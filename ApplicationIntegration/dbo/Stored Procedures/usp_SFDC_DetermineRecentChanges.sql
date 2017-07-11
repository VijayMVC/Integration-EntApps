
CREATE PROCEDURE [dbo].[usp_SFDC_DetermineRecentChanges] 
AS

/* 	Author: 	Reetika
	Date:		4/30/2012
	Purpose:	Determine Recent SFDC Changes to be Sent Back to 
				Credentialing.
				These changes will need to be made in MPDB portal on web.
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	/* Archive the Changes */
	INSERT INTO SFDCCurrentChangesArchive
	SELECT * 
		FROM SFDCCurrentChanges CC
		WHERE SentFlag = 'Y' 
		AND NOT EXISTS (SELECT 1
					FROM SFDCCurrentChangesArchive AS CA
					WHERE CA.SFID = CC.SFID
						AND CA.LastModifiedDate = CC.LastModifiedDate
						AND CA.LastModifiedbyId = CC.LastModifiedbyId)

	DELETE FROM SFDCCurrentChanges
	WHERE SentFlag = 'Y'


	INSERT INTO SFDCCurrentChanges 
	SELECT PMB.LastName AS PMBLastName,
		PMB.FirstName AS PMBFirstName,
		PMB.SFID,
		U.Name AS LastModifiedBy,	
		CH.CreatedDate,
		CH.Field As FieldModified,
		CH.NewValue AS SFDCValue,
		CH.OldValue AS PMDBValue,
		NULL AS PMBSite1,
		NULL AS SFDCSite1,
		NULL AS PMBSite2,
		NULL AS SFDCSite2,
		NULL AS PMBSite3,
		NULL AS SFDCSite3,
		NULL AS PMBSite4,
		NULL AS SFDCSite4,
		'N' AS Change,
		'N' AS SentFlag,
		NULL AS SentDate,
		CH.CreatedById
	FROM ProviderMasterBase AS PMB 
	JOIN SalesForce...ContactHistory CH
		ON CH.ContactId = PMB.SFID
	JOIN SalesForce...[User] U
		ON CH.CreatedById = U.Id
	WHERE CH.CreatedDate > '6/24/2012'
						--(SELECT MAX(LastModifiedDate)
						--	FROM dbo.SFDCCurrentChangesArchive)
	AND CH.Field IN ( 'Cred_Spouse_Name__c',
						'Email',
						'Fax',
						'Title__c',
						'FirstName',
						'LastName',
						'MailingStreet',
						'MailingCity',
						'MailingState',
						'MailingPostalCode',
						'Middle_Name__c',
						'MobilePhone',
						'HomePhone',
						'OtherCity',
						'OtherPhone',
						'OtherPostalCode',
						'OtherState',
						'OtherStreet',
						'Phone',
						'ts2__Firstname__c',
						'ts2__Lastname__c',
						'ts2__Middlename__c',
						'Cred_marital_status__c')
    AND NOT EXISTS (SELECT 1
				FROM SFDCCurrentChangesArchive AS CC
				WHERE CC.SFID = PMB.SFID
					AND CC.LastModifiedDate = CH.CreatedDate
					AND CC.LastModifiedByID = CH.CreatedById)
	AND CH.CreatedById <> '005G0000002CAdBIAW'
	
