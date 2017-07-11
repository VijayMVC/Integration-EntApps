
CREATE PROCEDURE [dbo].[usp_SFDC_LoadNewSites] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Generate a webcode and load the Sitename and 
				Code in Hospital_Region table for Web.
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF
SET DEADLOCK_PRIORITY HIGH

BEGIN

--Download all SFDC Accounts

	TRUNCATE TABLE SFDCHospital

	INSERT INTO SFDCHospital
	SELECT C.Id,
		   AccountId,
		   CASE WHEN C.Contract_Holder__c = '001A000000LwvkyIAB'
				THEN 'CEP'
				WHEN C.Contract_Holder__c = '001G000000m58DdIAI'
				THEN 'GALEN' END AS StaffGroup,
				A.Name AS HospitalName,
				A.Name AS WebName,
				C.BillingStreet AS Addr,
				C.BillingCity As City,
				C.BillingState As [State],
				C.BillingPostalCode As Zip,
				C.BillingCountry As Nation,
				C.Phone__c,
				C.Fax__c,
				'' AS Region,
				C.Practice_Location__c,
				C.Practice_Location_Code__c
	FROM Salesforce...Account A
	JOIN SalesForce...Contract C On C.AccountId = A.Id 
	WHERE (Contract_Holder__c = '001A000000LwvkyIAB' 
			or Contract_Holder__c = '001G000000m58DdIAI')
	AND C.Practice_Location_Code__c IS NOT NULL
			

--Get Newly added accounts from SFDC which do not exist in HR
	
	TRUNCATE TABLE Hospital_RegionStaging
	
	INSERT INTO Hospital_RegionStaging(SFID, SFDCName, HospitalName, 
										hospitalNameShort,Region, [status], TCstruct, flag )
	SELECT DISTINCT SH.AccountId,
	SH.HospitalName,
	LTRIM(RTRIM(SH.HospitalName)) + ' - ' + LTRIM(RTRIM(SH.PracticeLocationCode)) AS HospitalName,	
	LEFT(LTRIM(RTRIM(HospitalName)),50) hospitalNameShort, 
	--CASE WHEN PracticeLocation = 'Hospital Medicine' 
	--		THEN LTRIM(RTRIM(SH.HospitalName)) + ' - Hospital Medicine'
	--	 WHEN PracticeLocation = 'Anesthesia' 
	--		THEN LTRIM(RTRIM(SH.HospitalName)) + ' - ANES'
	--	 WHEN PracticeLocation = 'Ambulatory and Urgent Care' 
	--		THEN LTRIM(RTRIM(SH.HospitalName)) + ' - AUC'
	--	 WHEN PracticeLocation = 'Intensive Care Medicine' 
	--		THEN LTRIM(RTRIM(SH.HospitalName)) + ' - INT'
	--	 WHEN PracticeLocation = 'Skilled Nursing' 
	--		THEN LTRIM(RTRIM(SH.HospitalName)) + ' - SNF'
	--	 WHEN PracticeLocation = 'Wound Care' 
	--		THEN LTRIM(RTRIM(SH.HospitalName)) + ' - WC'
	--	 WHEN PracticeLocation = 'Psychiatric Emergency Medicine' 
	--		THEN LTRIM(RTRIM(SH.HospitalName)) + ' - PEM'
	--	ELSE LTRIM(RTRIM(SH.HospitalName)) END AS HospitalName,
	SH.Region, 0 [Status], SH.ContractId, 0 [flag]
	FROM SFDCHospital As SH
	WHERE SH.ContractId NOT IN (SELECT DISTINCT ContractID 
								FROM Hospital_Region_Contracts)
	--ORDER BY SH.HospitalName





