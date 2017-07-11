
--DROP PROCEDURE dbo.usp_LawsonPApendingChanges 


CREATE PROCEDURE [dbo].[usp_LawsonPApendingChanges] 
WITH RECOMPILE
AS

/********************************************************************************************************************
Author: 	Jim Rogers  
Date: 		7/26/2010
Purpose:	This Routine is used to Extract/Transform/Load PA & NP Pending changes from Lawson tables into 
		LawsonPApendingChanges table. 
		
		J Rogers	8/2/2010	Updated to format pay rate change when action = "PAY CHANGE"
		J.Rogers	2/3/2011	Updated to pull new pay rate from pa.NEW_VALUE_15
		
*******************************************************************************************************************/

BEGIN

/*** Truncate Table	***/
TRUNCATE TABLE LawsonPApendingChanges
;
				

/*** Insert records to table	***/
INSERT INTO LawsonPApendingChanges
	SELECT
		CASE 
			WHEN pa.action_code = 'STATUS' THEN
				'STATUS CHANGE'
			WHEN pa.action_code LIKE 'TERM%' THEN
				'SEPARATE'
			WHEN pa.action_code = 'JOBCHG' THEN
				'JOB CHANGE'
			WHEN pa.action_code = 'REHIRE' THEN
				'RE-HIRE'
			ELSE pa.action_code
			END as action,
		CONVERT(VARCHAR,pa.effect_date,101) effect_date,
		ltrim(rtrim(e.first_name)) + ' ' + ltrim(rtrim(e.last_name)) as provider_name,
		pa.employee as Lawson_ID, 	
		pa.pos_level,	
		CASE 
			WHEN pa.process_level <> '' THEN
				(SELECT b.name FROM AppStaging.dbo.LawsonPRSYSTEM b
				WHERE pa.process_level = b.process_level)
			ELSE ''
		END as new_site,
		pa.process_level as new_process_level,
		UPPER(pr.name) as old_site,
		ep.process_level as old_process_level,
		pa.job_code as new_job_code,
		ep.job_code as old_job_code,	
		CASE
			WHEN pa.action_code = 'STATUS' THEN pa.NEW_VALUE_02
			ELSE ''
		END as new_status,
		e.emp_status as old_status,
		CASE
			WHEN pa.action_code = 'PAY CHANGE' and left(pa.NEW_VALUE_15,10)=' 000000000'
				THEN substring(pa.NEW_VALUE_15,12,2) + '.' + substring(pa.NEW_VALUE_15,14,2)
			WHEN pa.action_code = 'PAY CHANGE' AND
				(left(pa.NEW_VALUE_02,10)=' 000000000' OR left(pa.NEW_VALUE_15,10)=' 000000000')
				THEN substring(pa.NEW_VALUE_02,12,2) + '.' + substring(pa.NEW_VALUE_02,14,2)
			WHEN pa.action_code = 'PAY CHANGE' and left(pa.NEW_VALUE_02,10)<> ' 000000000'
				THEN substring(pa.NEW_VALUE_02,1,15)
			ELSE ''
		END as new_pay_rate,
		cast(ep.pay_rate as varchar) as old_pay_rate,	
		pa.reason_01, pa.reason_02,
		CASE 
			WHEN pa.action_code = 'STATUS' and pa.new_value_03 <> '' THEN
				CONVERT(VARCHAR,cast(pa.new_value_03 as datetime),101)
			ELSE
				CONVERT(VARCHAR,pae.ben_date_1,101) 
		END as ben_date_1, 
		CASE 
			WHEN pa.action_code = 'STATUS' and pa.new_value_04 <> '' THEN
				CONVERT(VARCHAR,cast(pa.new_value_04 as datetime),101)
			ELSE CONVERT(VARCHAR,pae.ben_date_2,101) 
		END as ben_date_2,
		CONVERT(varchar,getDate(),101)
	FROM 	AppStaging.dbo.LawsonPERSACTION pa INNER JOIN AppStaging.dbo.LawsonPAEMPPOS ep 
			ON pa.employee = ep.employee AND pa.pos_level = ep.pos_level
		INNER JOIN AppStaging.dbo.LawsonEMPLOYEE e 
			ON pa.employee = e.employee 
		INNER JOIN AppStaging.dbo.LawsonPRSYSTEM pr 
			ON pr.process_level = ep.process_level
		LEFT JOIN AppStaging.dbo.LawsonPAEMPLOYEE pae ON pa.employee = pae.employee
	WHERE 	pa.action_code IN ('TERM','TERM PEND','STATUS','JOBCHG','REHIRE', 'PAY CHANGE')
		AND ep.end_date < '1/1/1901'
		AND (LEFT(ep.job_code,6)='EPHYAS' OR LEFT(ep.job_code,4)='ERNP'
			OR LEFT(ep.job_code,6)='EDIRPA' OR LEFT(ep.job_code,8)= 'ELSNPANP'
			OR LEFT(ep.job_code,6)='EPT000' )
			
	UNION ALL
	
	
	SELECT
		'ADD SITE' as  action,
		CONVERT(VARCHAR,pa.effect_date,101) effect_date,
		ltrim(rtrim(e.first_name)) + ' ' + ltrim(rtrim(e.last_name)) as provider_name,
		pa.employee as Lawson_ID, 	
		pa.pos_level,	
		CASE 
			WHEN pa.process_level <> '' THEN
				(SELECT b.name FROM AppStaging.dbo.LawsonPRSYSTEM b
				WHERE pa.process_level = b.process_level)
			ELSE ''
		END as new_site,
		pa.process_level as new_process_level,
		' ' as old_site,
		' ' old_process_level,
		pa.job_code as new_job_code,
		' ' as old_job_code,	
		' ' as new_status,
		' ' as old_status,
		CASE
			WHEN pa.action_code IN ('PAY CHANGE','JOBCHG') and left(pa.NEW_VALUE_15,10)=' 000000000'
				THEN substring(pa.NEW_VALUE_15,12,2) + '.' + substring(pa.NEW_VALUE_15,14,2)
			WHEN pa.action_code = 'PAY CHANGE' AND
				(left(pa.NEW_VALUE_02,10)=' 000000000' OR left(pa.NEW_VALUE_15,10)=' 000000000')
				THEN substring(pa.NEW_VALUE_02,12,2) + '.' + substring(pa.NEW_VALUE_02,14,2)
			WHEN pa.action_code = 'PAY CHANGE' and left(pa.NEW_VALUE_02,10)<> ' 000000000'
				THEN substring(pa.NEW_VALUE_02,1,15)
			ELSE ''
		END as new_pay_rate,
		' ' as old_pay_rate,	
		pa.reason_01, pa.reason_02,
		CONVERT(VARCHAR,pae.ben_date_1,101) as ben_date_1, 
		CONVERT(VARCHAR,pae.ben_date_2,101) as ben_date_2,
		CONVERT(varchar,getDate(),101)
	FROM 	AppStaging.dbo.LawsonPERSACTION pa 
		INNER JOIN AppStaging.dbo.LawsonEMPLOYEE e 
			ON pa.employee = e.employee 
		INNER JOIN AppStaging.dbo.LawsonPRSYSTEM pr 
			ON pr.process_level = pa.process_level
		LEFT JOIN AppStaging.dbo.LawsonPAEMPLOYEE pae ON pa.employee = pae.employee
	WHERE 	pa.action_code IN ('JOBCHG')
		AND (LEFT(pa.NEW_VALUE_04,6)='EPHYAS' OR LEFT(pa.NEW_VALUE_04,4)='ERNP'
			OR LEFT(pa.NEW_VALUE_04,6)='EDIRPA' OR LEFT(pa.NEW_VALUE_04,8)= 'ELSNPANP'
			OR LEFT(pa.NEW_VALUE_04,6)='EPT000' )
		AND pa.New_Value_10 <> ''
		AND LEFT(pa.New_Value_10,4) NOT IN
			(select y.process_level
			from AppStaging.dbo.LawsonPAEMPPOS y
			WHERE y.employee = pa.employee
			AND y.END_DATE < '1900-01-01'
	)
END

