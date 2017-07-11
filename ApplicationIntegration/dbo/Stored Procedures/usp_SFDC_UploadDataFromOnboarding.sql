


CREATE Procedure [dbo].[usp_SFDC_UploadDataFromOnboarding]

AS

/* =====================================================================

Loads data from Onboarding staging tables to Salesforce

 =====================================================================
 */


SET NOCOUNT ON 
SET DEADLOCK_PRIORITY HIGH


BEGIN


/*Move Re hire/recred data coming from Onboard Application to SFDC 
		with Flag = 'Ready4SF' and ProviderType = RC or RH. 
		After updating to SFDC the flag changes to 'Loaded2SF'
		*/



 /*Need to map title for License issuer mapping:
				Medical Doctors = M.D.
				Osteopathic Doctors = D.O.
				Physician Assistants = P.A. & P.A.-C
				Nurse Practitioners = N.P., F.N.P., C.N.P., C.R.N.P., 
				C.F.N.P., A.P.R.N., A.C.N.P., A.N.P.
				*/


	UPDATE AppStaging.dbo.OnboardProviderLicensesForSFDC
	SET ProviderType = 'MD'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC PA
	WHERE PA.SFID = OnboardProviderLicensesForSFDC.SFID
		AND PA.ProfessionalTitle IN ('M.D.', 'MD')
		AND PA.SF_Flag = 'Ready4SF'		
		
	UPDATE AppStaging.dbo.OnboardProviderLicensesForSFDC
	SET ProviderType = 'DO'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC PA
	WHERE PA.SFID = OnboardProviderLicensesForSFDC.SFID
		AND PA.ProfessionalTitle IN ('D.O.', 'DO')
		AND PA.SF_Flag = 'Ready4SF'		
		
	UPDATE AppStaging.dbo.OnboardProviderLicensesForSFDC
	SET ProviderType = 'PA'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC PA
	WHERE PA.SFID = OnboardProviderLicensesForSFDC.SFID
		AND PA.ProfessionalTitle IN ('P.A.', 'P.A.-C.')
		AND PA.SF_Flag = 'Ready4SF'		

	UPDATE AppStaging.dbo.OnboardProviderLicensesForSFDC
	SET ProviderType = 'NP'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC PA
	WHERE PA.SFID = OnboardProviderLicensesForSFDC.SFID
		AND PA.ProfessionalTitle IN ('N.P.', 'F.N.P.', 'C.N.P.', 'C.R.N.P.', 
				'C.F.N.P.', 'A.P.R.N.', 'A.C.N.P.', 'A.N.P.')
		AND PA.SF_Flag = 'Ready4SF'

/* Need to delete all cases from ProviderLicenses where License number = 'N/A' - This was needed for RC and RH mapping*/

DELETE FROM AppStaging.dbo.OnboardProviderLicensesForSFDC
WHERE LicenseNum = 'N/A'
AND LicenseType = 'CDS State DEA'

/* Data to be pushed in SFDC needs tracking - below query inserts records to be pushed in SFDC 
and then each object is updated*/

INSERT INTO SFDCUploadTracking
SELECT ProviderMasterID,
SFID,
ProviderType_Flag,
Credate,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL
FROM AppStaging.dbo.OnboardProviderAccountForSFDC OA
WHERE OA.SF_Flag = 'Ready4SF'
AND NOT EXISTS (SELECT * 
				FROM SFDCUploadTracking SU
				WHERE SU.ProviderMasterID = OA.ProviderMasterID
				AND SU.UploadToOnboard = OA.CreDate )
				
				
				
				
/*Clean up secondary email*/


UPDATE AppStaging.dbo.OnboardProviderAccountForSFDC
	SET Email2 = ''
	WHERE Email2 not in (SELECT Email2 
					FROM AppStaging.dbo.OnboardProviderReferencesForSFDC
					WHERE (CHARINDEX(' ',LTRIM(RTRIM(Email2))) = 0 
					AND  LEFT(LTRIM(Email2),1) <> '@' 
					AND  RIGHT(RTRIM(Email2),1) <> '.' 
					AND  CHARINDEX('.',Email2 ,CHARINDEX('@',Email2)) - CHARINDEX('@',Email2 ) > 1 
					AND  LEN(LTRIM(RTRIM(Email2 ))) - LEN(REPLACE(LTRIM(RTRIM(Email2)),'@','')) = 1 
					AND  CHARINDEX('.',REVERSE(LTRIM(RTRIM(Email2)))) >= 3 
					AND  (CHARINDEX('.@',Email2 ) = 0 AND CHARINDEX('..',Email2 ) = 0)))
	AND Email2 <> ''
						
/* SFDC Object Updated: Contact*/						

