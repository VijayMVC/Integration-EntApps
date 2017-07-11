
CREATE PROCEDURE [dbo].[usp_LoadProviderMasterUpdateLog] 
AS

/* 	Author: 	Reetika Singh
	Date:		4/23/2012
	Purpose:	Need to Load ProviderMasterUpdateLog
				And Compare to Base.  This procedure is 
				used to determined who updated the account, not
				necessarily the superadmin.
	Revision:	Updated for Multiple Clients

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN


	/* All Group - CEP, GALEN */
	
	INSERT INTO ProviderMasterUpdateLog
		(ProviderMasterID,
		 StaffGroup1,
		 StaffGroup2,
		 WebID,
		 TaxIDIncorporated,		
		 LastName,
		 FirstName,
		 MiddleNameOrInitial, 
		 PreferredName,
		 IncorporatedName,
		 Title,
		 MaritalStatus,
		 SpouseName,
		 EmailAddress,
		 CEPEmail,
		 CellPhoneNbr,
		 PagerNbr,
		 AddressType1,
		 AddressForPayrollFlag1,
		 AddressForNonPayrollFlag1,
		 Address1,
		 City1,
		 State1,
		 ZipCode1,
		 PhoneNbr1,
		 FaxNbr1,
		 AddressType2,
		 AddressForPayrollFlag2,
		 AddressForNonPayrollFlag2,
		 Address2,
		 City2,
		 State2,
		 ZipCode2,
		 PhoneNbr2,
		 FaxNbr2,
		 AddressType3,
		 AddressForPayrollFlag3,
		 AddressForNonPayrollFlag3,
		 Address3,
		 City3,
		 State3,
		 ZipCode3,
		 PhoneNbr3,
		 FaxNbr3,
		 Site1,
		 Site2,
		 Site3,
		 Site4,
		 Author,
		 TimeStmp)
	SELECT 	 PMU.ProviderMasterID,
		 PMU.StaffGroup1,
		 PMU.StaffGroup2,
		 PMU.WebID,
		 PMU.TaxIDIncorporated,		
		 PMU.LastName,
		 PMU.FirstName,
		 PMU.MiddleNameOrInitial, 
		 PMU.PreferredName,
		 PMU.IncorporatedName,
		 PMU.Title,
		 PMU.MaritalStatus,
		 PMU.SpouseName,
		 PMU.EmailAddress,
		 PMU.CEPEmail,
		 PMU.CellPhoneNbr,
		 PMU.PagerNbr,
		 PMU.AddressType1,
		 PMU.AddressForPayrollFlag1,
		 PMU.AddressForNonPayrollFlag1,
		 PMU.Address1,
		 PMU.City1,
		 PMU.State1,
		 PMU.ZipCode1,
		 PMU.PhoneNbr1,
		 PMU.FaxNbr1,
		 PMU.AddressType2,
		 PMU.AddressForPayrollFlag2,
		 PMU.AddressForNonPayrollFlag2,
		 PMU.Address2,
		 PMU.City2,
		 PMU.State2,
		 PMU.ZipCode2,
		 PMU.PhoneNbr2,
		 PMU.FaxNbr2,
		 PMU.AddressType3,
		 PMU.AddressForPayrollFlag3,
		 PMU.AddressForNonPayrollFlag3,
		 PMU.Address3,
		 PMU.City3,
		 PMU.State3,
		 PMU.ZipCode3,
		 PMU.PhoneNbr3,
		 PMU.FaxNbr3,
		 PMU.Site1,
		 PMU.Site2,
		 PMU.Site3,
		 PMU.Site4,
		 PMU.Author,
		 PMU.TimeStmp
		FROM ProviderMasterUpdate PMU WITH (NOLOCK)
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderMasterUpdateLog PMUL  WITH (NOLOCK)
				WHERE PMU.ProviderMasterID = PMUL.ProviderMasterID
				  AND PMU.Author 	   = PMUL.Author
				  AND PMU.TimeStmp 	   = PMUL.TimeStmp)
	

	UPDATE ProviderMasterUpdateLog SET
		InternalUpdateFlag = 'Y',
		TaxIDIncorporatedOld = 	 	CASE  
			WHEN PMUL.TaxIDIncorporated = PMB.TaxIDIncorporated 	THEN ' '
			WHEN PMB.TaxIDIncorporated = ' ' 			THEN 'None'
			ELSE PMB.TaxIDIncorporated 				END,
		TaxIDIncorporated = 	 	CASE 
			WHEN PMUL.TaxIDIncorporated = ' ' AND PMB.TaxIDIncorporated != ' ' 	
										THEN 'No Tax ID'
			ELSE PMUL.TaxIDIncorporated 				END,
		LastNameOld = 		 	CASE  
			WHEN PMUL.LastName = PMB.LastName 			THEN ' '
			WHEN PMB.LastName = ' ' 				THEN 'None'
			ELSE PMB.LastName 					END,	
		LastName = 		 	CASE
			WHEN PMUL.LastName = ' ' AND PMB.LastName != ' ' 	THEN 'No Last Name'
			ELSE PMUL.LastName 					END,
		FirstNameOld = 		 	CASE  
			WHEN PMUL.FirstName = PMB.FirstName			THEN ' '
			WHEN PMB.FirstName = ' ' 				THEN 'None'
			ELSE PMB.FirstName 					END,
		FirstName = 		 	CASE 
			WHEN PMUL.FirstName = ' ' AND PMB.FirstName != ' ' 	THEN 'No First Name'
			ELSE PMUL.FirstName 					END,
		MiddleNameOrInitialOld = 	CASE  
			WHEN PMUL.MiddleNameOrInitial = PMB.MiddleNameOrInitial 
										THEN ' '
			WHEN PMB.MiddleNameOrInitial = ' ' 			THEN 'None'
			ELSE PMB.MiddleNameOrInitial 				END,
		MiddleNameOrInitial = 		CASE  
			WHEN PMUL.MiddleNameOrInitial = ' ' AND PMB.MiddleNameOrInitial != ' ' THEN 'No Middle Name'
			ELSE PMUL.MiddleNameOrInitial 				END,
		PreferredNameOld = 		CASE  
			WHEN PMUL.PreferredName = PMB.PreferredName		THEN ' '
			WHEN PMB.PreferredName = ' ' 				THEN 'No Preferred Name'
			ELSE PMB.PreferredName 					END,
		PreferredName = 		CASE  
			WHEN PMUL.PreferredName = ' ' 
			 AND PMB.PreferredName != ' ' 				THEN 'No Preferred Name'
			ELSE PMUL.PreferredName 				END,
		IncorporatedNameOld = 		CASE  
			WHEN PMUL.IncorporatedName = PMB.IncorporatedName 	THEN ' '
			WHEN PMB.IncorporatedName = ' ' 			THEN 'No Incorporated Name'
			ELSE PMB.IncorporatedName 				END,
		IncorporatedName = 		CASE  
			WHEN PMUL.IncorporatedName = ' ' 
			 AND PMB.IncorporatedName != ' ' 			THEN 'No Incorporated Name'
			ELSE PMUL.IncorporatedName 				END,
		TitleOld = 			CASE  
			WHEN PMUL.Title = PMB.Title 				THEN ' '
			WHEN PMB.Title = ' ' 					THEN 'No Title'
			ELSE PMB.Title 						END,
		Title = 			CASE  
			WHEN PMUL.Title = ' ' 
			 AND PMB.Title != ' ' 					THEN 'No Title'
			ELSE PMUL.Title 					END,
		MaritalStatusOld = 		CASE  
			WHEN PMUL.MaritalStatus = PMB.MaritalStatus 		THEN ' '
			WHEN PMB.MaritalStatus = ' ' 				THEN 'No Marital Status'
			ELSE PMB.MaritalStatus 					END,
		MaritalStatus = 		CASE  
			WHEN PMUL.MaritalStatus = ' ' 
			 AND PMB.MaritalStatus != ' ' 				THEN 'No Marital Status'
			ELSE PMUL.MaritalStatus 				END,
		SpouseNameOld = 		CASE  
			WHEN PMUL.SpouseName = PMB.SpouseName 			THEN ' '
			WHEN PMB.SpouseName = ' ' 				THEN 'No Spouse Name'
			ELSE PMB.SpouseName 					END,
		SpouseName = 			CASE  
			WHEN PMUL.SpouseName = ' ' 
			 AND PMB.SpouseName != ' ' 				THEN 'No Spouse Name'
			ELSE PMUL.SpouseName 					END,
		EmailAddressOld = 		CASE  
			WHEN PMUL.EmailAddress = PMB.EmailAddress 		THEN ' '
			WHEN PMB.EmailAddress = ' ' 				THEN 'No Email'
			ELSE PMB.EmailAddress 					END,
		EmailAddress = 			CASE  
			WHEN PMUL.EmailAddress = ' ' 
			 AND PMB.EmailAddress != ' ' 				THEN 'No Email'
			ELSE PMUL.EmailAddress 					END,
		CEPEmailOld = 			CASE  
			WHEN PMUL.CEPEmail = PMB.CEPEmail 			THEN ' '
			WHEN PMB.CEPEmail = ' ' 				THEN 'No CEP Email'
			ELSE PMB.CEPEmail 					END,
		CEPEmail = 			CASE  
			WHEN PMUL.CEPEmail = ' ' 
			 AND PMB.CEPEmail != ' ' 				THEN 'No CEP Email'
			ELSE PMUL.CEPEmail 					END,
		CellPhoneNbrOld = 		CASE  
			WHEN PMUL.CellPhoneNbr = PMB.CellPhoneNbr 		THEN  ' '
			WHEN PMB.CellPhoneNbr = ' ' 				THEN 'No Cell Phone'
			ELSE PMB.CellPhoneNbr 					END,
		CellPhoneNbr = 			CASE  
			WHEN PMUL.CellPhoneNbr = ' ' 
			 AND PMB.CellPhoneNbr != ' ' 				THEN 'No Cell Phone'
			ELSE PMUL.CellPhoneNbr 					END,
		PagerNbrOld = 			CASE  
			WHEN PMUL.PagerNbr = PMB.PagerNbr 			THEN ' '
			WHEN PMB.PagerNbr = ' ' 				THEN 'No Pager'
			ELSE PMB.PagerNbr 					END,
		PagerNbr = 			CASE  
			WHEN PMUL.PagerNbr = ' ' 
			 AND PMB.PagerNbr != ' ' 				THEN 'No Pager'
			ELSE PMUL.PagerNbr 					END,
		AddressType1Old = 		CASE  
			WHEN PMUL.AddressType1 = PMB.AddressType1 		THEN ' '
			WHEN PMB.AddressType1 = ' ' 				THEN 'No Address Type1'
			ELSE PMB.AddressType1 					END,
		AddressForPayrollFlag1Old = 	CASE  
			WHEN PMUL.AddressForPayrollFlag1 = PMB.AddressForPayrollFlag1 
										THEN ' '
			WHEN PMB.AddressForPayrollFlag1 = ' ' 			THEN 'Z'
			ELSE PMB.AddressForPayrollFlag1 			END,
		AddressForNonPayrollFlag1Old = 	CASE  
			WHEN PMUL.AddressForNonPayrollFlag1 = PMB.AddressForNonPayrollFlag1
										THEN ' '
			WHEN PMB.AddressForNonPayrollFlag1 = ' ' 		THEN 'Z'
			ELSE PMB.AddressForNonPayrollFlag1 			END,
		Address1Old = 			CASE 
			WHEN PMUL.Address1 = PMB.Address1 			THEN ' '
			WHEN PMB.Address1 = ' ' 				THEN 'No Address 1'
			ELSE PMB.Address1 					END,
		Address1 = 			CASE  
			WHEN PMUL.Address1 = ' ' 
			 AND PMB.Address1 != ' ' 				THEN 'No Address 1'
			ELSE PMUL.Address1 					END,
		City1Old = 			CASE  
			WHEN PMUL.City1 = PMB.City1 				THEN ' '
			WHEN PMB.City1 = ' ' 					THEN 'No City 1'
			ELSE PMB.City1						END,
		City1 = 			CASE  
			WHEN PMUL.City1 = ' ' 
			 AND PMB.City1 != ' ' 					THEN 'No City 1'
			ELSE PMUL.City1 					END,
		State1Old = 			CASE  
			WHEN PMUL.State1 = PMB.State1 				THEN ' '
			WHEN PMB.State1 = ' ' 					THEN 'No State 1'
			ELSE PMB.State1 					END,
		State1 = 			CASE  
			WHEN PMUL.State1 = ' ' 
			 AND PMB.State1 != ' ' 					THEN 'No State 1'
			ELSE PMUL.State1 					END,
		ZipCode1Old = 			CASE  
			WHEN PMUL.ZipCode1 = PMB.ZipCode1 			THEN ' '
			WHEN PMB.ZipCode1 = ' ' 				THEN 'No ZipCode 1'
			ELSE PMB.ZipCode1 					END,
		ZipCode1 = 			CASE  
			WHEN PMUL.ZipCode1 = ' ' 
			 AND PMB.ZipCode1 != ' ' 				THEN 'No ZipCode 1'
			ELSE PMUL.ZipCode1 					END,
		Country1Old = 			CASE  
			WHEN PMUL.Country1 = PMB.Country1 			THEN ' '
			ELSE PMB.Country1 					END,
		PhoneNbr1Old = 			CASE  
			WHEN PMUL.PhoneNbr1 = PMB.PhoneNbr1 			THEN ' '
			WHEN PMB.PhoneNbr1 = ' ' 				THEN 'No Phone 1'
			ELSE PMB.PhoneNbr1 					END,
		PhoneNbr1 = 			CASE  
			WHEN PMUL.PhoneNbr1 = ' ' 
			 AND PMB.PhoneNbr1 != ' ' 				THEN 'No Phone 1'
			ELSE PMUL.PhoneNbr1 					END,
		FaxNbr1Old =			CASE  
			WHEN PMUL.FaxNbr1 = PMB.FaxNbr1 			THEN ' '
			WHEN PMB.FaxNbr1 = ' ' 					THEN 'No Fax'
			ELSE PMB.FaxNbr1 					END,
		FaxNbr1 = 			CASE  
			WHEN PMUL.FaxNbr1 = ' ' AND PMB.FaxNbr1 != ' ' 		THEN 'No Fax 1'
			ELSE PMUL.FaxNbr1 					END,
		AddressType2Old = 		CASE  
			WHEN PMUL.AddressType2 = PMB.AddressType2 		THEN ' '
			WHEN PMB.AddressType2 = ' ' 				THEN 'No Address Type2'
			ELSE PMB.AddressType2 					END,
		AddressForPayrollFlag2Old = 	CASE  
			WHEN PMUL.AddressForPayrollFlag2 = PMB.AddressForPayrollFlag2 
										THEN ' '
			WHEN PMB.AddressForPayrollFlag2 = ' ' 			THEN 'Z'
			ELSE PMB.AddressForPayrollFlag2				END,
		AddressForNonPayrollFlag2Old = 	CASE  
			WHEN PMUL.AddressForNonPayrollFlag2 = PMB.AddressForNonPayrollFlag2 
										THEN ' '
			WHEN PMB.AddressForNonPayrollFlag2 = ' ' 		THEN 'Z'
			ELSE PMB.AddressForNonPayrollFlag2 			END,
		Address2Old = 			CASE  
			WHEN PMUL.Address2 = PMB.Address2 			THEN ' '
			WHEN PMB.Address2 = ' ' 				THEN 'No Address 2'
			ELSE PMB.Address2 					END,
		Address2 = 			CASE  
			WHEN PMUL.Address2 = ' ' 
			 AND PMB.Address2 != ' ' 				THEN 'No Address 2'
			ELSE PMUL.Address2 					END,
		City2Old = 			CASE  
			WHEN PMUL.City2 = PMB.City2 				THEN ' '
			WHEN PMB.City2 = ' ' 					THEN 'No City 2'
			ELSE PMB.City2 						END,
		City2 = 			CASE  
			WHEN PMUL.City2 = ' ' 
			 AND PMB.City2 != ' ' 					THEN 'No City 2'
			ELSE PMUL.City2 					END,
		State2Old = 			CASE  
			WHEN PMUL.State2 = PMB.State2 				THEN ' '
			WHEN PMB.State2 = ' ' 					THEN 'No State 2'
			ELSE PMB.State2 					END,
		State2 = 			CASE  
			WHEN PMUL.State2 = ' ' 
			 AND PMB.State2 != ' ' 					THEN 'No State 2'
			ELSE PMUL.State2 					END,
		ZipCode2Old = 			CASE  
			WHEN PMUL.ZipCode2 = PMB.ZipCode2 			THEN ' '
			WHEN PMB.ZipCode2 = ' ' 				THEN 'No ZipCode 2'
			ELSE PMB.ZipCode2 					END,
		ZipCode2 = 			CASE  
			WHEN PMUL.ZipCode2 = ' ' 
			 AND PMB.ZipCode2 != ' ' 				THEN 'No ZipCode 2'
			ELSE PMUL.ZipCode2 					END,
		Country2Old = 			CASE  
			WHEN PMUL.Country2 = PMB.Country2 			THEN ' '
			ELSE PMB.Country2 					END,
		PhoneNbr2Old = 			CASE  
			WHEN PMUL.PhoneNbr2 = PMB.PhoneNbr2 			THEN ' '
			WHEN PMB.PhoneNbr2 = ' ' 				THEN 'No Phone 2'
			ELSE PMB.PhoneNbr2					END,
		PhoneNbr2 = 			CASE  
			WHEN PMUL.PhoneNbr2 = ' ' 
			 AND PMB.PhoneNbr2 != ' ' 				THEN 'No Phone 2'
			ELSE PMUL.PhoneNbr2 					END,
		FaxNbr2Old = 			CASE  
			WHEN PMUL.FaxNbr2 = PMB.FaxNbr2 			THEN ' '
			WHEN PMB.FaxNbr2 = ' ' 					THEN 'No Fax 2'
			ELSE PMB.FaxNbr2 					END,
		FaxNbr2 = 			CASE  
			WHEN PMUL.FaxNbr2 = ' ' 
			 AND PMB.FaxNbr2 != ' ' 				THEN 'No Fax 2'
			ELSE PMUL.FaxNbr2 					END,
		AddressType3Old = 		CASE  
			WHEN PMUL.AddressType3 = PMB.AddressType3 		THEN ' '
			WHEN PMB.AddressType3 = ' ' 				THEN 'No Address Type 3'
			ELSE PMB.AddressType3 					END,
		AddressForPayrollFlag3Old = 	CASE  
			WHEN PMUL.AddressForPayrollFlag3 = PMB.AddressForPayrollFlag3 
										THEN ' '
			WHEN PMB.AddressForPayrollFlag3 = ' ' 			THEN 'Z'
			ELSE PMB.AddressForPayrollFlag3 			END,
		AddressForNonPayrollFlag3Old = 	CASE  
			WHEN PMUL.AddressForNonPayrollFlag3 = PMB.AddressForNonPayrollFlag3 
										THEN ' '
			WHEN PMB.AddressForNonPayrollFlag3 = ' ' 		THEN 'Z'
			ELSE PMB.AddressForNonPayrollFlag3 			END,
		Address3Old = 			CASE  
			WHEN PMUL.Address3 = PMB.Address3 			THEN ' '
			WHEN PMB.Address3 = ' ' 				THEN 'No Address 3'
			ELSE PMB.Address3 					END,
		Address3 = 			CASE  
			WHEN PMUL.Address3 = ' ' 
			 AND PMB.Address3 != ' ' 				THEN 'No Address 3'
			ELSE PMUL.Address3 					END,
		City3Old = 			CASE  
			WHEN PMUL.City3 = PMB.City3 				THEN ' '
			WHEN PMB.City3 = ' ' 					THEN 'No City 3'
			ELSE PMB.City3 						END,
		City3 = 			CASE  
			WHEN PMUL.City3 = ' ' 
			 AND PMB.City3 != ' ' 					THEN 'No City 3'
			ELSE PMUL.City3 					END,
		State3Old = 			CASE  
			WHEN PMUL.State3 = PMB.State3 				THEN ' '
			WHEN PMB.State3 = ' ' 					THEN 'No State 3'
			ELSE PMB.State3 					END,
		State3 = 			CASE  
			WHEN PMUL.State3 = ' ' 
			 AND PMB.State3 != ' ' 					THEN 'No State 3'
			ELSE PMUL.State3 					END,
		ZipCode3Old = 			CASE  
			WHEN PMUL.ZipCode3 = PMB.ZipCode3 			THEN ' '
			WHEN PMB.ZipCode3 = ' ' 				THEN 'No ZipCode 3'
			ELSE PMB.ZipCode3 					END,
		ZipCode3 = 			CASE  
			WHEN PMUL.ZipCode3 = ' ' 
			 AND PMB.ZipCode3 != ' ' 				THEN 'No ZipCode 3'
			ELSE PMUL.ZipCode3 					END,
		Country3Old = 			CASE  
			WHEN PMUL.Country3 = PMB.Country3			THEN ' '
			ELSE PMB.Country3 					END,
		PhoneNbr3Old = 			CASE  
			WHEN PMUL.PhoneNbr3 = PMB.PhoneNbr3 			THEN ' '
			WHEN PMB.PhoneNbr3 = ' ' 				THEN 'No Phone 3'
			ELSE PMB.PhoneNbr3 					END,
		PhoneNbr3 = 			CASE  
			WHEN PMUL.PhoneNbr3 = ' ' 
			 AND PMB.PhoneNbr3 != ' ' 				THEN 'No Phone 3'
			ELSE PMUL.PhoneNbr3 					END,
		FaxNbr3Old = 			CASE  
			WHEN PMUL.FaxNbr3 = PMB.FaxNbr3				THEN ' '
			WHEN PMB.FaxNbr3 = ' ' 					THEN 'No Fax 3' 
			ELSE PMB.FaxNbr3 					END,
		FaxNbr3 = 			CASE  
			WHEN PMUL.FaxNbr3 = ' ' 
			 AND PMB.FaxNbr3 != ' ' 				THEN 'No Fax 3'
			ELSE PMUL.FaxNbr3 					END,
		Site1Old = 			CASE  
			WHEN Prov.CurrentProviderFlag = 'N'
			 AND PMB.Site1 != ' '					THEN PMB.Site1
			WHEN PMUL.Site1 = PMB.Site1 				THEN ' '
			WHEN PMB.Site1 = ' ' 					THEN 'No S1'
			ELSE PMB.Site1 						END,
		Site1 = 			CASE 
			WHEN Prov.CurrentProviderFlag = 'N'			
			 AND PMB.Site1 != ' '					THEN 'No S1'
			WHEN PMUL.Site1 = ' ' 
			 AND PMB.Site1 != ' ' 					THEN 'No S1'
			ELSE PMUL.Site1 					END,
		Site2Old = 			CASE  
			WHEN Prov.CurrentProviderFlag = 'N'
			 AND PMB.Site2 != ' '					THEN PMB.Site2
			WHEN PMUL.Site2 = PMB.Site2 				THEN ' '
			WHEN PMB.Site2 = ' '					THEN 'No S2'
			ELSE PMB.Site2 						END,
		Site2 = 			CASE 
			WHEN Prov.CurrentProviderFlag = 'N'			
			 AND PMB.Site2 != ' '					THEN 'No S2'
			WHEN PMUL.Site2 = ' ' 
			 AND PMB.Site2 != ' ' 					THEN 'No S2'
			ELSE PMUL.Site2 					END,
		Site3Old = 			CASE  
			WHEN Prov.CurrentProviderFlag = 'N'
			 AND PMB.Site3 != ' '					THEN PMB.Site3
			WHEN PMUL.Site3 = PMB.Site3 				THEN ' '
			WHEN PMB.Site3 = ' ' 					THEN 'No S3'
			ELSE PMB.Site3 						END,
		Site3 = 			CASE 
			WHEN Prov.CurrentProviderFlag = 'N'			
			 AND PMB.Site3 != ' '					THEN 'No S3'
			WHEN PMUL.Site3 = ' ' 
			 AND PMB.Site3 != ' ' 					THEN 'No S3'
			ELSE PMUL.Site3 					END,
		Site4Old = 			CASE  
			WHEN Prov.CurrentProviderFlag = 'N'
			 AND PMB.Site4 != ' '					THEN PMB.Site4
			WHEN PMUL.Site4 = PMB.Site4 				THEN ' '
			WHEN PMB.Site4 = ' ' 					THEN 'No S4'
			ELSE PMB.Site4 						END,
		Site4 = 			CASE 
			WHEN Prov.CurrentProviderFlag = 'N'			
			 AND PMB.Site4 != ' '					THEN 'No S4'
			WHEN PMUL.Site4 = ' ' 
			 AND PMB.Site4 != ' ' 					THEN 'No S4'
			ELSE PMUL.Site4 					END
		FROM ProviderMasterUpdateLog 		PMUL
		INNER JOIN ProviderMasterBase 		PMB
			ON PMUL.providerMasterID = PMB.ProviderMasterID
		INNER JOIN ProviderMaster 		Prov
			ON PMUL.ProviderMasterID = Prov.ProviderMasterID
		 WHERE PMUL.InternalUpdateFlag IS NULL
		   --AND PMUL.StaffGroup = @StaffGroup


	/* CEP */
	UPDATE ProviderMasterUpdateLog SET
		AuthorApproval 	 = PMU.Author,
		TimeStmpApproval = PMU.TimeStmp
		FROM ProviderMasterUpdateLog PMUL 
		INNER JOIN ProviderMasterUpdate PMU 
			ON PMU.ProviderMasterID = PMUL.ProviderMasterID
		WHERE PMU.UpdatedFlag = 'Y'
		  AND PMUL.AuthorApproval IS NULL
		  --AND PMUL.StaffGroup = @StaffGroup

		 

END

