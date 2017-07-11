

CREATE PROCEDURE [dbo].[usp_LoadPMUpdateArchive] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Loads data into the ProviderMasterUpdateArchive table
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

/* Round1 - Load providers that are inactive but still have site
		They are transferred so rhat the Sites can be removed*/
		
		INSERT INTO ProviderMasterUpdateArchive 
		(StaffGroup1, StaffGroup2, ProviderMasterID, 
			WebID, TaxIDIncorporated, LastName, FirstName, 
			MiddleNameOrInitial, PreferredName, IncorporatedName, 
			Title, MaritalStatus, SpouseName, EmailAddress, 
			CEPEmail, CellPhoneNbr, PagerNbr, AddressType1, 
			AddressForPayrollFlag1, AddressForNonPayrollFlag1,
			Address1, City1, State1, ZipCode1, Country1, PhoneNbr1, 
			FaxNbr1, AddressType2, AddressForPayrollFlag2, 
			AddressForNonPayrollFlag2, Address2, City2, State2, ZipCode2, 
			Country2, PhoneNbr2, FaxNbr2, AddressType3, AddressForPayrollFlag3,
			AddressForNonPayrollFlag3, Address3, City3, State3, ZipCode3, 
			Country3, PhoneNbr3, FaxNbr3, PrimarySite, Site1, Site2, Site3, 
			Site4, TimeStmp, Author, UpdatedFlag)		
		SELECT StaffGroup1, StaffGroup2, ProviderMasterID, 
			WebID, TaxIDIncorporated, LastName, FirstName, 
			MiddleNameOrInitial, PreferredName, IncorporatedName, 
			Title, MaritalStatus, SpouseName, EmailAddress, 
			CEPEmail, CellPhoneNbr, PagerNbr, AddressType1, 
			AddressForPayrollFlag1, AddressForNonPayrollFlag1,
			Address1, City1, State1, ZipCode1, Country1, PhoneNbr1, 
			FaxNbr1, AddressType2, AddressForPayrollFlag2, 
			AddressForNonPayrollFlag2, Address2, City2, State2, ZipCode2, 
			Country2, PhoneNbr2, FaxNbr2, AddressType3, AddressForPayrollFlag3,
			AddressForNonPayrollFlag3, Address3, City3, State3, ZipCode3, 
			Country3, PhoneNbr3, FaxNbr3, PrimarySite, Site1, Site2, Site3, 
			Site4, TimeStmp, Author, UpdatedFlag
			FROM ProviderMasterBase PMB
			WHERE 	(Site1 != ' ' 
				OR	 Site2 != ' ' 
				OR 	 Site3 != ' ' 
				OR 	 Site4 != ' ')
			AND EXISTS (SELECT 1 
				FROM ProviderMaster Prov
				WHERE PMB.ProviderMasterID = Prov.ProviderMasterID
	 				AND Prov.CurrentProviderFlag = 'N')



/* Round2 - Load Updates from ProviderMasterUpdateLog*/
		
		INSERT INTO ProviderMasterUpdateArchive 
		(StaffGroup1, StaffGroup2, ProviderMasterID, 
			WebID, TaxIDIncorporated, LastName, FirstName, 
			MiddleNameOrInitial, PreferredName, IncorporatedName, 
			Title, MaritalStatus, SpouseName, EmailAddress, 
			CEPEmail, CellPhoneNbr, PagerNbr, AddressType1, 
			AddressForPayrollFlag1, AddressForNonPayrollFlag1,
			Address1, City1, State1, ZipCode1, Country1, PhoneNbr1, 
			FaxNbr1, AddressType2, AddressForPayrollFlag2, 
			AddressForNonPayrollFlag2, Address2, City2, State2, ZipCode2, 
			Country2, PhoneNbr2, FaxNbr2, AddressType3, AddressForPayrollFlag3,
			AddressForNonPayrollFlag3, Address3, City3, State3, ZipCode3, 
			Country3, PhoneNbr3, FaxNbr3, PrimarySite, Site1, Site2, Site3, 
			Site4, TimeStmp, Author, UpdatedFlag)		
		SELECT StaffGroup1, StaffGroup2, ProviderMasterID, 
			WebID, TaxIDIncorporated, LastName, FirstName, 
			MiddleNameOrInitial, PreferredName, IncorporatedName, 
			Title, MaritalStatus, SpouseName, EmailAddress, 
			CEPEmail, CellPhoneNbr, PagerNbr, AddressType1, 
			AddressForPayrollFlag1, AddressForNonPayrollFlag1,
			Address1, City1, State1, ZipCode1, Country1, PhoneNbr1, 
			FaxNbr1, AddressType2, AddressForPayrollFlag2, 
			AddressForNonPayrollFlag2, Address2, City2, State2, ZipCode2, 
			Country2, PhoneNbr2, FaxNbr2, AddressType3, AddressForPayrollFlag3,
			AddressForNonPayrollFlag3, Address3, City3, State3, ZipCode3, 
			Country3, PhoneNbr3, FaxNbr3, PrimarySite, Site1, Site2, Site3, 
			Site4, TimeStmp, Author, UpdatedFlag 
		FROM ProviderMasterUpdate PMU
		WHERE PMU.UpdatedFlag = 'Y'
			   AND NOT EXISTS
			(SELECT 1
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMU.providermasterid 	= PMUA.providermasterid
	 				   AND PMU.Author 		= PMUA.Author
					   AND PMU.timestmp 		= PMUA.timestmp)



	      
END


