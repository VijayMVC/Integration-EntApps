CREATE    PROCEDURE [dbo].[usp_SFDC_LoadStagingTables] 
AS

/* 	Author: 	Reetika Singh
	Date:		3/26/2012
	Purpose:	Download data from Salesforce into Staging tables
	Revision:	
*/

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS ON 
SET DEADLOCK_PRIORITY HIGH


BEGIN
	
/*ProviderMasterStaging table is a Pre ProviderMaster/ PMB Table. 
It is used to determine new hires that have complete information 
and can be loaded into ProviderMaster/PMB table.
*/
	
	
	TRUNCATE TABLE ProviderMasterStaging

	INSERT INTO ProviderMasterStaging
	SELECT 	 Contact.Id AS SFID,
			 LTRIM(RTRIM(Contact.LastName)),
			 LTRIM(RTRIM(Contact.FirstName)),
			 LTRIM(RTRIM(Preferred_Name__c)),
			 LTRIM(RTRIM(Middle_Name__c)),
			 CASE 	WHEN Title__c IN ('P.A.-C', 'P.A-C', 'PAC', 'PA-C', 'PA.-C')  
					THEN 'P.A.-C.' 
		  		WHEN Title__c IN ('M.D.', 'MD.', 'M.D', 'MD')
					THEN 'M.D.'
				WHEN Title__c IN ('D.O.', 'DO.', 'D.O', 'DO')
					THEN 'D.O.'
				WHEN Title__c IN ('P.A.', 'PA.', 'P.A', 'PA')
					THEN 'P.A.'
				WHEN Title__c IN ('N.P.', 'NP.', 'N.P', 'NP')
					THEN 'N.P.'
				WHEN Title__c IN ('F.N.P.', 'FNP.', 'F.N.P', 'FNP', 'F.NP', 'F.NP.')
					THEN 'F.N.P.'
		     		ELSE LTRIM(RTRIM(Title__c)) END  AS Title,
			   Email,
			   LEFT(Cred_Gender__c, 1) As Gender,
			   Substring(Cred_Social_Security_ID__c,1, 3) + '-' +
			   Substring(Cred_Social_Security_ID__c,4, 2) + '-' +
			   Substring(Cred_Social_Security_ID__c,6, 4) As SSNFormated,
			   Cred_Social_Security_ID__c As SSNUnformatted,
			   LTRIM(RTRIM(Cred_Other_Last_Name__c)),
			   LTRIM(RTRIM(Cred_Other_First_Name__c)),
			   LTRIM(RTRIM(Cred_Other_Middle_Name__c)),
			   0 AS BatchNbr,
			   LTRIM(RTRIM(Cred_Marital_Status__c)),
			   CASE WHEN Cred_Marital_Status__c IS NULL
				THEN LEFT(Cred_Marital_Status__c, 1) 
				ELSE '' END AS MaritalCode,
			   LTRIM(RTRIM(Cred_Spouse_Name__c)),
			   NULL As HealthcareFacility,
			   MobilePhone,
			   Cred_Date_Of_Birth__c,
			   Contact.Primary_Taxonomy__c,
			   Contact.Cred_NPI__c,
			   Prov.WebID AS WebID,
			   Provider_Master_ID__c,
			   NULL AS MultiClientFlag,
			   NULL AS CompleteRecordFlag,
			   'N' AS ActiveFlag
	FROM AppStaging.dbo.SFDCContactStaging As Contact
	LEFT OUTER JOIN ProviderMaster 	Prov
		ON Contact.Provider_Master_ID__c = Prov.ProviderMasterID
	WHERE Contact.LastName <> ''
	AND Contact.FirstName <> ''



/* Set ActiveFlag based on a Active Provider Status
*/
	UPDATE ProviderMasterStaging
	SET ActiveFlag = 'Y'
	WHERE SFID IN (SELECT DISTINCT SFMS.SFID
				FROM ProviderMasterStaging AS SFMS
				JOIN AppStaging.dbo.SFDCFacilityStaging As Fac 
								ON Fac.Contact__c = SFMS.SFID
				WHERE Fac.To__c IS NULL)
				
					
