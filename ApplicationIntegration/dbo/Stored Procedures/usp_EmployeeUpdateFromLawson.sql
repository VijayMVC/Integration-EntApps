


CREATE        PROCEDURE [dbo].[usp_EmployeeUpdateFromLawson] 
AS

					 
	

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN


		--UPDATE Data

		UPDATE EmployeeBase
		SET PreferredName = LTRIM(RTRIM(T.FIRST_NAME)),
		LastName = LTRIM(RTRIM(T.LAST_NAME)),
		FirstName = LTRIM(RTRIM(T.FIRST_NAME)),
		MiddleNameOrInitial = LTRIM(RTRIM(T.MIDDLE_NAME)),
		Title = LTRIM(RTRIM(LJ.[DESCRIPTION])),
		MaritalStatus = LTRIM(RTRIM(P.TRUE_MAR_STAT)),
		Gender = LTRIM(RTRIM(P.SEX)),
		Address1= LTRIM(RTRIM(T.ADDR1)) + ' ' + LTRIM(RTRIM(T.ADDR2)),
		City1 = LTRIM(RTRIM(T.CITY)),
		State1 = LTRIM(RTRIM(T.[STATE])),
		ZipCode1 = LTRIM(RTRIM(T.ZIP)),
		Country1 = LTRIM(RTRIM(T.COUNTRY_CODE)),
		--PhoneNbr1 = LTRIM(RTRIM(P.HM_PHONE_NBR)),
		Address2= LTRIM(RTRIM(T.ADDR1)) + ' ' + LTRIM(RTRIM(T.ADDR2)),
		City2 = LTRIM(RTRIM(T.CITY)),
		State2 = LTRIM(RTRIM(T.[STATE])),
		ZipCode2 = LTRIM(RTRIM(T.ZIP)),
		Country2 = LTRIM(RTRIM(T.COUNTRY_CODE)),
		HireDate = T.DATE_HIRED,
		[Status] = CASE WHEN T.EMP_STATUS LIKE 'A%' OR T.EMP_STATUS LIKE 'L%'
					THEN 0 ELSE 1 END
		FROM AppStaging.dbo.LawsonEmployee T
		JOIN AppStaging.dbo.LawsonPAEMPLOYEE P
			ON T.EMPLOYEE = P.EMPLOYEE
		JOIN AppStaging.dbo.LawsonPAPOSITION LJ
				ON T.R_POSITION = LJ.R_POSITION
				AND T.DEPARTMENT = LJ.DEPARTMENT
				AND T.PROCESS_LEVEL = LJ.PROCESS_LEVEL
		WHERE EmployeeBase.LawsonID = T.EMPLOYEE
		AND EmployeeBase.LawsonID = P.EMPLOYEE
		AND LJ.END_DATE = '1753-01-01 00:00:00.000'



		update EmployeeBase
		SET FirstName = [dbo].[InitCap] ( [FirstName] ),
		LastName = [dbo].[InitCap] ( [LastName] ),
		MiddleNameOrInitial = [dbo].[InitCap] ( [MiddleNameOrInitial] ),
		PreferredName = [dbo].[InitCap] ( [PreferredName] )

		--Marital status Update

		UPDATE EmployeeBase
		SET MaritalStatus = CASE WHEN MaritalStatus = 'M'
								THEN 'Married'
								WHEN MaritalStatus = 'S' 
								THEN 'Single'
								When MaritalStatus = 'D'
								Then 'Divorced'
								WHEN MaritalStatus = 'W'
								THEN 'Widowed'
								WHEN MaritalStatus = 'P'
								THEN 'Partnered'
								WHEN MaritalStatus = 'R' OR MaritalStatus = 'L'
								THEN 'Separated'
								ELSE '' END
								


		--MBIS folks without WebID that have an email - Insert into PhysicianInfo

		TRUNCATE TABLE PhysInfoMBSIInsert

		INSERT INTO PhysInfoMBSIInsert
		select StaffGroup1, LawsonID, WebID,
		ProviderMasterID, EB.FirstName, EB.PreferredName, EB.LastName, ED.SamAccountName,
		EB.Title, EB.EmailAddress, 'dMBSI' AS Site1, EB.Status 
		from EmployeeBase EB
		join ExchangeDataImportEmployee ED on EB.LawsonID = ED.ipphone
		WHERE StaffGroup1 = 'MBSI'
		and Status = 0
		and WebID IS NULL

		--update MPID in Physician Info where WebID exists

		TRUNCATE TABLE PhyInfoUpdateEmployee

		INSERT INTO PhyInfoUpdateEmployee
		select E.StaffGroup1, ProviderMasterID, WebID, E.LawsonID ,E.LastName, 
				E.FirstName, E.EmailAddress, E.Status, ED.SamAccountName
		from EmployeeBase E
		left outer join ExchangeDataImportEmployee ED on E.LawsonID = ED.ipphone
		join PhysicianInfo P on P.ID = E.WebID
		where WebID IN ( select ID from PhysicianInfo
					where MPID = 0
					or MPID = ''
					or MPID is NULL)
		order by E.LastName
		
		/*Special case when a Scribe transitions over to PA. 
		Lawson will delete Hire_Source for the scribe and ProviderMasterBase will have the new record
		At this point we can term the scribe in EmployeeBase -- will have to delete*/
		
		UPDATE EmployeeBase
		SET Status = 1
		FROM AppStaging.dbo.LawsonPAEMPLOYEE LP
		WHERE LP.EMPLOYEE = EmployeeBase.LawsonID
		AND ProviderMasterID IN (SELECT ProviderMasterID FROM ProviderMasterBase)
		AND LP.HIRE_SOURCE = ''
		
		
		DELETE FROM EmployeeSiteBase
		WHERE ProviderMasterID IN (	SELECT ProviderMasterID  FROM EmployeeBase
						WHERE Status = 1 
						AND ProviderMasterID IN (SELECT ProviderMasterID FROM ProviderMasterBase))
		

		DELETE  FROM EmployeeBase
		WHERE Status = 1 
		AND ProviderMasterID IN (SELECT ProviderMasterID FROM ProviderMasterBase)
		
		
		/*Capture transitions of employees from one corporate group to another*/
		--Case 1 -- Other groups to MA/MBSI
		
		UPDATE EmployeeBase
		SET StaffGroup1 = CASE WHEN LE.PROCESS_LEVEL = 9100 
							THEN 'MA'
							ELSE 'MBSI' END,
			StaffGroup2 = CASE WHEN LE.PROCESS_LEVEL = 9100 
							THEN 'MA'
							ELSE 'MBSI' END
		FROM AppStaging.dbo.LawsonPAEMPLOYEE LPE 
		JOIN AppStaging.dbo.LawsonEMPLOYEE LE ON LPE.EMPLOYEE = LE.EMPLOYEE
		JOIN AppStaging.dbo.LawsonPAPOSITION LJ
										ON LE.R_POSITION = LJ.R_POSITION
										AND LE.DEPARTMENT = LJ.DEPARTMENT
										AND LE.PROCESS_LEVEL = LJ.PROCESS_LEVEL
		JOIN AppStaging.dbo.LawsonPRSYSTEM LP ON LP.PROCESS_LEVEL = LE.PROCESS_LEVEL
		JOIN AppStaging.dbo.LawsonPAEMPPOS LPOS ON LPOS.R_POSITION = LE.R_POSITION
											AND LPOS.EMPLOYEE = LE.EMPLOYEE
		WHERE EmployeeBase.LawsonID = LE.EMPLOYEE
		AND LE.PROCESS_LEVEL IN (9100, 9200)
		AND LPOS.END_DATE = '1753-01-01 00:00:00.000'
		AND LJ.END_DATE = '1753-01-01 00:00:00.000'
		AND LPE.HIRE_SOURCE = ''
		AND EmployeeBase.StaffGroup1 NOT IN ('MA', 'MBSI')


		--Case 2 -- From one group to another
		
		UPDATE EmployeeBase
		SET StaffGroup1 = CASE WHEN HIRE_SOURCE LIKE '%SCRIBE%' 
							THEN 'SCRIBE'
							WHEN HIRE_SOURCE LIKE 'AUC%'
							THEN 'AUC'
							ELSE 'OSA' END,
			StaffGroup2 = CASE WHEN HIRE_SOURCE LIKE '%SCRIBE%' 
							THEN 'SCRIBE'
							WHEN HIRE_SOURCE LIKE 'AUC%'
							THEN 'AUC'
							ELSE 'OSA' END
		FROM AppStaging.dbo.LawsonPAEMPLOYEE LPE 
		JOIN AppStaging.dbo.LawsonEMPLOYEE LE ON LPE.EMPLOYEE = LE.EMPLOYEE
		JOIN AppStaging.dbo.LawsonPAPOSITION LJ
										ON LE.R_POSITION = LJ.R_POSITION
										AND LE.DEPARTMENT = LJ.DEPARTMENT
										AND LE.PROCESS_LEVEL = LJ.PROCESS_LEVEL
		JOIN AppStaging.dbo.LawsonPRSYSTEM LP ON LP.PROCESS_LEVEL = LE.PROCESS_LEVEL
		JOIN AppStaging.dbo.LawsonPAEMPPOS LPOS ON LPOS.R_POSITION = LE.R_POSITION
											AND LPOS.EMPLOYEE = LE.EMPLOYEE
		WHERE EmployeeBase.LawsonID = LE.EMPLOYEE
			AND (HIRE_SOURCE LIKE '%scribe%'
			OR HIRE_SOURCE LIKE '%OSA%'
			OR HIRE_SOURCE LIKE 'AUC%')
			AND LPE.EMPLOYEE NOT IN (SELECT EMPLOYEE FROM AppStaging.dbo.LawsonEMPLOYEE
								WHERE PROCESS_LEVEL IN (9100, 9200))
			AND LPOS.END_DATE = '1753-01-01 00:00:00.000'
			AND LJ.END_DATE = '1753-01-01 00:00:00.000'
		
		
END