/*The logic below generates a random WebCode for the new site. 
For GALEN sites an additional row is created in Hospital_Region table
*/

	DECLARE @RC int
	DECLARE @useNumbers bit
	DECLARE @useLowerCase bit
	DECLARE @useUpperCase bit
	DECLARE @charactersToUse varchar(100)
	DECLARE @passwordLength smallint
	DECLARE @password varchar(100)
	DECLARE @Code char(4)
	DECLARE @SFID nchar(18)
	DECLARE @HospitalName nvarchar(100)
	--DECLARE @Count int

	--SET @Count = 0


		DECLARE Hospital_RegionCode_Cursor CURSOR FOR 
			SELECT 	DISTINCT Code,
					SFID,
					HospitalName
			FROM Hospital_RegionStaging
			WHERE Code IS NULL
			--AND HospitalName NOT LIKE '%Hospitalist'
			FOR UPDATE

		OPEN Hospital_RegionCode_Cursor
   		FETCH NEXT FROM Hospital_RegionCode_Cursor 
			INTO 	@Code, @SFID, @HospitalName
		WHILE @@FETCH_STATUS = 0
			BEGIN
				DECLARE @FoundCode int
				SET @FoundCode = 1
				WHILE @FoundCode <> 0
					BEGIN
					
						
						EXECUTE @RC = [ApplicationIntegration].[dbo].[GenerateRandomString] 
									   0
									  ,0
									  ,0
									  ,ABCDEFGHIJKLMNOPQRSTUVWXYZ
									  ,2
									  ,@password OUTPUT
	  
		
						
						IF 	NOT EXISTS
							(SELECT 1 FROM Hospital_region
							 WHERE LEFT(Code,3) = @password)
						
							BREAK

					END

					
				UPDATE Hospital_RegionStaging 
				SET Code = @password + '1',
				[Status] = 0
				WHERE SFID = @SFID
				AND HospitalName = @HospitalName 
		


					
				UPDATE Hospital_RegionStaging 
				SET Code = @password + '2',
				[Status] = 0
				WHERE SFID = @SFID
				AND HospitalName = @HospitalName
				AND Code IS NULL
			
					  

				FETCH NEXT FROM Hospital_RegionCode_Cursor
				INTO 	@Code, @SFID, @HospitalName
		
			END
		
		CLOSE Hospital_RegionCode_Cursor
		DEALLOCATE Hospital_RegionCode_Cursor


	--SELECT * FROM Hospital_RegionStaging
	
	--Insert new record into Hospital_Region table 
	INSERT INTO Hospital_Region (SFID, Code,SFDCName,HospitalName,hospitalNameShort,Region, [status], TCstruct, flag)
	SELECT SFID, Code,SFDCName, LEFT(LTRIM(RTRIM(HospitalName)),100) HospitalName,LEFT(LTRIM(RTRIM(HospitalName)),50) hospitalNameShort, Region, 0, TCstruct, 0
	FROM Hospital_RegionStaging
	
	
	--Insert the contract Id in Hospital_Region_Contracts
	
	INSERT INTO Hospital_Region_Contracts
	SELECT C.Id AS ContractID,
		   AccountId,
		   CASE WHEN C.Contract_Holder__c = '001A000000LwvkyIAB'
				THEN 'CEP'
				WHEN C.Contract_Holder__c = '001G000000m58DdIAI'
				THEN 'GALEN' END AS StaffGroup,
				A.Name AS HospitalName,
				A.Name AS WebName,
				C.BillingStreet AS Addr,
				C.BillingCity As City,
				C.BillingState As [State],
				C.BillingPostalCode As Zip,
				C.BillingCountry As Nation,
				C.Phone__c,
				C.Fax__c,
				'NULL' AS Region ,
				A.ED_Contract_Holder__c	
	FROM Salesforce...Account A
	JOIN SalesForce...Contract C On C.AccountId = A.Id 
	WHERE (Contract_Holder__c = '001A000000LwvkyIAB' 
			or Contract_Holder__c = '001G000000m58DdIAI')
	AND C.Id NOT IN (SELECT DISTINCT ContractID 
						FROM Hospital_Region_Contracts)
	AND C.Practice_Location_Code__c IS NOT NULL
    --AND C.Practice_Location__c IN ('Emergency Medicine', 'Hospital Medicine', 'Ambulatory and Urgent Care', 
				--				'Anesthesia', 'Intensive Care Medicine', 'Skilled Nursing', 'Wound Care',
				--				'Psychiatric Emergency Medicine' )
	
	

END

