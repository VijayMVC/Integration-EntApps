

CREATE        PROCEDURE [dbo].[usp_PA_NP_HistCounts_Hosp] 
AS

/* 	Author: 	Reetika Singh
	Date:	    1/8/2015
	Purpose:	Generates the report PA_NP_Historical Counts for HOSPITALIST AND Phyisical Therapist
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

		--TRUNCATE TABLE PANPHistCount 
	
		DECLARE @v_end_date as datetime

		-- If January then continue to load previous year
		-- Else load current year
		SET @v_end_date = 
				CASE	WHEN month(getDate())=1 THEN '12/31/' + cast(year(getDate())-1 as varchar)
					ELSE '12/31/' + cast(year(getDate()) as varchar)
				END
		--For Manual back load
		--SET @v_end_date = '12/31/2011'

		BEGIN
		
		
		INSERT INTO PANPHistCount
		SELECT * FROM (

			/******  Full Time PA data for the period	*****/
			SELECT 	
		ltrim(rtrim(a.first_name)) + ' ' + ltrim(rtrim(a.last_name)) as provider, a.employee,
				upper(b.name) as site, a.process_level, 
				CASE
					WHEN a.process_level >=1000 AND a.process_level < 2000 THEN 'CA'
					ELSE 'NON-CA'
				END as ca_flag,
				c.description as position, 
				CASE 
					WHEN c.description LIKE '%NP%' THEN 'HOSP-NP'
					WHEN c.description LIKE '%PHYSICAL THERAPIST%' THEN 'PT'
					ELSE	'HOSP-PA' END as pa_np,
				'FULL TIME' as emp_status,
				convert(varchar, a.date_hired, 101) as date_hired,
				e.address1, e.city1, e.state1, e.zipCode1, 
				CASE 	WHEN len(e.phoneNbr1) !< 3 THEN e.phoneNbr1
					ELSE e.phoneNbr2
				END as phoneNbr,
				e.CellPhoneNbr,
				e.CEPEmail,
				d.providerMasterID
			FROM AppStaging.dbo.LawsonEMPLOYEE a  
				INNER JOIN AppStaging.dbo.LawsonPRSYSTEM b ON a.process_level = b.process_level
				INNER JOIN AppStaging.dbo.LawsonJOBCODE c ON a.job_code = c.job_code
				INNER JOIN ApplicationIntegration.dbo.LawsonIDMatch d ON a.employee = d.LawsonEmpNo
				LEFT OUTER JOIN ApplicationIntegration.dbo.providerMasterBase e ON e.providerMasterID = d.providerMasterID
			WHERE a.employee IN
			(
				SELECT ep.employee
				FROM AppStaging.dbo.LawsonPAEMPPOS ep
				WHERE (fte = 1 or a.emp_status = 'A1' )
				 	AND (
					ep.end_date >= @v_end_date AND ep.effect_date < @v_end_date 
					OR (ep.effect_date <= @v_end_date AND ep.end_date < '1/1/1901') 
					)
				AND ep.pos_level=1
				AND ep.JOB_CODE IN ('EPT00000','HLSTASS1', 'HLSTASSI', 'HLSTASSL', 
						'HLSTASSR', 'HLSTNPR1', 'HLSTNPRI', 'HLSTNPRL', 'HLSTNPRR ' )
				GROUP BY employee
			) 
			AND a.process_level in (1233, 1294, 1296, 1297, 1298, 1299, 1300, 1301, 1302, 1305, 1306, 1307, 1308, 1309, 1319, 2149, 2901)
			-- Employees without term dates removed - SG 10/8/2012
			




			UNION ALL


			/******  Part Time PA data for the period	*****/
			SELECT 	
		ltrim(rtrim(a.first_name)) + ' ' + ltrim(rtrim(a.last_name)) as provider, a.employee,
				upper(b.name) as site, a.process_level, 
				CASE
					WHEN a.process_level >=1000 AND a.process_level < 2000 THEN 'CA'
					ELSE 'NON-CA'
				END as ca_flag,
				c.description as position, 
				CASE 
					WHEN c.description LIKE '%NP%' THEN 'HOSP-NP'
					WHEN c.description LIKE '%PHYSICAL THERAPIST%' THEN 'PT'
					ELSE	'HOSP-PA' END as pa_np,
				'PART TIME' as emp_status,
				convert(varchar, a.date_hired, 101) as date_hired,
				e.address1, e.city1, e.state1, e.zipCode1, 
				CASE 	WHEN len(e.phoneNbr1) !< 3 THEN e.phoneNbr1
					ELSE e.phoneNbr2
				END as phoneNbr,
				e.CellPhoneNbr,
				e.CEPEmail,
				d.providerMasterID
			FROM AppStaging.dbo.LawsonEMPLOYEE a  
				INNER JOIN AppStaging.dbo.LawsonPRSYSTEM b ON a.process_level = b.process_level
				INNER JOIN AppStaging.dbo.LawsonJOBCODE c ON a.job_code = c.job_code
				INNER JOIN ApplicationIntegration.dbo.LawsonIDMatch d ON a.employee = d.LawsonEmpNo
				LEFT OUTER JOIN ApplicationIntegration.dbo.providerMasterBase e ON e.providerMasterID = d.providerMasterID
			WHERE a.employee IN
			(
				SELECT ep.employee
				FROM AppStaging.dbo.LawsonPAEMPPOS ep
				WHERE (fte = 0.5 or a.emp_status = 'A2' )
				 	AND (
					ep.end_date >= @v_end_date AND ep.effect_date < @v_end_date 
					OR (ep.effect_date <= @v_end_date AND ep.end_date < '1/1/1901') 
					)
				AND ep.pos_level=1
				AND ep.JOB_CODE IN ('EPT00000','HLSTASS1', 'HLSTASSI', 'HLSTASSL', 
						'HLSTASSR', 'HLSTNPR1', 'HLSTNPRI', 'HLSTNPRL', 'HLSTNPRR ' )
				GROUP BY employee
			) 
			AND a.process_level in (1233, 1294, 1296, 1297, 1298, 1299, 1300, 1301, 1302, 1305, 1306, 
								1307, 1308, 1309, 1319, 2149, 2901)


			UNION ALL


			/******  PER DIEM PA data for the period	*****/
			SELECT 	
		ltrim(rtrim(a.first_name)) + ' ' + ltrim(rtrim(a.last_name)) as provider, a.employee,
				upper(b.name) as site, a.process_level, 
				CASE
					WHEN a.process_level >=1000 AND a.process_level < 2000 THEN 'CA'
					ELSE 'NON-CA'
				END as ca_flag,
				c.description as position, 
				CASE 
					WHEN c.description LIKE '%NP%' THEN 'HOSP-NP'
					WHEN c.description LIKE '%PHYSICAL THERAPIST%' THEN 'PT'
					ELSE	'HOSP-PA' END as pa_np,
				'PER DIEM' as emp_status,
				convert(varchar, a.date_hired, 101) as date_hired,
				e.address1, e.city1, e.state1, e.zipCode1, 
				CASE 	WHEN len(e.phoneNbr1) !< 3 THEN e.phoneNbr1
					ELSE e.phoneNbr2
				END as phoneNbr,
				e.CellPhoneNbr,
				e.CEPEmail,
				d.providerMasterID
			FROM AppStaging.dbo.LawsonEMPLOYEE a  
				INNER JOIN AppStaging.dbo.LawsonPRSYSTEM b ON a.process_level = b.process_level
				INNER JOIN AppStaging.dbo.LawsonJOBCODE c ON a.job_code = c.job_code
				INNER JOIN ApplicationIntegration.dbo.LawsonIDMatch d ON a.employee = d.LawsonEmpNo
				LEFT OUTER JOIN ApplicationIntegration.dbo.providerMasterBase e ON e.providerMasterID = d.providerMasterID
			WHERE a.employee IN
			(
				SELECT ep.employee
				FROM AppStaging.dbo.LawsonPAEMPPOS ep
				WHERE (fte = 0.25 or a.emp_status = 'A6' )
				 	AND (
					ep.end_date >= @v_end_date AND ep.effect_date < @v_end_date 
					OR (ep.effect_date <= @v_end_date AND ep.end_date < '1/1/1901') 
					)
				AND ep.pos_level=1
				AND ep.JOB_CODE IN ('EPT00000','HLSTASS1', 'HLSTASSI', 'HLSTASSL', 
						'HLSTASSR', 'HLSTNPR1', 'HLSTNPRI', 'HLSTNPRL', 'HLSTNPRR ' )
				GROUP BY employee
			) 
			AND a.process_level in (1233, 1294, 1296, 1297, 1298, 1299, 1300, 1301, 1302, 1305, 1306, 
									1307, 1308, 1309, 1319, 2149, 2901)


			UNION ALL


			/******  'UNKNOWN' PA data for the period	*****/
			SELECT 	
		ltrim(rtrim(a.first_name)) + ' ' + ltrim(rtrim(a.last_name)) as provider, a.employee,
				upper(b.name) as site, a.process_level, 
				CASE
					WHEN a.process_level >=1000 AND a.process_level < 2000 THEN 'CA'
					ELSE 'NON-CA'
				END as ca_flag,
				c.description as position, 
				CASE 
					WHEN c.description LIKE '%NP%' THEN 'HOSP-NP'
					WHEN c.description LIKE '%PHYSICAL THERAPIST%' THEN 'PT'
					ELSE	'HOSP-PA' END as pa_np,
				'UNKNOWN' as emp_status,
				convert(varchar, a.date_hired, 101) as date_hired,
				e.address1, e.city1, e.state1, e.zipCode1, 
				CASE 	WHEN len(e.phoneNbr1) !< 3 THEN e.phoneNbr1
					ELSE e.phoneNbr2
				END as phoneNbr,
				e.CellPhoneNbr,
				e.CEPEmail,
				d.providerMasterID
			FROM AppStaging.dbo.LawsonEMPLOYEE a  
				INNER JOIN AppStaging.dbo.LawsonPRSYSTEM b ON a.process_level = b.process_level
				INNER JOIN AppStaging.dbo.LawsonJOBCODE c ON a.job_code = c.job_code
				INNER JOIN ApplicationIntegration.dbo.LawsonIDMatch d ON a.employee = d.LawsonEmpNo
				LEFT OUTER JOIN ApplicationIntegration.dbo.providerMasterBase e ON e.providerMasterID = d.providerMasterID
			WHERE a.employee IN
			(
				SELECT ep.employee
				FROM AppStaging.dbo.LawsonPAEMPPOS ep
				WHERE (fte NOT IN (1, .5, .25) and a.emp_status NOT IN ('A1','A2','A6'))
				 	AND (
					ep.end_date >= @v_end_date AND ep.effect_date < @v_end_date 
					OR (ep.effect_date <= @v_end_date AND ep.end_date < '1/1/1901') 
					)
				AND ep.pos_level=1
				AND ep.JOB_CODE IN ('EPT00000','HLSTASS1', 'HLSTASSI', 'HLSTASSL', 
						'HLSTASSR', 'HLSTNPR1', 'HLSTNPRI', 'HLSTNPRL', 'HLSTNPRR ' )
				GROUP BY employee
			) 
			AND a.process_level in (1233, 1294, 1296, 1297, 1298, 1299, 1300, 1301, 1302, 1305, 1306, 1307, 1308, 1309, 1319, 2149, 2901)
			
				
				)		AS T ORDER BY T.date_hired;
			
	END


	DELETE FROM  PANPHistCount
	WHERE EMPLOYEE IN (SELECT LP.EMPLOYEE
				FROM AppStaging.dbo.LawsonPAEMPLOYEE LP
				WHERE (LP.BEN_SALARY_1 = 0
							AND LP.BEN_SALARY_2 = 0))
	

END