UPDATE Salesforce...Contact 
SET Provider_Master_ID__c = LTRIM(RTRIM(PA.ProviderMasterID)),
LastName = LTRIM(RTRIM(PA.LastName)) ,
FirstName = LTRIM(RTRIM(PA.FirstName)),
Middle_Name__c = LTRIM(RTRIM(PA.MiddleName)) ,
ts2__Lastname__c = LTRIM(RTRIM(PA.LastName)),
ts2__Firstname__c = LTRIM(RTRIM(PA.FirstName)),
ts2__Middlename__c = LTRIM(RTRIM(PA.MiddleName)),
Title__c = LTRIM(RTRIM(PA.ProfessionalTitle)),
Contact.Description = Convert(varchar, PA.OtherInfo) + '---' + Convert(varchar, GetDate()) + '(Online Cred App):' + Convert(varchar,PA.Description)  ,
Cred_Other_First_name__c = LTRIM(RTRIM(PA.OtherFirstName1)) ,
Cred_other_last_name__c = LTRIM(RTRIM(PA.OtherLastName1)) ,
Cred_other_middle_name__c = LTRIM(RTRIM(PA.OtherMiddleName1)) ,
Email = LTRIM(RTRIM(PA.Email1)) ,
Secondary_Email__c = LTRIM(RTRIM(PA.Email2)),
HomePhone = LTRIM(RTRIM(PA.PhoneNbr)) ,
Phone = LTRIM(RTRIM(PA.PhoneNbr)) ,
MobilePhone = LTRIM(RTRIM(PA.MobileNbr)) ,
OtherPhone = LTRIM(RTRIM(PA.PhoneNbr2)),
Fax = LTRIM(RTRIM(PA.FaxNbr)) ,
MailingStreet = LTRIM(RTRIM(PA.PrimaryAddress)) + ' ' + LTRIM(RTRIM(PA.PrimarySuite)) ,
MailingCity = LTRIM(RTRIM(PA.PrimaryCity)) ,
MailingState = LTRIM(RTRIM(PA.PrimaryState)) ,
MailingPostalCode = LTRIM(RTRIM(Left(PA.PrimaryZipCode,5))),
OtherStreet = LTRIM(RTRIM(PA.SecondaryAddress)) + ' ' + LTRIM(RTRIM(PA.SecondarySuite)) ,
OtherCity = LTRIM(RTRIM(PA.SecondaryCity)),
OtherState = LTRIM(RTRIM(PA.SecondaryState)) ,
OtherPostalCode = LTRIM(RTRIM(Left(PA.SecondaryZipCode,5))),
Cred_Social_Security_ID__c = REPLACE(LTRIM(RTRIM(PA.SSN)), '-', '') ,
ts2__Social_Security__c = REPLACE(LTRIM(RTRIM(PA.SSN)), '-', ''),
Cred_marital_status__c = LTRIM(RTRIM(MaritalStatus)),
Cred_Spouse_name__c = LTRIM(RTRIM(PA.PartnerName)) ,
Cred_date_of_birth__c = CONVERT(Datetime, PA.DOB),
Date_of_Birth__c = CONVERT(Datetime, PA.DOB),
Cred_City_of_Birth__c = LTRIM(RTRIM(PA.CityOfBirth)) ,
Cred_Country_of_Birth_1__c = LTRIM(RTRIM(PA.CountryOfBirth)),
State_of_Birth_1__c = LTRIM(RTRIM(PA.StateOfBirth)),
Cred_Gender__c = CASE WHEN LTRIM(RTRIM(PA.Gender)) = 'M'
				THEN 'Male'
				WHEN LTRIM(RTRIM(PA.Gender)) = 'F'
				THEN 'Female' 
				ELSE '' END,
Cred_Enter_Non_English_Language_u_speak__c = 
				CASE WHEN PA.OtherLang1 IS NULL OR  PA.OtherLang1 = '' THEN ''
				ELSE LTRIM(RTRIM(PA.OtherLang1)) END  +
				CASE WHEN PA.OtherLang2 IS NULL OR PA.OtherLang2 = '' THEN ''
				ELSE ', ' +  LTRIM(RTRIM(PA.OtherLang2)) END + 
				CASE WHEN PA.OtherLang3 IS NULL OR PA.OtherLang3 = '' THEN ''
				ELSE ', ' +  LTRIM(RTRIM(PA.OtherLang3)) END,
Cred_FNIN_Country_of_Issue_1__c = LTRIM(RTRIM(PA.FNINCountryIssued)),
Cred_Foreign_National_Identification_Num__c = LTRIM(RTRIM(PA.FNIN)) ,
Cred_NPI__c = LTRIM(RTRIM(PA.NPINum)),
Cred_Suffix__c = LTRIM(RTRIM(PA.Suffix)),
Cred_Marital_Status__c = LTRIM(RTRIM(PA.MaritalStatus))
FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
WHERE Contact.Id = PA.SFID 
AND Contact.AccountId = '001A000000LwvkyIAB'  
AND Contact.RecordTypeId = '012G0000000yDrOIAU'
AND PA.SF_Flag = 'Ready4SF'
--AND PA.ProviderType_Flag IN ('RC', 'RH')



UPDATE SFDCUploadTracking
	SET SFDCContact = 'True'
FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
WHERE SFDCUploadTracking.SFID = PA.SFID 
AND PA.SF_Flag = 'Ready4SF'



/*Work History - 
	1. Hospital affiliations - Should have SFID to map to Work History
	2. Other Work History - Type = Other Clinical in SFDC
	3. Gaps - Type = Gap in Work Hisotry
*/


--Case 1  - Hospital affiliations -- INSERT(new records)
	INSERT INTO Salesforce...Work_History__c
	(Contact__c,
	Work_History_Type__c,
	Health_Care_Facility__c,
	From__c,
	To__c,
	Position__c,
	Comments__c,
	CEPA_Contracted_Site__c,
	Galen_Contracted_Site__c
	)
	SELECT Aff.SFID,
	Aff.AffiliationType,
	Aff.EmployerSFID,
	Aff.FromDate,
	Aff.ToDate,
	Aff.Position,
	Aff.Department,
	'false',
	'false'
	FROM AppStaging.dbo.OnboardProviderAffiliationsForSFDC As Aff
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
				ON PA.SFID = Aff.SFID
	where PA.SF_Flag = 'Ready4SF'
	AND Aff.EmployerSFID <> ''
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (Aff.SFDCName IS NULL
		OR Aff.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE HospAffiliations IS NULL)
		
		
