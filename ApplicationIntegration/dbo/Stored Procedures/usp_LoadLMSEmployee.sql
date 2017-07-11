USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_LoadLMSEmployee]    Script Date: 11/18/2016 10:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER        PROCEDURE [dbo].[usp_LoadLMSEmployee] 
AS

/* 	Author: 	Reetika Singh
	Date:		10/7/2016
	Revision:	7/18/2016 -- As per Mina -- 1. Provider should be pulled from PMB (Status = 0) irrespective of their status in Lawson
								2. The USER_STATUS_TEXT for PA/NP comes from Lawson and for MD/DO comes from SFDC
								
				9/19/2016 -- Changing manager information in LMSEmployee			
								For MA/MBSI -- HRSUPER
								FOR CEP     -- File from Roman
								
				10/3/2016 --- Get a list of inactive employees from existing LMSEmployee file

				11/2/2016 -- As per mina miller:
				
							For startups, LOA with no site, suspended with no site.

							SITE:  Site Unassigned
							MANAGER:  Manager Unassigned
								Firstname:  Manager
								Lastname:  Unassigned
								Employee ID:  107487CEP
								Username:  ManagerUnassigned

*/


BEGIN

  SET NOCOUNT ON;
SET XACT_ABORT ON;
	BEGIN TRY
	
		BEGIN TRANSACTION;

--PRINT 'Starting by inactives'	
						
			--Delete all Active Employees to be reloaded, keep inactives and update their status
			DELETE FROM LMSEmployee
			WHERE EMP_NO IN (SELECT ProviderMasterID 
								FROM ProviderMasterBase
								WHERE Status IN (0,2)
							UNION 
							SELECT ProviderMasterID 
								FROM EmployeeBase
								WHERE Status IN (0)
							)
			
			--Flag all inactive Employees
			UPDATE LMSEmployee
			SET ACTIVE_FLAG = 0,
				LOGIN_ENABLED_FLAG = 0,
				USER_STATUS_TEXT = 'Inactive',
				PRIMARY_ORG = '',
				MOBILE_ENABLED = 0