/*Get Preferred name for existing Provider from ProviderMaster table
*/
	UPDATE ProviderMasterStaging 
	SET PreferredName = Prov.PreferredName
	FROM ProviderMasterStaging AS SFPM
	INNER JOIN ProviderMaster Prov
			ON SFPM.ProviderMasterID = Prov.ProviderMasterID
		WHERE SFPM.PreferredName != Prov.PreferredName
		
		
	UPDATE ProviderMasterStaging 
	SET PreferredName = FirstName
	WHERE PreferredName IS NULL


/* Update WebID for existing Providers
*/		
	UPDATE ProviderMasterStaging 
	SET WebID = Prov.WebID
	FROM ProviderMasterStaging AS SFPM
	INNER JOIN ProviderMasterBase Prov
			ON SFPM.ProviderMasterID = Prov.ProviderMasterID
 



/*ProviderStatus Staging 
*/


	TRUNCATE TABLE ProviderStatusStaging

	INSERT INTO ProviderStatusStaging
	SELECT DISTINCT 
	CASE WHEN fac.Department__c  = 'Hospital Medicine'
		THEN 'GALEN'
		ELSE 'CEP' END AS StaffGroup, -- Now should be department,
	Contact.Id AS SFID,
	Contact.Provider_Master_ID__c,
	NULL As WebID,
	Fac.From__c,
	Fac.To__c,
	Fac.Record_Status__c,
	Fac.Staff_Status1__c,
	CASE WHEN Fac.Record_Status__c IN ( 'Retired', 'Former Medical Staff')
		THEN 'N'
		ELSE 'Y' END As Active,
	Contact.Email As CorporateEmail,
	Contact.Secondary_Email__c As ForwardingEmail,
	fac.Staff_Status1__c AS PartnershipLevel,
	fac.Staff_Status_Date__c As PartnershipLevelDate,
	fac.Department__c,
	fac.Facility__c,
	fac.From__c As HireDate,
	fac.Position__c AS PositionStatus,
	NULL As CompleteRecordFlag
	FROM AppStaging.dbo.SFDCContactStaging As Contact
	JOIN AppStaging.dbo.SFDCFacilityStaging As Fac 
					ON Fac.Contact__c = Contact.Id
	JOIN ApplicationIntegration.dbo.ProviderMasterStaging AS PM 
					ON PM.SFID = Contact.Id
	WHERE fac.Facility__c <> 'Sutter Emergency Medical Associates'
		OR fac.Facility__c IS NULL



/*Get WebID for existing records*/

	UPDATE ProviderStatusStaging 
	SET WebID = Prov.WebID
	FROM ApplicationIntegration.dbo.ProviderMaster Prov
	WHERE ProviderStatusStaging.ProviderMasterID = Prov.ProviderMasterID
	
	
/*Populate rehires for setting Status for Onboarding App*/
	
		
	--TRUNCATE TABLE RehireStaging

	--INSERT INTO RehireStaging
	--	SELECT SFID,
	--	Facility,
	--	Department,
	--	RecordStatus,
	--	StaffStatus,
	--	StaffGroup,
	--	ProviderMasterID,
	--	Active,
	--	'N',
	--	[From],
	--	[To],
	--	GETDATE()
	--	FROM ProviderStatusStaging PS

--Do not truncate this table as it will be an archive for Rehires
--ONLY delete those providers that did not make to the onboarding app due to some missing info
	DELETE FROM RehireStaging
	WHERE LoadedToOnboard IS NULL


	INSERT INTO RehireStaging
	SELECT SFID,
		Fac.Id, 
		Fac.Facility__c,
		Department,
		RecordStatus,
		StaffStatus,
		StaffGroup,
		ProviderMasterID,
		Active,
		'Y' RehireFlag,
		[From],
		[To],
		Date_Rehired__c DateRehired,
		NULL
		FROM ProviderStatusStaging PS
		JOIN Salesforce...Facility__c As Fac
			ON Fac.Contact__c = PS.SFID
		WHERE Fac.Rehire__c = 'true'
		AND PS.[To] IS NULL
		AND NOT EXISTS (SELECT *
						FROM RehireStaging RN1
						WHERE PS.ProviderMasterID = RN1.ProviderMasterID
						AND Fac.ID = RN1.FacID
						AND PS.SFID = RN1.SFID)
						
						
--For Rehires
--SELECT Contact.Provider_Master_ID__c 
--FROM AppStaging.dbo.SFDCContactStaging As Contact
--	JOIN AppStaging.dbo.SFDCFacilityStaging As Fac 
--					ON Fac.Contact__c = Contact.Id
--WHERE Fac.Rehire__c = 'true'


	--UPDATE RehireStaging
	--SET Rehire = 'Y'
	--WHERE ProviderMasterID IN (SELECT ProviderMasterID
	--						FROM ProviderMaster		
	--						WHERE CurrentProviderFlag = 'N')
	--AND Active = 'Y'



