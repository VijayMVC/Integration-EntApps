
CREATE PROCEDURE [dbo].[usp_LawsonPAchanges] 
WITH RECOMPILE
AS


/********************************************************************************************************************
Author: 	Jim Rogers  
Date: 		7/7/2010
Purpose:	This Routine is used to Extract/Transform/Load PA & NP changes from Lawson tables into LawsonPAchanges table. 
		The routine is called by DTS Package "Lawson - Report - Employee Changes - PA"

J Rogers: 	7/9/2010: 	Updated to break out data into 3 distict load types (Hire, Change, Separation) 
J Rogers: 	7/12/2010:	Added Previous Pay, Prev Status, Prev Site, & Prev Effective Date	
J Rogers: 	7/14/2010:  	Removed "item_name" to group by action_type			
J Rogers: 	7/16/2010:  	Added "RETRO PAY CHANGE" based on difference between 
					process date and first pay date 	
J Rogers:   	7/19/2010: 	Pull data for job codes 'EDIRPA' and 'ELSNPANP'
  					Added logic to "PAY CHANGE" action_type	to check for previous pay-rate 
					(if no change then don't show data)
J Rogers	7/22/2010:	Merged multipe action types into one record for effective date
J Rogers	7/23/2010:	Created table "PAchanges" to store data at Proc usp_PAchanges run time.	
J Rogers	8/3/2010:	Delete from LawsonPAchanges where the processed_date is within 
					15 days of current date, then refresh last 15 days
J Rogers	8/9/2010	Updated action type to only "Primary Site Change", no matter if the rate changes
					or the position changes (Per Cindy Addy).
J Rogers	8/13/2010	Updated action type back to orginal for "Primary Site Change" to once again include
					rate changes,and/or status change and/or position change (Per Cindy Addy).
J Rogers	9/15/2010	Pull records from PERSACTHST when previous action is not contained in the PAEMPPOS table.
					This happens when a PA action has the same beginning date as the previous action.
					(A new record is not created in the PAEMPPOS table - the active record is updated.)
J Rogers	9/28/2010	Updated to 45 day refresh
J Rogers	9/29/2010	Update to include PT's (per Aimee Nalle)
J Rogers	11/12/2010	Added Ben Date2 Logic when Ben Date2 has been changes in Lawson
					-- per Cindy Addy
J Rogers	11/15/2010	Added column "prev_ben_date2"
J Rogers	2/3/2011	Update Reason 2 when action like 'Status change' and reason 2 is null
*******************************************************************************************************************/

/*** Start of #PAchanges table creation	***/
SELECT CAST(date_stamp as datetime) as date_stamp,
	CAST(effect_date as datetime) as effect_date, 
	CAST(end_date as datetime) AS end_date, 
	r_position,
	site, process_level, employee, pos_level, pay_rate, fte, action_code, 
	last_name, first_name, description as position, reason_01, reason_02,
	term_date, emp_status,
	CAST(ben_date_1 as datetime) as ben_date_1, CAST(ben_date_2 as datetime) as ben_date_2
