


CREATE PROCEDURE [dbo].[usp_RefreshOnboardingTables]
	
AS

/*
for providers where the Provider_Type flag = RC or RH we need to refresh data from SFDC - frequency to be determined
This will only be for till the provider has been loaded to SFDC
*/

	--get a list of providers whose data needs to be refreshed
	
	/*put this in the package to get the latest data status
	TRUNCATE TABLE Refresh_TempProviderAccount
	
	INSERT INTO Refresh_TempProviderAccount
	SELECT  SFID, ProviderMasterID, SF_Flag,ProviderType_Flag
	FROM ProviderAccount_Re
	WHERE ProviderType_Flag IN ('RC', 'RH')
	AND SF_Flag NOT IN ('Ready4SF', 'Loaded2SF')	
	
	SELECT distinct * FROM Refresh_TempProviderAccount*/
	

	--Reload refresh_ tables
	

	TRUNCATE TABLE Refresh_ProviderAccount
	
	INSERT INTO Refresh_ProviderAccount
	SELECT PM.ProviderMasterID,
		PM.WebID,
		PM.SFID,
		PMB.StaffGroup1,
		PMB.StaffGroup2,
		PMB.LastName,
		PMB.FirstName,
		PM.MiddleNameOrInitial,
		SC.Cred_Suffix__c,
		PM.PreferredName,
		SC.Cred_Other_Last_Name__c,
		SC.Cred_Other_First_Name__c,
		SC.Cred_Other_Middle_Name__c,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		PM.Title,
		NULL,
		NULL,
		PM.Gender,
		PM.DateOfBirth,
		SC.Cred_Country_of_Birth_1__c,
		SC.State_of_Birth_1__c,
		SC.Cred_City_of_Birth__c,
		SCred.DEA_State_of_Registration__c,
		SCred.Cert_Lic_Number__c,
		SCred.Expiration_Date__c,
		PM.SSNFormatted,
		SC.Cred_Foreign_National_Identification_Num__c,
		SC.Cred_FNIN_Country_of_Issue_1__c,
		CASE WHEN CHARINDEX(',', Cred_Enter_Non_English_Language_u_speak__c) > 0
			THEN LEFT(Convert(varchar(255), Cred_Enter_Non_English_Language_u_speak__c), CHARINDEX(',', Cred_Enter_Non_English_Language_u_speak__c)-1)
			ELSE Cred_Enter_Non_English_Language_u_speak__c
			END AS OtherLang1,
		NULL,
		NULL,
		SC.Cred_Marital_Status__c,
		PM.SpouseName,
		PMB.Address1,
		NULL,
		PMB.City1,
		PMB.State1,
		PMB.ZipCode1,
		PMB.Country1,
		CASE WHEN PMB.Address1 <> PMB.Address2
			THEN PMB.Address2
			ELSE NULL END,
		NULL,
		CASE WHEN PMB.City1 <> PMB.City2
			THEN PMB.City2
			ELSE NULL END,
		CASE WHEN PMB.State1 <> PMB.State2
			THEN PMB.State2
			ELSE NULL END,
		CASE WHEN PMB.ZipCode1 <> PMB.ZipCode2
			THEN PMB.ZipCode2
			ELSE NULL END,
		CASE WHEN PMB.Country1 <> PMB.Country2
			THEN PMB.Country2
			ELSE NULL END,
		'primary',
		SC.MobilePhone,
		LEFT(PMB.PhoneNbr1, 20) PhoneNbr1,
		LEFT(PMB.PhoneNbr2, 20) PhoneNbr2,
		PMB.FaxNbr1,
		PMB.CEPEmail,
		PMB.EmailAddress,
		NULL,
		NULL,
		NULL,
		SC.Cred_NPI__c,
		NULL,
		NULL,
		NULL,
		PM.DateOfHire,
		NULL,
		NULL,
		TA.ProviderType_Flag, 		/* NH- New hire, RH- Rehire, RC- Recred*/
		GETDATE(),
		'N',
		TA.SF_Flag		
	FROM Refresh_TempProviderAccount TA
	JOIN ProviderMaster AS PM ON PM.ProviderMasterID = TA.ProviderMasterID
	JOIN ProviderMasterBase AS PMB ON PM.ProviderMasterID = PMB.ProviderMasterID
	JOIN Salesforce...Contact SC	 
								ON SC.Provider_Master_ID__c = PM.ProviderMasterID
	LEFT OUTER JOIN (SELECT * 
						FROM Salesforce...Professional_Credentials__c
						WHERE Type__c = 'Driver''s License'
			) Scred	ON SCred.Contact__c = SC.Id
	WHERE PMB.Status = 0
		AND PMB.WebID IS NOT NULL
		--AND PM.ProviderMasterID NOT IN (SELECT ProviderMasterID
		--							FROM AppStaging.dbo.OnboardProviderAccountForSFDC)
	ORDER BY PMB.ProviderMasterID
			
			
	
	
	