--PRINT 'Load MD/DO/PA/NP	'	
									
			--Load active employees - This makes sure all the active employees have latest data

			--Case 1 -- MD/DO/PA/NP

			INSERT INTO LMSEmployee
			SELECT DISTINCT PMB.ProviderMasterID EMP_NO,
					LTRIM(RTRIM(PMB.LastName)) LAST_NAME,
					LTRIM(RTRIM(PMB.FirstName)) FIRST_NAME,
					LTRIM(RTRIM(PMB.MiddleNameOrInitial)) MIDDLE_NAME,
					LTRIM(RTRIM(PMB.PreferredName)) PREFERRED_FIRST_NAME,
					PMB.HireDate [START_DATE],
					CASE WHEN PMB.[Status] IN (0,2)
						THEN 1 ELSE 0 END ACTIVE_FLAG,
					'CEPAmerica' PRIMARY_DOMAIN,
					'MA - Learner' SECURITY_ROLE,
					1 INTERNAL_FLAG, --Internal Flag Value must be 0(For No) or 1(For Yes)
					LTRIM(RTRIM(PMB.CEPEmail)) EMAIL,
					LTRIM(RTRIM(PMB.Address1)) WORK_ADDRESS1,
					LTRIM(RTRIM(PMB.City1)) WORK_CITY,
					LTRIM(RTRIM(PMB.State1)) WORK_STATE_TEXT,
					--Country1 WORK_COUNTRY_TEXT,
					LTRIM(RTRIM(PMB.CellPhoneNbr)) WORK_MOBILE,
					LTRIM(RTRIM(PMB.PhoneNbr1)) WORK_PHONE,
					'' MANAGER_NO,
					LTRIM(RTRIM(PMB.CEPEmail)) LOGIN_USERNAME, --Email Address
					CASE WHEN PMB.[Status] IN (0,2)
						THEN 1
						ELSE 0 END LOGIN_ENABLED_FLAG, -- Login Enabled Flag must be 0(For No) or 1(For Yes)
					--CASE WHEN LE.FTE_TOTAL LIKE '1.0%'
					--	THEN 'Full-time'
					--	WHEN LE.FTE_TOTAL LIKE '0.5%'
					--	THEN 'Part-time'
					--	WHEN LE.FTE_TOTAL LIKE '0.25%'
					--	THEN 'Part-time'
					--	ELSE '' END  USER_CODE_TEXT,
					CASE WHEN PM.PartnershipLevel LIKE '%Partner%'
							THEN 'Partner'
							ELSE 'Employee' END USER_CODE_TEXT,
					CASE WHEN LE.EMP_STATUS LIKE 'A%'
						THEN 'Active'
						WHEN LE.EMP_STATUS LIKE 'T%'
						THEN 'Inactive'
						WHEN LE.EMP_STATUS LIKE 'L%'
						THEN 'Leave of Absence'
						ELSE '' END  USER_STATUS_TEXT,
					LTRIM(RTRIM(SB.WebCode)) PRIMARY_ORG,
					CASE WHEN LTRIM(RTRIM(PMB.Title)) LIKE '%M.D%' OR LTRIM(RTRIM(PMB.Title)) LIKE '%D.O%'
						THEN 'MD'
						WHEN LTRIM(RTRIM(PMB.Title)) LIKE '%P.A%' OR LTRIM(RTRIM(PMB.Title)) LIKE '%N.P%' OR LTRIM(RTRIM(PMB.Title)) LIKE '%R.N%'
						THEN 'Advanced Provider'
						WHEN LTRIM(RTRIM(PMB.Title)) LIKE '%P.T%'
						THEN 'PT'
						ELSE '' END PRIMARY_JOB,
					PM.PartnershipLevel   PARNTERSHIP_LEVEL,
					LTRIM(RTRIM(LS.EMP_STATUS))+  ' - ' + LTRIM(RTRIM(LS.DESCRIPTION)) EMPLOYMENT_TYPE,
					NULL FIRST_SHIFT_DATE,
					NULL LAST_SHIFT_DATE,
					CASE WHEN PMB.Status IN (0,2)
						THEN 1
						ELSE 0 END AS MOBILE_ENABLED,
					'' CUSTOM_MEMO1
			FROM ProviderMasterBase PMB
			JOIN SiteBase SB ON PMB.ProviderMasterID = SB.ProviderMasterID
						AND SB.PrimarySite = 'Y'
			JOIN ProviderMaster PM ON PM.ProviderMasterID = PMB.ProviderMasterID
			JOIN LMSOrg LO ON LO.ORG_CODE = LTRIM(RTRIM(SB.WebCode))
			LEFT OUTER JOIN AppStaging.dbo.LawsonEMPLOYEE LE ON LE.FICA_NBR = PM.SSNFormatted
			LEFT OUTER JOIN AppStaging.dbo.LawsonEMSTATUS LS ON LS.EMP_STATUS = LE.EMP_STATUS
			WHERE PMB.Status IN (0, 2)
			--AND LE.EMP_STATUS NOT LIKE 'T%'
			AND PMB.CEPEmail IS NOT NULL
			AND PM.ExchangeDirectoryName IS NOT NULL
			ORDER BY PMB.ProviderMasterID



			--11/2/2016 --MD/DO/PA/NP -- No Site = Unassigned Site

			INSERT INTO LMSEmployee
			SELECT DISTINCT PMB.ProviderMasterID EMP_NO,
					LTRIM(RTRIM(PMB.LastName)) LAST_NAME,
					LTRIM(RTRIM(PMB.FirstName)) FIRST_NAME,
					LTRIM(RTRIM(PMB.MiddleNameOrInitial)) MIDDLE_NAME,
					LTRIM(RTRIM(PMB.PreferredName)) PREFERRED_FIRST_NAME,
					PMB.HireDate [START_DATE],
					CASE WHEN PMB.[Status] IN (0,2)
						THEN 1 ELSE 0 END ACTIVE_FLAG,
					'CEPAmerica' PRIMARY_DOMAIN,
					'MA - Learner' SECURITY_ROLE,
					1 INTERNAL_FLAG, --Internal Flag Value must be 0(For No) or 1(For Yes)
					LTRIM(RTRIM(PMB.CEPEmail)) EMAIL,
					LTRIM(RTRIM(PMB.Address1)) WORK_ADDRESS1,
					LTRIM(RTRIM(PMB.City1)) WORK_CITY,
					LTRIM(RTRIM(PMB.State1)) WORK_STATE_TEXT,
					LTRIM(RTRIM(PMB.CellPhoneNbr)) WORK_MOBILE,
					LTRIM(RTRIM(PMB.PhoneNbr1)) WORK_PHONE,
					'107487CEP' MANAGER_NO,
					LTRIM(RTRIM(PMB.CEPEmail)) LOGIN_USERNAME, --Email Address
					CASE WHEN PMB.[Status] IN (0,2)
						THEN 1
						ELSE 0 END LOGIN_ENABLED_FLAG, -- Login Enabled Flag must be 0(For No) or 1(For Yes)
					CASE WHEN PM.PartnershipLevel LIKE '%Partner%'
							THEN 'Partner'
							ELSE 'Employee' END USER_CODE_TEXT,
					CASE WHEN LE.EMP_STATUS LIKE 'A%'
						THEN 'Active'
						WHEN LE.EMP_STATUS LIKE 'T%'
						THEN 'Inactive'
						WHEN LE.EMP_STATUS LIKE 'L%'
						THEN 'Leave of Absence'
						ELSE '' END  USER_STATUS_TEXT,
					'ZZ22' PRIMARY_ORG,
					CASE WHEN LTRIM(RTRIM(PMB.Title)) LIKE '%M.D%' OR LTRIM(RTRIM(PMB.Title)) LIKE '%D.O%'
						THEN 'MD'
						WHEN LTRIM(RTRIM(PMB.Title)) LIKE '%P.A%' OR LTRIM(RTRIM(PMB.Title)) LIKE '%N.P%' OR LTRIM(RTRIM(PMB.Title)) LIKE '%R.N%'
						THEN 'Advanced Provider'
						WHEN LTRIM(RTRIM(PMB.Title)) LIKE '%P.T%'
						THEN 'PT'
						ELSE '' END PRIMARY_JOB,
					PM.PartnershipLevel   PARNTERSHIP_LEVEL,
					LTRIM(RTRIM(LS.EMP_STATUS))+  ' - ' + LTRIM(RTRIM(LS.DESCRIPTION)) EMPLOYMENT_TYPE,
					NULL FIRST_SHIFT_DATE,
					NULL LAST_SHIFT_DATE,
					CASE WHEN PMB.Status IN (0,2)
						THEN 1
						ELSE 0 END AS MOBILE_ENABLED,
					'' CUSTOM_MEMO1
			FROM ProviderMasterBase PMB
			JOIN ProviderMaster PM ON PMB.ProviderMasterID = PM.ProviderMasterID
			LEFT OUTER JOIN (SELECT * FROM SiteBase
							WHERE PrimarySite = 'Y'
							) SB ON SB.ProviderMasterID = PMB.ProviderMasterID
			LEFT OUTER JOIN AppStaging.dbo.LawsonEMPLOYEE LE ON LE.FICA_NBR = PM.SSNFormatted
			LEFT OUTER JOIN AppStaging.dbo.LawsonEMSTATUS LS ON LS.EMP_STATUS = LE.EMP_STATUS
			WHERE Status IN (0,2)
			AND PMB.ProviderMasterID NOT IN (SELECT EMP_NO FROM LMSEmployee)
			AND PartnershipLevel NOT IN ('Locum Tenen')
			AND WebCode IS NULL
			AND PMB.CEPEmail IS NOT NULL
			AND PM.ExchangeDirectoryName IS NOT NULL
			AND PMB.ProviderMasterID NOT IN (SELECT EMP_NO FROM LMSEmployee)
			ORDER BY PMB.ProviderMasterID










		--USER_STATUS_TEXT FOR PA/NP comes from Lawson For MD/DO comes from SFDC

			UPDATE LMSEmployee
			SET USER_STATUS_TEXT = ''
			WHERE PRIMARY_JOB = 'MD'


			UPDATE LMSEmployee
			SET USER_STATUS_TEXT = CASE WHEN ACTIVE_FLAG = 1 THEN 'Active'
										ELSE 'Inactive' END
			WHERE PRIMARY_JOB = 'MD'

		--Get LOA from SFDC


			UPDATE LMSEmployee
			SET USER_STATUS_TEXT = 'Leave of Absence'
			WHERE LMSEmployee.EMP_NO IN (SELECT PMB.ProviderMasterID
									FROM SalesForce...Department_History__c DH
									JOIN ProviderMasterBase PMB ON PMB.SFID = DH.Contact__c
									WHERE DH.Partnership_History__c LIKE '%Leave%of%Ab%'
									AND To__c >= GETDATE()
									AND From__c <= GETDATE())
			AND LMSEmployee.PRIMARY_JOB = 'MD'