INTO #PAchanges 
FROM
(

	/***  Provider Initial Hire data	***/
	SELECT 	COALESCE(CONVERT(VARCHAR, max(date_stamp),101),'') as date_stamp,
		CONVERT(VARCHAR,effect_date,101) effect_date, 
		CASE 	WHEN CONVERT(VARCHAR,end_date,101) = '01/01/1753' THEN ''
			ELSE CONVERT(VARCHAR,end_date,101)
		END AS end_date, r_position, job_code,
		site, process_level, employee, pos_level, pay_rate, fte, action_code, item_name, 
		last_name, first_name, description, reason_01, reason_02,term_date, emp_status,
		CONVERT(VARCHAR,ben_date_1,101) ben_date_1, CONVERT(VARCHAR,ben_date_2,101) ben_date_2
	FROM
	(
		SELECT 	ep.PROCESS_LEVEL, UPPER(pr.name) as site, ep.JOB_CODE, ep.R_POSITION, e.LAST_NAME, e.FIRST_NAME,
			jc.DESCRIPTION, ep.PAY_RATE, ep.FTE, ep.EMPLOYEE, 'Location' as item_name,
			pah.OBJ_ID, 'HIRE' as ACTION_CODE, pah.ACTION_NBR, ep.DATE_STAMP, ep.POS_LEVEL,
			pah.REASON_01, pah.REASON_02,e.EMP_STATUS, e.TERM_DATE,
			ep.EFFECT_DATE, ep.END_DATE, ep.POS_EFF_DT,pah.ANT_END_DATE, pae.BEN_DATE_1, pae.BEN_DATE_2
		FROM 	
			AppStaging.dbo.LawsonPAEMPPOS ep LEFT JOIN AppStaging.dbo.LawsonPERSACTHST as pah ON ep.employee = pah.employee 
				AND ep.pos_level = pah.pos_level
				AND ep.effect_date = pah.effect_date
			LEFT JOIN AppStaging.dbo.LawsonPAEMPLOYEE pae ON pah.employee = pae.employee	
			INNER JOIN AppStaging.dbo.LawsonEmployee e ON e.employee = ep.employee
			INNER JOIN AppStaging.dbo.LawsonJOBCODE jc ON jc.JOB_CODE = ep.JOB_CODE
			INNER JOIN AppStaging.dbo.LawsonPRSYSTEM pr ON pr.process_level = ep.process_level
		WHERE 	(LEFT(ep.job_code,6)='EPHYAS' OR LEFT(ep.job_code,4)='ERNP'
				OR LEFT(ep.job_code,6)='EDIRPA' OR LEFT(ep.job_code,8)= 'ELSNPANP'
				OR LEFT(ep.job_code,6)='EPT000')
			AND ep.PROCESS_LEVEL < 8000
			AND ep.POS_LEVEL = 1
			AND CONVERT(VARCHAR,ep.effect_date,101) + '|' + CONVERT(VARCHAR,ep.employee)+ '|' + CONVERT(VARCHAR,ep.pos_level) IN
				(SELECT CONVERT(VARCHAR,MIN(effect_date),101) + '|' + CONVERT(VARCHAR,employee)+ '|' + CONVERT(VARCHAR,pos_level)
				FROM AppStaging.dbo.LawsonPAEMPPOS 
				GROUP BY employee, pos_level
				)
	) x


	GROUP BY site, process_level, r_position, job_code, employee, pos_level, pay_rate, fte, action_code, item_name,
		last_name, first_name, description, reason_01, reason_02, term_date, emp_status,
		effect_date, end_date, ben_date_1, ben_date_2	


UNION ALL


	/***  Provider Actions (PA's and NP's) excluding New Hire & Separations/Terminations	***/
	SELECT 	CONVERT(VARCHAR, max(date_stamp),101) as date_stamp,
		CONVERT(VARCHAR,effect_date,101) effect_date, 
		CASE 	WHEN CONVERT(VARCHAR,end_date,101) = '01/01/1753' THEN ''
			ELSE CONVERT(VARCHAR,end_date,101)
		END AS end_date, r_position, job_code,
		site,  process_level, employee, pos_level, pay_rate, fte, action_code, item_name, 
		last_name, first_name, description, reason_01, reason_02,term_date, emp_status,
		CONVERT(VARCHAR,ben_date_1,101) ben_date_1, CONVERT(VARCHAR,ben_date_2,101) ben_date_2
	FROM
	(
		SELECT 	ep.PROCESS_LEVEL, UPPER(pr.name) as site, ep.JOB_CODE, ep.R_POSITION, e.LAST_NAME, e.FIRST_NAME,
			jc.DESCRIPTION, d.ITEM_NAME, d.PERS_ACTION, ep.PAY_RATE, ep.FTE, ep.EMPLOYEE,
			pah.OBJ_ID, pah.ACTION_CODE, pah.ACTION_NBR, ep.DATE_STAMP, ep.POS_LEVEL,
			pah.REASON_01, pah.REASON_02,e.EMP_STATUS, e.TERM_DATE,
			ep.EFFECT_DATE, ep.END_DATE, ep.POS_EFF_DT,pah.ANT_END_DATE, hrh.FLD_NBR, hrh.SEQ_NBR, 
			hrh.N_VALUE, hrh.A_VALUE, pae.BEN_DATE_1, pae.BEN_DATE_2
		FROM 	
			AppStaging.dbo.LawsonPAEMPPOS ep LEFT JOIN AppStaging.dbo.LawsonPERSACTHST as pah ON ep.employee = pah.employee 
				AND ep.pos_level = pah.pos_level
				AND ep.effect_date = pah.effect_date
			LEFT JOIN AppStaging.dbo.LawsonHRHISTORY as hrh ON pah.OBJ_ID = hrh.ACT_OBJ_ID
			LEFT JOIN AppStaging.dbo.LawsonPADICT as d ON d.FLD_NBR = hrh.FLD_NBR
			LEFT JOIN AppStaging.dbo.LawsonPAEMPLOYEE pae ON pah.employee = pae.employee

			INNER JOIN AppStaging.dbo.LawsonEmployee e ON e.employee = ep.employee
			INNER JOIN AppStaging.dbo.LawsonJOBCODE jc ON jc.JOB_CODE = ep.JOB_CODE
			INNER JOIN AppStaging.dbo.LawsonPRSYSTEM pr ON pr.process_level = ep.process_level
		WHERE 	(LEFT(ep.job_code,6)='EPHYAS' OR LEFT(ep.job_code,4)='ERNP' 
				OR LEFT(ep.job_code,6)='EDIRPA' OR LEFT(ep.job_code,8)= 'ELSNPANP'
				OR LEFT(ep.job_code,6)='EPT000' )

			AND ep.PROCESS_LEVEL < 8000
			AND 
			(	/*(pah.ACTION_CODE = 'JOBCHNG' AND d.item_name IN ('Assignment Date', 'Location')) OR*/
				(pah.ACTION_CODE = 'JOBCHG') OR
				(pah.ACTION_CODE = 'REHIRE') OR
				(pah.ACTION_CODE = 'PAY CHANGE' AND d.item_name = 'Emp Base Pay Rate') OR 
				(pah.ACTION_CODE = 'STATUS' AND pah.POS_LEVEl = 1) 
			)
	) x


	GROUP BY site, process_level, employee, r_position, job_code, pos_level, pay_rate, fte, action_code, item_name,
		last_name, first_name, description, reason_01, reason_02, term_date, emp_status,
		effect_date, end_date, ben_date_1, ben_date_2


UNION ALL


	/***	Separated/Terminated Providers		***/
	SELECT 	COALESCE(CONVERT(VARCHAR, max(date_stamp),101),'') as date_stamp,
		CONVERT(VARCHAR,effect_date,101) effect_date, 
		CASE 	WHEN CONVERT(VARCHAR,end_date,101) = '01/01/1753' THEN ''
			ELSE CONVERT(VARCHAR,end_date,101)
		END AS end_date, r_position, job_code,
		site,process_level, employee, pos_level, pay_rate, fte, action_code, item_name, 
		last_name, first_name, description, reason_01, reason_02,term_date, emp_status,
		CONVERT(VARCHAR,ben_date_1,101) ben_date_1, CONVERT(VARCHAR,ben_date_2,101) ben_date_2

	FROM
	(
		SELECT 	ep.PROCESS_LEVEL, UPPER(pr.name) as site, ep.JOB_CODE, ep.R_POSITION, e.LAST_NAME, e.FIRST_NAME,
			jc.DESCRIPTION, ep.PAY_RATE, ep.EMPLOYEE, ep.FTE, 'Separation' as item_name,
			pah.OBJ_ID, pah.ACTION_CODE, pah.ACTION_NBR, pah.DATE_STAMP, pah.POS_LEVEL,
			pah.REASON_01, pah.REASON_02,e.EMP_STATUS, e.TERM_DATE,
			pah.EFFECT_DATE, ep.END_DATE, ep.POS_EFF_DT, pah.ANT_END_DATE, pae.BEN_DATE_1, pae.BEN_DATE_2
		FROM 	AppStaging.dbo.LawsonPERSACTHST as pah LEFT JOIN AppStaging.dbo.LawsonPAEMPLOYEE pae ON pah.employee = pae.employee
			INNER JOIN AppStaging.dbo.LawsonPAEMPPOS ep ON ep.employee = pah.employee 
				AND ep.pos_level = pah.pos_level
				AND ep.end_date = pah.effect_date
			INNER JOIN AppStaging.dbo.LawsonEmployee e ON e.employee = pah.employee
			INNER JOIN AppStaging.dbo.LawsonJOBCODE jc ON jc.JOB_CODE = ep.JOB_CODE
			INNER JOIN AppStaging.dbo.LawsonPRSYSTEM pr ON pr.process_level = ep.process_level
		WHERE 	(LEFT(ep.job_code,6)='EPHYAS' OR LEFT(ep.job_code,4)='ERNP'
				OR LEFT(ep.job_code,6)='EDIRPA' OR LEFT(ep.job_code,8)= 'ELSNPANP'
				OR LEFT(ep.job_code,6)='EPT000' )	
	)x
	WHERE 	action_code = 'TERM PEND'


	GROUP BY site, process_level, employee, r_position, job_code, pos_level, pay_rate, fte, action_code, item_name,
		last_name, first_name, description, reason_01, reason_02, term_date, emp_status,
		effect_date, end_date, ben_date_1, ben_date_2

) xx