-- Work History *** Part 1 - Excluding Gap in Work History****
    TRUNCATE TABLE Refresh_ProviderAffiliations
	
	INSERT INTO Refresh_ProviderAffiliations
	SELECT WH.Name,
	PMB.ProviderMasterID,
	PMB.WebID,
	Contact__c,
	Work_History_Type__c AS AffiliationType,
	Health_Care_Facility__c As EmployerSFID,
	CASE WHEN WH.Health_Care_Facility__c IS NOT NULL --= 'Hospital'
			THEN LEFT(WH.Healthcare_Facility_Name__c, 100)
			ELSE LEFT(WH.Other_Facility__c, 100) END AS EmployerName,
	NULL EmployerNameOther,
	CASE WHEN Work_History_Type__c = 'Hospital' 
		THEN LH.BillingStreet
		ELSE WH.Other_Street_1__c END AS Street,
	CASE WHEN Work_History_Type__c = 'Hospital' 
		THEN NULL 
		ELSE LEFT(WH.Other_Street_2__c, 20) END AS Suite,
	CASE WHEN Work_History_Type__c = 'Hospital' 
		THEN LH.BillingCity
		ELSE WH.Other_City__c END AS City,
	CASE WHEN Work_History_Type__c = 'Hospital' 
		THEN LH.BillingState
		ELSE WH.Other_State__c END AS State,
	CASE WHEN Work_History_Type__c = 'Hospital' 
		THEN LH.BillingPostalCode
		ELSE WH.Other_Zip__c END AS Zip,
	CASE WHEN Work_History_Type__c = 'Hospital' 
		THEN LH.BillingCountry
		ELSE NULL END AS Country,
	CASE WHEN Work_History_Type__c = 'Hospital' 
		THEN LH.Phone
		ELSE WH.Other_Phone__c END AS Phone,
	CASE WHEN Work_History_Type__c = 'Hospital' 
		THEN LH.Fax
		ELSE WH.Other_Fax__c END As Fax,
	NULL As Department,
	Position__c,
	CASE WHEN To__c IS NULL --AND (CEPA_Contracted_Site__c = 'true' OR
						--Galen_Contracted_Site__c = 'true')
		THEN 'yes'
		ELSE 'no' END AS CurrentlyWorking,
	From__c,
	To__c,	
	NULL,
	NULL,
	NULL,
	NULL,
	Comments__c ,
	GETDATE()
	FROM Salesforce...Work_History__c WH
	JOIN ProviderMasterBase PMB 
			ON WH.Contact__c = PMB.SFID
	JOIN Refresh_TempProviderAccount TA ON PMB.ProviderMasterID = TA.ProviderMasterID
	LEFT OUTER JOIN Salesforce...Account LH
					ON LH.Id = WH.Health_Care_Facility__c	
	WHERE Work_History_Type__c IN ('Hospital', 'Other Clinical')
	AND (To__c IS NULL
		OR Year(To__c) >= YEAR(GETDATE()) -10) 
	ORDER BY PMB.ProviderMasterID
	
