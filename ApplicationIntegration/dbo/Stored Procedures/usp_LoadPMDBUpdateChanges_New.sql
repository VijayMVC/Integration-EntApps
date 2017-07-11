USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_LoadPMDBUpdateChanges_New]    Script Date: 11/11/2016 11:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE [dbo].[usp_LoadPMDBUpdateChanges_New] 
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
		EmailAddress1   = PMU.EmailAddress,
		CEPEmailAddress		= CASE 	WHEN PMU.CEPEmail = ' '
							THEN Prov.CEPEMailAddress
						ELSE REPLACE(REPLACE(PMU.CEPEmail,'@@', '@'),' ', '') END, 
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
		EmailAddress    = PMU.EmailAddress,
		CEPEmail		= CASE 	WHEN PMU.CEPEmail = ' '
							THEN PMB.CEPEMail
						ELSE REPLACE(REPLACE(PMU.CEPEmail,'@@', '@'),' ', '') END,
		CellPhoneNbr		= PMU.CellPhoneNbr, 
		PagerNbr		= PMU.PagerNbr,
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
	
	
	
				  
	/* Update SiteChanges to the siteBase table*/
	--Update webID
	
	UPDATE SiteBase
	SET WebID = PMB.WebID
	FROM ProviderMasterBase PMB
	WHERE PMB.ProviderMasterID = SiteBase.ProviderMasterID
	
	 
	
	--DROP SITE
	--DELETE
	--FROM SiteBase
	--WHERE EXISTS (SELECT 1
	--				FROM SiteUpdateLog SUL
	--				WHERE SUL.SiteAction = 'DROP - SITE'
	--				AND SUL.ProviderMasterID = SiteBase.ProviderMasterID
	--				AND SUL.WebCode = SiteBase.WebCode)
	--AND ProviderMasterID IN (SELECT ProviderMasterID 
	--						FROM ProviderMasterUpdate PMU
	--						WHERE UpdatedFlag = 'Y'
	--							AND EXISTS	(SELECT 1 FROM ProviderMasterUpdateArchive PMUA				
	--											WHERE PMU.ProviderMasterID 	= PMUA.ProviderMasterID
	--											  AND PMU.TimeStmp 		= PMUA.TimeStmp
	--											  AND PMU.Author 		= PMUA.Author
	--											  AND PMUA.UpdatedBaseFlag IS NULL)	)
	
													  
	DELETE FROM SiteBase
	WHERE Convert(varchar(10),ProviderMasterID) + '' + Webcode IN ( 												  
	SELECT Convert(varchar(10),SB.ProviderMasterID) + '' + SB.Webcode
	FROM SiteBase SB
	JOIN SiteUpdateLog SUL ON SB.ProviderMasterID = SUL.ProviderMasterID
				AND SUL.WebCode = SB.WebCode
	WHERE SUL.SiteAction = 'DROP - SITE'
	AND EXISTS	(SELECT 1 FROM ProviderMasterUpdate PMU
				WHERE SUL.ProviderMasterID 	= PMU.ProviderMasterID
				  AND SUL.TimeStmp 		= PMU.TimeStmp
				  AND SUL.Author 		= PMU.Author
				  AND PMU.UpdatedFlag = 'Y'))
	
	
	
					
	/*If there is an entry in ProviderMasterUpdate table but no entry in SiteUpdate table then it 
	is an all site drop*/
	
	DELETE FROM SiteBase
	WHERE ProviderMasterID NOT IN (SELECT ProviderMasterID
								FROM SiteUpdates)
	AND ProviderMasterID IN (SELECT ProviderMasterID
						FROM ProviderMasterUpdate PMU
						WHERE UpdatedFlag = 'Y'
						AND EXISTS (SELECT 1 FROM ProviderMasterUpdateArchive PMUA
								WHERE PMU.ProviderMasterID 	= PMUA.ProviderMasterID
								  AND PMU.TimeStmp 		= PMUA.TimeStmp
								  AND PMU.Author 		= PMUA.Author
								  AND PMUA.UpdatedBaseFlag IS NULL))
						
	--Add Site
	
	INSERT INTO SiteBase
	SELECT PMB.SFID,
		SUL.ProviderMasterID,
		PMB.WebID,
		HR.SFID,
		LTRIM(RTRIM(HR.Code)),
		HR.SFDCName,
		SUL.PrimarySite
	FROM SiteUpdateLog SUL
	JOIN ProviderMasterBase PMB ON SUL.ProviderMasterID = PMB.ProviderMasterID
	JOIN Hospital_region HR ON HR.Code = SUL.WebCode
	WHERE SiteAction = 'ADD - SITE'
	AND SUL.SentFlag IS NULL
	AND SUL.ProviderMasterID IN (SELECT ProviderMasterID 
							FROM ProviderMasterUpdate PMU
							WHERE UpdatedFlag = 'Y'
								AND TimeStmp = SUL.TimeStmp
								AND EXISTS	(SELECT 1 FROM ProviderMasterUpdateArchive PMUA				
												WHERE PMU.ProviderMasterID 	= PMUA.ProviderMasterID
												  AND PMU.TimeStmp 		= PMUA.TimeStmp
												  AND PMU.Author 		= PMUA.Author
												  AND PMUA.UpdatedBaseFlag IS NULL)	)
	
	
	--Update SiteBase for Primary Site
	/*11/16/2015 -- Added a siple update for Primary sites based on the list of sites coming in from Web Portal.
	Once Add Site and Drop Site has been completed it is just a matter of updating the flag*/
	UPDATE SiteBase
	SET PrimarySite = SU.PrimarySite
	FROM SiteUpdates SU
	WHERE SU.ProviderMasterID = SiteBase.ProviderMasterID
	AND SU.WebCode = SiteBase.WebCode
	
	--SELECT SUL.ProviderMasterID, SUL.WebCode, SUL.PrimarySite
	--INTO #PrimarySite
	--FROM SiteBase, SiteUpdateLog SUL
	--WHERE SUL.PrimarySite = 'Y'
	--AND SUL.ProviderMasterID = SiteBase.ProviderMasterID
	--AND LTRIM(RTRIM(SUL.WebCode)) = LTRIM(RTRIM(SiteBase.WebCode))
	--AND SUL.SiteAction = 'ADD - SITE'
	--AND SUL.TimeStmp IN (SELECT MAX(TimeStmp) 
	--					FROM SiteUpdateLog SUL2
	--					WHERE SUL2.ProviderMasterID = SUL.ProviderMasterID
	--					AND SUL2.PrimarySite = 'Y')
	--AND SiteBase.PrimarySite <> 'Y'
	
	--UPDATE SiteBase
	--SET PrimarySite = 'N'
	--WHERE ProviderMasterID IN (SELECT ProviderMasterID FROM #PrimarySite) 
	
	--UPDATE SiteBase
	--SET PrimarySite = 'Y'
	--FROM #PrimarySite PS
	--WHERE SiteBase.ProviderMasterID = PS.ProviderMasterID
	--AND  SiteBase.WebCode = PS.WebCode
	
	--DROP TABLE #PrimarySite

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
		  AND NOT EXISTS
				(SELECT 1 
					FROM SiteBase SB
					WHERE AddressStaging.ProviderMasterID = SB.ProviderMasterID )


		/* CEP */
	UPDATE AddressStaging	SET 	
		[Type] 						= 'Home', 
		AddressForPayrollFlag		= 'N',
		AddressForNonPayrollFlag	= 'N',
		AddressLine1				= PMU.Address1,
		City						= PMU.City1,
		[State]						= PMU.State1,
		Zip							= PMU.ZipCode1,
		Phone 						= PMU.PhoneNbr1
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
	SET [Type] 					= 'Mailing', 
		AddressForPayrollFlag		= 'Y',
		AddressForNonPayrollFlag	= 'Y',
		AddressLine1				= PMU.Address2,
		City						= PMU.City2,
		[State]						= PMU.State2,
		Zip							= PMU.ZipCode2,
		Phone						= PMU.PhoneNbr2
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
		 AddressListOrder)
	SELECT 	Prov.SFID,
		 PMU.ProviderMasterID,
		 'Mailing',
		 'Y',
		 'Y',
		 PMU.Address2,
		 PMU.City2,
		 PMU.State2,
		 PMU.ZipCode2,
		 PMU.PhoneNbr2,
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
	UPDATE ProviderMasterBase SET 
		 AddressType1 			= 'Home',
		 Address1 				= PMU.Address1, 
		 City1 					= PMU.City1,
		 State1 				= PMU.State1,
		 ZipCode1 				= PMU.ZipCode1,
		 PhoneNbr1 				= PMU.PhoneNbr1,
		 AddressForPayrollFlag1 	= 'No',
		 AddressForNonPayrollFlag1 	= 'No'
		FROM ProviderMasterBase PMB
		INNER JOIN ProviderMasterUpdate PMU
			 ON PMB.ProviderMasterID = PMU.ProviderMasterID
		WHERE PMU.UpdatedFlag = 'Y'


	UPDATE ProviderMasterBase SET 
		 AddressType2 			= 'Mailing',
		 Address2 				= PMU.Address2, 
		 City2 					= PMU.City2,
		 State2 				= PMU.State2,
		 ZipCode2 				= PMU.ZipCode2,
		 PhoneNbr2 				= PMU.PhoneNbr2, 	
		 AddressForPayrollFlag2 	= 'Yes',
		 AddressForNonPayrollFlag2 	= 'Yes'
		FROM ProviderMasterBase PMB
		INNER JOIN ProviderMasterUpdate PMU
			 ON PMB.ProviderMasterID = PMU.ProviderMasterID
		WHERE PMU.UpdatedFlag = 'Y'
		

	UPDATE ProviderMasterBase
		SET AddressForPayrollFlag1 = CASE 
			WHEN AddressForPayrollFlag1 = 'Y' THEN 'Yes'
			WHEN AddressForPayrollFlag1 = 'N' THEN 'No' 
			ELSE AddressForPayrollFlag1 END,
		AddressForPayrollFlag2 = CASE 
			WHEN AddressForPayrollFlag2 = 'Y' THEN 'Yes'	
			WHEN AddressForPayrollFlag2 = 'N' THEN 'No' 
			ELSE AddressForPayrollFlag2 END,
		AddressForNonPayrollFlag1 = CASE 
			WHEN AddressForNonPayrollFlag1 = 'Y' THEN 'Yes'	
			WHEN AddressForNonPayrollFlag1 = 'N' THEN 'No' 
			ELSE AddressForNonPayrollFlag1 END,
		AddressForNonPayrollFlag2 = CASE 
			WHEN AddressForNonPayrollFlag2 = 'Y' THEN 'Yes'
			WHEN AddressForNonPayrollFlag2 = 'N' THEN 'No' 
			ELSE AddressForNonPayrollFlag2 END



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
		
		
	/*separation for PMB when provider transitions to Locum*/
	UPDATE ProviderMasterBase SET 	
		Status = 	'1'
		FROM ProviderMaster Prov
		INNER JOIN ProviderMasterBase PMB
			ON Prov.ProviderMasterID = PMB.ProviderMasterID
		WHERE Prov.PartnershipLevel = 'Locum Tenen'
	

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

	EXEC usp_LoadProviderSites_New

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
		AND Prov.StaffStatus LIKE 'Former%'			
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
	
	
	--UPDATE PROVIDERMASTERBASE
	--SET [STATUS] = 0,
	--	SITE1 = 'MCN1'
	--WHERE PROVIDERMASTERID = 3008
	
	
	UPDATE ProviderMasterBase
	SET AddressForNonPayrollFlag1 = 'No',
	AddressForNonPayrollFlag2 = 'Yes',
	AddressForNonPayrollFlag3 = 'No',
	AddressForPayrollFlag1 = 'No',
	AddressForPayrollFlag2 = 'Yes',
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
	
	UPDATE ProviderMasterBase
	SET LastName = LTRIM(RTRIM(LastName)),
	FirstName = LTRIM(RTRIM(FirstName))
	
	--Preferred Name = First Name
	
	UPDATE ProviderMasterBase
	SET PreferredName = FirstName
	WHERE (PreferredName = ''
		OR PreferredName IS NULL)
		AND FirstName IS NOT NULL
		AND FirstName <> ''
		
	UPDATE ProviderMaster
	SET PreferredName = EB.PreferredName 
	FROM EmployeeBase EB 
	WHERE ProviderMaster.ProviderMasterID = EB.ProviderMasterID
		
	
	UPDATE ProviderMaster
	SET PreferredName = PMB.PreferredName 
	FROM ProviderMasterBase PMB 
	WHERE ProviderMaster.ProviderMasterID = PMB.ProviderMasterID
	
	
	UPDATE ProviderMaster
	SET PreferredName = FirstName
	WHERE (PreferredName = ''
		OR PreferredName IS NULL)
		AND FirstName IS NOT NULL
		AND FirstName <> ''

	/* at this point in the process New hires have been loaded, rehires have been updated, Exchange info has been 
	populated - Good time to generate corporate email addreses*/
	
	Exec usp_SFDC_GenerateCorporateEmailForNewHires


END