GROUP BY date_stamp, effect_date, end_date, r_position, job_code,
	site,process_level, employee, pos_level, pay_rate, fte, action_code, 
	last_name, first_name, description, reason_01, reason_02, term_date, emp_status,
	ben_date_1, ben_date_2
;	
/*** End of #PAchanges table creation	***/

DECLARE @lastProcessedDate datetime
SET @lastProcessedDate = '2007-01-01' --(SELECT MAX(CAST(processed_date as datetime)) from LawsonPAchanges)

/* Delete records processed in last 45 days and then refresh */	
--DELETE FROM LawsonPAchanges
--WHERE cast(processed_date as datetime) >= CAST(CONVERT(varchar,getDate() -12,101) as datetime);

--TRUNCATE TABLE LawsonPAchanges;


/*****	Extract/Transform/Load data from temp table #PAchanges into LawsonPAchanges table	*****/

BEGIN
--problem exists below this line

INSERT INTO LawsonPAchanges
SELECT 	
	CASE	
	WHEN provider_action LIKE '%PAY CHANGE%' 
		AND cast(date_stamp as datetime) + 1 >= 
		CASE 
			WHEN day(cast(effective_date as datetime)) <= 15 THEN 
				cast(month(cast(effective_date as datetime)) as varchar) + '/22/' + cast(year(cast(effective_date as datetime)) as varchar) 
			WHEN day(cast(effective_date as datetime)) > 15 THEN   
				cast(month(cast(effective_date as datetime) + 20) as varchar)  + '/07/' + cast(year(cast(effective_date as datetime) + 20) as varchar) 
		END
		THEN provider_action + ' - RETRO'
	ELSE provider_action
	END as Provider_action,	
	effective_date,	
	end_date,
	employee_name as provider_name, 
	emp_id as lawson_id, 
	pos_level, 
	site as current_site, 
	process_level as current_site_id, 
	prev_site,
	CASE
		WHEN 	prev_process_level = process_level THEN ''
		ELSE 	prev_process_level
	END as prev_site_id,
	position as current_position, 
	prev_position,
	emp_status as current_status, 
	prev_status, 
	pay_rate as current_rate, 
	prev_pay_rate,
	reason_01, 
	reason_02, 
	emp_status_code, 
	CASE	WHEN term_date < '1/1/1900' THEN ''
		ELSE CONVERT(VARCHAR,term_date,101)
	END  as term_date,
	date_stamp, 
	ben_date_1, 
	ben_date_2, 
	prev_ben_date_2,
	CASE	
		WHEN provider_action LIKE '%PAY CHANGE%' THEN firstPayDate
		ELSE ''
	END as firstPayDate,
	CONVERT(varchar,getDate(),101) as creDate