--PRINT 'Insert non clinical population'	

			--Case 2 Every one else
			
			INSERT INTO LMSEmployee

			SELECT * FROM(
				SELECT DISTINCT EB.ProviderMasterID EMP_NO,
						LTRIM(RTRIM(EB.LastName)) LAST_NAME,
						LTRIM(RTRIM(EB.FirstName)) FIRST_NAME,
						LTRIM(RTRIM(EB.MiddleNameOrInitial)) MIDDLE_NAME,
						LTRIM(RTRIM(EB.PreferredName)) PREFERRED_FIRST_NAME,
						EB.HireDate [START_DATE],
						CASE WHEN EB.[Status] = 0
							THEN 1 ELSE 0 END ACTIVE_FLAG,
						'CEPAmerica' PRIMARY_DOMAIN,
						'MA - Learner' SECURITY_ROLE,
						1 INTERNAL_FLAG,
						LTRIM(RTRIM(EB.EmailAddress)) EMAIL,
						CASE WHEN EB.StaffGroup1 = 'MA'
							THEN '2100 Powell Street, Suite 900'
							WHEN EB.StaffGroup1 = 'MBSI'
							THEN '1601 Cummins Drive, Suite D'
							ELSE LTRIM(RTRIM(EB.Address1)) END WORK_ADDRESS1,
						CASE WHEN EB.StaffGroup1 = 'MA'
							THEN 'Emeryville'
							WHEN EB.StaffGroup1 = 'MBSI'
							THEN 'Modesto'
							ELSE LTRIM(RTRIM(EB.City1)) END WORK_CITY,
						CASE WHEN EB.StaffGroup1 IN ( 'MA', 'MBSI')
							THEN 'CA'
							ELSE LTRIM(RTRIM(EB.State1))END WORK_STATE_TEXT,
						--Country1 WORK_COUNTRY_TEXT,
						LTRIM(RTRIM(EB.CellPhoneNbr)) WORK_MOBILE,
						LTRIM(RTRIM(EB.PhoneNbr1)) WORK_PHONE,
						'' MANAGER_NO,
						LTRIM(RTRIM(EB.EmailAddress)) LOGIN_USERNAME,
						CASE WHEN EB.[Status] = 0
							THEN 1
							ELSE 0 END LOGIN_ENABLED_FLAG,
						--CASE WHEN LE.FTE_TOTAL LIKE '1.0%'
						--	THEN 'Full-time'
						--	WHEN LE.FTE_TOTAL LIKE '0.5%'
						--	THEN 'Part-time'
						--	WHEN LE.FTE_TOTAL LIKE '0.25%'
						--	THEN 'Part-time'
						--	ELSE '' END  USER_CODE_TEXT,
						'Employee' USER_CODE_TEXT,
						CASE WHEN LE.EMP_STATUS LIKE 'A%'
							THEN 'Active'
							WHEN LE.EMP_STATUS LIKE 'T%'
							THEN 'Inactive'
							WHEN LE.EMP_STATUS LIKE 'L%'
							THEN 'Leave of Absence'
							ELSE '' END  USER_STATUS_TEXT,
						LTRIM(RTRIM(ESB.WebCode)) PRIMARY_ORG,
						LTRIM(RTRIM(LE.R_POSITION)) PRIMARY_JOB,
						'' PARNTERSHIP_LEVEL,
						LTRIM(RTRIM(LS.EMP_STATUS))+  ' - ' + LTRIM(RTRIM(LS.DESCRIPTION)) EMPLOYMENT_TYPE,
						NULL FIRST_SHIFT_DATE,
						NULL LAST_SHIFT_DATE,
						CASE WHEN EB.Status = 0
							THEN 1
							ELSE 0 END AS MOBILE_ENABLED,
						'' CUSTOM_MEMO1
				FROM EmployeeBase EB with (nolock)
				JOIN EmployeeSiteBase ESB with (nolock)
					ON ESB.ProviderMasterID = EB.ProviderMasterID
					AND ESB.PrimarySite = 'Y'
				JOIN AppStaging.dbo.LawsonEMPLOYEE LE ON LE.EMPLOYEE = EB.LawsonID
				JOIN AppStaging.dbo.LawsonEMSTATUS LS ON LS.EMP_STATUS = LE.EMP_STATUS
				JOIN LMSOrg LO ON LO.ORG_CODE = LTRIM(RTRIM(ESB.WebCode))
				WHERE EB.[Status] IN (0)
					AND EB.ProviderMasterID IS NOT NULL
					AND LE.EMP_STATUS NOT LIKE 'T%'		
					AND (EB.EmailAddress IS NOT NULL AND EB.EmailAddress <> '')
			) EMP
			ORDER BY EMP.EMP_NO



			--Scribes/OSA Site = Unassigned Site
			
			INSERT INTO LMSEmployee			
			SELECT DISTINCT EB.ProviderMasterID EMP_NO,
					LTRIM(RTRIM(EB.LastName)) LAST_NAME,
					LTRIM(RTRIM(EB.FirstName)) FIRST_NAME,
					LTRIM(RTRIM(EB.MiddleNameOrInitial)) MIDDLE_NAME,
					LTRIM(RTRIM(EB.PreferredName)) PREFERRED_FIRST_NAME,
					EB.HireDate [START_DATE],
					CASE WHEN EB.[Status] = 0
						THEN 1 ELSE 0 END ACTIVE_FLAG,
					'CEPAmerica' PRIMARY_DOMAIN,
					'MA - Learner' SECURITY_ROLE,
					1 INTERNAL_FLAG,
					LTRIM(RTRIM(EB.EmailAddress)) EMAIL,
					CASE WHEN EB.StaffGroup1 = 'MA'
						THEN '2100 Powell Street, Suite 900'
						WHEN EB.StaffGroup1 = 'MBSI'
						THEN '1601 Cummins Drive, Suite D'
						ELSE LTRIM(RTRIM(EB.Address1)) END WORK_ADDRESS1,
					CASE WHEN EB.StaffGroup1 = 'MA'
						THEN 'Emeryville'
						WHEN EB.StaffGroup1 = 'MBSI'
						THEN 'Modesto'
						ELSE LTRIM(RTRIM(EB.City1)) END WORK_CITY,
					CASE WHEN EB.StaffGroup1 IN ( 'MA', 'MBSI')
						THEN 'CA'
						ELSE LTRIM(RTRIM(EB.State1))END WORK_STATE_TEXT,
					LTRIM(RTRIM(EB.CellPhoneNbr)) WORK_MOBILE,
					LTRIM(RTRIM(EB.PhoneNbr1)) WORK_PHONE,
					'107487CEP' MANAGER_NO,
					LTRIM(RTRIM(EB.EmailAddress)) LOGIN_USERNAME,
					CASE WHEN EB.[Status] = 0
						THEN 1
						ELSE 0 END LOGIN_ENABLED_FLAG,
					'Employee' USER_CODE_TEXT,
					CASE WHEN LE.EMP_STATUS LIKE 'A%'
						THEN 'Active'
						WHEN LE.EMP_STATUS LIKE 'T%'
						THEN 'Inactive'
						WHEN LE.EMP_STATUS LIKE 'L%'
						THEN 'Leave of Absence'
						ELSE '' END  USER_STATUS_TEXT,
					'ZZ22' PRIMARY_ORG,
					LTRIM(RTRIM(LE.R_POSITION)) PRIMARY_JOB,
					'' PARNTERSHIP_LEVEL,
					LTRIM(RTRIM(LS.EMP_STATUS))+  ' - ' + LTRIM(RTRIM(LS.DESCRIPTION)) EMPLOYMENT_TYPE,
					NULL FIRST_SHIFT_DATE,
					NULL LAST_SHIFT_DATE,
					CASE WHEN EB.Status = 0
						THEN 1
						ELSE 0 END AS MOBILE_ENABLED,
					'' CUSTOM_MEMO1
			FROM EmployeeBase EB
			JOIN AppStaging.dbo.LawsonEMPLOYEE LE ON LE.EMPLOYEE = EB.LawsonID
			JOIN AppStaging.dbo.LawsonEMSTATUS LS ON LS.EMP_STATUS = LE.EMP_STATUS
			LEFT OUTER JOIN (SELECT * 
							FROM EmployeeSiteBase
							WHERE PrimarySite = 'Y'
							) ESB ON ESB.ProviderMasterID = EB.ProviderMasterID
			WHERE EB.[Status] IN (0)
			AND EB.ProviderMasterID NOT IN (SELECT EMP_NO FROM LMSEmployee)
			AND LE.EMP_STATUS NOT LIKE 'T%'
			AND ESB.WebCode IS NULL
			AND StaffGroup1 NOT IN ('MA', 'MBSI')
			AND (EB.EmailAddress IS NOT NULL AND EB.EmailAddress <> '')
			ORDER BY EB.ProviderMasterID