--Case 1  - Hospital affiliations -- Update(existing records)

	UPDATE Salesforce...Work_History__c
	SET Work_History_Type__c = Aff.AffiliationType,
		Health_Care_Facility__c = Aff.EmployerSFID,
		From__c = Aff.FromDate,
		To__c = Aff.ToDate,
		Position__c = Aff.Position,
		Comments__c = Convert(varchar(1000), Comments__c) + ';' + Convert(varchar(1000), Aff.Department)
	FROM AppStaging.dbo.OnboardProviderAffiliationsForSFDC As Aff
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
				ON PA.SFID = Aff.SFID
	WHERE Work_History__c.Contact__c = PA.SFID
	AND Work_History__c.Name = Aff.SFDCName
	AND PA.SF_Flag = 'Ready4SF'
	AND Aff.EmployerSFID <> ''
	AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (Aff.SFDCName IS NOT NULL
		AND Aff.SFDCName <> '')
	
	
	UPDATE SFDCUploadTracking
		SET HospAffiliations = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'

--Case2 - Other Clinical -- Insert(New records)

	INSERT INTO Salesforce...Work_History__c
	(Contact__c,
	Work_History_Type__c,
	Other_Facility__c,
	From__c,
	To__c,
	Position__c,
	Comments__c,
	Other_Street_1__c,
	Other_Street_2__c,
	Other_City__c,
	Other_State__c,
	Other_Zip__c,
	Other_Fax__c,
	Other_Phone__c
	)
	SELECT Aff.SFID,
	Aff.AffiliationType,
	Aff.EmployerName,
	Aff.FromDate,
	Aff.ToDate,
	Aff.Position,
	Aff.Department,
	Aff.Address,
	Aff.Suite,
	Aff.City,
	Aff.State,
	Aff.ZipCode,
	Aff.Fax,
	Aff.PhoneNbr
	FROM AppStaging.dbo.OnboardProviderAffiliationsForSFDC As Aff
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
			ON PA.SFID = Aff.SFID
	where PA.SF_Flag = 'Ready4SF'
	AND Aff.EmployerSFID = ''
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (Aff.SFDCName IS NULL
		OR Aff.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE OtherClinical IS NULL)
		
--Case2 - Other Clinical -- Update(Existing records)

	UPDATE Salesforce...Work_History__c
	SET Work_History_Type__c = Aff.AffiliationType,
		Other_Facility__c = Aff.EmployerName,
		From__c = Aff.FromDate,
		To__c = Aff.ToDate,
		Position__c = Aff.Position,
		Comments__c = Convert(varchar(1000),Comments__c) + ';' + Aff.Department,
		Other_Street_1__c = Aff.Address,
		Other_Street_2__c = Aff.Suite,
		Other_City__c = Aff.City,
		Other_State__c = Aff.State,
		Other_Zip__c = Aff.ZipCode,
		Other_Fax__c = Aff.Fax,
		Other_Phone__c = Aff.PhoneNbr
	FROM AppStaging.dbo.OnboardProviderAffiliationsForSFDC As Aff
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
			ON PA.SFID = Aff.SFID
	where Work_History__c.Contact__c = PA.SFID
	AND Work_History__c.Name = Aff.SFDCName
	AND PA.SF_Flag = 'Ready4SF'
	AND Aff.EmployerSFID = ''
	AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (Aff.SFDCName IS NULL
		OR Aff.SFDCName = '')
		

	UPDATE SFDCUploadTracking
		SET OtherClinical = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'


--Case 3  - Gap in Work History -- INSERT(New records)
	INSERT INTO Salesforce...Work_History__c
	(Contact__c,
	Work_History_Type__c,
	From__c,
	To__c,
	Comments__c
	)
	SELECT Aff.SFID,
	'Gap in work History',
	Aff.FromDate,
	Aff.ToDate,
	Aff.Description
	FROM AppStaging.dbo.OnboardProviderWorkHistoryGapForSFDC As Aff
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
				ON PA.SFID = Aff.SFID
	where PA.SF_Flag = 'Ready4SF'
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (Aff.SFDCName IS NULL
		OR Aff.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE GapInWH IS NULL)
		
--Case 3  - Gap in Work History -- UPDATE(Existing records)
	UPDATE Salesforce...Work_History__c
	SET From__c = Aff.FromDate,
		To__c = Aff.ToDate,
		Comments__c = Convert(varchar(1000),Comments__c) + ';' + Aff.Description
	FROM AppStaging.dbo.OnboardProviderWorkHistoryGapForSFDC As Aff
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
				ON PA.SFID = Aff.SFID
	WHERE Work_History__c.Contact__c = PA.SFID
	AND Work_History__c.Name = Aff.SFDCName
	AND PA.SF_Flag = 'Ready4SF'
	AND PA.ProviderType_Flag IN ('RC', 'RH')



	UPDATE SFDCUploadTracking
		SET GapInWH = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'

/*Professional Credentials - 
	1. Contact - Dirver License
	2. Specialty Certification - Certifications
	3. Specialties - Board Certified
	4. Professional License
*/

-- Case 1 - Type = Drivers License -- INSERT(New Records)

	INSERT INTO Salesforce...Professional_Credentials__c(
	Contact__c,
	Type__c,
	DEA_State_of_Registration__c,
	Cert_Lic_Number__c,
	Expiration_Date__c)
	SELECT DISTINCT PA.SFID,
		'Driver''s License',
		PA.DriverLicenseState,
		PA.DriverLicenseNo,
		PA.DriverLicenseExpDt
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC PA
	WHERE PA.SF_Flag = 'Ready4SF'
		AND PA.DriverLicenseNo <> ''
		--AND PA.ProviderType_Flag IN ('RC', 'RH')
		AND NOT EXISTS(SELECT *
					FROM Salesforce...Professional_Credentials__c PC
					WHERE PC.Type__C = 'Driver''s License'
					AND PC.Contact__c = PA.SFID)





