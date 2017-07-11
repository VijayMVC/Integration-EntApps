


CREATE  PROCEDURE [dbo].[usp_Onboard_UpdatePMDB_New] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Update ProviderMaster and PMB from data coming from 
				Onboard Application
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN


	UPDATE  ProviderMaster SET 
		LastName 			= LTRIM(RTRIM(PA.LastName)), 	
		FirstName			= LTRIM(RTRIM(PA.FirstName)), 
		PreferredName		= LTRIM(RTRIM(PA.PreferredName)),
		MiddleNameOrInitial	= LTRIM(RTRIM(PA.MiddleName)), 	
		Title 				= LTRIM(RTRIM(PA.ProfessionalTitle)), 		
		Gender				= LTRIM(RTRIM(PA.Gender)),
		DateOfBirth			= Convert(Datetime, PA.DOB),
		CEPEmailAddress		= LTRIM(RTRIM(PA.Email1)),
		EmailAddress1		= LTRIM(RTRIM(PA.Email2)),
		EmailAddress2		= LTRIM(RTRIM(PA.Email2)),
		FormerLastName		= LTRIM(RTRIM(PA.OtherLastName1)), 
		FormerFirstName		= LTRIM(RTRIM(PA.OtherFirstName1)), 
		FormerMiddleName	= LTRIM(RTRIM(PA.OtherMiddleName1)), 	
		SpouseName			= LTRIM(RTRIM(PA.PartnerName)), 		
		CellPhoneNbr		= LTRIM(RTRIM(PA.MobileNbr)),
		NationalID			= LTRIM(RTRIM(PA.NPINum)),
		MaritalStatus		= LTRIM(RTRIM(PA.MaritalStatus)),
		UPDDate				= GETDATE()
		FROM  AppStaging.dbo.OnboardProviderAccountForSFDC	PA
		INNER JOIN ProviderMaster 		Prov
			ON PA.SFID = Prov.SFID
		INNER JOIN ProviderMasterBase PMB 
			ON PMB.ProviderMasterID = Prov.ProviderMasterID
		WHERE Prov.WebID IS NOT NULL
		  AND PA.SF_Flag = 'Ready4SF'
		  AND PMB.Status = 2
		  

	UPDATE  ProviderMasterBase SET 
			LastName 					= Prov.LastName, 	
			FirstName					= Prov.FirstName, 
			PreferredName				= Prov.PreferredName, 
			MiddleNameOrInitial			= Prov.MiddleNameOrInitial, 	
			Title 						= Prov.Title, 		
			EmailAddress				= Prov.EmailAddress1, 		
			PagerNbr					= Prov.PagerNbr, 	
			MaritalStatus				= Prov.MaritalStatus,
			SpouseName					= Prov.SpouseName, 
			Gender						= Prov.Gender,		
			CEPEmail 					= Prov.CEPEmailAddress,
			CellPhoneNbr				= Prov.CellPhoneNbr,
			AddressType1				= 'Home',
			AddressForPayrollFlag1		= 'No',
			AddressForNonPayrollFlag1	= 'No',
			Address1					= LTRIM(RTRIM(PA.PrimaryAddress)) + ' ' + LTRIM(RTRIM(PA.PrimarySuite)),
			City1						= LTRIM(RTRIM(PA.PrimaryCity)),
			State1						= LTRIM(RTRIM(PA.PrimaryState)),
			ZipCode1					= LTRIM(RTRIM(PA.PrimaryZipCode)),
			PhoneNbr1					= LTRIM(RTRIM(PA.PhoneNbr)),
			FaxNbr1						= LTRIM(RTRIM(PA.FaxNbr)),
			AddressType2				= 'Mailing',
			AddressForPayrollFlag2		= 'Yes',
			AddressForNonPayrollFlag2	= 'Yes',
			Address2					= LTRIM(RTRIM(PA.PrimaryAddress)) + ' ' + LTRIM(RTRIM(PA.PrimarySuite)),
			City2						= LTRIM(RTRIM(PA.PrimaryCity)),
			State2						= LTRIM(RTRIM(PA.PrimaryState)),
			ZipCode2					= LTRIM(RTRIM(PA.PrimaryZipCode)),
			PhoneNbr2					= LTRIM(RTRIM(PA.PhoneNbr)),
			HireDate					= Prov.DateOfHire
			FROM  AppStaging.dbo.OnboardProviderAccountForSFDC	PA
			INNER JOIN ProviderMaster 			Prov
				 ON PA.SFID = Prov.SFID
			INNER JOIN ProviderMasterBase			PMB
				 ON Prov.ProviderMasterID = PMB.ProviderMasterID
			WHERE Prov.WebID IS NOT NULL
			  AND PA.SF_Flag = 'Ready4SF'
			  AND PMB.Status = 2
			  
			  
			  
	UPDATE  ProviderMasterBase SET 
			Address2  = LTRIM(RTRIM(PA.SecondaryAddress)) + ' ' + LTRIM(RTRIM(PA.SecondarySuite)),
			City2	  = LTRIM(RTRIM(PA.SecondaryCity)),
			State2	  = LTRIM(RTRIM(PA.SecondaryState)),
			ZipCode2  = LTRIM(RTRIM(PA.SecondaryZipCode)),
			PhoneNbr2 = LTRIM(RTRIM(PA.PhoneNbr2))
		FROM  AppStaging.dbo.OnboardProviderAccountForSFDC	PA
		INNER JOIN ProviderMaster 			Prov
			 ON PA.SFID = Prov.SFID
		INNER JOIN ProviderMasterBase			PMB
			 ON Prov.ProviderMasterID = PMB.ProviderMasterID
		WHERE Prov.WebID IS NOT NULL
			  AND PA.SF_Flag = 'Ready4SF'
			  AND PMB.Status = 2
			  AND PA.MailingAddress = 'secondary'
			  
			  
			
		
			  
			  
			  
			
			UPDATE ProviderMasterBase
			SET Status = 0
			WHERE SFID IN (SELECT SFID
									FROM AppStaging.dbo.OnboardProviderAccountForSFDC
									WHERE SF_Flag = 'Ready4SF')
			AND Status = 2




				
END



