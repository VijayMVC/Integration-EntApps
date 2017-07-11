
CREATE PROCEDURE [dbo].[usp_UpdateSFDC] 
AS

/* 	Purpose:	Update SFDC with the latest changes from the 
				Provider Master Database
	Revision:	List of Tables:
				ProviderMaster, 	
				Hospital_Region
			2/12/20007 - Antonia Miller - Added routine to 
					make organization name blank in SFDC if 
					Site 1 is blank in MPDB, 
					per Angella Bernal/Jen Munkner
				

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN


	/* Names */
		/* First */
		
	SELECT Prov.ProviderMasterID,
		Prov.FirstName , 
		Con.FirstName AS OtherName,
		Con.ts2__Firstname__c
	INTO #TempFN
	FROM ProviderMaster Prov
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
	  AND (Prov.FirstName  != Con.ts2__Firstname__c
		OR Prov.FirstName != Con.FirstName
		OR Con.ts2__Firstname__c = NULL
		OR Con.FirstName IS NULL)
		
	DELETE FROM #TempFN
	WHERE (FirstName = '' OR FirstName IS NULL)
		AND OtherName IS NULL
		AND ts2__Firstname__c IS NULL

	UPDATE Salesforce...Contact SET
		Cred_Other_First_Name__c = FN.OtherName,
		FirstName  = FN.FirstName,
		ts2__Firstname__c = FN.FirstName
		FROM #TempFN FN
		WHERE FN.ProviderMasterID = Contact.Provider_Master_ID__c
		
	DROP TABLE #TempFN

		/* Middle */
		
	SELECT Prov.ProviderMasterID,
		Prov.MiddleNameOrInitial,
		Con.Middle_Name__c,
		Con.ts2__Middlename__c
	INTO #TempMN
	FROM ProviderMaster Prov
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
  	    AND (Prov.MiddleNameOrInitial != Con.Middle_Name__c 
	  	OR Prov.MiddleNameOrInitial != Con.ts2__Middlename__c
	  	OR Con.Middle_Name__c IS NULL
	  	OR Con.ts2__Middlename__c IS NULL)
	  	
	DELETE FROM #TempMN
	WHERE (MiddleNameOrInitial = '' OR MiddleNameOrInitial IS NULL)
	AND Middle_Name__c IS NULL
	AND ts2__Middlename__c IS NULL
		


	UPDATE Salesforce...Contact SET
		Cred_Other_Middle_Name__c = MN.Middle_Name__c,
		Middle_Name__c = MN.MiddleNameOrInitial,
	  	ts2__Middlename__c = MN.MiddleNameOrInitial
		FROM #TempMN MN
		WHERE MN.ProviderMasterID = Contact.Provider_Master_ID__c

	DROP TABLE #TempMN
	
		/* Last */
		
		
	SELECT Prov.ProviderMasterID,
		Prov.LastName,
		con.LastName AS SFLastName,
		con.ts2__Lastname__c
	INTO #TempLN
	FROM ProviderMaster Prov
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasteRID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
	  AND (Prov.LastName  != Con.ts2__Lastname__c
		OR Prov.LastName != Con.LastName
		OR Con.ts2__Lastname__c IS NULL
		OR Con.LastName IS NULL)
						
	
	
	DELETE FROM #TempLN
	WHERE (LastName = '' OR LastName IS NULL)
		AND SFLastName IS NULL
		AND ts2__Lastname__c IS NULL
	
		
	UPDATE Salesforce...Contact SET
		Cred_Other_Last_Name__c = LN.SFLastName,
		LastName  = LN.LastName,
		ts2__Lastname__c = Ln.LastName
	FROM #TempLN LN
	WHERE LN.ProviderMasterID = Contact.Provider_Master_ID__c
	
	DROP TABLE #TempLN
		
	/* Email Address */
	
	SELECT Prov.SFID,
		Prov.CEPEmailAddress AS CEPEmailAddress, 
			Con.Email
	INTO #TempEM
	FROM ProviderMaster Prov 
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		 ON Prov.SFID = Con.Id
  	WHERE Prov.CurrentProviderFlag = 'Y'
   		AND (Prov.CEPEmailAddress != Con.Email	
   			OR Con.Email IS NULL)
   	

   			
   	DELETE FROM #TempEM 
   	WHERE (CEPEmailAddress = '' OR CEPEmailAddress IS NULL)
   	AND Email IS NULL
	
		
	UPDATE Salesforce...Contact SET
	Contact.Secondary_Email__c = CASE WHEN (Contact.Email LIKE '%@cep.com%'
								or Contact.Email LIKE '%@galen.com%')
							  THEN Contact.Secondary_Email__c
							  ELSE Contact.Email END,
	Contact.Email = EM.CEPEmailAddress		
	FROM #TempEM EM
	WHERE EM.SFID = Contact.Id

	DROP TABLE #TempEM

	/* Title -- only 7 characters*/
	
	SELECT Prov.ProviderMasterID,
		CASE WHEN CHARINDEX(',', LTRIM(RTRIM(Prov.Title))) <> 0
			THEN Left(LTRIM(RTRIM(Prov.Title)), CHARINDEX(',', LTRIM(RTRIM(Prov.Title))) - 1)
			ELSE LTRIM(RTRIM(Prov.Title)) END AS Title,
			Con.Title__c
	INTO #TempTM
	FROM ProviderMaster Prov
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasteRID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
 	 AND (CASE WHEN CHARINDEX(',', LTRIM(RTRIM(Prov.Title))) <> 0
			THEN Left(LTRIM(RTRIM(Prov.Title)), CHARINDEX(',', LTRIM(RTRIM(Prov.Title))) - 1)
			ELSE LTRIM(RTRIM(Prov.Title)) END != Con.Title__c
		OR Con.Title__c IS NULL)
		
		
	DELETE FROM #TempTM
	WHERE (Title IS NULL OR Title = '')
	AND Title__c IS NULL
	
	UPDATE Salesforce...Contact
		SET Title__c = CASE WHEN TM.Title = ''
						THEN NULL
						ELSE TM.Title END 
	FROM #TempTM TM
	WHERE TM.ProviderMasterID = Contact.Provider_Master_ID__c
	
	DROP TABLE #TempTM	



	/* SpouseName */
	
	SELECT Prov.ProviderMasterID,
		Prov.SpouseName, Cred_Spouse_Name__c
		--Prov.MaritalStatus, Cred_Marital_Status__c
	INTO #TempSP
	FROM ProviderMaster Prov
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasteRID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
  	  AND (Prov.SpouseName != Con.Cred_Spouse_Name__c	
  			OR  Con.Cred_Spouse_Name__c IS NULL)
  			
   	
  	DELETE FROM #TempSP 
  	WHERE (SpouseName IS NULL or SpouseName = '')
  		AND Cred_Spouse_Name__c IS NULL	
  		
  	UPDATE Salesforce...Contact SET 
		Cred_Spouse_Name__c	= SP.SpouseName 
	FROM #TempSP SP
	WHERE SP.ProviderMasterID = Contact.Provider_Master_ID__c	
  	
  	
  	DROP TABLE #TempSP	
  	
  	
  	/* Marital Status*/
  	
  	SELECT Prov.ProviderMasterID,
		Prov.MaritalStatus, Cred_Marital_Status__c
	INTO #TempMSS
	FROM ProviderMaster Prov
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasteRID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y' 
  		AND (Prov.MaritalStatus != con.Cred_Marital_Status__c
			OR con.Cred_Marital_Status__c IS NULL)
		
					
	DELETE FROM #TempMSS 
  	WHERE (MaritalStatus IS NULL or MaritalStatus = '')
  		AND Cred_Marital_Status__c IS NULL	
	
	UPDATE Salesforce...Contact SET 
		Cred_Marital_Status__c = MS.MaritalStatus
	FROM #TempMSS MS
	WHERE MS.ProviderMasterID = Contact.Provider_Master_ID__c
	
	
	DROP TABLE #TempMSS
		

	/* Cell Phones */
	
	SELECT Prov.ProviderMasterID,
		SUBSTRING(Prov.CellPhoneNbr,1,14) AS CellPhone,
		MobilePhone
	INTO #TempCP
	FROM AppStaging.dbo.SFDCContactStaging Con
	INNER JOIN ProviderMaster Prov
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
	  AND (Con.MobilePhone != SUBSTRING(Prov.CellPhoneNbr,1,14)
			OR Con.MobilePhone IS NULL)
			
	DELETE FROM #TempCP 
  	WHERE (CellPhone IS NULL or CellPhone = '')
  		AND MobilePhone IS NULL
  		

	UPDATE Salesforce...Contact 
	SET MobilePhone = CP.CellPhone
	FROM #TempCP CP
	WHERE CP.ProviderMasterID = Contact.Provider_Master_ID__c
	
	DROP TABLE #TempCP
		
	/* Phone */
	
	SELECT Prov.ProviderMasterID,
		SUBSTRING(Prov.PhoneNbr1,1,14) As Phone,
		Con.Phone AS PhoneSF, con.HomePhone
	INTO #TempPh
	FROM ProviderMasterBase Prov
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.[Status] = 0
	  AND (SUBSTRING(Prov.PhoneNbr1,1,14) != Con.Phone
			OR SUBSTRING(Prov.PhoneNbr1,1,14) != Con.HomePhone
			OR Con.Phone IS NULL
			OR Con.HomePhone IS NULL)
			

	DELETE FROM #TempPh 
  	WHERE (Phone IS NULL or Phone = '')
  		AND PhoneSF IS NULL
  		AND HomePhone IS NULL
					
	
	UPDATE Salesforce...Contact
		SET Phone = Ph.Phone,
		HomePhone = Ph.Phone
	FROM #TempPh Ph
	WHERE Ph.ProviderMasterID = Contact.Provider_Master_ID__c

	DROP TABLE #TempPh

	/* Fax */
	
	SELECT Prov.ProviderMasterID,
		SUBSTRING(Prov.FaxNbr1,1,14) AS Fax, con.Fax AS FaxSF
	INTO #TempFax
	FROM ProviderMasterBase Prov
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		 ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.[Status] = 0
	  AND (SUBSTRING(Prov.FaxNbr1,1,14) != Con.Fax)

	
	DELETE FROM #TempFax 
  	WHERE (Fax IS NULL or Fax = '')
  		AND FaxSF IS NULL
	
	
	UPDATE Salesforce...Contact
		SET Fax = FX.Fax
	FROM #TempFax FX
	WHERE FX.ProviderMasterID = Contact.Provider_Master_ID__c
		
	DROP TABLE #TempFax

	/* Address - Mailing Street */
	
	
	SELECT Prov.ProviderMasterID,
		AddS.Address1 Addr,
		MailingStreet
	INTO #TempMailStr
	FROM ProviderMaster Prov			
	INNER JOIN ProviderMasterBase AddS
		 ON Prov.ProviderMasterID = AddS.ProviderMasterID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		 ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE Prov.CurrentProviderFlag = 'Y'
	  AND LTRIM(RTRIM(AddS.AddressType1)) IN ('Home', 'Mailing')
	  AND AddS.AddressForPayrollFlag1 = 'Yes'
	  AND (RTRIM(LTRIM(MailingStreet)) != LTRIM(RTRIM(AddS.Address1))		 										
		 OR MailingStreet IS NULL)
	
	
	DELETE FROM #TempMailStr 
	WHERE (Addr = '' OR Addr IS NULL)
	AND MailingStreet IS NULL
	
	
		
	UPDATE Salesforce...Contact
	SET MailingStreet = TA.Addr		
	FROM #TempMailStr TA
	WHERE TA.ProviderMasterID = Contact.Provider_Master_ID__c
	
	DROP TABLE #TempMailStr
	
	
	/* Address - Mailing City */
	
	SELECT Prov.ProviderMasterID,
		RTRIM(LTRIM(SUBSTRING(AddS.City1,1,20))) AS City, 
		MailingCity
	INTO #TempMailCity
	FROM ProviderMaster Prov			
	INNER JOIN ProviderMasterBase AddS
		 ON Prov.ProviderMasterID = AddS.ProviderMasterID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		 ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE CurrentProviderFlag = 'Y'
	  AND (RTRIM(LTRIM(SUBSTRING(MailingCity,1,20)))!= RTRIM(LTRIM(AddS.City1))
			OR MailingCity IS NULL)
	  AND LTRIM(RTRIM(AddS.AddressType1)) IN ('Home', 'Mailing')
	  AND AddS.AddressForPayrollFlag1 = 'Yes'
	  			
	
	DELETE FROM #TempMailCity 
	WHERE (City = '' OR City IS NULL)
	AND MailingCity IS NULL

	
	UPDATE Salesforce...Contact
	SET MailingCity   = TA.City		
	FROM #TempMailCity TA
	WHERE TA.ProviderMasterID = Contact.Provider_Master_ID__c
	
	DROP TABLE #TempMailCity
	
	
	
	/* Address - Mailing State */
	
	SELECT Prov.ProviderMasterID,
		AddS.State1, MailingState
	INTO #TempMailState
	FROM ProviderMaster Prov			
	INNER JOIN ProviderMasterBase AddS
		 ON Prov.ProviderMasterID = AddS.ProviderMasterID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		 ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE CurrentProviderFlag = 'Y'
	  AND (RTRIM(LTRIM(MailingState)) != RTRIM(LTRIM(AddS.State1))
			OR MailingState IS NULL)
	  AND LTRIM(RTRIM(AddS.AddressType1)) IN ('Home', 'Mailing')
	  AND AddS.AddressForPayrollFlag1 = 'Yes'
	  			
	
	DELETE FROM #TempMailState 
	WHERE (State1 = '' OR State1 IS NULL)
	AND MailingState IS NULL
	
	
	UPDATE Salesforce...Contact
	SET MailingState   = TA.State1		
	FROM #TempMailState TA
	WHERE TA.ProviderMasterID = Contact.Provider_Master_ID__c
	
	DROP TABLE #TempMailState
	
	
	/* Address - Postal code */
	
	SELECT Prov.ProviderMasterID,
		LTRIM(RTRIM(Left(AddS.ZipCode1,5))) AS Zip, 
		MailingPostalCode
	INTO #TempPCode
	FROM ProviderMaster Prov			
	INNER JOIN ProviderMasterBase AddS
		 ON Prov.ProviderMasterID = AddS.ProviderMasterID
	INNER JOIN AppStaging.dbo.SFDCContactStaging Con
		 ON Prov.ProviderMasterID = Con.Provider_Master_ID__c
	WHERE CurrentProviderFlag = 'Y'
	  AND (RTRIM(LTRIM(MailingPostalCode)) != LTRIM(RTRIM(Left(AddS.ZipCode1,5)))
	  		OR MailingPostalCode IS NULL)
	  AND LTRIM(RTRIM(AddS.AddressType1)) IN ('Home', 'Mailing')
	  AND AddS.AddressForPayrollFlag1 = 'Yes'
	  			
	
	DELETE FROM #TempPCode 
	WHERE (Zip = '' OR Zip IS NULL)
	AND MailingPostalCode IS NULL
	
	
	UPDATE Salesforce...Contact
	SET MailingPostalCode = TA.Zip	
	FROM #TempPCode TA
	WHERE TA.ProviderMasterID = Contact.Provider_Master_ID__c
	
	DROP TABLE #TempPCode
		
	



END