--THIS WILL ONLY BE AN UPDATE FOR RC AND RH
	UPDATE Salesforce...Professional_Credentials__c
	SET DEA_State_of_Registration__c = PA.DriverLicenseState,
		Cert_Lic_Number__c = PA.DriverLicenseNo,
		Expiration_Date__c = PA.DriverLicenseExpDt
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	JOIN Salesforce...Contact AS Contact ON Contact.Id = PA.SFID 
	WHERE Professional_Credentials__c.Contact__c = PA.SFID
	AND Professional_Credentials__c.Type__C = 'Driver''s License'
	AND Contact.AccountId = '001A000000LwvkyIAB'  
	AND Contact.RecordTypeId = '012G0000000yDrOIAU'
	AND PA.SF_Flag = 'Ready4SF'
	AND PA.DriverLicenseNo <> ''
	AND PA.ProviderType_Flag IN ('RC', 'RH')




--Case 2 - Insert certifications like NALS, ATLS, PALS -- INSERT (New records)

	INSERT INTO Salesforce...Professional_Credentials__c(
	Contact__c,
	Type__c,
	Issue_Date__c,
	Expiration_Date__c
	)
	SELECT 
	PC.SFID,
	CASE WHEN PC.CertificationType = 'CA'
		THEN 'CA Pharmacology Certificate'
		ELSE PC.CertificationType END,
	PC.StartDate,
	PC.EndDate
	FROM AppStaging.dbo.OnboardProviderCertificationForSFDC AS PC
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA ON PA.SFID = PC.SFID
	WHERE PA.SF_Flag = 'Ready4SF'
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (PC.SFDCName IS NULL
		OR PC.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE Certifications IS NULL)
		
--Case 2 - Insert certifications like NALS, ATLS, PALS -- UPDATE (existing records)

	UPDATE Salesforce...Professional_Credentials__c
	SET Type__c = CASE WHEN PC.CertificationType = 'CA'
						THEN 'CA Pharmacology Certificate'
						ELSE PC.CertificationType END,
	Issue_Date__c = PC.StartDate,
	Expiration_Date__c = PC.EndDate
	FROM AppStaging.dbo.OnboardProviderCertificationForSFDC AS PC
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA ON PA.SFID = PC.SFID
	WHERE Professional_Credentials__c.Contact__c = PA.SFID
	AND Professional_Credentials__c.Name = PC.SFDCName
	AND PA.SF_Flag = 'Ready4SF'
	AND PA.ProviderType_Flag IN ('RC', 'RH')


	UPDATE SFDCUploadTracking
		SET Certifications = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'

--Case 3 - Board certification -- INSERT (New Records)

	INSERT INTO Salesforce...Professional_Credentials__c(
	Contact__c,
	Type__c,
	Issuer_1__c,
	--DEA_State_of_Registration__c,
	Issue_Date__c,
	Expiration_Date__c,
	Renewed__c
	)
	SELECT
	PS.SFID,
	'Board Certification',
	BoardSFID,
	--IM.State1,
	PS.InitialCertDate,
	PS.ExpirationDate,
	PS.ReCertDate
	FROM AppStaging.dbo.OnboardProviderSpecialtyForSFDC AS PS
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PS.SFID
	--JOIN IssuerMapping AS IM ON IM.Issuer = PS.CertifyingBoard
	where PA.SF_Flag = 'Ready4SF'
	AND PS.BoardCertified = 'True'
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (PS.SFDCName IS NULL
		OR PS.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE BoardCertifications IS NULL)
		
--Case 3 - Board certification -- UPDATE (Existing Records)

	UPDATE Salesforce...Professional_Credentials__c
	SET Type__c = 'Board Certification',
		Issuer_1__c = BoardSFID,
		Issue_Date__c = PS.InitialCertDate,
		Expiration_Date__c = PS.ExpirationDate,
		Renewed__c = PS.ReCertDate
	FROM AppStaging.dbo.OnboardProviderSpecialtyForSFDC AS PS
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PS.SFID
	WHERE Professional_Credentials__c.Contact__c = PA.SFID
	AND Professional_Credentials__c.Name = PS.SFDCName
	AND PA.SF_Flag = 'Ready4SF'
	AND PS.BoardCertified = 'True'
	AND PA.ProviderType_Flag IN ('RC', 'RH')


	UPDATE SFDCUploadTracking
		SET BoardCertifications = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'

--Case 4 -  Insert Licenses
--		a. State License = Medical License -- INSERT(New records)


	INSERT INTO Salesforce...Professional_Credentials__c(
	Contact__c,
	Type__c,
	Issuer_1__c,
	Cert_Lic_Number__c,
	DEA_State_of_Registration__c,
	Issue_Date__c,
	Expiration_Date__c,
	Comments__c)
	SELECT DISTINCT
	PL.SFID,
	'Medical License',
	IM.IssuerSFID,
	PL.LicenseNum,
	PL.IssuingState,
	PL.IssueDate,
	PL.ExpirationDate,
	PL.LicenseStatus
	FROM IssuerMapping AS IM
	JOIN AppStaging.dbo.OnboardProviderLicensesForSFDC AS PL 
		ON PL.IssuingState = IM.State1
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PL.SFID
	WHERE IssuerType LIKE '%License%'
	AND  PA.SF_Flag = 'Ready4SF'
	AND LTRIM(RTRIM(LicenseType)) IN ('State')
	AND CHARINDEX(PL.ProviderType, IM.ProviderType) <> 0
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (PL.SFDCName IS NULL
		OR PL.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE MedicalLicense IS NULL)
	
	
