CREATE  PROCEDURE [dbo].[usp_LoadPMDBUpdateChanges] 
AS

/* 	Author: 	
	Date:		
	Purpose:	LoadProviderMasterUpdateChanges
	Revision:	
*/

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	
	/* Reset Updated Records */
		/* CEP */
	UPDATE ProviderMasterBase SET 
		UpdatedFlag = NULL
		WHERE UpdatedFlag = 'Y'
		AND NOT EXISTS
		(SELECT 1 
			FROM ProviderMasterUpdate PMU
			WHERE PMU.ProviderMasterID = ProviderMasterBase.ProviderMasterID)

	/* UPDATE ProviderMaster and ProviderMasterBase (Uploads to Web) Tables with Updates */
		/* CEP */
	UPDATE ProviderMaster SET 	
		TaxIDIncorporated 	= PMU.TaxIDIncorporated, 
		IncorporatedName	= PMU.IncorporatedName,
		LastName	  	= PMU.LastName,
		FirstName 		= PMU.FirstName, 
		MiddleNameOrInitial	= PMU.MiddleNameOrInitial,
		PreferredName 		= CASE 	WHEN PMU.PreferredName = ' ' 	THEN PMU.FirstName 
						WHEN PMU.PreferredName IS NULL  THEN PMU.FirstName 
						ELSE PMU.PreferredName END,
		Title 			= PMU.Title,
		MaritalStatus		= PMU.MaritalStatus, 
		SpouseName		= PMU.SpouseName, 
		CEPEmailAddress		= CASE 	WHEN PMU.CEPEmail = ' '
							THEN Prov.CEPEMailAddress
						ELSE REPLACE(REPLACE(PMU.CEPEmail,'@@', '@'),' ', '') END, 
		EmailAddress1 	= CASE  WHEN PMU.EmailAddress = ' '
						THEN Prov.EmailAddress1
						ELSE REPLACE(REPLACE(PMU.EmailAddress,'@@', '@'),' ', '') END, 
		CellPhoneNbr		= PMU.CellPhoneNbr, 
		PagerNbr		= PMU.PagerNbr,
		WebID			= CASE 	WHEN PMU.WebID IS NULL 	THEN Prov.WebID
						ELSE PMU.WebID END
		FROM ProviderMaster Prov
		INNER JOIN ProviderMasterUpdate PMU
			ON Prov.ProviderMasterID = PMU.ProviderMasterID
	  	WHERE PMU.UpdatedFlag = 'Y'
		  AND EXISTS
			(SELECT 1 
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMU.ProviderMasterID 	= PMUA.ProviderMasterID
				  AND PMU.TimeStmp 		= PMUA.TimeStmp
				  AND PMU.Author 		= PMUA.Author
				  AND PMUA.UpdatedBaseFlag IS NULL)



		/* CEP */
	UPDATE ProviderMasterBase  SET 	
		TaxIDIncorporated 	= PMU.TaxIDIncorporated,
		IncorporatedName	= PMU.IncorporatedName, 
		LastName	  	= PMU.LastName,
		FirstName 		= PMU.FirstName, 
		MiddleNameOrInitial	= PMU.MiddleNameOrInitial,
		PreferredName 		= CASE 	WHEN PMU.PreferredName = ' '	THEN PMU.FirstName 
						WHEN PMU.PreferredName IS NULL  THEN PMU.FirstName 
						ELSE PMU.PreferredName END,
		Title 			= PMU.Title,
		MaritalStatus		= PMU.MaritalStatus, 
		SpouseName		= PMU.SpouseName, 
		CEPEmail		= CASE 	WHEN PMU.CEPEmail = ' '
							THEN PMB.CEPEMail
						ELSE REPLACE(REPLACE(PMU.CEPEmail,'@@', '@'),' ', '') END,
		EmailAddress 		= CASE  WHEN PMU.EmailAddress = ' '
						THEN PMB.EmailAddress
						ELSE REPLACE(REPLACE(PMU.EmailAddress,'@@', '@'),' ', '') END,  
		CellPhoneNbr		= PMU.CellPhoneNbr, 
		PagerNbr		= PMU.PagerNbr,
		Site1 = CASE 	WHEN Prov.CurrentProviderFlag = 'N' 	THEN ' '
				WHEN PMU.Site1 != ' ' 			THEN PMU.Site1
				WHEN PMU.Site2 != ' ' 			THEN PMU.Site2
				WHEN PMU.Site3 != ' ' 			THEN PMU.Site3
				WHEN PMU.Site4 != ' '			THEN PMU.Site4
				ELSE PMU.Site1 				END,
		Site2 =	CASE 	WHEN Prov.CurrentProviderFlag = 'N' 	THEN ' '
				WHEN PMU.Site2 != ' ' 			THEN PMU.Site2
				WHEN PMU.Site3 != ' ' 			THEN PMU.Site3
				WHEN PMU.Site4 != ' ' 			THEN PMU.Site4
				ELSE PMU.Site2 				END,
		Site3 = CASE 	WHEN Prov.CurrentProviderFlag = 'N' 	THEN ' '
				WHEN PMU.Site3 != ' ' 			THEN PMU.Site3
				WHEN PMU.Site4 != ' ' 			THEN PMU.Site4
				ELSE PMU.Site3 				END,
		Site4 = CASE	WHEN Prov.CurrentProviderFlag = 'N' 	THEN ' '
				ELSE PMU.Site4				END,
		WebID = CASE 	WHEN PMU.WebID IS NULL 			THEN PMB.WebID
				ELSE PMU.WebID 				END,
		Notes = PMU.Notes
		FROM ProviderMasterBase 	PMB
		INNER JOIN ProviderMasterUpdate PMU
			ON PMB.ProviderMasterID = PMU.ProviderMasterID
		INNER JOIN ProviderMaster	Prov
			ON PMB.ProviderMasterID = Prov.ProviderMasterID
	  	WHERE PMU.UpdatedFlag = 'Y'
		  AND EXISTS
			(SELECT 1 FROM ProviderMasterUpdateArchive PMUA
				WHERE PMU.ProviderMasterID 	= PMUA.ProviderMasterID
				  AND PMU.TimeStmp 		= PMUA.TimeStmp
				  AND PMU.Author 		= PMUA.Author
				  AND PMUA.UpdatedBaseFlag IS NULL)


	/* Remove duplicate sites and blank sites in the middle of the listing */
		/* CEP */
	UPDATE ProviderMasterBase SET 
		Site2 = CASE 
			WHEN PMB.Site1  = PMB.Site2
			 AND PMB.Site3  = PMB.Site2
			 AND PMB.Site4  = PMB.Site2 
				THEN ' '
			WHEN PMB.Site1  = PMB.Site2
			 AND PMB.Site3 != PMB.Site2 
				THEN PMB.Site3
			WHEN PMB.Site1  = PMB.Site2
			 AND PMB.Site4 != PMB.Site2 
				THEN PMB.Site4
			ELSE PMB.Site2 END,
		Site3 = CASE
			WHEN PMB.Site3  = PMB.Site1
			 AND PMB.Site3  = PMB.Site2
			  	THEN ' '
			WHEN PMB.Site2  = PMB.Site4
			 AND PMB.Site1  = PMB.Site3
			  	THEN ' '
			WHEN (PMB.Site3  = PMB.Site1
			  OR  PMB.Site3  = PMB.Site2
			  OR  PMB.Site1  = PMB.Site2)
			  AND PMB.Site4 != PMB.Site3
			  	THEN PMB.Site4
			WHEN (PMB.Site3  = PMB.Site1
			  OR  PMB.Site3  = PMB.Site2)
			  AND PMB.Site4 = PMB.Site3
			  	THEN ' '
			ELSE PMB.Site3 END,
		Site4 = CASE
			WHEN PMB.Site4  = PMB.Site1
			  OR PMB.Site4  = PMB.Site2
			  OR PMB.Site4  = PMB.Site3 
			  OR PMB.Site2	= PMB.Site3
			  OR PMB.Site1  = PMB.Site2
			  OR PMB.Site1  = PMB.Site3 THEN ' '
			ELSE PMB.Site4 END
		FROM ProviderMasterBase PMB
		INNER JOIN ProviderMasterUpdate PMU
			ON PMB.ProviderMasterID = PMU.ProviderMasterID


	----/* To account for records that have not processed to the web yet. */
	--DELETE FROM AddressStaging
	--	WHERE EXISTS
	--	(SELECT 1 
	--		FROM ProviderMasterBase PMB
	--		WHERE AddressStaging.ProviderMasterID = PMB.ProviderMasterID
	--		  AND PMB.WebID IS NULL
	--		  AND PMB.Status = 2)
			  
	/* Separated Providers */
	DELETE FROM AddressStaging
		WHERE [Type] IN 
			('Hospital', 
			 'ACC')
		  AND EXISTS
				(SELECT 1 
				FROM ProviderMaster PM
				WHERE AddressStaging.ProviderMasterID = PM.ProviderMasterID
				  AND PM.CurrentProviderFlag = 'N')


	/* Providers with no sites */
	DELETE FROM AddressStaging
		WHERE [Type] IN 
			('Hospital', 
			 'ACC')
		  AND EXISTS
				(SELECT 1 
					FROM ProviderMasterBase PMB
					WHERE AddressStaging.ProviderMasterID = PMB.ProviderMasterID
					  AND PMB.Site1 = '' AND PMB.Site2 = '' 
					  AND PMB.Site3 = '' AND PMB.Site4 = '')


		/* CEP */
	UPDATE AddressStaging	SET 	
		[Type] 						= PMU.AddressType1, 
		AddressForPayrollFlag		= SUBSTRING(PMU.AddressForPayrollFlag1,1,1),
		AddressForNonPayrollFlag	= SUBSTRING(PMU.AddressForNonPayrollFlag1,1,1),
		AddressLine1				= PMU.Address1,
		City						= PMU.City1,
		[State]						= PMU.State1,
		Zip							= PMU.ZipCode1,
		Phone 						= PMU.PhoneNbr1,
		Fax							= PMU.FaxNbr1
		FROM AddressStaging PA
		INNER JOIN ProviderMasterUpdate PMU
			ON PA.ProviderMasterID = PMU.ProviderMasterID
	  	WHERE PMU.UpdatedFlag = 'Y'
		  AND PA.AddressListOrder = 1
	  	  AND EXISTS
			(SELECT 1 
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMU.ProviderMasterID 	= PMUA.ProviderMasterID
				  AND PMU.TimeStmp 		= PMUA.TimeStmp
				  AND PMU.Author 		= PMUA.Author
				  AND PMUA.UpdatedBaseFlag IS NULL)
	
		/* CEP */
	UPDATE AddressStaging
	SET [Type] 					= PMU.AddressType2, 
		AddressForPayrollFlag		= SUBSTRING(PMU.AddressForPayrollFlag2,1,1),
		AddressForNonPayrollFlag	= SUBSTRING(PMU.AddressForNonPayrollFlag2,1,1),
		AddressLine1				= PMU.Address2,
		City						= PMU.City2,
		[State]						= PMU.State2,
		Zip							= PMU.ZipCode2,
		Phone						= PMU.PhoneNbr2,
		Fax							= PMU.FaxNbr2
		FROM AddressStaging PA
		INNER JOIN ProviderMasterUpdate PMU
			 ON PA.ProviderMasterID = PMU.ProviderMasterID
	  	WHERE PMU.UpdatedFlag = 'Y' 
		  AND PA.AddressListOrder = 2
	  	  AND EXISTS
			(SELECT 1 
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMU.ProviderMasterID = PMUA.ProviderMasterID
				  AND PMU.TimeStmp 	= PMUA.TimeStmp
				  AND PMU.Author 	= PMUA.Author
				  AND PMUA.UpdatedBaseFlag IS NULL)

		/* CEP */
	INSERT INTO AddressStaging
		(SFID,
		 ProviderMasterID,
		 [Type],
		 AddressForPayrollFlag,
		 AddressForNonPayrollFlag,
		 AddressLine1,
		 City,
		 [State],
		 Zip,
		 Phone,
		 Fax,
		 AddressListOrder)
	SELECT 	Prov.SFID,
		 PMU.ProviderMasterID,
		 PMU.AddressType2,
		 SUBSTRING(PMU.AddressForPayrollFlag2,1,1),
		 SUBSTRING(PMU.AddressForNonPayrollFlag2,1,1),
		 PMU.Address2,
		 PMU.City2,
		 PMU.State2,
		 PMU.ZipCode2,
		 PMU.PhoneNbr2,
		 PMU.FaxNbr2,
		 2
		FROM ProviderMasterUpdate PMU
		INNER JOIN ProviderMaster Prov
			ON PMU.ProviderMasterID = Prov.ProviderMasterID	
		WHERE PMU.UpdatedFlag = 'Y' 
		  AND PMU.Address2 != ' ' 
		  AND PMU.City2 != ' '
		  AND Prov.CurrentProviderFlag = 'Y'
	  	  AND EXISTS
			(SELECT 1 
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMU.ProviderMasterID = PMUA.ProviderMasterID
				  AND PMU.TimeStmp 	= PMUA.TimeStmp
				  AND PMU.Author 	= PMUA.Author
				  AND PMUA.UpdatedBaseFlag IS NULL)
		  AND NOT EXISTS 
			(SELECT 1
				FROM AddressStaging PA
				WHERE PMU.ProviderMasterID = PA.ProviderMasterID
	 			  AND PA.AddressListOrder = 2)

	
		/* CEP */
	UPDATE AddressStaging SET 	
		[Type]						= PMU.AddressType3, 
		AddressForPayrollFlag		= SUBSTRING(PMU.AddressForPayrollFlag3,1,1),
		AddressForNonPayrollFlag	= SUBSTRING(PMU.AddressForNonPayrollFlag3,1,1),
		AddressLine1				= PMU.Address3,
		City						= PMU.City3,
		[State]						= PMU.State3,
		Zip							= PMU.ZipCode3,
		Phone						= PMU.PhoneNbr3,
		Fax							= PMU.FaxNbr3
		FROM AddressStaging PA
		INNER JOIN ProviderMasterUpdate PMU
			ON PA.ProviderMasterID = PMU.ProviderMasterID
		JOIN ProviderMaster AS PM 
			ON PM.ProviderMasterID = PMU.ProviderMasterID
	  	WHERE PMU.UpdatedFlag = 'Y' 
		  AND PA.AddressListOrder = 3
		  AND PM.CurrentProviderFlag = 'Y'
	  	  AND EXISTS
			(SELECT 1 
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMU.ProviderMasterID = PMUA.ProviderMasterID
				  AND PMU.TimeStmp = PMUA.TimeStmp
				  AND PMU.Author = PMUA.Author
				  AND PMUA.UpdatedBaseFlag IS NULL)

		/* CEP */
	INSERT INTO AddressStaging
		(SFID,
		 ProviderMasterID, 
		 [Type],
		 AddressForPayrollFlag,
		 AddressForNonPayrollFlag,
		 AddressLine1,
		 City,
		 [State],
		 Zip,
		 Phone,
		 Fax,
		 AddressListOrder)
	SELECT 	Prov.SFID,
		 PMU.ProviderMasterID,
		 PMU.AddressType3,
		 SUBSTRING(PMU.AddressForPayrollFlag3,1,1),
		 SUBSTRING(PMU.AddressForNonPayrollFlag3,1,1),
		 PMU.Address3,
		 PMU.City3,
		 PMU.State3,
		 PMU.ZipCode3,
		 PMU.PhoneNbr3,
		 PMU.FaxNbr3, 
		 3
		FROM ProviderMasterUpdate PMU
		INNER JOIN ProviderMaster Prov
			ON PMU.ProviderMasterID = Prov.ProviderMasterID	
		WHERE PMU.UpdatedFlag = 'Y'
		  AND PMU.Address3 != ' '
		  AND PMU.City3 != ' '
		  AND Prov.CurrentProviderFlag = 'Y'
	  	  AND EXISTS
			(SELECT 1 
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMU.ProviderMasterID 	= PMUA.ProviderMasterID
				  AND PMU.TimeStmp 		= PMUA.TimeStmp
				  AND PMU.Author 		= PMUA.Author
				  AND UpdatedBaseFlag IS NULL)
		  AND NOT EXISTS 
			(SELECT 1 
				FROM AddressStaging PA
				WHERE PMU.ProviderMasterID = PA.ProviderMasterID
	 			  AND PA.AddressListOrder = 3)

		


	/* CEP */
	UPDATE ProviderMasterBase SET 
		 AddressType1 			= PMU.AddressType1,
		 Address1 				= PMU.Address1, 
		 City1 					= PMU.City1,
		 State1 				= PMU.State1,
		 ZipCode1 				= PMU.ZipCode1,
		 --Country1 			= PA.Country, 
		 PhoneNbr1 				= PMU.PhoneNbr1, 	
		 FaxNbr1 				= PMU.FaxNbr1,
		 AddressForPayrollFlag1 	= PMU.AddressForPayrollFlag1,
		 AddressForNonPayrollFlag1 	= PMU.AddressForNonPayrollFlag1
		FROM ProviderMasterBase PMB
		INNER JOIN ProviderMasterUpdate PMU
			 ON PMB.ProviderMasterID = PMU.ProviderMasterID
		WHERE PMU.UpdatedFlag = 'Y'


	UPDATE ProviderMasterBase SET 
		 AddressType2 			= PMU.AddressType2,
		 Address2 				= PMU.Address2, 
		 City2 					= PMU.City2,
		 State2 				= PMU.State2,
		 ZipCode2 				= PMU.ZipCode2,
		 --Country1 			= PA.Country, 
		 PhoneNbr2 				= PMU.PhoneNbr2, 	
		 FaxNbr2 				= PMU.FaxNbr2,
		 AddressForPayrollFlag2 	= PMU.AddressForPayrollFlag2,
		 AddressForNonPayrollFlag2 	= PMU.AddressForNonPayrollFlag2
		FROM ProviderMasterBase PMB
		INNER JOIN ProviderMasterUpdate PMU
			 ON PMB.ProviderMasterID = PMU.ProviderMasterID
		WHERE PMU.UpdatedFlag = 'Y'
		

	UPDATE ProviderMasterBase SET 
		 AddressType3 			= PMU.AddressType3,
		 Address3 				= PMU.Address3, 
		 City3 					= PMU.City3,
		 State3 				= PMU.State3,
		 ZipCode3 				= PMU.ZipCode3,
		 --Country1 			= PA.Country, 
		 PhoneNbr3 				= PMU.PhoneNbr3, 	
		 FaxNbr3 				= PMU.FaxNbr3,
		 AddressForPayrollFlag3 	= PMU.AddressForPayrollFlag3,
		 AddressForNonPayrollFlag3	= PMU.AddressForNonPayrollFlag3
		FROM ProviderMasterBase PMB
		INNER JOIN ProviderMasterUpdate PMU
			 ON PMB.ProviderMasterID = PMU.ProviderMasterID
		WHERE PMU.UpdatedFlag = 'Y'

	UPDATE ProviderMasterBase SET 
		AddressType3 			= ' ', 
		Address3 			= ' ',	
		City3 				= ' ', 
		State3 				= ' ', 
		ZipCode3 			= ' ', 
		Country3 			= ' ', 
		PhoneNbr3 			= ' ', 
		FaxNbr3 			= ' ',
		AddressForPayrollFlag3  	= 'No',
		AddressForNonPayrollFlag3 	= 'No'
		WHERE NOT EXISTS
			(SELECT 1 
				FROM AddressStaging  PA
				WHERE ProviderMasterBase.ProviderMasterID = PA.ProviderMasterID 
				  AND PA.AddressListOrder = 3)

	UPDATE ProviderMasterBase SET 
		AddressType2 			= ' ', 
		Address2 			= ' ',	
		City2 				= ' ', 
		State2 				= ' ', 
		ZipCode2 			= ' ', 
		Country2 			= ' ', 
		PhoneNbr2 			= ' ', 
		FaxNbr2 			= ' ',
		AddressForPayrollFlag2  	= 'No',
		AddressForNonPayrollFlag2 	= 'No'
		WHERE NOT EXISTS
			(SELECT 1 
				FROM AddressStaging  PA
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



	/* Medical School */
	/* CEP */
	UPDATE ProviderMasterBase SET 	
		MedSchool = 	CASE 
			WHEN Prov.MedSchool IS NULL THEN ' ' 
			ELSE Prov.MedSchool END,
		Status = 	CASE 
			WHEN Prov.CurrentProviderFlag = 'N' 	THEN '1' 
			ELSE 0 END
		FROM ProviderMaster Prov
		INNER JOIN ProviderMasterBase PMB
			ON Prov.ProviderMasterID = PMB.ProviderMasterID
		WHERE Status <> 2
		
	/*separation for PMB when online application is not completed*/
	UPDATE ProviderMasterBase SET 	
		Status = 	'1'
		FROM ProviderMaster Prov
		INNER JOIN ProviderMasterBase PMB
			ON Prov.ProviderMasterID = PMB.ProviderMasterID
		WHERE Status = 2
		AND Prov.CurrentProviderFlag = 'N'
	

	/* Partnership Level */
		/* CEP */
	UPDATE ProviderMasterBase SET 	
		 CEPLevel = CASE 
			WHEN Prov.PartnershipLevelCode IS NULL THEN ' ' 
			ELSE Prov.PartnershipLevelCode END, 
		 CEPLevelDate 	= Prov.PartnershipLevelDate,
		 HireDate 	= Prov.DateOfHire,
		 Gender 	= Prov.Gender
		FROM ProviderMaster Prov
		INNER JOIN ProviderMasterBase PMB
			ON Prov.ProviderMasterID = PMB.ProviderMasterID

	
	/*Standardize Phone and Fax numbers*/
	
	EXEC usp_SFDC_StandardizeProviderPhones
	

	/* Load All Site Information */

	EXEC usp_LoadProviderSites

	/* Clean Up */
		/* CEP */
	UPDATE ProviderMasterBase SET 
		 TimeStmp = PMU.TimeStmp, 
		 UpdatedFlag = 'Y', 
		 Author = PMU.Author
		FROM ProviderMasterBase PMB
		INNER JOIN ProviderMasterUpdate PMU
			ON PMU.ProviderMasterID = PMB.ProviderMasterID
		WHERE PMU.UpdatedFlag = 'Y'


		/* CEP */
	UPDATE ProviderMasterUpdateArchive SET 
		 UpdatedFlag = 'Y'
		WHERE NOT EXISTS
		(SELECT 1 
			FROM ProviderMasterUpdate PMU
			WHERE PMU.ProviderMasterID = ProviderMasterUpdateArchive.ProviderMasterID)
		  AND UpdatedFlag IS NULL



	/* UPDATE Non CEP, WEP, DEP Providers if not caught earlier*/
	UPDATE ProviderMaster 
		SET CurrentProviderFlag = 'N'
	FROM ProviderMaster Prov
	WHERE NOT EXISTS
			(SELECT 1
				FROM ProviderStatusStaging PS
				WHERE Prov.ProviderMasterID = PS.ProviderMasterID
				  AND PS.Active = 'Y'
			 )
		AND (Prov.StaffStatus NOT LIKE 'CURRENT%'
			OR Prov.StaffStatus NOT LIKE 'Applicant%'
			OR Prov.StaffStatus NOT LIKE 'Suspended%')				
		AND Prov.CurrentProviderFlag = 'Y'

	/* Email Cleanup -- Temporary.  Figure out better solution later. */
	UPDATE ProviderMaster 		
		SET EmailAddress1 = CEPEmailAddress
	WHERE EmailAddress1 LIKE '%CEP.Com%'
	  AND EmailAddress1 != CEPEmailAddress
	  AND CurrentProviderFlag = 'Y'

	UPDATE ProviderMasterBase 	
		SET EmailAddress = CEPEmail
	WHERE EmailAddress LIKE '%CEP.Com%'
	  AND EmailAddress != CEPEmail
	  
	  
	  
	/*UPDATE ARIZONA SITES TO MATCH WEB NEEDS, INFO COMES FROM ECHO THIS WAY*/
	UPDATE PROVIDERMASTERBASE
	SET 	SITE1 = CASE 	WHEN SITE1 = 'DEL3' THEN 'DEL1' 
				WHEN SITE1 = 'BOS3' THEN 'BOS1' ELSE SITE1 END,
		SITE2 = CASE 	WHEN SITE2 = 'DEL3' THEN 'DEL1' 
				WHEN SITE2 = 'BOS3' THEN 'BOS1' ELSE SITE2 END,
		SITE3 = CASE 	WHEN SITE3 = 'DEL3' THEN 'DEL1' 
				WHEN SITE3 = 'BOS3' THEN 'BOS1' ELSE SITE3 END,
		SITE4 = CASE 	WHEN SITE4 = 'DEL3' THEN 'DEL1' 
				WHEN SITE4 = 'BOS3' THEN 'BOS1' ELSE SITE4 END
				
	/*UPDATE SITE PRIMARY SITE FOR OREGON - ADVENTIST*/ 
	UPDATE PROVIDERMASTERBASE
	SET PRIMARYSITE = HR.HospitalName 
	FROM PROVIDERMASTERBASE, Hospital_region HR
	WHERE PROVIDERMASTERBASE.SITE1 = HR.CODE AND 
	PROVIDERMASTERBASE.SITE1 = 'ADV1'

	/*UPDATE SITE PRIMARY SITE FOR GEORGIA - DEKLAB MEDICAL CENTERS*/ 
	UPDATE PROVIDERMASTERBASE
	SET PRIMARYSITE = HR.HospitalName 
	FROM PROVIDERMASTERBASE,  Hospital_region HR
	WHERE PROVIDERMASTERBASE.SITE1 = HR.CODE AND 
	PROVIDERMASTERBASE.SITE1 IN( 'DEK3', 'DEK5')


	/*UPDATE SITE PRIMARY SITE FOR ARIZONA */ 
	UPDATE PROVIDERMASTERBASE
	SET PRIMARYSITE = HR.HospitalName 
	FROM PROVIDERMASTERBASE, Hospital_region HR
	WHERE PROVIDERMASTERBASE.SITE1 = HR.CODE AND 
	PROVIDERMASTERBASE.SITE1 IN('DEL1', 'BOS1')
	
	
	UPDATE PROVIDERMASTERBASE
	SET [STATUS] = 0,
		SITE1 = 'MCN1'
	WHERE PROVIDERMASTERID = 3008
	
	
	UPDATE ProviderMasterBase
	SET AddressForNonPayrollFlag1 = 'Yes',
	AddressForNonPayrollFlag2 = 'No',
	AddressForNonPayrollFlag3 = 'No',
	AddressForPayrollFlag1 = 'Yes',
	AddressForPayrollFlag2 = 'No',
	AddressForPayrollFlag3 = 'No'
	WHERE Status = 2



	update ProviderMasterBase
	set FaxNbr1 = ''
	where FaxNbr1 is null

	update ProviderMasterBase
	set  Address2 = ''
	where Address2 is null

	update ProviderMasterBase
	set City2 = ''
	where City2 is null

	update ProviderMasterBase
	set  State2 = ''
	where State2 is null

	update ProviderMasterBase
	set  ZipCode2 = ''
	where ZipCode2 is null

	update ProviderMasterBase
	set  PhoneNbr2 = ''
	where PhoneNbr2 is null

	update ProviderMasterBase
	set  FaxNbr2 = ''
	where FaxNbr2 is null

	update ProviderMasterBase
	set  MedSchool = ''
	where MedSchool is null


	UPDATE ProviderMasterBase
	SET StaffGroup1 = ''
	WHERE StaffGroup1 IS NULL

	UPDATE ProviderMasterBase
	SET StaffGroup2 = ''
	WHERE StaffGroup2 IS NULL
	
	
	UPDATE ProviderMasterBase
	SET AddressType2 = ''
	where AddressType2 IS NULL


	/* at this point in the process New hires have been loaded, rehires have been updated, Exchange info has been 
	populated - Good time to generate corporate email addreses*/
	
	Exec usp_SFDC_GenerateCorporateEmailForNewHires


END