FROM
(
	SELECT 
		CASE
			WHEN action_code = 'HIRE' AND effective_date <> '01/01/2007' AND end_date = '' 
				THEN 'NEW HIRE'
			WHEN action_code = 'REHIRE' AND end_date = ''
				THEN 'RE-HIRE'
			WHEN action_code = 'TERM PEND' 
				THEN 'SEPARATE'	

			WHEN action_code = 'JOBCHG' AND pos_level = 1 AND prev_position <> '' 
				AND end_date = ''
				AND prev_status <> emp_status AND prev_status <> '' 
				AND prev_site <> ''
				THEN 'PRIMARY SITE CHANGE|POSITION CHANGE|STATUS CHANGE'
			WHEN action_code = 'JOBCHG' AND pos_level = 1 AND prev_position <> '' 
				AND end_date = ''
				AND prev_position <> position AND prev_site <> ''
				THEN 'PRIMARY SITE CHANGE|POSITION CHANGE'
			WHEN action_code = 'JOBCHG' AND pos_level = 1 AND prev_site <> '' 
				AND end_date=''
				AND prev_status <> emp_status AND prev_status <> ''
				THEN 'PRIMARY SITE CHANGE|STATUS CHANGE'
			WHEN action_code = 'JOBCHG' AND pos_level = 1 AND prev_site <> '' 
				AND end_date = ''	
				THEN 'PRIMARY SITE CHANGE' 
				

			WHEN action_code = 'JOBCHG' AND pos_level = 1 AND prev_position <> '' 
				AND end_date = ''
				AND prev_status <> emp_status AND prev_status <> ''
				THEN 'POSITION CHANGE|STATUS CHANGE'

			WHEN action_code = 'JOBCHG' 
				--AND pos_level = 1 
				AND prev_position <> '' 
				AND end_date = ''
				AND prev_position <> position
				THEN 'POSITION CHANGE'
			WHEN action_code = 'JOBCHG' AND pos_level = 1 AND prev_pay_rate <> '' 
				AND end_date = ''
				AND prev_pay_rate <> pay_rate
				THEN 'PAY CHANGE'
			WHEN action_code = 'JOBCHG' AND pos_level <> 1  
				--AND end_date <> '' 
				AND prev_site = '' 
				AND process_level NOT IN
					(select process_level 
					from AppStaging.dbo.LawsonPAEMPPOS
					where employee = emp_id
					and end_date < '1/1/1901')
				THEN 'DROP SITE'
			WHEN action_code = 'JOBCHG' AND pos_level <> 1   
				AND prev_site = ''
				AND end_date = ''
				THEN 'ADD SITE'
			WHEN action_code = 'JOBCHG' AND pos_level <> 1  
				AND end_date = '' 
				AND prev_site = '' 
				THEN 'NON-PRIMARY SITE CHANGE'

			WHEN action_code = 'PAY CHANGE' 
				AND end_date = '' 
				AND prev_pay_rate <> '' 
				--AND prev_status ='' AND prev_site = '' AND prev_position = ''
				THEN 'PAY CHANGE'
			WHEN action_code = 'STATUS' 
				AND end_date = '' 
				--AND prev_pay_rate <> '' 
				AND pos_level=1
				AND prev_site <> '' 
				AND prev_status <> ''
				THEN 'PRIMARY SITE CHANGE|STATUS CHANGE'	
			WHEN action_code = 'STATUS' 
				AND end_date = '' 
				--AND prev_pay_rate <> '' 
				--AND prev_site = '' AND prev_position = '' 
				AND prev_status <> ''
				THEN 'STATUS CHANGE'			
		END as provider_action,
	* 
	FROM

	(
		SELECT 
			COALESCE(CONVERT(VARCHAR, a.date_stamp,101),'') AS date_stamp, 	
			CONVERT(VARCHAR,a.effect_date,101) AS effective_date,
			CASE 
				WHEN CONVERT(VARCHAR,a.end_date,101) = '01/01/1900' THEN ''
				ELSE CONVERT(VARCHAR,a.end_date,101)
			END AS end_date, 
			
			a.site, a.process_level,

			COALESCE(
			(SELECT coalesce(d.name,' ') as prev_site
			FROM AppStaging.dbo.LawsonPRSYSTEM d INNER JOIN AppStaging.dbo.LawsonPAEMPPOS c ON c.process_level = d.process_level
			WHERE COALESCE(CONVERT(VARCHAR,c.effect_date,101),' ') IN
				(select COALESCE(CONVERT(VARCHAR,max(b.effect_date),101),' ') as prev_effect_date
				from AppStaging.dbo.LawsonPAEMPPOS b
				where cast(a.employee as varchar) + '|' + cast(a.pos_level as varchar) = 
						cast(b.employee as varchar) + '|' + cast(b.pos_level as varchar)
					AND b.effect_date < a.effect_date			
				)			
			AND cast(a.employee as varchar) + '|' + cast(a.pos_level as varchar) = 
				cast(c.employee as varchar) + '|' + cast(c.pos_level as varchar)
			AND a.site <> d.name
			GROUP BY d.name
			),'') as prev_site,

			COALESCE(
			(SELECT coalesce(c.process_level,' ') as prev_process_level
			FROM AppStaging.dbo.LawsonPAEMPPOS c
			WHERE COALESCE(CONVERT(VARCHAR,c.effect_date,101),' ') IN
				(select COALESCE(CONVERT(VARCHAR,max(b.effect_date),101),' ') as prev_effect_date
				from AppStaging.dbo.LawsonPAEMPPOS b
				where cast(a.employee as varchar) + '|' + cast(a.pos_level as varchar) = 
						cast(b.employee as varchar) + '|' + cast(b.pos_level as varchar)
					AND b.effect_date < a.effect_date			
				)
			AND cast(a.employee as varchar) + '|' + cast(a.pos_level as varchar) = 
				cast(c.employee as varchar) + '|' + cast(c.pos_level as varchar)
			AND a.site <> c.process_level
			GROUP BY c.process_level
			),'') as prev_process_level,
			
			LTRIM(RTRIM(a.first_name)) + ' ' + LTRIM(RTRIM(a.last_name)) as employee_name, 
			a.employee as emp_ID,	
			a.pos_level, 
			CAST(CAST(a.pay_rate as decimal(9,2)) as varchar) as pay_rate,

			COALESCE(
				(SELECT coalesce(cast(cast(c.pay_rate as decimal(9,2)) as varchar),'') as prev_pay_rate
				FROM AppStaging.dbo.LawsonPAEMPPOS c
				WHERE COALESCE(CONVERT(VARCHAR,c.effect_date,101),' ') IN
					(select COALESCE(CONVERT(VARCHAR,max(b.effect_date),101),'') as prev_effect_date
					from AppStaging.dbo.LawsonPAEMPPOS b
					where cast(a.employee as varchar) + '|' + cast(a.process_level as varchar) = 
							cast(b.employee as varchar) + '|' + cast(b.process_level as varchar)
						AND b.effect_date < a.effect_date
					)
				AND cast(a.employee as varchar) + '|' + cast(a.process_level as varchar) = 
					cast(c.employee as varchar) + '|' + cast(c.process_level as varchar)
				AND a.pay_rate <> c.pay_rate
				GROUP BY c.pay_rate
				),'') as prev_pay_rate,

			CASE 
				WHEN a.fte = 1 THEN 'FULL TIME'
				WHEN a.fte = .5 THEN 'PART TIME'
				WHEN a.fte = .25 THEN 'PER DIEM'
				WHEN a.pos_level <> 1 AND a.fte =0 THEN ''
				ELSE cast(a.fte as varchar)
			END as emp_status, 

			COALESCE(
			(SELECT
			CASE 
				WHEN c.fte = 1 THEN 'FULL TIME'
				WHEN c.fte = .5 THEN 'PART TIME'
				WHEN c.fte = .25 THEN 'PER DIEM'
				WHEN c.pos_level <> 1  AND c.fte =0 THEN ''
				ELSE cast(c.fte as varchar)
			END as emp_status 
			FROM #PAchanges c
			WHERE COALESCE(CONVERT(VARCHAR,c.effect_date,101),'') IN
				(select COALESCE(CONVERT(VARCHAR,max(b.effect_date),101),' ') as prev_effect_date
				from #PAchanges b
				where cast(a.employee as varchar) + '|' + cast(a.pos_level as varchar) = 
						cast(b.employee as varchar) + '|' + cast(b.pos_level as varchar)
					AND b.effect_date < a.effect_date					
				)
			AND cast(a.employee as varchar) + '|' + cast(a.pos_level as varchar) = 
				cast(c.employee as varchar) + '|' + cast(c.pos_level as varchar)
			AND cast(a.fte as varchar) <> cast(c.fte as varchar)	
			GROUP BY c.fte, c.pos_level
			),'') as prev_status,

			LTRIM(RTRIM(a.position)) as position,

--subquery below causes "more than one row" error

			COALESCE(
			(SELECT coalesce(c.r_position,'') as prev_pos
			FROM #PAchanges c
			WHERE COALESCE(CONVERT(VARCHAR,c.effect_date,101),' ') IN
				(select COALESCE(CONVERT(VARCHAR,max(b.effect_date),101),'') as prev_effect_date
				from #PAchanges b
				where cast(a.employee as varchar) + '|' + cast(a.process_level as varchar) = 
						cast(b.employee as varchar) + '|' + cast(b.process_level as varchar)
					AND b.effect_date < a.effect_date AND b.r_position <> a.r_position
				)
			AND cast(a.employee as varchar) + '|' + cast(a.process_level as varchar) = 
				cast(c.employee as varchar) + '|' + cast(c.process_level as varchar)
			AND a.r_position <> c.r_position and a.effect_date < c.effect_date
			GROUP BY c.r_position
			), ' ') as prev_position,

			action_code,
			COALESCE(a.reason_01, ' ') as reason_01, 
			COALESCE(a.reason_02, ' ') as reason_02,
			a.emp_status as emp_status_code, a.term_date,
			COALESCE(CONVERT(VARCHAR,a.ben_date_1,101),' ') AS ben_date_1, 
			COALESCE(CONVERT(VARCHAR,a.ben_date_2,101),' ') AS ben_date_2,
			'1/1/1900' AS prev_ben_date_2,

			CASE 
				WHEN day(a.effect_date) <= 15 THEN 
					cast(month(a.effect_date) as varchar) + '/22/' + cast(year(a.effect_date) as varchar) 
				WHEN day(a.effect_date) > 15 THEN  
					cast(month(a.effect_date + 20) as varchar)  + '/07/' + cast(year(a.effect_date + 20) as varchar) 
				ELSE ''
			END as FirstPayDate

		FROM #PAchanges a
		WHERE CAST(CONVERT(varchar,date_stamp,101) as datetime) > 
			@lastProcessedDate
			

	) x

	GROUP BY  
		date_stamp, effective_date, end_date,
		site, process_level, prev_site, prev_process_level,
		employee_name, emp_id, pay_rate, prev_pay_rate, emp_status, 
		prev_status, pos_level, position, prev_position, action_code, 
		reason_01, reason_02, emp_status_code, term_date,
		ben_date_1, ben_date_2, prev_ben_date_2, firstPayDate
) xx