--		a. State License = Medical License -- UPDATE(Existing records)

	UPDATE Salesforce...Professional_Credentials__c
	SET Type__c = 'Medical License',
		Issuer_1__c = IM.IssuerSFID,
		Cert_Lic_Number__c = PL.LicenseNum,
		DEA_State_of_Registration__c = PL.IssuingState,
		Issue_Date__c = PL.IssueDate,
		Expiration_Date__c = PL.ExpirationDate
		--Comments__c = Convert(varchar(1000),Comments__c) + ';' + PL.LicenseStatus
	FROM IssuerMapping AS IM
	JOIN AppStaging.dbo.OnboardProviderLicensesForSFDC AS PL 
		ON PL.IssuingState = IM.State1
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PL.SFID
	WHERE Professional_Credentials__c.Contact__c = PA.SFID
	AND Professional_Credentials__c.Name = PL.SFDCName
	AND IssuerType LIKE '%License%'
	AND  PA.SF_Flag = 'Ready4SF'
	AND LTRIM(RTRIM(LicenseType)) IN ('State')
	AND CHARINDEX(PL.ProviderType, IM.ProviderType) <> 0
	AND PA.ProviderType_Flag IN ('RC', 'RH')



	UPDATE SFDCUploadTracking
		SET MedicalLicense = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'

--		b. State CDS License = Medical License -- INSERT(New Records)

	INSERT INTO Salesforce...Professional_Credentials__c(
	Contact__c,
	Type__c,
	Issuer_1__c,
	Cert_Lic_Number__c,
	DEA_State_of_Registration__c,
	Issue_Date__c,
	Expiration_Date__c,
	Comments__c)
	SELECT DISTINCT
	PL.SFID,
	'State DEA',
	IM.IssuerSFID,
	PL.LicenseNum,
	PL.IssuingState,
	PL.IssueDate,
	PL.ExpirationDate,
	PL.LicenseStatus
	FROM IssuerMapping AS IM
	JOIN AppStaging.dbo.OnboardProviderLicensesForSFDC AS PL 
		ON PL.IssuingState = IM.State1
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PL.SFID
	WHERE IssuerType LIKE '%CSC%'
	AND  PA.SF_Flag = 'Ready4SF'
	AND LicenseType LIKE ('CDS%State%DEA')
	AND CHARINDEX(PL.ProviderType, IM.ProviderType) <> 0	
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (PL.SFDCName IS NULL
		OR PL.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE StateDEA IS NULL)
		
		
--		b. State CDS License = Medical License -- Update(Existing Records)
	UPDATE Salesforce...Professional_Credentials__c
	SET Type__c = 'State DEA',
		Issuer_1__c = IM.IssuerSFID,
		Cert_Lic_Number__c = PL.LicenseNum,
		DEA_State_of_Registration__c = PL.IssuingState,
		Issue_Date__c = PL.IssueDate,
		Expiration_Date__c = PL.ExpirationDate
		--Comments__c = Convert(varchar(1000),Comments__c) + ';' + PL.LicenseStatus
	FROM IssuerMapping AS IM
	JOIN AppStaging.dbo.OnboardProviderLicensesForSFDC AS PL 
		ON PL.IssuingState = IM.State1
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PL.SFID
	WHERE Professional_Credentials__c.Contact__c = PA.SFID
	AND Professional_Credentials__c.Name = PL.SFDCName
	AND IssuerType LIKE '%CSC%'
	AND  PA.SF_Flag = 'Ready4SF'
	AND LicenseType LIKE ('CDS%State%DEA')
	AND CHARINDEX(PL.ProviderType, IM.ProviderType) <> 0	
	AND PA.ProviderType_Flag IN ('RC', 'RH')


	UPDATE SFDCUploadTracking
		SET StateDEA = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'
	

--		c. Federal DEA - State not needed -- INSERT(New Records)

	INSERT INTO Salesforce...Professional_Credentials__c(
	Contact__c,
	Type__c,
	Issuer_1__c,
	Cert_Lic_Number__c,
	DEA_State_of_Registration__c,
	Issue_Date__c,
	Expiration_Date__c,
	Comments__c)
	SELECT DISTINCT
	PL.SFID,
	'Federal DEA',
	'a1zG00000008n0aIAA', -- Drug Enforcement Agency
	PL.LicenseNum,
	PL.IssuingState,
	PL.IssueDate,
	PL.ExpirationDate,
	PL.LicenseStatus
	FROM AppStaging.dbo.OnboardProviderLicensesForSFDC AS PL 
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PL.SFID
	WHERE PA.SF_Flag = 'Ready4SF'
	AND LicenseType IN ('Federal DEA')
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (PL.SFDCName IS NULL
		OR PL.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE FederalDEA IS NULL)
		
		