--PRINT 'Remove Dupes'	

			--Resolve duplicate LawsonID
			--List of all Employees in Lawson that are termed and also have an active status:

			DELETE FROM LMSEmployee
			WHERE EMPLOYMENT_TYPE LIKE 'T%'
			AND EMP_NO IN (SELECT EMP_NO FROM LMSEmployee
							WHERE EMPLOYMENT_TYPE NOT LIKE 'T%')
							
							
			--Deletes second round
			
			IF OBJECT_ID('ApplicationIntegration..#DelEmployee') IS NOT NULL
			/*Then it exists*/
				DROP TABLE #DelEmployee
			
			SELECT DISTINCT LE.EMP_NO, LE.LAST_NAME, LE.FIRST_NAME, PM.SSNFormatted, Law.EMPLOYEE, 
							LTRIM(RTRIM(LS.EMP_STATUS))+  ' - ' + LTRIM(RTRIM(LS.DESCRIPTION)) EMPLOYMENT_TYPE
				INTO #DelEmployee
			FROM LMSEmployee LE
			JOIN ProviderMaster PM ON PM.ProviderMasterID = LE.EMP_NO 
			JOIN AppStaging.dbo.LawsonEMPLOYEE Law ON Law.FICA_NBR = PM.SSNFormatted
			JOIN AppStaging.dbo.LawsonEMSTATUS LS ON LS.EMP_STATUS = Law.EMP_STATUS
			WHERE LE.EMP_NO IN (
								SELECT EMP_No
								FROM LMSEmployee LE
								GROUP BY EMP_NO
								HAVING COUNT(*) > 1)
				AND Law.EMPLOYEE NOT IN (SELECT EMPLOYEEID FROM BSwiftDemographicsMaster)
			ORDER BY LE.EMP_NO


			DELETE
			FROM LMSEmployee 
			WHERE EXISTS (SELECT * FROM #DelEmployee DE
							WHERE DE.EMP_NO = LMSEmployee.EMP_NO
							AND LMSEmployee.EMPLOYMENT_TYPE = DE.EMPLOYMENT_TYPE)



			DROP TABLE #DelEmployee
			
