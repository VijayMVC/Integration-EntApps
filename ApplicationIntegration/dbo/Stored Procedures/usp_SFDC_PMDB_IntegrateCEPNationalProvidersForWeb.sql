CREATE PROCEDURE [dbo].[usp_SFDC_PMDB_IntegrateCEPNationalProvidersForWeb] AS

/* 5/27/2005 Antonia Miller - 
	Stored Procedure created to load out of state CEP providers and sites into 
	areas of the ProviderMasterTest database to allow automatic loading of physicians into web 
	source data tables (ProviderMasterBase) and also other tables needed for processing 
	of web-based provider profile updates
6/17/2005 Added Insert into StaffHistory for Physician Extenders (DEP)
7/12/2005 Added Update to StaffHistory to change all DEP physician extenders to 
	StaffSubGroup = 'DEP Physician Extenders
4/26/2006 Added AEP staff group for physicians and physician extenders
8/13/2007 - Antonia Miller - Added TXP
11/29/2007 - Mohamed Mahmoud - modified TXP physician extenders insert
query to use 'CEP' in the where not exists to make sure CEP records are added to StaffHistory for PAs
2/12/2009 - Antonia Miller - Added ILP
5/14/2009 - Antonia Miller - Added WAP
12/04/2009 - Reetika Singh - Added WEP 
5/11/2011  - Reetika singh - Added KYP*/


/*Main insert, for the first time, into ProviderMasterBase.  WEP or DEP physician goes out to the 
web as CEP. */

/*ProviderMasterBase*/