-- Work History *** Part 2 - Gap in Work History****

TRUNCATE TABLE Refresh_ProviderWorkHistoryGap	

INSERT INTO Refresh_ProviderWorkHistoryGap
	SELECT WH.Name,
	PMB.ProviderMasterID,
	PMB.WebID,
	Contact__c,
	NULL AS HospitalName,
	From__c,
	To__c,	
	Comments__c,
	GETDATE()
	FROM Salesforce...Work_History__c WH
	JOIN ProviderMasterBase PMB 
			ON WH.Contact__c = PMB.SFID
	JOIN Refresh_TempProviderAccount TA ON PMB.ProviderMasterID = TA.ProviderMasterID
	WHERE Work_History_Type__c IN ('Gap in Work History')
	AND (To__c IS NULL
		OR Year(To__c) >= YEAR(GETDATE()) -10)
	ORDER BY PMB.ProviderMasterID


/*Professional Credentials - 
	1. Specialty Certification - Certifications
	2. Specialties - Board Certified
	3. Professional License
*/


--Case 2 - Load certifications like NALS, ATLS, PALS
	TRUNCATE TABLE Refresh_ProviderCertification

	INSERT INTO Refresh_ProviderCertification
	SELECT SC.Name,
		PMB.ProviderMasterID,
		PMB.WebID,
		PMB.SFID,
		CASE WHEN SC.Type__c = 'CA Pharmacology Certificate'
		THEN 'CA'
		ELSE SC.Type__c END AS CertificationType,
		SC.Issue_Date__c,
		SC.Expiration_Date__c,
		NULL,
		GETDATE()	
	FROM Salesforce...Professional_Credentials__c SC
	JOIN ProviderMasterBase PMB 
			ON SC.Contact__c = PMB.SFID
	JOIN Refresh_TempProviderAccount TA ON PMB.ProviderMasterID = TA.ProviderMasterID 
	WHERE SC.Type__c IN ('ACLS', 'ATLS', 'BLS', 'NRP', 'PALS')
	ORDER BY PMB.ProviderMasterID
	


--Case 3 - Board certification

	TRUNCATE TABLE Refresh_ProviderSpecialty
	
	INSERT INTO Refresh_ProviderSpecialty
	SELECT SC.Name,
		PMB.ProviderMasterID,
		PMB.WebID,
		PMB.SFID,
		CASE WHEN SS.Specialty = 'Emergency Medicine' 
			THEN 'primary'
			ELSE 'secondary' END AS SpecialtyType,
		SS.Specialty AS PrimarySpecialty,
		CASE WHEN CB.Name LIKE '%Eligible%' OR CB.Name IS NULL THEN 'False'
			ELSE 'True' END AS BoardCertified,
		SC.Issuer_1__c BoardSFID,
		CB.Name CertifyingBoard,
		SC.Issue_Date__c InitialCertDate,
		SC.Renewed__c ReCertDate,
		Sc.Expiration_Date__c ExpirationDate,
		NULL AS NoCertOption,
		'' AS PendCertBoard,
		NULL As PendCertDt,
		NULL AS FutureExamDt,
		NULL AS DoNotIntendToBoardCert,
		NULL AS Comments1	,
		GETDATE()
	FROM Salesforce...Professional_Credentials__c SC
	JOIN ProviderMasterBase PMB 
			ON SC.Contact__c = PMB.SFID
	JOIN Refresh_TempProviderAccount TA ON PMB.ProviderMasterID = TA.ProviderMasterID
	LEFT OUTER JOIN LookupCertifyingBoard CB
		ON CB.ID = SC.Issuer_1__c
	LEFT OUTER JOIN dbo.SpecialtyBoardMap SS
		ON SS.CertifyingBoard = CB.Name
	WHERE Type__c =  'Board Certification'
	ORDER BY PMB.ProviderMasterID, SS.Specialty
	
	
	
	--In case not emergency medicine then set the primary specialty based on alphabetical order
	
	UPDATE Refresh_ProviderSpecialty
	SET SpecialtyType = 'primary'
	FROM ProviderSpecialty PS1
	WHERE PS1.ProviderMasterID not in (SELECT ProviderMasterID 
										FROM Refresh_ProviderSpecialty
										WHERE Speciality = 'Emergency Medicine')
	AND PS1.Speciality IN (SELECT Top 1 Speciality
							FROM Refresh_ProviderSpecialty PS2
							WHERE PS2.ProviderMasterID = PS1.ProviderMasterID)

