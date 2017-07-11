
CREATE PROCEDURE [dbo].[usp_CompareProviderMasterUpdateToBase_New] 
AS

/* 	Author: 	Reetika
	Date:		4/30/2012
	Purpose:	Standardize ProviderMasterUpdate
				table to ProviderMasterBase
	Revision:	Accommodated for Multiple Clients
				Added Logic for Email Addresses Changing From MailBox
							to Personal or Vice Versa.
				As 4/1/2011 SEMA is part of CEP

*/


SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN


	UPDATE ProviderMasterUpdateArchive SET
		InternalUpdateFlag = 'Y',
		SentValueChanged = CASE  
			WHEN (PMUA.PreferredNameOld 	!= ' ' 
			  OR  PMUA.TitleOld 		!= ' ' 
			  OR 	(PMUA.EmailAddressOld 	!= ' '
					AND NOT 	(	  (PMUA.EmailAddressOld = 'No Email'	 
								OR PMUA.EmailAddressOld LIKE '%CEP.COM%')
							 AND    (PMUA.EmailAddress = 'No Email'	 
								OR PMUA.EmailAddress LIKE '%CEP.COM%')
							)
				)
			  OR  PMUA.CellPhoneNbrOld  	!= ' ' 
			  OR  PMUA.PagerNbrOld 	!= ' ' 
			  OR  PMUA.Address1Old 	!= ' '
			  OR  PMUA.Address2Old 	!= ' ' 
			  OR  PMUA.City1Old 	!= ' ' 
			  OR  PMUA.City2Old 	!= ' ' 
			  OR  PMUA.State1Old 	!= ' ' 
			  OR  PMUA.State2Old 	!= ' ' 
			  OR  PMUA.ZipCode1Old 	!= ' '
			  OR  PMUA.ZipCode2Old 	!= ' ' 
			  OR  PMUA.PhoneNbr1Old != ' ' 
			  OR  PMUA.PhoneNbr2Old != ' ')
			  THEN 'Y' ELSE 'N' END,		
		TaxIDIncorporatedOld = 	 	CASE  
			WHEN PMUA.TaxIDIncorporated = PMB.TaxIDIncorporated 	THEN ' '
			WHEN PMB.TaxIDIncorporated = ' ' 			THEN 'None'
			ELSE PMB.TaxIDIncorporated 				END,
		TaxIDIncorporated = 	 	CASE 
			WHEN PMUA.TaxIDIncorporated = ' ' AND PMB.TaxIDIncorporated != ' ' 	
										THEN 'No Tax ID'
			ELSE PMUA.TaxIDIncorporated 				END,
		LastNameOld = 		 	CASE  
			WHEN PMUA.LastName = PMB.LastName 			THEN ' '
			WHEN PMB.LastName = ' ' 				THEN 'None'
			ELSE PMB.LastName 					END,	
		LastName = 		 	CASE
			WHEN PMUA.LastName = ' ' AND PMB.LastName != ' ' 	THEN 'No Last Name'
			ELSE PMUA.LastName 					END,
		FirstNameOld = 		 	CASE  
			WHEN PMUA.FirstName = PMB.FirstName			THEN ' '
			WHEN PMB.FirstName = ' ' 				THEN 'None'
			ELSE PMB.FirstName 					END,
		FirstName = 		 	CASE 
			WHEN PMUA.FirstName = ' ' AND PMB.FirstName != ' ' 	THEN 'No First Name'
			ELSE PMUA.FirstName 					END,
		MiddleNameOrInitialOld = 	CASE  
			WHEN PMUA.MiddleNameOrInitial = PMB.MiddleNameOrInitial 
										THEN ' '
			WHEN PMB.MiddleNameOrInitial = ' ' 			THEN 'None'
			ELSE PMB.MiddleNameOrInitial 				END,
		MiddleNameOrInitial = 		CASE  
			WHEN PMUA.MiddleNameOrInitial = ' ' AND PMB.MiddleNameOrInitial != ' ' THEN 'No Middle Name'
			ELSE PMUA.MiddleNameOrInitial 				END,
		PreferredNameOld = 		CASE  
			WHEN PMUA.PreferredName = PMB.PreferredName		THEN ' '
			WHEN PMB.PreferredName = ' ' 				THEN 'No Preferred Name'
			ELSE PMB.PreferredName 					END,
		PreferredName = 		CASE  
			WHEN PMUA.PreferredName = ' ' 
			 AND PMB.PreferredName != ' ' 				THEN 'No Preferred Name'
			ELSE PMUA.PreferredName 				END,
		IncorporatedNameOld = 		CASE  
			WHEN PMUA.IncorporatedName = PMB.IncorporatedName 	THEN ' '
			WHEN PMB.IncorporatedName = ' ' 			THEN 'No Incorporated Name'
			ELSE PMB.IncorporatedName 				END,
		IncorporatedName = 		CASE  
			WHEN PMUA.IncorporatedName = ' ' 
			 AND PMB.IncorporatedName != ' ' 			THEN 'No Incorporated Name'
			ELSE PMUA.IncorporatedName 				END,
		TitleOld = 			CASE  
			WHEN PMUA.Title = PMB.Title 				THEN ' '
			WHEN PMB.Title = ' ' 					THEN 'No Title'
			ELSE PMB.Title 						END,
		Title = 			CASE  
			WHEN PMUA.Title = ' ' 
			 AND PMB.Title != ' ' 					THEN 'No Title'
			ELSE PMUA.Title 					END,
		MaritalStatusOld = 		CASE  
			WHEN PMUA.MaritalStatus = PMB.MaritalStatus 		THEN ' '
			WHEN PMB.MaritalStatus = ' ' 				THEN 'No Marital Status'
			ELSE PMB.MaritalStatus 					END,
		MaritalStatus = 		CASE  
			WHEN PMUA.MaritalStatus = ' ' 
			 AND PMB.MaritalStatus != ' ' 				THEN 'No Marital Status'
			ELSE PMUA.MaritalStatus 				END,
		SpouseNameOld = 		CASE  
			WHEN PMUA.SpouseName = PMB.SpouseName 			THEN ' '
			WHEN PMB.SpouseName = ' ' 				THEN 'No Spouse Name'
			ELSE PMB.SpouseName 					END,
		SpouseName = 			CASE  
			WHEN PMUA.SpouseName = ' ' 
			 AND PMB.SpouseName != ' ' 				THEN 'No Spouse Name'
			ELSE PMUA.SpouseName 					END,
		CEPEmailOld = 			CASE  
			WHEN PMUA.CEPEmail = PMB.CEPEmail 			THEN ' '
			WHEN PMB.CEPEmail = ' ' 				THEN 'No CEP Email'
			ELSE PMB.CEPEmail 					END,
		CEPEmail = 			CASE  
			WHEN PMUA.CEPEmail = ' ' 
			 AND PMB.CEPEmail != ' ' 				THEN 'No CEP Email'
			ELSE PMUA.CEPEmail 					END,
		CellPhoneNbrOld = 		CASE  
			WHEN PMUA.CellPhoneNbr = PMB.CellPhoneNbr 		THEN  ' '
			WHEN PMB.CellPhoneNbr = ' ' 				THEN 'No Cell Phone'
			ELSE PMB.CellPhoneNbr 					END,
		CellPhoneNbr = 			CASE  
			WHEN PMUA.CellPhoneNbr = ' ' 
			 AND PMB.CellPhoneNbr != ' ' 				THEN 'No Cell Phone'
			ELSE PMUA.CellPhoneNbr 					END,
		Address1Old = 			CASE 
			WHEN PMUA.Address1 = PMB.Address1 			THEN ' '
			WHEN PMB.Address1 = ' ' 				THEN 'No Address 1'
			ELSE PMB.Address1 					END,
		Address1 = 			CASE  
			WHEN PMUA.Address1 = ' ' 
			 AND PMB.Address1 != ' ' 				THEN 'No Address 1'
			ELSE PMUA.Address1 					END,
		City1Old = 			CASE  
			WHEN PMUA.City1 = PMB.City1 				THEN ' '
			WHEN PMB.City1 = ' ' 					THEN 'No City 1'
			ELSE PMB.City1						END,
		City1 = 			CASE  
			WHEN PMUA.City1 = ' ' 
			 AND PMB.City1 != ' ' 					THEN 'No City 1'
			ELSE PMUA.City1 					END,
		State1Old = 			CASE  
			WHEN PMUA.State1 = PMB.State1 				THEN ' '
			WHEN PMB.State1 = ' ' 					THEN 'No State 1'
			ELSE PMB.State1 					END,
		State1 = 			CASE  
			WHEN PMUA.State1 = ' ' 
			 AND PMB.State1 != ' ' 					THEN 'No State 1'
			ELSE PMUA.State1 					END,
		ZipCode1Old = 			CASE  
			WHEN PMUA.ZipCode1 = PMB.ZipCode1 			THEN ' '
			WHEN PMB.ZipCode1 = ' ' 				THEN 'No ZipCode 1'
			ELSE PMB.ZipCode1 					END,
		ZipCode1 = 			CASE  
			WHEN PMUA.ZipCode1 = ' ' 
			 AND PMB.ZipCode1 != ' ' 				THEN 'No ZipCode 1'
			ELSE PMUA.ZipCode1 					END,
		PhoneNbr1Old = 			CASE  
			WHEN PMUA.PhoneNbr1 = PMB.PhoneNbr1 			THEN ' '
			WHEN PMB.PhoneNbr1 = ' ' 				THEN 'No Phone 1'
			ELSE PMB.PhoneNbr1 					END,
		PhoneNbr1 = 			CASE  
			WHEN PMUA.PhoneNbr1 = ' ' 
			 AND PMB.PhoneNbr1 != ' ' 				THEN 'No Phone 1'
			ELSE PMUA.PhoneNbr1 					END,
		Address2Old = 			CASE  
			WHEN PMUA.Address2 = PMB.Address2 			THEN ' '
			WHEN PMB.Address2 = ' ' 				THEN 'No Address 2'
			ELSE PMB.Address2 					END,
		Address2 = 			CASE  
			WHEN PMUA.Address2 = ' ' 
			 AND PMB.Address2 != ' ' 				THEN 'No Address 2'
			ELSE PMUA.Address2 					END,
		City2Old = 			CASE  
			WHEN PMUA.City2 = PMB.City2 				THEN ' '
			WHEN PMB.City2 = ' ' 					THEN 'No City 2'
			ELSE PMB.City2 						END,
		City2 = 			CASE  
			WHEN PMUA.City2 = ' ' 
			 AND PMB.City2 != ' ' 					THEN 'No City 2'
			ELSE PMUA.City2 					END,
		State2Old = 			CASE  
			WHEN PMUA.State2 = PMB.State2 				THEN ' '
			WHEN PMB.State2 = ' ' 					THEN 'No State 2'
			ELSE PMB.State2 					END,
		State2 = 			CASE  
			WHEN PMUA.State2 = ' ' 
			 AND PMB.State2 != ' ' 					THEN 'No State 2'
			ELSE PMUA.State2 					END,
		ZipCode2Old = 			CASE  
			WHEN PMUA.ZipCode2 = PMB.ZipCode2 			THEN ' '
			WHEN PMB.ZipCode2 = ' ' 				THEN 'No ZipCode 2'
			ELSE PMB.ZipCode2 					END,
		ZipCode2 = 			CASE  
			WHEN PMUA.ZipCode2 = ' ' 
			 AND PMB.ZipCode2 != ' ' 				THEN 'No ZipCode 2'
			ELSE PMUA.ZipCode2 					END,
		PhoneNbr2Old = 			CASE  
			WHEN PMUA.PhoneNbr2 = PMB.PhoneNbr2 			THEN ' '
			WHEN PMB.PhoneNbr2 = ' ' 				THEN 'No Phone 2'
			ELSE PMB.PhoneNbr2					END,
		PhoneNbr2 = 			CASE  
			WHEN PMUA.PhoneNbr2 = ' ' 
			 AND PMB.PhoneNbr2 != ' ' 				THEN 'No Phone 2'
			ELSE PMUA.PhoneNbr2 					END
		FROM ProviderMasterUpdateArchive 	PMUA
		INNER JOIN ProviderMasterBase 		PMB
			ON PMUA.providerMasterID = PMB.ProviderMasterID
		INNER JOIN ProviderMaster 		Prov
			ON PMUA.ProviderMasterID = Prov.ProviderMasterID
		WHERE PMUA.InternalUpdateFlag IS NULL



	


		/* Separated Staff */
	UPDATE ProviderMaster 
	SET ExchangeDirectoryName   = NULL,
		ExchangeDirectoryName2  = NULL,
		ExchangeContainer 	= NULL,
		ExchangeContainer2	= NULL
	WHERE CurrentProviderFlag = 'N'


	/* Match Emails */
	EXECUTE usp_LoadExchangeInfo
	
	
	UPDATE ProviderMasterUpdateArchive SET
		InternalUpdateFlag = 'Y',
		SentValueChanged = 'Y'
	WHERE ProviderMasterID IN (SELECT DISTINCT ProviderMasterID 
								FROM SiteUpdateLog)
		AND ProviderMasterUpdateArchive.InternalUpdateFlag IS NULL	
		
		
		
		
		
		
END