/*The code below marks the real changes where values are different between SFDC and PMB
*/



	/* First Name */
	UPDATE SFDCCurrentChanges
	SET Change = 'Y' 
	FROM ProviderMaster Prov
	INNER JOIN SFDCCurrentChanges CC
		ON CC.SFID = Prov.SFID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
	  AND (Prov.FirstName  != Con.ts2__Firstname__c
		OR Prov.FirstName != Con.FirstName)
	  AND CC.FieldModified IN ( 'FirstName', 'ts2__Firstname__c')

		/* Middle Name */
	
	
	UPDATE SFDCCurrentChanges
	SET Change = 'Y'	
	FROM ProviderMaster Prov
	INNER JOIN SFDCCurrentChanges CC
		ON CC.SFID = Prov.SFID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
  	    AND (Prov.MiddleNameOrInitial != Con.Middle_Name__c 
	  	OR Prov.MiddleNameOrInitial != Con.ts2__Middlename__c)
		AND CC.FieldModified IN ('Middle_Name__c', 'ts2__Middlename__c')
	
	/* Last Name */
	UPDATE SFDCCurrentChanges
	SET Change = 'Y'	
	FROM ProviderMaster Prov
	INNER JOIN SFDCCurrentChanges CC
		ON CC.SFID = Prov.SFID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
	  AND (Prov.LastName  != Con.ts2__Lastname__c
		AND Prov.LastName != Con.LastName)
		AND CC.FieldModified IN ( 'ts2__Lastname__c', 'LastName')
	
	/* Email */
	UPDATE SFDCCurrentChanges
	SET Change = 'Y'	
	FROM ProviderMaster Prov
	INNER JOIN SFDCCurrentChanges CC
		ON CC.SFID = Prov.SFID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
		AND Prov.CEPEmailAddress != Con.Email
		AND CC.FieldModified = 'Email'
		

	/*Title */
	UPDATE SFDCCurrentChanges
	SET Change = 'Y'	
	FROM ProviderMaster Prov
	INNER JOIN SFDCCurrentChanges CC
		ON CC.SFID = Prov.SFID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
		AND (CASE WHEN CHARINDEX(',', LTRIM(RTRIM(Prov.Title))) <> 0
			THEN Left(LTRIM(RTRIM(Prov.Title)), CHARINDEX(',', LTRIM(RTRIM(Prov.Title))) - 1)
			ELSE LTRIM(RTRIM(Prov.Title)) END != Con.Title__c)
		AND CC.FieldModified = 'Title__c'

	/*Marital */
	UPDATE SFDCCurrentChanges
	SET Change = 'Y'	
	FROM ProviderMaster Prov
	INNER JOIN SFDCCurrentChanges CC
		ON CC.SFID = Prov.SFID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
		AND Prov.MaritalStatus != con.Cred_Marital_Status__c
		AND CC.FieldModified = 'Cred_Marital_Status__c'
		
	/*Spouse */
	UPDATE SFDCCurrentChanges
	SET Change = 'Y'	
	FROM ProviderMaster Prov
	INNER JOIN SFDCCurrentChanges CC
		ON CC.SFID = Prov.SFID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
		AND Prov.SpouseName != Con.Cred_Spouse_Name__c
		AND CC.FieldModified = 'Cred_Spouse_Name__c' 

	/*Cell */
	UPDATE SFDCCurrentChanges
	SET Change = 'Y'	
	FROM ProviderMaster Prov
	INNER JOIN SFDCCurrentChanges CC
		ON CC.SFID = Prov.SFID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
		AND Con.MobilePhone != SUBSTRING(Prov.CellPhoneNbr,1,14)
		AND CC.FieldModified = 'MobilePhone'

	/*Phone */
	UPDATE SFDCCurrentChanges
	SET Change = 'Y'	
	FROM ProviderMasterBase Prov
	INNER JOIN SFDCCurrentChanges CC
		ON CC.SFID = Prov.SFID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.Status = 0
		AND (SUBSTRING(Prov.PhoneNbr1,1,14) != Con.Phone
			OR SUBSTRING(Prov.PhoneNbr1,1,14) != Con.HomePhone)
		AND CC.FieldModified IN ('Phone','HomePhone')
			
	/*Fax */
	UPDATE SFDCCurrentChanges
	SET Change = 'Y'	
	FROM ProviderMasterBase Prov
	INNER JOIN SFDCCurrentChanges CC
		ON CC.SFID = Prov.SFID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.Status = 0
		 AND (SUBSTRING(Prov.FaxNbr1,1,14) != Con.Fax)
		 AND CC.FieldModified = 'Fax'
		 
	/*Address */
	UPDATE SFDCCurrentChanges
	SET Change = 'Y'	
	FROM ProviderMaster Prov
	INNER JOIN SFDCCurrentChanges CC
		ON CC.SFID = Prov.SFID
	INNER JOIN AddressStaging AddS
		 ON Prov.ProviderMasterID = AddS.ProviderMasterID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
		AND (RTRIM(LTRIM(MailingStreet)) != CASE WHEN Adds.AddressLine2 IS NOT NULL 
												THEN RTRIM(LTRIM(AddS.AddressLine1)) + ' ' 
		 													+ RTRIM(LTRIM(Adds.AddressLine2))
		 										ELSE RTRIM(LTRIM(AddS.AddressLine1)) END
		OR 	 RTRIM(LTRIM(SUBSTRING(MailingCity,1,20)))!= RTRIM(LTRIM(AddS.City))
		OR	 RTRIM(LTRIM(MailingState)) != RTRIM(LTRIM(AddS.State))
		OR 	 RTRIM(LTRIM(MailingPostalCode)) != LTRIM(RTRIM(Left(AddS.Zip,5))))
		  AND AddS.Type = 'Home'
		  AND AddS.AddressForPayrollFlag = 'Y'
		AND CC.FieldModified IN ('MailingCity', 'MailingPostalCode', 'MailingStreet', 'MailingState')  			
	

	/*Get site Names from Web */
	UPDATE SFDCCurrentChanges
		SET PMBSite1 = PMB.Site1,
		PMBSite2 = PMB.Site2,
		PMBSite3 = PMB.Site3,
		PMBSite4 = PMB.Site4
	FROM ProviderMasterBase PMB
	WHERE SFDCCurrentChanges.SFID = PMB.SFID
	
	
	
	DELETE FROM SFDCCurrentChanges
	WHERE CHANGE = 'N'

	--SELECT * FROM SFDCCurrentChanges
	
END