--Case 4 -  Insert Licenses
--		a. State License = Medical License

	TRUNCATE TABLE Refresh_ProviderLicenses
	
	INSERT INTO Refresh_ProviderLicenses	
	SELECT SC.Name,
		PMB.ProviderMasterID,
		PMB.WebID,
		Sc.Issuer_1__c,
		'State',
		SC.Cert_Lic_Number__c,
		SC.DEA_State_of_Registration__c,
		SC.Issue_Date__c,
		SC.Expiration_Date__c,
		'' PractINLicState,
		'' LicenseStatus,
		'' ProviderType,
		GETDATE()
	FROM Salesforce...Professional_Credentials__c SC
	JOIN ProviderMasterBase PMB 
			ON SC.Contact__c = PMB.SFID
	JOIN Refresh_TempProviderAccount TA ON PMB.ProviderMasterID = TA.ProviderMasterID
	WHERE Type__c =  'Medical License'
	AND Sc.Issuer_1__c IS NOT NULL




--		b. State CDS License = Medical License
	
	
	INSERT INTO Refresh_ProviderLicenses			
	SELECT SC.Name,
		PMB.ProviderMasterID,
		PMB.WebID,
		Sc.Issuer_1__c,
		'CDS State DEA',
		SC.Cert_Lic_Number__c,
		SC.DEA_State_of_Registration__c,
		SC.Issue_Date__c,
		SC.Expiration_Date__c,
		'' PractINLicState,
		'' LicenseStatus,
		'' ProviderType,
		GETDATE()
	FROM Salesforce...Professional_Credentials__c SC
	JOIN ProviderMasterBase PMB 
			ON SC.Contact__c = PMB.SFID
	JOIN Refresh_TempProviderAccount TA ON PMB.ProviderMasterID = TA.ProviderMasterID
	WHERE Type__c =  'State DEA'
	AND Sc.Issuer_1__c IS NOT NULL
	ORDER BY PMB.ProviderMasterID