--		c. Federal DEA - State not needed -- Update(Existing Records)
	UPDATE Salesforce...Professional_Credentials__c
	SET Type__c = 'Federal DEA',
		Issuer_1__c = 'a1zG00000008n0aIAA', -- Drug Enforcement Agency
		Cert_Lic_Number__c = PL.LicenseNum,
		DEA_State_of_Registration__c = PL.IssuingState,
		Issue_Date__c = PL.IssueDate,
		Expiration_Date__c = PL.ExpirationDate
		--Comments__c = Convert(varchar(1000),Comments__c) + ';' + PL.LicenseStatus
	FROM AppStaging.dbo.OnboardProviderLicensesForSFDC AS PL 
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PL.SFID
	WHERE Professional_Credentials__c.Contact__c = PA.SFID
	AND Professional_Credentials__c.Name = PL.SFDCName
	AND PA.SF_Flag = 'Ready4SF'
	AND LicenseType IN ('Federal DEA')
	AND PA.ProviderType_Flag IN ('RC', 'RH')


	UPDATE SFDCUploadTracking
		SET FederalDEA = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'


/*Education and Training - 
	1. Type = Medical School 
			WHERE Degree in (Doctor of Medicine, Doctor of Osteopathy, Bachelor of Medicine,
							Bachelor of Surgery)  AND Country = 'USA' 
	2. Type = Foreign Medical School
			WHERE Degree in (Doctor of Medicine, Doctor of Osteopathy, Bachelor of Medicine,
							Bachelor of Surgery)  AND Country <> 'USA'
	3. Type = Fifth Pathway
			WHERE Degree in Fifth Pathway Program AND Country = 'USA'
	4. Type = Graduate Education 
			WHERE Country <> '
*/

--Case 1 - Country = 'USA' -- INSERT(New Records)

	INSERT INTO Salesforce...Education__c
	( Contact__c,
	Education_Type__c,
	Institution_1__c,
	Degree__c,
	From__c,
	To__c,
	Completed__c
	)
	SELECT DISTINCT
	PE.SFID,
	CASE WHEN PE.EducationType = 'Undergraduate'
		 THEN 'Undergraduate Education' 	
		 WHEN PE.EducationType = 'Graduate'
				AND PE.Degree IN ('Doctor of Medicine',
							'Doctor of Osteopathy',
							'Bachelor of Medicine, Bachelor of Surgery')
		 THEN 'Medical School'
		 WHEN PE.EducationType = 'Graduate'
				AND PE.Degree IN ('Fifth Pathway Program')
		 THEN 'Fifth Pathway'
		 ELSE 'Graduate Education' END,
	PE.SchoolSFID, 
	PE.Degree,
	PE.StartDate,
	PE.EndDate,
	CASE WHEN PE.EducationCompleted = 'y'
		THEN 'true'
		ELSE 'false' END AS Completed
	FROM AppStaging.dbo.OnboardProviderEducationForSFDC AS PE
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PE.SFID
	WHERE PA.SF_Flag = 'Ready4SF'
	AND PE.Country LIKE ('U%S%A')
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (PE.SFDCName IS NULL
		OR PE.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE Education IS NULL)
		
--Case 1 - Country = 'USA' -- UPDATE(Existing Records)
	UPDATE Salesforce...Education__c
	SET Education_Type__c =	CASE WHEN Education_Type__c <> 'Post Graduate Education'
								THEN ( CASE WHEN PE.EducationType = 'Undergraduate'
										 THEN 'Undergraduate Education' 	
										 WHEN PE.EducationType = 'Graduate'
												AND PE.Degree IN ('Doctor of Medicine',
															'Doctor of Osteopathy',
															'Bachelor of Medicine, Bachelor of Surgery')
										 THEN 'Medical School'
										 WHEN PE.EducationType = 'Graduate'
												AND PE.Degree IN ('Fifth Pathway Program')
										 THEN 'Fifth Pathway'
										 ELSE 'Graduate Education' END)
								ELSE Education_Type__c END,
		Institution_1__c = PE.SchoolSFID, 
		Degree__c = PE.Degree,
		From__c = PE.StartDate,
		To__c = PE.EndDate,
		Completed__c = CASE WHEN PE.EducationCompleted = 'y'
							THEN 'true'
							ELSE 'false' END
	FROM AppStaging.dbo.OnboardProviderEducationForSFDC AS PE
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PE.SFID
	WHERE Education__c.Contact__c = PA.SFID
	AND Education__c.Name = PE.SFDCName
	AND PA.SF_Flag = 'Ready4SF'
	AND PE.Country LIKE ('U%S%A')
	AND PA.ProviderType_Flag IN ('RC', 'RH')


	UPDATE SFDCUploadTracking
		SET Education = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'
	

--Case 2 - Country <> 'USA' -- INSERT(New Records)

	INSERT INTO Salesforce...Education__c
	( Contact__c,
	Education_Type__c,
	Institution_1__c,
	Degree__c,
	From__c,
	To__c,
	ECFMG_Number__c,
	ECFMG_Date__c
	)
	SELECT 
	PE.SFID,
	CASE WHEN PE.EducationType = 'Undergraduate'
		 THEN 'Undergraduate Education' 	
		 WHEN PE.EducationType = 'Graduate'
				AND PE.Degree IN ('Doctor of Medicine',
							'Doctor of Osteopathy',
							'Bachelor of Medicine, Bachelor of Surgery')
		 THEN 'Foreign Medical School'
		 ELSE 'Graduate Education' END,
	PE.SchoolSFID,
	PE.Degree,
	PE.StartDate,
	PE.EndDate,
	PE.ECFMGNum,
	PE.ECFMGIssueDate
	FROM AppStaging.dbo.OnboardProviderEducationForSFDC AS PE
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PE.SFID
	where PA.SF_Flag = 'Ready4SF'
	AND (PE.Country IS NULL
	OR PE.Country NOT LIKE ('U%S%A'))
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (PE.SFDCName IS NULL
		OR PE.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE ForeignEducation IS NULL)
		

