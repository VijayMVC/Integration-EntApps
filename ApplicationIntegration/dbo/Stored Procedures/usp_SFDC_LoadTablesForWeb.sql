CREATE PROCEDURE [dbo].[usp_SFDC_LoadTablesForWeb]
AS

/* Load Education for Web*/

		
	TRUNCATE TABLE SFDCEducationForWeb

	INSERT INTO SFDCEducationForWeb
	SELECT Prov.ProviderMasterID,
	Prov.WebID,
	SFEDU.Education_Type__c,
	SFSchool.Name,
	SFEDU.From__c,
	SFEDU.To__c,
	GETDATE(),
	GETDATE()
	FROM ProviderMaster Prov
	JOIN AppStaging.dbo.SFDCEducationStaging SFEDU 
			ON SFEDU.Contact__c = Prov.SFID
	JOIN Salesforce...E_T_Institution__c SFSchool  
			ON SFSchool.Id = SFEDU.Institution_1__c
	WHERE Prov.CurrentProviderFlag = 'Y'
	ORDER BY ProviderMasterID
	
	
/* Commitees for Web*/

--Not in SFDC

/*   Insurance for Web */
	
	TRUNCATE TABLE SFDCInsuranceForWeb

	INSERT INTO SFDCInsuranceForWeb
	SELECT 	PM.ProviderMasterID	,
		PM.WebID, 
		MPS.Malpractice_Type__c	AS InsuranceType,  
	    Car.Name AS InsuranceCarrier, 
		MPS.Policy_Number__c As PolicyNbr, 
		MPS.Coverage_Range__c + '/' + Coverage_Range2__c As Coverage, 
		MPS.Enrolled_Date__c	As FromDate, 
		MPS.Expiration_Date__c	As ToDate,
		GETDATE(),
		GETDATE()
		FROM ProviderMaster AS PM
		JOIN AppStaging.dbo.SFDCMalPracStaging AS MPS 
				ON MPS.Contact__c = PM.SFID
		JOIN Salesforce...Carrier__c As Car
				ON Car.Id = MPS.Carrier__c
				
/* License for Web */
	
	TRUNCATE TABLE SFDCLicensesForWeb

	INSERT INTO SFDCLicensesForWeb
	SELECT 	PM.ProviderMasterID , 
		PM.WebID, 
		CS.Type__c 		AS LicenseType, 
		CS.Cert_Lic_Number__c		AS LicenseNumber,  
		Issue.Name 		AS Institution,
		CS.Issue_Date__c	AS IssueDate,
		CS.Renewed__c		AS RenewDate,
		CS.Expiration_Date__c	AS ExpirationDate,
		GETDATE(),
		GETDATE()		
	FROM  ProviderMaster PM 
	JOIN AppStaging.dbo.SFDCCredentialsStaging AS CS 
			ON CS.Contact__c = PM.SFID
	JOIN Salesforce...Issuer__c As Issue
			ON Issue.Id = CS.Issuer_1__c
	WHERE CS.Type__c  NOT LIKE '%Compliance%'
			AND CS.Type__c  NOT IN 
				('CEP Employment Agreement', 'CEP Partnership Agreement')
			AND CS.Type__c  NOT LIKE '%COBRA%'

	
/*Societies for web*/ 

--Not in SFDC
	

/*Affiliation for Web*/

	TRUNCATE TABLE SFDCAffiliationsForWeb

	INSERT INTO SFDCAffiliationsForWeb
	SELECT 	 Prov.ProviderMasterID, 
		 Prov.WebID, 
		 CASE WHEN WH.To__c IS NULL
				THEN 'Current Medical Staff'
			  ELSE 'Former Medical Staff' END AS StaffStatus,
		 WH.Healthcare_Facility_Name__c,
		 WH.From__c,
		 WH.To__c,
		 GETDATE(),
		 GETDATE()
		FROM ProviderMaster Prov
		JOIN AppStaging.dbo.SFDCWorkHistoryStaging As WH
				ON WH.Contact__c = Prov.SFID
		WHERE WH.Healthcare_Facility_Name__c IS NOT NULL
		AND Prov.CurrentProviderFlag = 'Y'
		--AND Prov.SFID IN (SELECT SFID FROM AffiliationStaging
		--					WHERE StaffGroup = 'CEP')							
		ORDER BY Prov.ProviderMasterID
		