--PRINT 'Manager for MA/MBSI'	
			
			--MA/MBSI/OSA/SCRIBE Manager Info:
			--9/27/2016 -- As per Mina and Steff at MBSI the managers come from Supervisor field
			--10/5/2016 -- SCRIBES and OSA have managers = Medical Director of their primary site
						-- All other employee population managers come from Lawson
			
			--For non SCRIBE and OSAs,  manager comes from Lawson
			IF OBJECT_ID('ApplicationIntegration..#TempLMSEmployee') IS NOT NULL
				DROP TABLE #TempLMSEmployee


			SELECT LMS.*
				 , LE.SUPERVISOR Manager
				, EB.StaffGroup1
			INTO #TempLMSEmployee
			FROM LMSEmployee LMS
			JOIN EmployeeBase EB ON LMS.EMP_NO = EB.ProviderMasterID
			JOIN AppStaging.dbo.LawsonEMPLOYEE LE ON LE.EMPLOYEE = EB.LawsonID
			WHERE Status = 0
				AND EMP_STATUS NOT LIKE 'T%'
				AND EB.StaffGroup1 NOT IN ('SCRIBE', 'OSA')
			ORDER BY SUPERVISOR_IND
				
			
			UPDATE #TempLMSEmployee
				SET MANAGER_NO = LawsonHRSUPER.EMPLOYEE
			FROM AppStaging.dbo.LawsonHRSUPER
			WHERE LawsonHRSUPER.CODE = #TempLMSEmployee.Manager
			

			
			UPDATE LMSEmployee
				SET MANAGER_NO = EB.ProviderMasterID
			FROM #TempLMSEmployee TE
			JOIN EmployeeBase EB ON EB.LawsonID = TE.MANAGER_NO
			WHERE TE.EMP_NO = LMSEmployee.EMP_NO
				AND EB.Status = 0
			
			
			DROP TABLE #TempLMSEmployee
			
