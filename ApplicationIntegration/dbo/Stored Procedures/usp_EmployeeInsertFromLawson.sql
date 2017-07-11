


CREATE        PROCEDURE [dbo].[usp_EmployeeInsertFromLawson] 
AS

					 
	

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	/* Get Lawson Data*/
	
	--DROP TABLE #TempBase

	SELECT * INTO #TempBase
	FROM (
	SELECT DISTINCT LE.EMPLOYEE, LE.EMP_STATUS,
					LAST_NAME, FIRST_NAME, MIDDLE_NAME,FICA_NBR,
						LE.EMAIL_ADDRESS,
						LE.ADDR1, LE.ADDR2,LE.CITY, LE.STATE, LE.COUNTRY_CODE, LE.ZIP,
						LPE.HM_PHONE_NBR,
						DATE_HIRED As HireDate,
						ADJ_HIRE_DATE As AdjHireDate,
						LE.PROCESS_LEVEL, LP.Name AS Process_LevelDesc,
						LE.R_POSITION, LJ.DESCRIPTION AS PositionDesc, LPE.SEX,LPE.TRUE_MAR_STAT,
						CASE WHEN LE.PROCESS_LEVEL = 9100 
							THEN 'MA'
							ELSE 'MBSI' END AS StaffGroup
	FROM AppStaging.dbo.LawsonPAEMPLOYEE LPE
	JOIN AppStaging.dbo.LawsonEMPLOYEE LE ON LPE.EMPLOYEE = LE.EMPLOYEE
	JOIN AppStaging.dbo.LawsonPAPOSITION LJ
									ON LE.R_POSITION = LJ.R_POSITION
									AND LE.DEPARTMENT = LJ.DEPARTMENT
									AND LE.PROCESS_LEVEL = LJ.PROCESS_LEVEL
	JOIN AppStaging.dbo.LawsonPRSYSTEM LP ON LP.PROCESS_LEVEL = LE.PROCESS_LEVEL
	JOIN AppStaging.dbo.LawsonPAEMPPOS LPOS ON LPOS.R_POSITION = LE.R_POSITION
										AND LPOS.EMPLOYEE = LE.EMPLOYEE
	WHERE LE.PROCESS_LEVEL IN (9100, 9200)
	AND LPOS.END_DATE = '1753-01-01 00:00:00.000'
	AND LJ.END_DATE = '1753-01-01 00:00:00.000'
	UNION
	SELECT DISTINCT LE.EMPLOYEE, LE.EMP_STATUS,
						LAST_NAME, FIRST_NAME, MIDDLE_NAME,FICA_NBR,
						LE.EMAIL_ADDRESS,
						LE.ADDR1, LE.ADDR2,LE.CITY, LE.STATE, LE.COUNTRY_CODE, LE.ZIP,
						LPE.HM_PHONE_NBR,
						DATE_HIRED As HireDate,
						ADJ_HIRE_DATE As AdjHireDate,
						LE.PROCESS_LEVEL, LP.Name AS Process_LevelDesc,
						LE.R_POSITION, LJ.DESCRIPTION AS PositionDesc, LPE.SEX,LPE.TRUE_MAR_STAT,
						CASE WHEN HIRE_SOURCE LIKE '%SCRIBE%' 
							THEN 'SCRIBE'
							WHEN HIRE_SOURCE LIKE 'AUC%'
							THEN 'AUC'
							ELSE 'OSA' END AS StaffGroup
	FROM AppStaging.dbo.LawsonPAEMPLOYEE LPE
	JOIN AppStaging.dbo.LawsonEMPLOYEE LE ON LPE.EMPLOYEE = LE.EMPLOYEE
	JOIN AppStaging.dbo.LawsonPAPOSITION LJ
									ON LE.R_POSITION = LJ.R_POSITION
									AND LE.DEPARTMENT = LJ.DEPARTMENT
									AND LE.PROCESS_LEVEL = LJ.PROCESS_LEVEL
	JOIN AppStaging.dbo.LawsonPRSYSTEM LP ON LP.PROCESS_LEVEL = LE.PROCESS_LEVEL
	JOIN AppStaging.dbo.LawsonPAEMPPOS LPOS ON LPOS.R_POSITION = LE.R_POSITION
										AND LPOS.EMPLOYEE = LE.EMPLOYEE
	WHERE (HIRE_SOURCE LIKE '%scribe%'
	OR HIRE_SOURCE LIKE '%OSA%'
	OR HIRE_SOURCE LIKE 'AUC%')
	AND LPE.EMPLOYEE NOT IN (SELECT EMPLOYEE FROM AppStaging.dbo.LawsonEMPLOYEE
						WHERE PROCESS_LEVEL IN (9100, 9200))
	AND LPOS.END_DATE = '1753-01-01 00:00:00.000'
	AND LJ.END_DATE = '1753-01-01 00:00:00.000'
	) T
	ORDER BY LAST_NAME, FIRST_NAME


	--select distinct EMP_STATUS from #TempBase

	INSERT INTO ApplicationIntegration.dbo.EmployeeBase
	SELECT StaffGroup,
		StaffGroup, 
		NULL,
		NULL,
		NULL,
		LTRIM(RTRIM(EMPLOYEE)),
		LTRIM(RTRIM(FICA_NBR)),
		LTRIM(RTRIM(LAST_NAME)),
		LTRIM(RTRIM(FIRST_NAME)),
		LTRIM(RTRIM(MIDDLE_NAME)),
		LTRIM(RTRIM(FIRST_NAME)),
		NULL,
		LTRIM(RTRIM(PositionDesc)),
		LTRIM(RTRIM(TRUE_MAR_STAT)),
		NULL,
		LTRIM(RTRIM(SEX)),
		LTRIM(RTRIM(EMAIL_ADDRESS)),
		NULL,
		NULL,
		'Home',
		LTRIM(RTRIM(ADDR1)) + ' ' + LTRIM(RTRIM(ADDR2)),
		LTRIM(RTRIM(CITY)),
		LTRIM(RTRIM(STATE)),
		LTRIM(RTRIM(ZIP)),
		LTRIM(RTRIM(COUNTRY_CODE)),
		LTRIM(RTRIM(HM_PHONE_NBR)),
		NULL,
		'Mailing',
		LTRIM(RTRIM(ADDR1)) + ' ' + LTRIM(RTRIM(ADDR2)),
		LTRIM(RTRIM(CITY)),
		LTRIM(RTRIM(STATE)),
		LTRIM(RTRIM(ZIP)),
		LTRIM(RTRIM(COUNTRY_CODE)),
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		HireDate,
		NULL,
		NULL,
		NULL,
		NULL,
		LTRIM(RTRIM(EMP_STATUS)),
		NULL,
		NULL
	FROM #TempBase
	WHERE EMPLOYEE NOT IN (SELECT LawsonID 
					FROM ApplicationIntegration.dbo.EmployeeBase
					)
	AND FICA_NBR NOT IN (SELECT TaxIDIncorporated 
					FROM ApplicationIntegration.dbo.EmployeeBase
					WHERE Status = 0
					)
		


	UPDATE EmployeeBase
	SET Status = LTRIM(RTRIM(LE.EMP_STATUS))
	FROM AppStaging.dbo.LawsonEMPLOYEE LE
	WHERE LE.EMPLOYEE = EmployeeBase.LawsonID



	UPDATE EmployeeBase
	SET Status = 0 
	WHERE Status like 'A%'
	or Status like 'L%'


	UPDATE EmployeeBase
	SET Status = 1
	WHERE STATUS like 'T%'
	
	
	/* if PMID is null then look for a match*/
		
	UPDATE EmployeeBase
	SET EmployeeBase.ProviderMasterID = PM.ProviderMasterID,
	EmployeeBase.WebID = PM.WebID,
	EmployeeBase.SFID = PM.SFID
	FROM ProviderMaster PM
	WHERE PM.SSNFormatted = EmployeeBase.TaxIDIncorporated
	AND PM.ProviderMasterID NOT IN (SELECT ProviderMasterID FROM ProviderMasterBase)
	AND (PM.SSNFormatted <> ''
	OR PM.SSNFormatted IS Not NULL)
	AND EmployeeBase.ProviderMasterID IS NULL


	/*UPDATE from Employee Lookup*/

	UPDATE EmployeeBase
	SET EmployeeBase.WebID = EL.ID
	FROM LS_EmplLookup EL
	WHERE EL.LawsonNum = EmployeeBase.LawsonID
	AND EmployeeBase.WebID IS NULL
	AND EL.LawsonNum NOT LIKE '0%'



	UPDATE EmployeeBase
	SET EmployeeBase.ProviderMasterID = PM.ProviderMasterID
	FROM ProviderMaster PM
	WHERE PM.WebID = EmployeeBase.WebID
	AND EmployeeBase.ProviderMasterID IS NULL
	AND EmployeeBase.LastName = PM.LastName
	AND EmployeeBase.FirstName = PM.FirstName


	/* corner cases*/

	update EmployeeBase
	set WebID =  13025
	where LawsonID = 9372   


	update EmployeeBase
	set WebID =  10652
	where LawsonID = 9243   
	
	
	update EmployeeBase
	set LawsonID =  12362
	where WebID = 15661 



	UPDATE EmployeeBase 
	SET ProviderMasterID = 2297,
	WebID = 1665
	FROM ProviderMaster PM
	WHERE EmployeeBase.LastName = 'Wood'
	and EmployeeBase.FirstName = 'Shawn'
	and EmployeeBase.WebID is NULL


	/* Email and user names from Exchange Data*/

	DELETE FROM ExchangeDataImportEmployee
	WHERE ipphone = 'ipphone' 
	or ISNUMERIC(ipphone) <> 1
	or ipphone LIKE '%,%'
	or ipphone LIKE '%+%'
	or ipphone LIKE '%.%'

	UPDATE ExchangeDataImportEmployee
	SET PhoneNumber = ''
	WHERE PhoneNumber IN ('Not Applicable', 'Not Available')


	UPDATE ExchangeDataImportEmployee
	SET PhoneNumber = REPLACE(LTRIM(RTRIM(PhoneNumber)), '+', '')
	
	/* 6/6/2016 --  UPDATE from Lawson to capture the changes made in Lawson in case 
					Phone Number is missing from Exchange report -- CS-1279 */
	
	UPDATE EmployeeBase
		SET PhoneNbr1 = LTRIM(RTRIM(P.HM_PHONE_NBR))
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

	--UPDATE for MBSI all from Exchange

	UPDATE EmployeeBase
	SET EmailAddress = LTRIM(RTRIM(ED.Email)),
	PhoneNbr1 = LTRIM(RTRIM(ED.PhoneNumber))
	FROM dbo.ExchangeDataImportEmployee ED
	WHERE ED.ipphone = EmployeeBase.LawsonID
	AND EmployeeBase.StaffGroup1 = 'MBSI'


	-- Update all other groups from exchange

	UPDATE EmployeeBase
	SET EmailAddress = LTRIM(RTRIM(ED.Email))
	FROM dbo.ExchangeDataImportEmployee ED
	WHERE ED.ipphone = EmployeeBase.LawsonID
	AND EmployeeBase.StaffGroup1 <> 'MBSI'
	AND ED.Email <> ''



	UPDATE EmployeeBase
	SET PhoneNbr1 = LTRIM(RTRIM(ED.PhoneNumber))
	FROM dbo.ExchangeDataImportEmployee ED
	WHERE ED.ipphone = EmployeeBase.LawsonID
	AND EmployeeBase.StaffGroup1 <> 'MBSI'
	AND ED.PhoneNumber <> ''


	UPDATE EmployeeBase
	SET EmailAddress = ''
	WHERE emailaddress not like '%cep.com%'
	AND emailaddress not like '%medamerica.com%' 
	
	UPDATE EmployeeBase 
	SET EmailAddress = ED.Email
	FROM ExchangeDataImport ED
	WHERE ED.MPID = EmployeeBase.ProviderMasterID
	AND (emailaddress not like '%cep.com%'
	AND emailaddress not like '%medamerica.com%' )
	AND ISNUMERIC(MPID) = 1
	AND MPID NOT IN (SELECT ProviderMasterID FROM ProviderMasterBase)
	
	
	/* INSERT NEW HIRES TO CREATE PMID - The query below excludes any one whose name matches 
		with a record already in ProviderMasterTable*/
	
	INSERT INTO ProviderMaster
		(SFID,
		 WebID,
		 SSNFormatted, 
		 LastName,  		 FirstName,  
		 MiddleNameOrInitial,   
		 DateOfHire,
		 EmailAddress1,	 
		 CurrentlyNotComparedFlag,
		 CurrentProviderFlag)
	SELECT 	NULL ,
		 EB.WebID ,
		 EB.TaxIDIncorporated,
		 EB.LastName,
		 EB.FirstName,
		 EB.MiddleNameOrInitial,
		 EB.HireDate,
		 EB.EmailAddress,
		 'Y' ,
		 'N' 
		FROM EmployeeBase EB
			WHERE NOT EXISTS 
				(SELECT 1 
					FROM ProviderMaster Prov
					WHERE EB.TaxIDIncorporated = Prov.SSNFormatted
					AND EB.TaxIDIncorporated <> '')			
			AND EB.ProviderMasterID IS NULL
			AND EB.TaxIDIncorporated IS NOT NULL
			AND EB.TaxIDIncorporated <> ''
			--AND WebID NOT IN (SELECT WebID FROM ProviderMasterBase)
			--AND NOT EXISTS 
			--	(SELECT 1 
			--		FROM ProviderMaster Prov
			--		WHERE EB.LastName = Prov.LastName
			--		AND EB.FirstName = Prov.FirstName
			--		)	
		ORDER BY HireDate
		
		
		UPDATE EmployeeBase
		SET ProviderMasterID = PM.ProviderMasterID
		FROM ProviderMaster PM
		WHERE PM.SSNFormatted = EmployeeBase.TaxIDIncorporated
		AND PM.ProviderMasterID NOT IN (SELECT ProviderMasterID FROM ProviderMasterBase)
		AND (PM.SSNFormatted <> ''
		OR PM.SSNFormatted IS Not NULL)
		AND EmployeeBase.ProviderMasterID IS NULL

		


	/* SiteLine */
	UPDATE ProviderMaster SET 
		SitelineCntID 	= TbC.CntID, 
		UpdDate 	= GETDATE()
		FROM Appstaging.dbo.Siteline_tblCnt TbC, ProviderMaster Prov
		WHERE ((TbC.CntNameFirst = Prov.FirstName AND TbC.CntNameLast = Prov.LastName)
			OR TbC.zcntssn = Prov.SSNFormatted)
			AND NOT EXISTS
				(SELECT 1 
					FROM ProviderMaster Prov2
					WHERE TbC.CntID = Prov2.SitelineCntID)
					  AND Prov.SitelineCntID IS NULL
					  
					  
					  
	--Without name matching when sure no duplicates exist//SAMPLE
	
	
	--INSERT INTO ProviderMaster
	--	(SFID,
	--	 WebID,
	--	 SSNFormatted, 
	--	 LastName,  	--	 FirstName,  
	--	 MiddleNameOrInitial,   
	--	 DateOfHire,
	--	 EmailAddress1,	 
	--	 CurrentlyNotComparedFlag,
	--	 CurrentProviderFlag)
	--SELECT 	NULL ,
	--	 EB.WebID ,
	--	 EB.TaxIDIncorporated,
	--	 EB.LastName,
	--	 EB.FirstName,
	--	 EB.MiddleNameOrInitial,
	--	 EB.HireDate,
	--	 EB.EmailAddress,
	--	 'Y' ,
	--	 'N' 
	--	FROM EmployeeBase EB
	--		WHERE NOT EXISTS 
	--			(SELECT 1 
	--				FROM ProviderMaster Prov
	--				WHERE EB.TaxIDIncorporated = Prov.SSNFormatted)			
	--		AND EB.ProviderMasterID IS NULL
	--		AND EB.LastName NOT IN ('Mack','Williams')                      
	--	ORDER BY HireDate
	
	
	--Exception Report for same name check
	
	TRUNCATE TABLE EmployeeExceptionsReport
	
	INSERT INTO EmployeeExceptionsReport	
	SELECT 	NULL AS PMID ,
		 EB.WebID ,
		 EB.TaxIDIncorporated,
		 EB.LastName,
		 EB.FirstName,
		 EB.MiddleNameOrInitial,
		 EB.HireDate,
		 EB.EmailAddress  
		FROM EmployeeBase EB
			WHERE NOT EXISTS 
				(SELECT 1 
					FROM ProviderMaster Prov
					WHERE EB.TaxIDIncorporated = Prov.SSNFormatted
					AND EB.TaxIDIncorporated <> '')			
			AND EB.ProviderMasterID IS NULL
			AND EXISTS 
				(SELECT 1 
					FROM ProviderMaster Prov
					WHERE EB.LastName = Prov.LastName
					AND EB.FirstName = Prov.FirstName
					)	
		ORDER BY HireDate


END