--		c. Federal DEA - State not needed

	INSERT INTO Refresh_ProviderLicenses	
	SELECT SC.Name,
		PMB.ProviderMasterID,
		PMB.WebID,
		Sc.Issuer_1__c,
		'Federal DEA',
		SC.Cert_Lic_Number__c,
		SC.DEA_State_of_Registration__c,
		SC.Issue_Date__c,
		SC.Expiration_Date__c,
		'' PractINLicState,
		'' LicenseStatus,
		'' ProviderType,
		GETDATE()
	FROM Salesforce...Professional_Credentials__c SC
	JOIN ProviderMasterBase PMB 
			ON SC.Contact__c = PMB.SFID
	JOIN Refresh_TempProviderAccount TA ON PMB.ProviderMasterID = TA.ProviderMasterID
	WHERE Type__c =  'Federal DEA'
	AND Sc.Issuer_1__c IS NOT NULL
	ORDER BY PMB.ProviderMasterID

		



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

	TRUNCATE TABLE Refresh_ProviderEducation
	
	INSERT INTO Refresh_ProviderEducation
	SELECT SC.Name,
		PMB.ProviderMasterID,
		PMB.WebID,
		PMB.SFID,
		NULL ,
		NULL,
		SC.Institution_1__c,
		LS.Name,
		LS.Sub_Name__c,
		CASE WHEN LS.addr2 IS Not NULL
			THEN LS.Addr1 + ' ' + LS.addr2
			ELSE LS.Addr1 END AS Address,
		NULL,
		LS.City,		
		LS.State__c,
		LS.Zip_Code__c,
		LS.Country,
		LS.Phone__c,
		LS.Fax__c,
		SC.From__c,
		SC.To__c,
		SC.Degree__c,
		CASE WHEN SC.Completed__c = 'true'
			THEN 'y'
			ELSE 'n' END EducationCompleted,
		NULL,
		CASE WHEN SC.ECFMG_Number__c IS NULL 
			THEN 'N'
			ELSE 'Y' END  ECFMG,
		SC.ECFMG_Number__c,	
		SC.ECFMG_Date__c,
		GETDATE()
	FROM Salesforce...Education__c SC
	JOIN ProviderMasterBase PMB 
			ON SC.Contact__c = PMB.SFID
	JOIN Refresh_TempProviderAccount TA ON PMB.ProviderMasterID = TA.ProviderMasterID
	LEFT OUTER JOIN LookupSchools LS
		ON LS.SFID = SC.Institution_1__c
	WHERE SC.Education_Type__c NOT IN ('Internship', 'Residency', 'Fellowship')
		AND SC.Education_Type__c NOT LIKE '%Training%'
	ORDER BY PMB.ProviderMasterID

	UPDATE Refresh_ProviderEducation
	SET EducationType = CASE WHEN SC.Education_Type__c = 'Undergraduate Education' 
				THEN 'Undergraduate'  
				ELSE 'Graduate' END
	FROM Salesforce...Education__c SC
	WHERE SC.Name = Refresh_ProviderEducation.SFDCName


/*Malpractice Carrier 
*/

	TRUNCATE TABLE Refresh_ProviderMalPracCarrier
	
	INSERT INTO Refresh_ProviderMalPracCarrier
	SELECT SC.Name,
		PMB.ProviderMasterID,
		PMB.WebID,
		PMB.SFID,
		SC.Carrier__c,
		MC.Name,
		SC.Policy_Number__c,
		NULL,
		NULL,
		NULL,
		SC.Coverage_Range__c,
		SC.Coverage_Range2__c,
		SC.Enrolled_Date__c,
		SC.Expiration_Date__c,
		NULL,
		NULL,
		GETDATE()
	FROM Salesforce...Malpractice_Carriers__c SC
	JOIN ProviderMasterBase PMB 
			ON SC.Contact__c = PMB.SFID
	JOIN Refresh_TempProviderAccount TA ON PMB.ProviderMasterID = TA.ProviderMasterID
	LEFT OUTER JOIN LookupMalPracticeCarrier MC
		ON MC.Id = SC.Carrier__c
	WHERE (SC.Expiration_Date__c IS NULL
		OR Year(SC.Expiration_Date__c) >= YEAR(GETDATE()) -10)
	ORDER BY PMB.ProviderMasterID
	



--Provider Reference -- NOT NEEDED

--Provider Specialty -- Loaded with Board Certification


--/* Provider Training*/
	
	TRUNCATE TABLE Refresh_ProviderTraining
	
	INSERT INTO Refresh_ProviderTraining
	SELECT SC.Name,
		PMB.ProviderMasterID,
		PMB.WebID,
		PMB.SFID,
		NULL As PostGradTrain,
		SC.Education_Type__c,
		SC.Institution_1__c,
		LS.Name,
		SC.From__c,
		SC.To__c,
		SC.Specialty__c,
		Sc.Director__c,
		GETDATE()
	FROM Salesforce...Education__c SC
	JOIN ProviderMasterBase PMB 
			ON SC.Contact__c = PMB.SFID
	JOIN Refresh_TempProviderAccount TA ON PMB.ProviderMasterID = TA.ProviderMasterID
	LEFT OUTER JOIN LookupSchools LS
		ON Ls.SFID = SC.Institution_1__c
	WHERE (SC.Education_Type__c IN ('Internship', 'Residency', 'Fellowship')
		OR Sc.Education_Type__c LIKE '%Training%')
	ORDER BY PMB.ProviderMasterID