--PRINT 'Scribe OSA manager'				
			--Manager for SCRIBE and OSA = Medical Director of their primary site
			
			;WITH Manager (EMP_NO, ManagerID)
			AS
			(
				SELECT LMS.EMP_NO, 
 					  HR.ProviderMasterID AS ManagerID
				FROM LMSEmployee LMS
				JOIN EmployeeBase EB ON LMS.EMP_NO = EB.ProviderMasterID
				JOIN (SELECT Code, PMB.ProviderMasterID
					   FROM Hospital_region Hosp
					   JOIN ProviderMasterBase PMB ON PMB.WebID = Hosp.Site_Dir
					  ) HR ON HR.Code = LMS.PRIMARY_ORG
				WHERE EB.StaffGroup1 IN ('SCRIBE', 'OSA')
					AND EB.Status = 0
					AND EB.ProviderMasterID NOT IN (SELECT ProviderMasterID 
												FROM ProviderMasterBase
												WHERE Status IN (0,2) )
			)
			UPDATE LMSEmployee
			SET MANAGER_NO = Manager.ManagerID
			FROM Manager 
			WHERE Manager.EMP_NO = LMSEMPLOYEE.EMP_NO;
				
				
				
--PRINT 'Manager from romans file'				
			--CEP America Manager from Roman's file
			
			UPDATE LMSEmployee
				SET MANAGER_NO = LCEP.ParentMPID
			FROM LMSCEPHierarchy LCEP
			JOIN ProviderMasterBase PMB ON PMB.ProviderMasterID = LCEP.MPID
			WHERE LCEP.MPID = LMSEmployee.EMP_NO;
			

