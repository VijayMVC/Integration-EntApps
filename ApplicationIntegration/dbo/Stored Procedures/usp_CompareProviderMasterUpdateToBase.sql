
CREATE PROCEDURE [dbo].[usp_CompareProviderMasterUpdateToBase] 
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
			WHEN (PMUA.Site1Old 		!= ' ' 
			  OR  PMUA.Site2Old 		!= ' ' 
			  OR  PMUA.Site3Old 		!= ' ' 
			  OR  PMUA.Site4Old 		!= ' '
			  OR  PMUA.PreferredNameOld 	!= ' ' 
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
		EmailAddressOld = 		CASE  
			WHEN PMUA.EmailAddress = PMB.EmailAddress 		THEN ' '
			WHEN PMB.EmailAddress = ' ' AND PMUA.EmailAddress LIKE '%CEP.COM%'
	 				THEN ' '
			WHEN PMB.EmailAddress LIKE '%CEP.COM%' AND PMUA.EmailAddress = ' '
	 				THEN ' '
			WHEN PMB.EmailAddress = ' ' THEN 'No Email'
			ELSE PMB.EmailAddress 					END,
		EmailAddress = 			CASE  
			WHEN PMUA.EmailAddress = ' ' 
			 AND PMB.EmailAddress != ' ' 
		    	 AND PMB.EmailAddress NOT LIKE '%CEP.COM%'		THEN 'No Email'
			ELSE PMUA.EmailAddress 					END,
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
		PagerNbrOld = 			CASE  
			WHEN PMUA.PagerNbr = PMB.PagerNbr 			THEN ' '
			WHEN PMB.PagerNbr = ' ' 				THEN 'No Pager'
			ELSE PMB.PagerNbr 					END,
		PagerNbr = 			CASE  
			WHEN PMUA.PagerNbr = ' ' 
			 AND PMB.PagerNbr != ' ' 				THEN 'No Pager'
			ELSE PMUA.PagerNbr 					END,
		AddressType1Old = 		CASE  
			WHEN PMUA.AddressType1 = PMB.AddressType1 		THEN ' '
			WHEN PMB.AddressType1 = ' ' 				THEN 'No Address Type1'
			ELSE PMB.AddressType1 					END,
		AddressForPayrollFlag1Old = 	CASE  
			WHEN PMUA.AddressForPayrollFlag1 = PMB.AddressForPayrollFlag1 
										THEN ' '
			WHEN PMB.AddressForPayrollFlag1 = ' ' 			THEN 'Z'
			ELSE PMB.AddressForPayrollFlag1 			END,
		AddressForNonPayrollFlag1Old = 	CASE  
			WHEN PMUA.AddressForNonPayrollFlag1 = PMB.AddressForNonPayrollFlag1
										THEN ' '
			WHEN PMB.AddressForNonPayrollFlag1 = ' ' 		THEN 'Z'
			ELSE PMB.AddressForNonPayrollFlag1 			END,
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
		Country1Old = 			CASE  
			WHEN PMUA.Country1 = PMB.Country1 			THEN ' '
			ELSE PMB.Country1 					END,
		PhoneNbr1Old = 			CASE  
			WHEN PMUA.PhoneNbr1 = PMB.PhoneNbr1 			THEN ' '
			WHEN PMB.PhoneNbr1 = ' ' 				THEN 'No Phone 1'
			ELSE PMB.PhoneNbr1 					END,
		PhoneNbr1 = 			CASE  
			WHEN PMUA.PhoneNbr1 = ' ' 
			 AND PMB.PhoneNbr1 != ' ' 				THEN 'No Phone 1'
			ELSE PMUA.PhoneNbr1 					END,
		FaxNbr1Old =			CASE  
			WHEN PMUA.FaxNbr1 = PMB.FaxNbr1 			THEN ' '
			WHEN PMB.FaxNbr1 = ' ' 					THEN 'No Fax'
			ELSE PMB.FaxNbr1 					END,
		FaxNbr1 = 			CASE  
			WHEN PMUA.FaxNbr1 = ' ' AND PMB.FaxNbr1 != ' ' 		THEN 'No Fax 1'
			ELSE PMUA.FaxNbr1 					END,
		AddressType2Old = 		CASE  
			WHEN PMUA.AddressType2 = PMB.AddressType2 		THEN ' '
			WHEN PMB.AddressType2 = ' ' 				THEN 'No Address Type2'
			ELSE PMB.AddressType2 					END,
		AddressForPayrollFlag2Old = 	CASE  
			WHEN PMUA.AddressForPayrollFlag2 = PMB.AddressForPayrollFlag2 
										THEN ' '
			WHEN PMB.AddressForPayrollFlag2 = ' ' 			THEN 'Z'
			ELSE PMB.AddressForPayrollFlag2				END,
		AddressForNonPayrollFlag2Old = 	CASE  
			WHEN PMUA.AddressForNonPayrollFlag2 = PMB.AddressForNonPayrollFlag2 
										THEN ' '
			WHEN PMB.AddressForNonPayrollFlag2 = ' ' 		THEN 'Z'
			ELSE PMB.AddressForNonPayrollFlag2 			END,
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
		Country2Old = 			CASE  
			WHEN PMUA.Country2 = PMB.Country2 			THEN ' '
			ELSE PMB.Country2 					END,
		PhoneNbr2Old = 			CASE  
			WHEN PMUA.PhoneNbr2 = PMB.PhoneNbr2 			THEN ' '
			WHEN PMB.PhoneNbr2 = ' ' 				THEN 'No Phone 2'
			ELSE PMB.PhoneNbr2					END,
		PhoneNbr2 = 			CASE  
			WHEN PMUA.PhoneNbr2 = ' ' 
			 AND PMB.PhoneNbr2 != ' ' 				THEN 'No Phone 2'
			ELSE PMUA.PhoneNbr2 					END,
		FaxNbr2Old = 			CASE  
			WHEN PMUA.FaxNbr2 = PMB.FaxNbr2 			THEN ' '
			WHEN PMB.FaxNbr2 = ' ' 					THEN 'No Fax 2'
			ELSE PMB.FaxNbr2 					END,
		FaxNbr2 = 			CASE  
			WHEN PMUA.FaxNbr2 = ' ' 
			 AND PMB.FaxNbr2 != ' ' 				THEN 'No Fax 2'
			ELSE PMUA.FaxNbr2 					END,
		AddressType3Old = 		CASE  
			WHEN PMUA.AddressType3 = PMB.AddressType3 		THEN ' '
			WHEN PMB.AddressType3 = ' ' 				THEN 'No Address Type 3'
			ELSE PMB.AddressType3 					END,
		AddressForPayrollFlag3Old = 	CASE  
			WHEN PMUA.AddressForPayrollFlag3 = PMB.AddressForPayrollFlag3 
										THEN ' '
			WHEN PMB.AddressForPayrollFlag3 = ' ' 			THEN 'Z'
			ELSE PMB.AddressForPayrollFlag3 			END,
		AddressForNonPayrollFlag3Old = 	CASE  
			WHEN PMUA.AddressForNonPayrollFlag3 = PMB.AddressForNonPayrollFlag3 
										THEN ' '
			WHEN PMB.AddressForNonPayrollFlag3 = ' ' 		THEN 'Z'
			ELSE PMB.AddressForNonPayrollFlag3 			END,
		Address3Old = 			CASE  
			WHEN PMUA.Address3 = PMB.Address3 			THEN ' '
			WHEN PMB.Address3 = ' ' 				THEN 'No Address 3'
			ELSE PMB.Address3 					END,
		Address3 = 			CASE  
			WHEN PMUA.Address3 = ' ' 
			 AND PMB.Address3 != ' ' 				THEN 'No Address 3'
			ELSE PMUA.Address3 					END,
		City3Old = 			CASE  
			WHEN PMUA.City3 = PMB.City3 				THEN ' '
			WHEN PMB.City3 = ' ' 					THEN 'No City 3'
			ELSE PMB.City3 						END,
		City3 = 			CASE  
			WHEN PMUA.City3 = ' ' 
			 AND PMB.City3 != ' ' 					THEN 'No City 3'
			ELSE PMUA.City3 					END,
		State3Old = 			CASE  
			WHEN PMUA.State3 = PMB.State3 				THEN ' '
			WHEN PMB.State3 = ' ' 					THEN 'No State 3'
			ELSE PMB.State3 					END,
		State3 = 			CASE  
			WHEN PMUA.State3 = ' ' 
			 AND PMB.State3 != ' ' 					THEN 'No State 3'
			ELSE PMUA.State3 					END,
		ZipCode3Old = 			CASE  
			WHEN PMUA.ZipCode3 = PMB.ZipCode3 			THEN ' '
			WHEN PMB.ZipCode3 = ' ' 				THEN 'No ZipCode 3'
			ELSE PMB.ZipCode3 					END,
		ZipCode3 = 			CASE  
			WHEN PMUA.ZipCode3 = ' ' 
			 AND PMB.ZipCode3 != ' ' 				THEN 'No ZipCode 3'
			ELSE PMUA.ZipCode3 					END,
		Country3Old = 			CASE  
			WHEN PMUA.Country3 = PMB.Country3			THEN ' '
			ELSE PMB.Country3 					END,
		PhoneNbr3Old = 			CASE  
			WHEN PMUA.PhoneNbr3 = PMB.PhoneNbr3 			THEN ' '
			WHEN PMB.PhoneNbr3 = ' ' 				THEN 'No Phone 3'
			ELSE PMB.PhoneNbr3 					END,
		PhoneNbr3 = 			CASE  
			WHEN PMUA.PhoneNbr3 = ' ' 
			 AND PMB.PhoneNbr3 != ' ' 				THEN 'No Phone 3'
			ELSE PMUA.PhoneNbr3 					END,
		FaxNbr3Old = 			CASE  
			WHEN PMUA.FaxNbr3 = PMB.FaxNbr3				THEN ' '
			WHEN PMB.FaxNbr3 = ' ' 					THEN 'No Fax 3' 
			ELSE PMB.FaxNbr3 					END,
		FaxNbr3 = 			CASE  
			WHEN PMUA.FaxNbr3 = ' ' 
			 AND PMB.FaxNbr3 != ' ' 				THEN 'No Fax 3'
			ELSE PMUA.FaxNbr3 					END,
		Site1Old = 			CASE  
			WHEN Prov.CurrentProviderFlag = 'N'
			 AND PMB.Site1 != ' '					THEN PMB.Site1
			WHEN PMB.Site1 = ' ' 					THEN 'No S1'
			ELSE PMB.Site1 						END,
		Site1 = 			CASE 
			WHEN Prov.CurrentProviderFlag = 'N'			
			 AND PMB.Site1 != ' '					THEN 'No S1'
			WHEN PMUA.Site1 = ' ' 
			 AND PMB.Site1 != ' ' 					THEN 'No S1'
			ELSE PMUA.Site1 					END,
		Site2Old = 			CASE  
			WHEN Prov.CurrentProviderFlag = 'N'
			 AND PMB.Site2 != ' '					THEN PMB.Site2
			WHEN PMB.Site2 = ' '					THEN 'No S2'
			ELSE PMB.Site2 						END,
		Site2 = 			CASE 
			WHEN Prov.CurrentProviderFlag = 'N'			
			 AND PMB.Site2 != ' '					THEN 'No S2'
			WHEN PMUA.Site2 = ' ' 
			 AND PMB.Site2 != ' ' 					THEN 'No S2'
			ELSE PMUA.Site2 					END,
		Site3Old = 			CASE  
			WHEN Prov.CurrentProviderFlag = 'N'
			 AND PMB.Site3 != ' '					THEN PMB.Site3
			WHEN PMB.Site3 = ' '  					THEN 'No S3'
			ELSE PMB.Site3 						END,
		Site3 = 			CASE 
			WHEN Prov.CurrentProviderFlag = 'N'			
			 AND PMB.Site3 != ' '					THEN 'No S3'
			WHEN PMUA.Site3 = ' ' 
			 AND PMB.Site3 != ' ' 					THEN 'No S3'
			ELSE PMUA.Site3 					END,
		Site4Old = 			CASE  
			WHEN Prov.CurrentProviderFlag = 'N'
			 AND PMB.Site4 != ' '					THEN PMB.Site4
			WHEN PMB.Site4 = ' ' 					THEN 'No S4'
			ELSE PMB.Site4 						END,
		Site4 = 			CASE 
			WHEN Prov.CurrentProviderFlag = 'N'			
			 AND PMB.Site4 != ' '					THEN 'No S4'
			WHEN PMUA.Site4 = ' ' 
			 AND PMB.Site4 != ' ' 					THEN 'No S4'
			ELSE PMUA.Site4 					END
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


		
		
		
		
		
END