--Case 2 - Country <> 'USA' -- UPDATE(Existing Records)

	UPDATE Salesforce...Education__c
	SET Education_Type__c = CASE WHEN Education_Type__c <> 'Post Graduate Education'
								THEN (CASE WHEN PE.EducationType = 'Undergraduate'
								 THEN 'Undergraduate Education' 	
								 WHEN PE.EducationType = 'Graduate'
										AND PE.Degree IN ('Doctor of Medicine',
													'Doctor of Osteopathy',
													'Bachelor of Medicine, Bachelor of Surgery')
								 THEN 'Foreign Medical School'
								 ELSE 'Graduate Education' END)
								ELSE Education_Type__c END,
		Institution_1__c = PE.SchoolSFID,
		Degree__c = PE.Degree,
		From__c = PE.StartDate,
		To__c = PE.EndDate,
		ECFMG_Number__c = PE.ECFMGNum,
		ECFMG_Date__c = PE.ECFMGIssueDate
	FROM AppStaging.dbo.OnboardProviderEducationForSFDC AS PE
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PE.SFID
	WHERE Education__c.Contact__c = PA.SFID
	AND Education__c.Name = PE.SFDCName
	AND PA.SF_Flag = 'Ready4SF'
	AND (PE.Country IS NULL
	OR PE.Country NOT LIKE ('U%S%A'))
	AND PA.ProviderType_Flag IN ('RC', 'RH')


	UPDATE SFDCUploadTracking
		SET ForeignEducation = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'
	
	

/*Malpractice Carrier 
*/

	--INSERT (New Records)

	INSERT INTO Salesforce...Malpractice_Carriers__c
	(Contact__c, 
	Carrier__c,
	Policy_number__c,
	Coverage_Range__c, --Individual
	Coverage_Range2__c, --Aggregate
	Enrolled_date__c,
	Expiration_Date__c)
	SELECT
	PM.SFID,
	PM.CarrierSFID,
	PM.PolicyNum,
	PM.IndividualAmount,
	PM.AggregateAmount,
	PM.EffectiveDate,
	PM.ExpirationDate
	FROM AppStaging.dbo.OnboardProviderMalPracCarrierForSFDC AS PM
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PM.SFID
	WHERE PA.SF_Flag = 'Ready4SF'
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (PM.SFDCName IS NULL
		OR PM.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE MalPracCarriers IS NULL)
		
		
	--UPDATE (Existing Records)
	
	UPDATE Salesforce...Malpractice_Carriers__c
	SET --Carrier__c = PM.CarrierSFID,
		Policy_number__c = PM.PolicyNum,
		Coverage_Range__c = PM.IndividualAmount,
		Coverage_Range2__c = PM.AggregateAmount,
		Enrolled_date__c = PM.EffectiveDate,
		Expiration_Date__c = PM.ExpirationDate
	FROM AppStaging.dbo.OnboardProviderMalPracCarrierForSFDC AS PM
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PM.SFID
	WHERE Malpractice_Carriers__c.Contact__c = PA.SFID
	AND Malpractice_Carriers__c.Name = PM.SFDCName
	AND PA.SF_Flag = 'Ready4SF'
	AND PA.ProviderType_Flag IN ('RC', 'RH')


	UPDATE SFDCUploadTracking
		SET MalPracCarriers = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'



/* Provider Reference

EMAIL Cleanup
*/

--This statement extracts the first email if there are multiple separated with a comma
	UPDATE AppStaging.dbo.OnboardProviderReferencesForSFDC
	SET Email = LTRIM(RTRIM(CASE WHEN CharIndex(',',Email) > 0
				THEN LEFT(Email , CharIndex(',' , Email) - 1)
				ELSE Email END))



--Following makes sure no invalid email addresses go to SFDC

	UPDATE AppStaging.dbo.OnboardProviderReferencesForSFDC
	SET Email = ''
	WHERE Email not in (SELECT Email 
					FROM AppStaging.dbo.OnboardProviderReferencesForSFDC
					WHERE (CHARINDEX(' ',LTRIM(RTRIM(Email))) = 0 
					AND  LEFT(LTRIM(Email),1) <> '@' 
					AND  RIGHT(RTRIM(Email),1) <> '.' 
					AND  CHARINDEX('.',Email ,CHARINDEX('@',Email)) - CHARINDEX('@',Email ) > 1 
					AND  LEN(LTRIM(RTRIM(Email ))) - LEN(REPLACE(LTRIM(RTRIM(Email)),'@','')) = 1 
					AND  CHARINDEX('.',REVERSE(LTRIM(RTRIM(Email)))) >= 3 
					AND  (CHARINDEX('.@',Email ) = 0 AND CHARINDEX('..',Email ) = 0)))
	AND Email <> ''

	--THIS WILL BE INSERT ONLY 
	
	INSERT INTO Salesforce...Credentialing_Reference__c (
	Provider__c,
	Name__c,
	Email__c,
	Phone__c,
	Fax__c,
	Address_Line_1__c,
	Address_Line_2__c,
	City__c,
	State__c,
	Zip_Code__c,
	Comment__c,
	Provider_Type__c
	)
	SELECT
	PR.SFID,
	PR.FirstName + ' ' + PR.LastName,
	PR.Email,
	PR.PhoneNbr,
	PR.Fax,
	PR.Address,
	PR.Suite,
	PR.City,
	PR.State,
	Left(PR.ZipCode, 5),
	PR.AreaOfInterest,
	PR.ProviderType
	FROM AppStaging.dbo.OnboardProviderReferencesForSFDC AS PR
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PR.SFID
	WHERE PA.SF_Flag = 'Ready4SF'
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (PR.SFDCName IS NULL
		OR PR.SFDCName = '')
	AND PR.LastName <> ''
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE ProviderReferences IS NULL)


	UPDATE SFDCUploadTracking
		SET ProviderReferences = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'

