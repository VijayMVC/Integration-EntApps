USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_LawsonNewHireEntryCorporate]    Script Date: 10/13/2016 15:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER                      PROCEDURE [dbo].[usp_LawsonNewHireEntryCorporate] 
AS

/* 	Author: 	Reetika Singh
	Date:		12/15/2010
	Purpose:	Load new hires into Lawson using PA31 and PA52.4
	Revision:	Populations: OSA/OSC/MA/MBSI
				Date Source: Salesforce
				Matching Key: SSN
				10/11/2016 -- added following SSN Rules				
				SSA will not issue SSNs beginning with the number “9”.
				SSA will not issue SSNs beginning with the number “666” in positions 1 – 3.
				SSA will not issue SSNs beginning with the number “000” in positions 1 – 3.
				SSA will not issue SSNs with the number “00” in positions 4 – 5.
				SSA will not issue SSNs with the number “0000” in positions 6 – 9.
				DOB cannot be greater than today

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN


--select ID, LastName, FirstName, ts2__Social_Security__c, Cred_Social_Security_ID__c,
--Title__c, Department, Department__c, Employee_Type__c, Date_of_Birth__c
--from Salesforce...Contact
--where Employee_Type__c IS NOT NULL



	TRUNCATE TABLE dbo.LawsonNewHireEntryCorporate

	
	INSERT INTO dbo.LawsonNewHireEntryCorporate
	SELECT 100, Contact.ID AS ContactId,
		LastName,
		FirstName,
		Middle_Initial__c AS MiddleInit ,
		Middle_Name__c MiddleNameOrInitial,
		NULL AS Title,
		FirstName PreferredName,
		Phone,
		Email,
		MailingStreet,
		MailingCity,
		UPPER(MailingState),
		MailingPostalCode,
		'US' AS Country,
		NULL,
		Cred_Gender__c,
		NULL,
		NULL,
		'Y' AS AutoDeposit,
		--CONVERT(VARCHAR(10),Contact.Date_of_Birth__c,101) DateOfBirth,
		Contact.Date_of_Birth__c DateOfBirth,
		Left(ts2__Social_Security__c,3)+'-'+Substring(ts2__Social_Security__c,4,2)+'-'+Substring(ts2__Social_Security__c,6,4) SSNFormatted,
		CASE WHEN Employee_Type__c = 'MA' 
			 THEN 9100
			 WHEN Employee_Type__c = 'MBSI'
			 THEN 9200
			 WHEN Employee_Type__c = 'CEPAmerica' 
			 THEN 1000 END ProcessLevel,
		CONVERT(VARCHAR(10),PL.ts2__Start_Date__c,101) AS DateOfHire,
		CONVERT(VARCHAR(10),PL.ts2__Start_Date__c,101) AS BenefitDate1,
		CONVERT(VARCHAR(10),PL.ts2__Start_Date__c,101) AS BenefitDate2,
		NULL AS BenefitSalary1,
		NULL AS BenefitSalary2,
		CASE WHEN Employee_Type__c = 'MA' 
			 THEN 'UNASGNMA'
			 WHEN Employee_Type__c = 'MBSI'
			 THEN '2BILLTR'
			 WHEN Employee_Type__c = 'CEPAmerica'  
			 THEN 'UNASGNCEP' END AS Pos,
		CASE WHEN Employee_Type__c = 'MA' 
			 THEN 'USASSIGN9100'
			 WHEN Employee_Type__c = 'MBSI'
			 THEN '2BILLTR330'
			 WHEN Employee_Type__c = 'CEPAmerica'  
			 THEN 'UNASSIGN1000' END AS PosPL,
		CASE WHEN Title__c = 'SCRIBE'
			THEN 'A6'
			ELSE 'A1'END AS STATUS,
		CASE WHEN Title__c = 'SCRIBE'
			THEN '0.25'
			ELSE '1.0'END AS FTE,		
		CONVERT(VARCHAR(10),PL.ts2__Start_Date__c,101) AS FirstWorkDate,
		CONVERT(VARCHAR(8),PL.ts2__Start_Date__c, 112) As EffectiveDate,
		'Y',
		'Y',
		'Y',
		'Y' ,
		Null,
		'Y', Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,
		 Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,
		 Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,
		 Null,Null,Null,Null,Null,Null, NULL
	FROM Salesforce...Contact
	JOIN Salesforce...ts2__Placement__c PL ON PL.ts2__Employee__c = Contact.Id
 	WHERE (Employee_Type__c IN ('MA', 'MBSI', 'CEPAmerica')
 			OR Title__c = 'SCRIBE') 
 	AND PL.Poeple_Status__c = 'Hired'
 	AND ts2__Social_Security__c IS NOT NULL
 	AND Contact.Date_of_Birth__c IS NOT NULL
	AND ts2__Social_Security__c NOT IN (SELECT DISTINCT REPLACE(FICA_NBR, '-', '') 
					FROM AppStaging.dbo.LawsonEMPLOYEE)  
	AND ts2__Social_Security__c NOT IN (SELECT DISTINCT  REPLACE(FICA_NBR, '-', '')
					FROM AppStaging.dbo.LawsonAPPLICANT)  
	--AND PL.ts2__Start_Date__c > GETDATE()
	
	
	--Update Start Date in case it is in past for NON MBSI Employees
	
	
	UPDATE LawsonNewHireEntryCorporate
	SET DateOfHire = CONVERT(VARCHAR(10),GETDATE(),101),
		BenefitDate1 = CONVERT(VARCHAR(10),GETDATE(),101),
		BenefitDate2 = CONVERT(VARCHAR(10),GETDATE(),101),
		FirstWorkDate = CONVERT(VARCHAR(10),GETDATE(),101),
		EffectiveDate = CONVERT(VARCHAR(8),GETDATE(), 112)
	WHERE DateOfHire < GETDATE()
	AND Pos <> '2BILLTR'
		

	
	--Delete past dates for MBSI
	
	DELETE FROM LawsonNewHireEntryCorporate
	WHERE DateOfHire < GETDATE()
	AND Pos = '2BILLTR'
	


	

	UPDATE LawsonNewHireEntryCorporate
	SET Title = Replace(Title,'.', '')

	
	--DROP TABLE #TempTbl1
	
	
	

	
	--exclude exceptions for exception report
	--TRUNCATE TABLE LawsonNewHireEntryExceptions
	
	--INSERT INTO LawsonNewHireEntryExceptions
	--SELECT *,
	--	CASE WHEN ProcessLevel IS NULL 
	--		THEN 'Missing PL'
	--		WHEN Pos IS NULL 
	--		THEN 'Missing Position'
	--		WHEN Status IS NULL
	--		THEN 'Missing Status'
	--		WHEN FTE IS NULL
	--		THEN 'Missing FTE'
	--		ELSE 'Incorrect Position' END AS Reason
	--FROM LawsonNewHireEntryCorporate
	--WHERE ProcessLevel IS NULL
	--OR Pos IS NULL
	--OR Status IS NULL
	--OR FTE IS NULL
	--OR PosPL NOT IN (SELECT R_POSITION FROM AppStaging.dbo.LawsonPAPOSITION)
	
	----Delete rows with incomplete data from Loading table
	--DELETE FROM LawsonNewHireEntry
	--WHERE EXISTS ( SELECT 1 FROM LawsonNewHireEntryExceptions LEE
	--			WHERE LawsonNewHireEntry.ProviderMasterID = LEE.ProviderMasterID)
	
	
	--Update states to make sure they are properly abbreviated
	
	UPDATE LawsonNewHireEntryCorporate
	SET State1 = REPLACE(State1, '.', '')
	
	UPDATE LawsonNewHireEntryCorporate
	SET State1 = LS.Code
	FROM LookupState LS
	WHERE LS.State = LawsonNewHireEntryCorporate.State1
	
	
	
	
	--Delete if state does not exist in Lookup State
	
	
	DELETE FROM LawsonNewHireEntryCorporate
	WHERE State1 not in (SELECT Code FROM LookupState)
		
	--Delete invalid SSN
	
	DELETE FROM LawsonNewHireEntryCorporate
	WHERE Pos IS NULL
	OR LEN(REPLACE(SSNFormatted, '-', '')) < 9
	OR DateOfBirth > GETDATE()
	
	
	DELETE FROM LawsonNewHireEntryCorporate
	WHERE SSNFormatted LIKE '9%'
		OR SSNFormatted LIKE '666%'
		OR SSNFormatted LIKE '000%'
		OR SSNFormatted LIKE '%-00-%'
		OR SSNFormatted LIKE '%-%-0000'
	
	
	
	
	UPDATE LawsonNewHireEntryCorporate
	SET LastName = UPPER(LastName),
		FirstName = UPPER(FirstName),
		MiddleInit = UPPER(MiddleInit),
		MiddleNameOrInitial = UPPER(MiddleNameOrInitial),
		PreferredName = UPPER(PreferredName)
	WHERE Pos <> '2BILLTR'
	
	
	
	
	--creates DME file for PFI upload

	Exec usp_LawsonNewHireEntry_PA31DMECorp

END