/*Provider Affiliations as stored in AffiliationStaging table - All Sites
*/

	TRUNCATE TABLE AffiliationStaging

	INSERT INTO AffiliationStaging

	SELECT Contact.Id As SFID,
	Contact.Provider_Master_ID__c,
	CASE WHEN CT.Practice_Location__c = 'Hospital Medicine'
		 THEN 'GALEN'
		 ELSE 'CEP' END AS StaffGroup,
	CASE WHEN WH.Active__c = 'true' 
		THEN 'Y' ELSE 'N' END AS Active,
	NULL As WithinStaffGroupFlag,
	NULL AS SiteLocationID,
	WH.From__c,
	WH.To__c,
	HR.Code,
	WH.Health_Care_Facility__c,
	WH.Healthcare_Facility_Name__c,
	WH.CEPA_Contracted_Site__c,
	WH.Galen_Contracted_Site__c,
	CT.Id ContractID,
	CT.Practice_Location__c,
	A.Name AS Contract_Holder__c
	FROM AppStaging.dbo.SFDCContactStaging As Contact
	JOIN AppStaging.dbo.SFDCWorkHistoryStaging As WH on WH.Contact__c = Contact.Id
	JOIN ProviderMasterStaging AS PM on PM.SFID = Contact.Id
	JOIN AppStaging.dbo.SFDCContractStaging AS CT
				ON CT.AccountId = WH.Health_Care_Facility__c
				AND CT.Practice_Location__c = WH.Practice_Location__c
				AND CT.Contract_Holder__c = WH.Contract_Holder__c
	JOIN Hospital_region HR on HR.TCstruct = CT.Id
	JOIN Salesforce...Account A on A.Id = CT.Contract_Holder__c
	WHERE (WH.Active__c = 'true')
	ORDER BY ProviderMasterID


/* Add Site Name:
Add active Affiliations for providers that have 
atleast one Active ProviderStatus i.e. Provider is active
*/

	UPDATE ProviderMasterStaging
	SET SiteName = (SELECT TOP 1 WH.SiteName
						FROM AffiliationStaging AS WH
						JOIN ProviderStatusStaging AS DH 
										ON DH.SFID = WH.SFID
						WHERE ProviderMasterStaging.SFID = WH.SFID
							AND WH.[To] IS NULL
							AND DH.Active = 'Y'
							AND WH.Active = 'Y')
								




/* AddressStaging
For new hires two addresses will come from the Contact Screen - Mailing - Home (1) 
and Other - Mailing (2). Once Web becomes the master the addresses only flow from Web to SFDC
so no need to download all addresses
*/


	TRUNCATE TABLE AddressStaging

	INSERT INTO AddressStaging
	SELECT Contact.Id As SFID,
	Contact.Provider_Master_ID__c,
	'Home' As AddType,
	Contact.MailingStreet,
	NULL,
	NULL,
	NULL,
	Contact.MailingCity,
	NULL,
	Contact.Mailingstate,
	Contact.MailingPostalCode,
	Contact.Fax,
	Contact.Phone,
	Contact.MobilePhone,
	'True',
	1 AS AddressListOrder,
	'Y',
	'Y',
	GETDATE(),
	GETDATE()
	FROM  AppStaging.dbo.SFDCContactStaging AS Contact
	JOIN ProviderMasterStaging AS PM on PM.SFID = Contact.Id
	WHERE Contact.MailingStreet IS NOT NULL
	UNION
	SELECT Contact.Id As SFID,
	Contact.Provider_Master_ID__c,
	'Mailing' As AddType,
	Contact.OtherStreet,
	NULL,
	NULL,
	NULL,
	Contact.OtherCity,
	NULL,
	Contact.OtherState,
	Contact.OtherPostalCode,
	NULL,
	NULL,
	NULL,
	'false',
	2 AS AddressListOrder,
	'N',
	'N',
	GETDATE(),
	GETDATE()
	FROM  AppStaging.dbo.SFDCContactStaging AS Contact
	JOIN ProviderMasterStaging AS PM on PM.SFID = Contact.Id
	WHERE Contact.MailingStreet IS NOT NULL