/* Address for Web*/

		TRUNCATE TABLE SFDCAddressForWeb

		INSERT INTO SFDCAddressForWeb
		SELECT Prov.ProviderMasterID , 
			 Prov.WebID, 
			 AS1.AddressLine1, 
			 AS1.AddressLine2, 
			 AS1.City, 
			 AS1.[STATE], 
			 AS1.Zip, 
			 AS1.[Type],
			 CASE WHEN AS1.AddressListOrder = 1 	THEN 'Y' 
				ELSE 'N' 	END  AS PrimaryAddress,
			 GETDATE(),
			 GETDATE()
		FROM ProviderMaster Prov
		INNER JOIN AddressStaging AS1
		ON Prov.SFID = AS1.SFID
		WHERE Prov.CurrentProviderFlag = 'Y'
			 --AND Prov.SFID IN (SELECT SFID FROM AffiliationStaging
				--				WHERE StaffGroup = 'CEP')
			AND AS1.AddressLine1 IS NOT NULL
			UNION
		SELECT Prov.ProviderMasterID , 
			 Prov.WebID, 
			 AS1.Address_Line_1__c, 
			 AS1.Address_Line_2__c, 
			 AS1.City__c, 
			 AS1.State__c, 
			 AS1.Zip__c, 
			 AS1.Type__c, 
			 'N' AS PrimaryAddress,
			 GETDATE(),
			 GETDATE()
		FROM ProviderMaster Prov
		LEFT OUTER JOIN AppStaging.dbo.SFDCAddressStagingNoHome AS1
			ON Prov.SFID = AS1.Contact__c
		WHERE Prov.CurrentProviderFlag = 'Y'
			 --AND Prov.SFID IN (SELECT SFID FROM AffiliationStaging
				--				WHERE StaffGroup = 'CEP')
			AND AS1.Address_Line_1__c IS NOT NULL

		
/* SFDC Master for Web*/

	TRUNCATE TABLE SFDCMasterForWeb

	INSERT INTO SFDCMasterForWeb
		SELECT PM.ProviderMasterID, 
			PM.WebID, 
			' ' AS FormattedSSN,
			 GETDATE(),
			 GETDATE()
		FROM ProviderMaster PM
		WHERE CurrentProviderFlag = 'Y'
		
		

	 
/* SFDC NPI for Web*/

	TRUNCATE TABLE SFDCProviderNPI
	
	--NPI
	INSERT INTO SFDCProviderNPI
	SELECT PMB.SFID, PMB.ProviderMasterID, C.Cred_NPI__c
	FROM ProviderMasterBase PMB
	JOIN AppStaging.dbo.SFDCContactStaging C
		ON PMB.ProviderMasterID = C.Provider_Master_ID__c
	

/* SFDC Practice Line and Account info for Web*/	

	TRUNCATE TABLE SFDCPracLine
	
	--NPI
	INSERT INTO SFDCPracLine
	SELECT C.*
	FROM Hospital_region HR
	JOIN AppStaging.dbo.SFDCAccountContractStaging C ON C.ContractId = HR.TCstruct
	WHERE status = 0
	

/* SFDC Psecialty for web */

	TRUNCATE TABLE SFDCSpecialtyForWeb

	INSERT INTO SFDCSpecialtyForWeb
	SELECT PMB.SFID, PMB.ProviderMasterID, PMB.LastName, 
	PMB.FirstName, SS.Specialty__c, SS.Board_Eligible__c, SS.Certified__c,
	SS.Expiration_Date__c, SS.Initial_Certification_Date__c, SS.Recertification_Date__c
	FROM AppStaging.dbo.SFDCSpecialtyStaging SS
	JOIN ProviderMasterBase PMB ON PMB.SFID = SS.Contact__c
	ORDER BY ProviderMasterID