UPDATE ProviderMasterBaseTest SET 
		 AddressType1 			= PA.AddressType,
		 Address1 			= PA.Address1, 
		 City1 				= PA.City,
		 State1 			= PA.State,
		 ZipCode1 			= PA.ZipCode,
		 Country1 			= PA.Country, 
		 PhoneNbr1 			= PA.PhoneNbr, 	
		 FaxNbr1 			= PA.FaxNbr,
		 AddressForPayrollFlag1 	= PA.AddressForPayrollFlag,
		 AddressForNonPayrollFlag1 	= PA.AddressForNonPayrollFlag
		FROM ProviderMasterBaseTest PMB
		INNER JOIN ProviderAddressStaffGroup PA
			 ON PMB.ProviderMasterID = PA.ProviderMasterID
			--AND PA.StaffGroup = @CEPStaffGroup 
		WHERE PA.AddressListOrder = 1

	UPDATE ProviderMasterBaseTest SET 
		 AddressType2 			= PA.AddressType,
		 Address2 			= PA.Address1, 
		 City2 				= PA.City,
		 State2 			= PA.State,
		 ZipCode2 			= PA.ZipCode,
		 Country2 			= PA.Country, 
		 PhoneNbr2 			= PA.PhoneNbr, 	
		 FaxNbr2 			= PA.FaxNbr,
		 AddressForPayrollFlag2 	= PA.AddressForPayrollFlag,
		 AddressForNonPayrollFlag2 	= PA.AddressForNonPayrollFlag
		FROM ProviderMasterBaseTest PMB
		INNER JOIN ProviderAddressStaffGroup PA
			 ON PMB.ProviderMasterID = PA.ProviderMasterID
			--AND PA.StaffGroup = @CEPStaffGroup
		WHERE PA.AddressListOrder = 2

	UPDATE ProviderMasterBaseTest SET 
		 AddressType3 			= PA.AddressType,
		 Address3 			= PA.Address1, 
		 City3 				= PA.City,
		 State3 			= PA.State,
		 ZipCode3 			= PA.ZipCode,
		 Country3 			= PA.Country, 
		 PhoneNbr3 			= PA.PhoneNbr, 	
		 FaxNbr3 			= PA.FaxNbr,
		 AddressForPayrollFlag3 	= PA.AddressForPayrollFlag,
		 AddressForNonPayrollFlag3 	= PA.AddressForNonPayrollFlag
		FROM ProviderMasterBaseTest PMB
		INNER JOIN ProviderAddressStaffGroup PA
			 ON PMB.ProviderMasterID = PA.ProviderMasterID
			--AND PA.StaffGroup = @CEPStaffGroup
		WHERE PA.AddressListOrder = 3

	UPDATE ProviderMasterBaseTest SET 
		AddressType3 			= ' ', 
		Address3 			= ' ',	
		City3 				= ' ', 
		State3 				= ' ', 
		ZipCode3 			= ' ', 
		Country3 			= ' ', 
		PhoneNbr3 			= ' ', 
		FaxNbr3 			= ' ',
		AddressForPayrollFlag3  	= 'N',
		AddressForNonPayrollFlag3 	= 'N'
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderAddressStaffGroup PA
				WHERE ProviderMasterBase.ProviderMasterID = PA.ProviderMasterID 
				  AND PA.AddressListOrder = 3)

	UPDATE ProviderMasterBaseTest SET 
		AddressType2 			= ' ', 
		Address2 			= ' ',	
		City2 				= ' ', 
		State2 				= ' ', 
		ZipCode2 			= ' ', 
		Country2 			= ' ', 
		PhoneNbr2 			= ' ', 
		FaxNbr2 			= ' ',
		AddressForPayrollFlag2  	= 'N',
		AddressForNonPayrollFlag2 	= 'N'
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderAddressStaffGroup PA
				WHERE ProviderMasterBase.ProviderMasterID = PA.ProviderMasterID 
				  AND PA.AddressListOrder = 2)

	UPDATE ProviderMasterBase
		SET AddressForPayrollFlag1 = CASE 
			WHEN AddressForPayrollFlag1 = 'Y' THEN 'Yes'
			WHEN AddressForPayrollFlag1 = 'N' THEN 'No' 
			ELSE AddressForPayrollFlag1 END,
		AddressForPayrollFlag2 = CASE 
			WHEN AddressForPayrollFlag2 = 'Y' THEN 'Yes'	
			WHEN AddressForPayrollFlag2 = 'N' THEN 'No' 
			ELSE AddressForPayrollFlag2 END,
		AddressForPayrollFlag3 = CASE 
			WHEN AddressForPayrollFlag3 = 'Y' THEN 'Yes'	
			WHEN AddressForPayrollFlag3 = 'N' THEN 'No' 
			ELSE AddressForPayrollFlag3 END,
		AddressForNonPayrollFlag1 = CASE 
			WHEN AddressForNonPayrollFlag1 = 'Y' THEN 'Yes'	
			WHEN AddressForNonPayrollFlag1 = 'N' THEN 'No' 
			ELSE AddressForNonPayrollFlag1 END,
		AddressForNonPayrollFlag2 = CASE 
			WHEN AddressForNonPayrollFlag2 = 'Y' THEN 'Yes'
			WHEN AddressForNonPayrollFlag2 = 'N' THEN 'No' 
			ELSE AddressForNonPayrollFlag2 END,
		AddressForNonPayrollFlag3 = CASE 
			WHEN AddressForNonPayrollFlag3 = 'Y' THEN 'Yes'
			WHEN AddressForNonPayrollFlag3 = 'N' THEN 'No' 
			ELSE AddressForNonPayrollFlag3 END



	--UPDATE ProviderMasterBaseTest SET 	
	--	MedSchool = 	CASE 
	--		WHEN Prov.MedSchool IS NULL THEN ' ' 
	--		ELSE Prov.MedSchool END,
	--	Status = 	CASE 
	--		WHEN Prov.CurrentProviderFlag = 'N' 	THEN '1' 
	--		ELSE 0 END
	--	FROM ProviderMasterTest Prov
	--	INNER JOIN ProviderMasterBaseTest PMB
	--		ON Prov.ProviderMasterID = PMB.ProviderMasterID	--	WHERE Status <> 2

		UPDATE ProviderMasterBaseTest SET 	
		 CEPLevel = CASE 
			WHEN Prov.PartnershipLevelCode IS NULL THEN ' ' 
			ELSE Prov.PartnershipLevelCode END, 
		 CEPLevelDate 	= Prov.PartnershipLevelDate,
		 HireDate 	= Prov.DateOfHire,
		 Gender 	= Prov.Gender
		FROM ProviderMasterTest Prov
		INNER JOIN ProviderMasterBaseTest PMB
			ON Prov.ProviderMasterID = PMB.ProviderMasterID
			
	--For below use Hospital_Region and SFID

	/*UPDATE ARIZONA SITES TO MATCH WEB NEEDS, INFO COMES FROM ECHO THIS WAY*/
	UPDATE PROVIDERMASTERBASETEST
	SET 	SITE1 = CASE 	WHEN SITE1 = 'DEL3' THEN 'DEL1' 
				WHEN SITE1 = 'BOS3' THEN 'BOS1' ELSE SITE1 END,
		SITE2 = CASE 	WHEN SITE2 = 'DEL3' THEN 'DEL1' 
				WHEN SITE2 = 'BOS3' THEN 'BOS1' ELSE SITE2 END,
		SITE3 = CASE 	WHEN SITE3 = 'DEL3' THEN 'DEL1' 
				WHEN SITE3 = 'BOS3' THEN 'BOS1' ELSE SITE3 END,
		SITE4 = CASE 	WHEN SITE4 = 'DEL3' THEN 'DEL1' 
				WHEN SITE4 = 'BOS3' THEN 'BOS1' ELSE SITE4 END
	/*UPDATE SITE PRIMARY SITE FOR OREGON - ADVENTIST*/ 
	UPDATE PROVIDERMASTERBASETEST
	SET PRIMARYSITE = SL.SITELOCATIONNAME
	FROM PROVIDERMASTERBASETEST, SITELOCATIONLOOKUP SL
	WHERE PROVIDERMASTERBASE.SITE1 = SL.WEBCODE AND 
	PROVIDERMASTERBASE.SITE1 = 'ADV1'

	/*UPDATE SITE PRIMARY SITE FOR GEORGIA - DEKLAB MEDICAL CENTERS*/ 
	UPDATE PROVIDERMASTERBASE
	SET PRIMARYSITE = SL.SITELOCATIONNAME
	FROM PROVIDERMASTERBASE, SITELOCATIONLOOKUP SL
	WHERE PROVIDERMASTERBASE.SITE1 = SL.WEBCODE AND 
	PROVIDERMASTERBASE.SITE1 IN( 'DEK3', 'DEK5')


	/*UPDATE SITE PRIMARY SITE FOR ARIZONA */ 
	UPDATE PROVIDERMASTERBASE
	SET PRIMARYSITE = SL.SITELOCATIONNAME
	FROM PROVIDERMASTERBASE, SITELOCATIONLOOKUP SL
	WHERE PROVIDERMASTERBASE.SITE1 = SL.WEBCODE AND 
	PROVIDERMASTERBASE.SITE1 IN('DEL1', 'BOS1')