/* Have to Make Sure All Info Is Complete Before Adding Record 
Set Complete Flags is all required fields are populated 
Required Fields : SSN
				CEPAmerica site
				Address
				FirstName
				LastName
				Private Email Address
				Date of Hire
				Staff Status
				Record status
				Department
				Title
	8/9/2012 - added Employee to the list of staff status as per Jen H.
*/

	UPDATE ProviderStatusStaging
		SET CompleteRecordFlag = 'Y'
		WHERE EXISTS
			(SELECT	1 
				FROM  ProviderMasterStaging AS SFPM
				WHERE SFPM.SSNUnformatted IS NOT NULL
		 		  AND SFPM.SSNUnformatted != ' '
				/* Sometimes a quick code (usually 3 digits is put in to add the
					record.  Need to make sure complete */
		  		  AND LEN(SFPM.SSNUnformatted) > 7
				  AND SFPM.SFID = ProviderStatusStaging.SFID
			 )
		  AND EXISTS
				/* Must Have Current Site*/
			(SELECT 1
				FROM AffiliationStaging AS SFAF
				WHERE SFAF.SFID = ProviderStatusStaging.SFID
					  AND SFAF.Active = 'Y')
		  AND EXISTS
				/* Must Have Address */
			(SELECT *
				FROM AddressStaging AS SFAdd
				WHERE SFAdd.SFID = ProviderStatusStaging.SFID
				  AND SFAdd.[Type] = 'Home')
		  AND EXISTS
			  /* Must Have FirstName, LastName, Email and Title */
		   (SELECT	1 
				FROM  ProviderMasterStaging AS SFPM
				WHERE SFPM.FirstName IS NOT NULL
					AND SFPM.LastName IS NOT NULL
					AND SFPM.Email IS NOT NULL
					AND SFPM.Title IS NOT NULL
		 			AND SFPM.SFID =	ProviderStatusStaging.SFID
			 )
		  AND EXISTS
				/*Active Date of hire*/
			(SELECT *
				FROM ProviderStatusStaging AS SFDH
				WHERE SFDH.SFID = ProviderStatusStaging.SFID
				  AND SFDH.[To] IS NULL
				  AND SFDH.[From] IS NOT NULL) 
		  --AND Department IS NOT NULL
		  AND (RecordStatus LIKE '%Current%'
			OR RecordStatus LIKE '%Applicant%')
						/* Partnership Levels 1-4, Full, Senior and
							Physician Extender for CEP*/
		  AND StaffStatus IN ('Full Partnership', 
						'Level 4 Partnership', 
						'Senior Partnership', 
						'Level 2 Partnership', 
						'Level 3 Partnership', 
						'Level 1 Partnership', 
						'Physician Extender',
						'Hospitalist',
						'Employee','Visa Agency',
						'Visa Employee')
			
--Set Complete record flags

	UPDATE ProviderStatusStaging
	 SET CompleteRecordFlag = 'N'
	WHERE CompleteRecordFlag <> 'Y'
		OR CompleteRecordFlag IS NULL


	UPDATE ProviderMasterStaging
		SET CompleteRecordFlag = 'Y'
	  WHERE EXISTS
			(SELECT 1
				FROM ProviderStatusStaging PS
				WHERE PS.SFID = ProviderMasterStaging.SFID
				  AND PS.CompleteRecordFlag = 'Y')
				  
				  
	UPDATE ProviderMasterStaging
	 SET CompleteRecordFlag = 'N'
	WHERE CompleteRecordFlag <> 'Y'
	OR CompleteRecordFlag IS NULL

--What is Multiple Client Flag used for ?? 
--Should only active cases be considered?
				  
				  
	UPDATE ProviderMasterStaging
		SET MultiClientFlag = 'Y'
	  WHERE ProviderMasterID IN
			(SELECT DISTINCT PS1.ProviderMasterID
				FROM ProviderStatusStaging AS PS1
				INNER JOIN ProviderStatusStaging AS PS2 ON PS1.SFID = PS2.SFID
									AND PS1.Facility <> PS2.Facility
				WHERE PS1.Active= 'Y'
				AND PS2.Active = 'Y')
				
	UPDATE ProviderMasterStaging
	SET MultiClientFlag = 'N'
	WHERE MultiClientFlag <> 'Y'
	OR MultiClientFlag IS NULL
	







END