--PRINT 'Security Role'	
			
			--UPDATE LMS Security Roles
			
					
			
			--Update managers
			UPDATE LMSEmployee
				SET SECURITY_ROLE = 'MA - Manager'
			WHERE CONVERT(varchar(50), EMP_NO) IN (SELECT DISTINCT MANAGER_NO FROM LMSEmployee
								WHERE MANAGER_NO <> '');
			
						
			--UPDATE LMSSecurityRoles
			--SET Role = REPLACE( Role, '-', ' - ')
			
			
			
			--AD security roles
			
			UPDATE LMSEmployee
				SET SECURITY_ROLE = LTRIM(RTRIM(LS.GroupName))
			FROM LMSSecurityRoles LS
			WHERE LS.Email = LMSEmployee.EMAIL;

			
						
			
			
--PRINT 'Adam Role'				
			--9/27/2016 - Adam Lafevers to be passed in Global Domain
			
			
			--UPDATE LMSEmployee
			--SET PRIMARY_DOMAIN = 'GLOBAL'
			--WHERE EMP_NO = 8894
			
			--9/27/2016 - OSA/OSC = MA - Roster Manager
--PRINT 'OSA SCRIBE Security'	
	
			--UPDATE LMSEmployee
			--SET SECURITY_ROLE = 'MA - Roster Manager'
			--FROM EmployeeBase EB 
			--WHERE EB.ProviderMasterID = LMSEmployee.EMP_NO
			--	AND EB.StaffGroup1 IN ('OSA', 'OSC')
			
--PRINT 'Updating Manager to blank'	
			--Where no manager pass an empty string


			UPDATE LMSEmployee
				SET MANAGER_NO = '""'
			WHERE MANAGER_NO IS NULL
				OR MANAGER_NO = ''
			

--PRINT 'Updating Shift Dates'	



			--UPDATE FIRST AND LAST SHIFT

			;WITH Shift_CTE (ProviderMasterID, FIRST_SHIFT_DATE, LAST_SHIFT_DATE)
			AS
			(
				SELECT PH.ProviderMasterID,
					MIN(PH.DateOfService) FIRST_SHIFT_DATE,
					MAX(PH.DateOfService) LAST_SHIFT_DATE
				FROM ProviderHoursDetail PH
				JOIN LMSEmployee LE ON LE.EMP_NO = PH.ProviderMasterID
				GROUP BY PH.ProviderMasterID
			)
			UPDATE LMSEmployee
			SET FIRST_SHIFT_DATE = SC.FIRST_SHIFT_DATE,
				LAST_SHIFT_DATE = SC.LAST_SHIFT_DATE
			FROM Shift_CTE SC
			WHERE SC.ProviderMasterID = LMSEMPLOYEE.EMP_NO;


			--SELECT * FROM LMSEmployee