WHERE provider_action IS NOT NULL
GROUP BY provider_action, effective_date,end_date, employee_name, emp_id, pos_level, 
	site, process_level, prev_site, prev_process_level,
	position, prev_position,
	emp_status, prev_status, pay_rate, prev_pay_rate,
	reason_01, reason_02, emp_status_code, term_date,
	date_stamp, ben_date_1, ben_date_2, prev_ben_date_2, firstPayDate
ORDER BY emp_ID, pos_level, CAST(effective_date AS DATETIME) DESC, CAST(date_stamp AS DATETIME) DESC

--problem exists above this line


END
;
/***	End Extract/Transform/Load into LawsonPAchanges table	***/




/*****  Create #tmpHRchanges table to retrieve change data not showing in PERSACTHST *****/

CREATE TABLE [#tmpHRchanges] (
	[Provider_action] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[effective_date] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[end_date] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[provider_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lawson_id] [int] NOT NULL ,
	[pos_level] [smallint] NOT NULL ,
	[current_site] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[current_site_id] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[prev_site] [char] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[prev_site_id] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[current_position] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[prev_position] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[current_status] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[prev_status] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[current_rate] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[prev_pay_rate] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[reason_01] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[reason_02] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[emp_status_code] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[term_date] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[processed_date] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ben_date_1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ben_date_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[prev_ben_date_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[firstPayDate] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[creDate] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)
 
/***** Insert into tmp table	*****/
INSERT INTO #tmpHRchanges 
SELECT 
	CASE
		WHEN item_name = 'FTE' THEN 'STATUS CHANGE'
		WHEN item_name = 'Process Level' AND pos_level=1 THEN 'PRIMARY SITE CHANGE'
		WHEN item_name = 'Process Level' AND pos_level<>1 THEN 'NON-PRIMARY SITE CHANGE'
		WHEN item_name = 'Emp Base Pay Rate' AND cast(date_stamp as datetime) + 1 >= 
			CASE 
			WHEN day(cast(beg_date as datetime)) <= 15 THEN 
				cast(month(cast(beg_date as datetime)) as varchar) + '/22/' + cast(year(cast(beg_date as datetime)) as varchar) 
			WHEN day(cast(beg_date as datetime)) > 15 THEN   
				cast(month(cast(beg_date as datetime) + 20) as varchar)  + '/07/' + cast(year(cast(beg_date as datetime) + 20) as varchar) 
			END
		THEN 'PAY CHANGE - RETRO'
		WHEN item_name = 'Emp Base Pay Rate' THEN 'PAY CHANGE'
		WHEN item_name = 'Job Code' THEN 'POSITION CHANGE'
		WHEN item_name = 'Benefit Date 2' THEN 'BENEFIT DATE2 CHANGE'
	END as provider_action,
	convert(varchar,beg_date,101) as effective_date,
	' ' as end_date,
	' ' as provider_name,
	employee as lawson_id,
	pos_level,
	' ' as current_site,
	CASE
		WHEN item_name = 'Process Level' THEN change_value
		ELSE ' '
	END as current_site_id,
	' ' as prev_site,
	CASE
		WHEN item_name = 'Process Level' THEN prev_value
		ELSE ' ' 
	END as prev_site_id,
	CASE
		WHEN item_name = 'Job Code' THEN change_value
		ELSE ' ' 
	END as current_position,
	CASE
		WHEN item_name = 'Job Code' THEN prev_value
		ELSE ' ' 
	END as prev_position,
	CASE
		WHEN item_name = 'FTE' THEN 
		CASE  
			WHEN cast(rtrim(change_value) as decimal(3,2)) = 1 THEN 'FULL TIME'
			WHEN cast(rtrim(change_value) as decimal(3,2)) = .50 THEN 'PART TIME'
			WHEN cast(rtrim(change_value) as decimal(3,2)) = .25 THEN 'PER DIEM'
			ELSE ''
		END
		ELSE ' ' 
	END as current_status,
	CASE
		WHEN item_name = 'FTE' THEN 
		CASE  
			WHEN cast(rtrim(prev_value) as decimal(3,2)) = 1 THEN 'FULL TIME'
			WHEN cast(rtrim(prev_value) as decimal(3,2)) = .50 THEN 'PART TIME'
			WHEN cast(rtrim(prev_value) as decimal(3,2)) = .25 THEN 'PER DIEM'
			ELSE ''
		END
		ELSE ' ' 
	END as prev_status,
	CASE
		WHEN item_name = 'Emp Base Pay Rate' THEN cast(cast(change_value as decimal(9,2)) as varchar)
		ELSE ' '
	END as current_rate,
	CASE
		WHEN item_name = 'Emp Base Pay Rate' THEN cast(cast(prev_value as decimal(9,2)) as varchar)
		ELSE ' '
	END as prev_pay_rate,
	' ' as reason_01,
	' ' as reason_02,
	CASE
		WHEN item_name = 'FTE' THEN 
		CASE  
			WHEN cast(rtrim(change_value) as decimal(3,2)) = 1 THEN 'A1'
			WHEN cast(rtrim(change_value) as decimal(3,2)) = .50 THEN 'A2'
			WHEN cast(rtrim(change_value) as decimal(3,2)) = .25 THEN 'A6'
			ELSE ''
		END
		ELSE ' ' 
	END as emp_status_code,
	' ' as term_date,
	CONVERT(varchar,date_stamp,101) as processed_date,
	' ' as ben_date_1,
	CASE 
		WHEN item_name = 'Benefit Date 2' THEN
			change_value
		ELSE ' ' 
	END as ben_date_2,
	CASE
		WHEN item_name = 'Benefit Date 2' THEN 
			prev_value
		ELSE ' '
	END as prev_ben_date_2,
	CASE 
		WHEN day(a.beg_date) <= 15 THEN 
			cast(month(a.beg_date) as varchar) + '/22/' + cast(year(a.beg_date) as varchar) 
		WHEN day(a.beg_date) > 15 THEN  
			cast(month(a.beg_date + 20) as varchar)  + '/07/' + cast(year(a.beg_date + 20) as varchar) 
		ELSE ' '
	END as FirstPayDate,
	CONVERT(varchar,getDate(),101) as loadDate

FROM
(
	SELECT a.date_stamp, a.time_stamp, a.date_time_stamp, a.beg_date, 
		a.item_name, a.job_code,
		a.change_value,	
		(select x.change_value
		from AppStaging.dbo.vw_lawsonPAhistory x
		where x.date_time_stamp IN
			(select coalesce(max(y.date_time_stamp),' ')
			from AppStaging.dbo.vw_lawsonPAhistory y
			where x.employee = y.employee
				and x.pos_level = y.pos_level
				and x.item_name = y.item_name
				and y.date_time_stamp < a.date_time_stamp
			)
		and a.employee = x.employee
		and a.pos_level = x.pos_level
		and a.item_name = x.item_name
		) as prev_value,
		a.employee,a.pos_level
	FROM	AppStaging.dbo.vw_lawsonPAhistory a
	WHERE cast(pos_level as varchar) + '|' + cast(employee as varchar) + '|' + item_name + '|' +
		convert(varchar,beg_date,101) IN
		(
			SELECT cast(pos_level as varchar) + '|' + cast(employee as varchar) + '|' + item_name + '|' +
				convert(varchar,beg_date,101)
			FROM AppStaging.dbo.vw_lawsonPAhistory
			WHERE item_name <> 'Benefit Date 2'
			GROUP BY cast(pos_level as varchar) + '|' + cast(employee as varchar) + '|' + item_name + '|' +
				convert(varchar,beg_date,101)
			HAVING count(cast(pos_level as varchar) + '|' + cast(employee as varchar) + '|' + item_name + '|' +
					convert(varchar,beg_date,101)) > 1
		)
	
	UNION ALL
	
	SELECT date_stamp, time_stamp, date_time_stamp, beg_date,
		item_name, job_code, change_value, coalesce(prev_value,'1/1/1900') as prev_value,
		employee, pos_level
	FROM
	(
		SELECT a.date_stamp, a.time_stamp, a.date_time_stamp, a.beg_date, 
			a.item_name, a.job_code,
			a.change_value,	
			(select coalesce(x.change_value,'1/1/1900')
			from AppStaging.dbo.vw_lawsonPAhistory x
			where x.date_time_stamp IN
				(select coalesce(max(y.date_time_stamp),'1/1/1900')
				from AppStaging.dbo.vw_lawsonPAhistory y
				where x.employee = y.employee
					and x.pos_level = y.pos_level
					and x.item_name = y.item_name
					and y.date_time_stamp < a.date_time_stamp
				)
			and a.employee = x.employee
			and a.pos_level = x.pos_level
			and a.item_name = x.item_name
			) as prev_value,
		a.employee,a.pos_level
	FROM	AppStaging.dbo.vw_lawsonPAhistory a
	WHERE a.item_name = 'Benefit Date 2'
	) b
) a
WHERE  a.prev_value is not null 
	AND item_name <> 'Status'
	AND rtrim(change_value) <> '0.000000'  
	AND rtrim(prev_value) <> '0.000000' 
	OR item_name = 'Benefit Date 2'
;

UPDATE #tmpHRchanges
SET provider_name = prov_name
FROM (select ltrim(rtrim(first_name)) + ' ' + ltrim(rtrim(last_name)) as prov_name, employee
	from AppStaging.dbo.LawsonEmployee) a
WHERE #tmpHRchanges.lawson_id = a.employee
;


UPDATE #tmpHRchanges
SET current_site_id = a.process_level
FROM (select ep.employee, ep.process_level, ep.pos_level, ep.effect_date
	from AppStaging.dbo.LawsonPAEMPPOS ep
	WHERE (LEFT(ep.job_code,6)='EPHYAS' OR LEFT(ep.job_code,4)='ERNP'
		OR LEFT(ep.job_code,6)='EDIRPA' OR LEFT(ep.job_code,8)= 'ELSNPANP' )
	AND ep.PROCESS_LEVEL < 8000 ) a
WHERE #tmpHRchanges.lawson_id = a.employee
	AND #tmpHRchanges.pos_level = a.pos_level
	AND #tmpHRchanges.effective_date = a.effect_date
	AND #tmpHRchanges.current_site_id = ' '
;

UPDATE #tmpHRchanges
SET current_position = a.jobDesc
FROM (select ep.employee, ep.process_level, ep.pos_level, ep.job_code, ep.effect_date, jc.description as jobDesc
	FROM AppStaging.dbo.LawsonPAEMPPOS ep
		INNER JOIN AppStaging.dbo.LawsonJOBCODE jc ON jc.job_code = ep.job_code
	WHERE (LEFT(ep.job_code,6)='EPHYAS' OR LEFT(ep.job_code,4)='ERNP'
		OR LEFT(ep.job_code,6)='EDIRPA' OR LEFT(ep.job_code,8)= 'ELSNPANP' )
	AND ep.PROCESS_LEVEL < 8000 ) a
WHERE #tmpHRchanges.lawson_id = a.employee
	AND #tmpHRchanges.pos_level = a.pos_level
	AND #tmpHRchanges.effective_date = a.effect_date
	AND #tmpHRchanges.current_position <> ' '
;


UPDATE #tmpHRchanges
SET current_site_id = a.process_level
FROM (select ep.employee, ep.process_level, ep.pos_level, max(ep.effect_date) effect_date
	from AppStaging.dbo.LawsonPAEMPPOS ep
	WHERE (LEFT(ep.job_code,6)='EPHYAS' OR LEFT(ep.job_code,4)='ERNP'
		OR LEFT(ep.job_code,6)='EDIRPA' OR LEFT(ep.job_code,8)= 'ELSNPANP' )
	AND ep.PROCESS_LEVEL < 8000 
	GROUP BY ep.employee, ep.process_level, ep.pos_level) a
WHERE #tmpHRchanges.lawson_id = a.employee
	AND #tmpHRchanges.pos_level = a.pos_level
	AND #tmpHRchanges.provider_action = 'BENEFIT DATE2 CHANGE'
	AND #tmpHRchanges.current_site_id = ' '
;



UPDATE #tmpHRchanges
SET current_status = a.emp_status
FROM (select ep.employee, ep.process_level, 
	CASE 
		WHEN ep.fte = 1 THEN 'A1'
		WHEN ep.fte = .5 THEN 'A2'
		WHEN ep.fte = .25 THEN 'A6'
	END as emp_status, 
	ep.pos_level, ep.job_code, ep.effect_date
	from AppStaging.dbo.LawsonPAEMPPOS ep
	WHERE (LEFT(ep.job_code,6)='EPHYAS' OR LEFT(ep.job_code,4)='ERNP'
		OR LEFT(ep.job_code,6)='EDIRPA' OR LEFT(ep.job_code,8)= 'ELSNPANP' )
	AND ep.PROCESS_LEVEL < 8000 ) a
WHERE #tmpHRchanges.lawson_id = a.employee
	AND #tmpHRchanges.pos_level = a.pos_level
	AND #tmpHRchanges.effective_date = a.effect_date
	AND #tmpHRchanges.current_status = ' '
	AND #tmpHRchanges.pos_level = 1
;


UPDATE #tmpHRchanges
SET current_rate = a.pay_rate
FROM (select ep.employee, ep.process_level, cast(ep.pay_rate as decimal(9,2)) as pay_rate, ep.pos_level, ep.job_code, ep.effect_date
	from AppStaging.dbo.LawsonPAEMPPOS ep
	WHERE (LEFT(ep.job_code,6)='EPHYAS' OR LEFT(ep.job_code,4)='ERNP'
		OR LEFT(ep.job_code,6)='EDIRPA' OR LEFT(ep.job_code,8)= 'ELSNPANP' )
	AND ep.PROCESS_LEVEL < 8000 ) a
WHERE #tmpHRchanges.lawson_id = a.employee
	AND #tmpHRchanges.pos_level = a.pos_level
	AND #tmpHRchanges.effective_date = a.effect_date
	AND #tmpHRchanges.current_site_id = a.process_level
	AND (#tmpHRchanges.current_rate = ' ' OR RIGHT(rtrim(#tmpHRchanges.current_rate),3) = '000')
;


UPDATE #tmpHRchanges
SET current_site = upper(site)
FROM (select ltrim(rtrim(name)) as site, process_level
	from AppStaging.dbo.LawsonPRSYSTEM) a
WHERE #tmpHRchanges.current_site_id = a.process_level
	AND #tmpHRchanges.current_site_id <> ' '
;


UPDATE #tmpHRchanges
SET prev_site = upper(site)
FROM (select ltrim(rtrim(name)) as site, process_level
	from AppStaging.dbo.LawsonPRSYSTEM) a
WHERE #tmpHRchanges.prev_site_id = a.process_level
	AND #tmpHRchanges.prev_site_id <> ' '	
;


UPDATE #tmpHRchanges
SET prev_position = a.jobDesc
FROM (select jc.job_code, jc.description as jobDesc
	FROM AppStaging.dbo.LawsonJOBCODE jc) a
WHERE #tmpHRchanges.prev_position = a.job_code
	AND #tmpHRchanges.prev_position <> ' '
;




INSERT INTO LawsonPAchanges
SELECT *
FROM #tmpHRchanges
WHERE CAST(CONVERT(varchar,processed_date,101) as datetime) > @lastProcessedDate 
and provider_action='BENEFIT DATE2 CHANGE'
;


UPDATE LawsonPAchanges
SET prev_position = a.jobDesc
FROM (select jc.job_code, jc.description as jobDesc
	FROM AppStaging.dbo.LawsonJOBCODE jc) a
WHERE LawsonPAchanges.prev_position = a.job_code
	AND LawsonPAchanges.prev_position <> ' '
;


UPDATE LawsonPAchanges
SET prev_ben_date_2 = ' '
WHERE prev_ben_date_2 = '1/1/1900'
	OR prev_ben_date_2 IS NULL
;

UPDATE LawsonPAchanges
SET prev_pay_rate = '',
	prev_status = '',
	prev_position='',
	prev_site = '',
	prev_site_id=''
WHERE provider_action = 'ADD SITE'
;


UPDATE LawsonPAchanges
SET 	emp_status_code = a.emp_status 
FROM
	(select employee, emp_status
	from AppStaging.dbo.LawsonEMPLOYEE
	) a
WHERE LawsonPAchanges.lawson_id = a.employee
	and LawsonPAchanges.emp_status_code =''
;

UPDATE LawsonPAchanges
SET 	ben_date_1 = convert(varchar,a.ben_date_1,101) 
FROM
	(select employee, ben_date_1
	from AppStaging.dbo.LawsonPAEMPLOYEE
	) a
WHERE LawsonPAchanges.lawson_id = a.employee
	and LawsonPAchanges.ben_date_1=''
;

UPDATE LawsonPAchanges
SET 	ben_date_2 = convert(varchar,a.ben_date_2,101) 
FROM
	(select employee, ben_date_2
	from AppStaging.dbo.LawsonPAEMPLOYEE
	) a
WHERE LawsonPAchanges.lawson_id = a.employee
	and LawsonPAchanges.ben_date_2=''
;

UPDATE LawsonPAchanges
SET 	reason_02 = a.reason_02
FROM
	(select employee, reason_02, effect_date
	from AppStaging.dbo.LawsonPERSACTHST
	where action_code = 'STATUS'
	) a
WHERE LawsonPAchanges.lawson_id = a.employee
	and LawsonPAchanges.reason_02=''
	and LawsonPAchanges.Provider_action like '%STATUS%'
	and LawsonPAchanges.pos_level = 1
	and LawsonPAchanges.effective_date = a.effect_date
;

drop table #tmpHRchanges;
drop table #PAchanges;


select * from LawsonPAchanges