/* Provider Specialty
*/

	--INSERT(New Records)

	INSERT INTO Salesforce...Specialty__c
	(Contact__c,
	Specialty__c,
	Certified__c,
	Expiration_Date__c,
	Initial_Certification_Date__c,
	Recertification_Date__c)
	SELECT
	PS.SFID,
	PS.PrimarySpeciality,
	CASE WHEN PS.BoardCertified = 'True'
		THEN 'Yes' ELSE 'No' END,
	PS.ExpirationDate,
	PS.InitialCertDate,
	PS.ReCertDate
	FROM AppStaging.dbo.OnboardProviderSpecialtyForSFDC AS PS
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PS.SFID
	WHERE PA.SF_Flag = 'Ready4SF'
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (PS.SFDCName IS NULL
		OR PS.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE Specialty IS NULL)
		
		
	--UPDATE(Existing Records)
	
	UPDATE Salesforce...Specialty__c
	SET Specialty__c = PS.PrimarySpeciality,
		Certified__c = CASE WHEN PS.BoardCertified = 'True'
						THEN 'Yes' ELSE 'No' END,
		Expiration_Date__c = PS.ExpirationDate,
		Initial_Certification_Date__c = PS.InitialCertDate,
		Recertification_Date__c = PS.ReCertDate
	FROM AppStaging.dbo.OnboardProviderSpecialtyForSFDC AS PS
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PS.SFID
	WHERE Specialty__c.Contact__c = PA.SFID
	AND Specialty__c.Name = PS.SFDCName
	AND PA.SF_Flag = 'Ready4SF'
	AND PA.ProviderType_Flag IN ('RC', 'RH')
	
	
	UPDATE SFDCUploadTracking
		SET Specialty = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'



/* Provider Training
*/
--select * from dbo.OnboardProviderTrainingForSFDC
	--INSERT(New Records)

	INSERT INTO Salesforce...Education__c
	( Contact__c,
	Education_Type__c,
	Institution_1__c,
	Specialty__c,
	Director__c,
	From__c,
	To__c)
	SELECT
	PT.SFID,
	PT.TrainingType,
	PT.InstitutionSFID,
	PT.DeptOrSpecialty,
	PT.Director,
	PT.StartDate,
	PT.EndDate
	FROM AppStaging.dbo.OnboardProviderTrainingForSFDC AS PT
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PT.SFID
	WHERE PA.SF_Flag = 'Ready4SF'
	--AND PA.ProviderType_Flag IN ('RC', 'RH')
	AND (PT.SFDCName IS NULL
		OR PT.SFDCName = '')
	AND PA.ProviderMasterID IN (SELECT ProviderMasterID
							FROM SFDCUploadTracking
							WHERE Training IS NULL)
		
--UPDATE (Existing Records)
	
	UPDATE Salesforce...Education__c
	SET Education_Type__c =	PT.TrainingType,
		Institution_1__c = PT.InstitutionSFID,
		Specialty__c = PT.DeptOrSpecialty,
		Director__c = PT.Director,
		From__c = PT.StartDate,
		To__c = PT.EndDate
	FROM AppStaging.dbo.OnboardProviderTrainingForSFDC AS PT
	JOIN AppStaging.dbo.OnboardProviderAccountForSFDC As PA 
		ON PA.SFID = PT.SFID
	WHERE Education__c.Name = PT.SFDCName
	AND Education__c.Contact__c = PA.SFID
	AND PA.SF_Flag = 'Ready4SF'
	AND PA.ProviderType_Flag IN ('RC', 'RH')




	UPDATE SFDCUploadTracking
		SET Training = 'True'
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
	AND PA.SF_Flag = 'Ready4SF'



--If all the data has been loaded to SFDC now onboarding flag should be changed else throw an error:

	UPDATE SFDCUploadTracking
	SET UploadToSFDC = GETDATE()
	FROM AppStaging.dbo.OnboardProviderAccountForSFDC AS PA
	WHERE SFDCUploadTracking.SFID = PA.SFID 
		AND PA.SF_Flag = 'Ready4SF'
		AND UploadToSFDC IS NULL
		AND SFDCContact = 'True'
		AND HospAffiliations = 'True'
		AND OtherClinical = 'True'
		AND GapInWH = 'True'
		AND Certifications = 'True'
		AND BoardCertifications = 'True'
		AND MedicalLicense = 'True'
		AND StateDEA = 'True'
		AND FederalDEA = 'True'
		AND Education = 'True'
		AND ForeignEducation = 'True'
		AND MalPracCarriers = 'True'
		AND ProviderReferences = 'True'
		AND Specialty = 'True'
		AND Training = 'True'
	
	
	
	UPDATE AppStaging.dbo.OnboardProviderAccountForSFDC
	SET SF_Flag = 'Loaded2SF'
	WHERE SF_Flag = 'Ready4SF'
	AND SFID IN (SELECT SFID FROM SFDCUploadTracking
				WHERE UploadToSFDC IS NOT NULL)
	--AND SFID IN (SELECT Id
	--			FROM Salesforce...Contact
	--			WHERE LastModifiedDate > Convert(Date, GETDATE())
	--			AND LastModifiedById = '005G0000002CAdBIAW')



	

	
			  
END