--PRINT 'Updating memo field'	

			--10/5/2016 -- UPDATE Memo field with Tags = Practice Line
			
			;WITH PL_CTE (ProviderMasterID, Sites)
			AS
			(
				Select Main.ProviderMasterID,
					   REPLACE(Left(Main.Sites,Len(Main.Sites)-1), ',' , ' ~ ') As Sites
				From
					(
						Select distinct ST2.ProviderMasterID, 
							(
								Select ST1.Practice_Location__c + ',' AS [text()]
								From (
										SELECT DISTINCT ProviderMasterID,
													CASE WHEN Sites.WebCode = 'ARW4' 
														THEN 'EMPA' 
														ELSE Practice_Location__c END AS Practice_Location__c
										FROM (
											SELECT DISTINCT ProviderMasterID, WebCode
											FROM SiteBase
											UNION
											SELECT DISTINCT ProviderMasterID, WebCode
											FROM EmployeeSiteBase
											WHERE HospitalSFID IS NOT NULL) Sites
										LEFT OUTER JOIN SFDCPracLine SP ON SP.WebCode = Sites.WebCode
										WHERE Practice_Location__c is not null) ST1
								Where ST1.ProviderMasterID = ST2.ProviderMasterID
								ORDER BY ST1.ProviderMasterID
								For XML PATH ('')
							) [Sites]
						From (
							SELECT DISTINCT ProviderMasterID,
										CASE WHEN Sites.WebCode = 'ARW4' 
											THEN 'EMPA' 
											ELSE Practice_Location__c END AS Practice_Location__c
							FROM (
								SELECT DISTINCT ProviderMasterID, WebCode
								FROM SiteBase
								UNION
								SELECT DISTINCT ProviderMasterID, WebCode
								FROM EmployeeSiteBase
								WHERE HospitalSFID IS NOT NULL) Sites
							LEFT OUTER JOIN SFDCPracLine SP ON SP.WebCode = Sites.WebCode
							WHERE Practice_Location__c is not null) ST2
					) Main
				)
			UPDATE LMSEmployee
				SET CUSTOM_MEMO1 = PC.Sites
			FROM PL_CTE PC
			WHERE PC.ProviderMasterID = LMSEMPLOYEE.EMP_NO;
			
			
			
			
			/* Temporary manager fix*/
--PRINT 'Temp Manager fix'	

			UPDATE LMSEmployee
			SET MANAGER_NO = '""'
			WHERE MANAGER_NO NOT IN (SELECT CONVERT(varchar(50), EMP_NO) FROM LMSEmployee)
			AND PRIMARY_ORG <> 'ZZ22'
			
			/*Temporary Email fix*/
			

--PRINT 'Unassigned Site People Security Role = 'MA - Learner'			
			
			UPDATE LMSEmployee
			SET SECURITY_ROLE = 'MA - Learner'
			WHERE PRIMARY_ORG = 'ZZ22'
			
			
--PRINT 'Updating Temp Email'			
			
			--UPDATE LMSEmployee
			--SET EMAIL = 'donotreply@sumtotalsystems.com'
			
			

--PRINT 'Remove carriage return'	

			--Remove Carriage Return Line feed
     
			DECLARE @sSQl NVARCHAR(MAX)=''
			SELECT  
			@sSQl=@sSQl+'UPDATE ['+TABLE_NAME+ '] SET ['+COLUMN_NAME+']= REPLACE(REPLACE(['+COLUMN_NAME+ '], CHAR(13), ''''), CHAR(10), '''')'+
							' WHERE ['+COLUMN_NAME+ '] IS NOT NULL'+CHAR(13)+CHAR(13)
			 FROM  INFORMATION_SCHEMA.COLUMNS
			WHERE DATA_TYPE LIKE '%CHAR%'
			AND TABLE_NAME = 'LMSEmployee'
			--AND ORDINAL_POSITION < 30
			
			--PRINT @ssql

			EXEC sp_executesql @sSQl;
			
			





		COMMIT TRANSACTION;
	END TRY
	
	BEGIN CATCH
		IF (XACT_STATE()) = -1
			ROLLBACK TRANSACTION;

		-- test if the transaction is committable
		IF (XACT_STATE()) = 1
			COMMIT TRANSACTION;

	END CATCH;

	
	

END



