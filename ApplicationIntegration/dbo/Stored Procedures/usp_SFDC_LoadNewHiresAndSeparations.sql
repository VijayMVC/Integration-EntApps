
CREATE  PROCEDURE [dbo].[usp_SFDC_LoadNewHiresAndSeparations] 
AS

/* 	Author: 	Reetika
	Date:		4/30/2012
	Purpose:	Load New Hires and Separations into Tables
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	DECLARE @Count			INT,
		@StaffGroup		VARCHAR(50)

	/*Insert records in */
	
	/* New Records */
--New Record "the exists" makes sure only new hires get inserted



	INSERT INTO ProviderMaster
		(SFID,
		SSNFormatted,
		SSNUnformatted,
		LastName,
		FirstName,
		MiddleNameOrInitial,
		PreferredName,
		Title,
		Gender,
		MaritalStatusCode,
		MaritalStatus,
		SpouseName,
		CellPhoneNbr,
		EmailAddress1,
		MultipleClientFlag)
	SELECT 
		SFID,
		SSNFormatted,
		SSNUnformatted,
		LastName,
		FirstName,
		MiddleName,
		PreferredName,
		Title,
		Gender,
		MaritalCode,
		MaritalStatus,
		SpouseName,
		MobilePhone,
		Email,
		MultiClientFlag
	FROM ProviderMasterStaging
	WHERE ProviderMasterID IS NULL
		AND CompleteRecordFlag = 'Y'
		AND SFID <> ''
		AND NOT EXISTS (SELECT 1 FROM ProviderMaster AS PROV
						WHERE Prov.SSNUnformatted = ProviderMasterStaging.SSNUnformatted
							OR Prov.SFID = ProviderMasterStaging.SFID)

--After insert make sure to update SFDC staging tables with the new PMID

	UPDATE ProviderMasterStaging
	SET ProviderMasterStaging.ProviderMasterID = Prov.ProviderMasterID
	FROM  ProviderMaster Prov
	WHERE ProviderMasterStaging.SFID = Prov.SFID
	AND ProviderMasterStaging.ProviderMasterID IS NULL

	UPDATE ProviderStatusStaging
	SET ProviderMasterID = Prov.ProviderMasterID
	FROM  ProviderMaster Prov
	WHERE Prov.SFID = ProviderStatusStaging.SFID
	AND ProviderStatusStaging.ProviderMasterID IS NULL

	UPDATE AffiliationStaging
	SET ProviderMasterID = Prov.ProviderMasterID
	FROM  ProviderMaster Prov
	WHERE Prov.SFID = AffiliationStaging.SFID
	AND AffiliationStaging.ProviderMasterID IS NULL

	UPDATE AddressStaging
	SET ProviderMasterID = Prov.ProviderMasterID
	FROM  ProviderMaster Prov
	WHERE Prov.SFID = AddressStaging.SFID
	AND AddressStaging.ProviderMasterID IS NULL




/* Need to Update Salesforce If Not On Web.  Allows new hires
		that have not been uploaded to the web to continue
		to be updated excluding rehire		
		WebID <> NULL makes sure the provider is not on web yet
		and Not exists makes sure it is not a rehire these will cases where PMB Status
		= 2 and data has   */
		
	UPDATE  ProviderMaster SET 
		LastName 			= SFPM.LastName, 	
		FirstName			= SFPM.FirstName, 
		PreferredName		= SFPM.PreferredName, 
		MiddleNameOrInitial	= SFPM.MiddleName, 	
		Title 				= SFPM.Title, 		
		Gender				= SFPM.Gender,
		SsnFormatted		= SFPM.SSNFormatted, 
		SSNUnformatted		= SFPM.SSNUnformatted, 	
		FormerLastName		= SFPM.OtherLastName, 
		FormerFirstName		= SFPM.OtherFirstName, 
		FormerMiddleName	= SFPM.OtherMiddleName, 	
		MaritalStatus		= SFPM.MaritalStatus,
		MaritalStatusCode	= SFPM.MaritalCode,
		SpouseName			= SFPM.SpouseName, 		
		CellPhoneNbr		= SFPM.MobilePhone,
		EmailAddress1		= CASE WHEN (SFPM.Email Not LIKE '%cep%'
									AND SFPM.Email Not LIKE '%GALEN%')
							THEN SFPM.Email ELSE Prov.EmailAddress1 END		
		FROM  ProviderMasterStaging	SFPM
		INNER JOIN ProviderMaster 		Prov
			ON SFPM.SFID = Prov.SFID
		WHERE Prov.WebID IS NULL
		  AND SFPM.CompleteRecordFlag = 'Y'
		  AND SFPM.SFID != ' '
		  AND NOT EXISTS
			(SELECT 1
				FROM ProviderStatusStaging PS
				WHERE Prov.ProviderMasterID = PS.ProviderMasterID
				  AND PS.WebID IS NOT NULL
				  AND PS.Active = 'Y')

--Get the correct Email Address from SFDC if record still not on Web:

	UPDATE  ProviderMaster
	SET EmailAddress1		= CASE WHEN PS.ForwardingEmail IS NOT NULL
									THEN PS.ForwardingEmail
									ELSE Prov.EmailAddress1 END,
		CEPEmailAddress     = PS.CorporateEmail
		FROM ProviderMasterStaging SFPM
		INNER JOIN ProviderMaster		Prov
			ON SFPM.SFID = Prov.SFID
		INNER JOIN ProviderStatusStaging PS
			ON PS.SFID = Prov.SFID
		WHERE Prov.WebID IS NULL
		  AND SFPM.CompleteRecordFlag = 'Y'
		  AND SFPM.SFID != ' '
		  AND NOT EXISTS
			(SELECT 1
			FROM ProviderStatusStaging PS1
			WHERE Prov.ProviderMasterID = PS1.ProviderMasterID
			  AND PS1.WebID IS NOT NULL
			  AND PS1.Active = 'Y')
				  
				  
	
	/* UPDATE Status AND Hire Date*/

	EXEC usp_SFDC_StatusAndPartnerShipLevel


	
	
	--INSERT INTO PMB with Status = 2 so that it can get uploaded to web and then 
	--go to .Net APP


	INSERT INTO ProviderMasterBase
		(StaffGroup1,
		 StaffGroup2,
		 ProviderMasterID, 
		 WebID,
		 SFID,
		 TaxIDIncorporated,
		 LastName,
		 FirstName,
		 MiddleNameOrInitial,
		 PreferredName,
		 Title,
		 MaritalStatus,
		 SpouseName,
		 EmailAddress,
		 CEPEmail,
		 CellPhoneNbr,
		 PagerNbr,
		 AddressType1,
		 Address1,
		 City1,
		 State1,
		 ZipCode1,
		 Author,
		 TimeStmp,
		 Status)
	SELECT DISTINCT NULL,
		 NULL,	
		 Prov.ProviderMasterID,
		 Prov.WebID,  
		 Prov.SFID,
		 CASE 	WHEN Prov.TaxIDIncorporated IS NULL THEN ' ' 
			ELSE Prov.TaxIDIncorporated END, 
		 Prov.LastName, 
		 Prov.FirstName, 
		 Prov.MiddleNameOrInitial,
		 Prov.PreferredName, 
		 Prov.Title, 
		 Prov.MaritalStatus, 
		 Prov.SpouseName, 
		 Prov.EmailAddress1, 
		 Prov.CEPEmailAddress,
		 Prov.CellPhoneNbr,
		 Prov.PagerNbr,
		 SFAS.[Type],
		 SFAS.AddressLine1,
		 SFAS.City,
		 SFAS.[State],
		 SFAS.Zip,
		'SFDC', 
		 GETDATE(),
		 '2' 
		FROM ProviderMaster Prov
		INNER JOIN ProviderMasterStaging SFPM
			ON Prov.SFID = SFPM.SFID
		INNER JOIN ( SELECT * 
					FROM AddressStaging 
					WHERE [Type] = 'Home'
			) AS SFAS ON Prov.SFID = SFAS.SFID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderMasterBase PMB
				WHERE Prov.ProviderMasterID = PMB.ProviderMasterID)
		  AND Prov.CurrentProviderFlag = 'Y'
		  AND Prov.PartnerShipLevel IS NOT NULL
		  AND Prov.PartnerShipLevel != ' '
		  AND EXISTS
			(SELECT 1 
				FROM AddressStaging SFAS
				WHERE Prov.SFID = SFAS.SFID
				  AND SFAS.AddressListOrder = 1)
		  AND EXISTS
			(SELECT 1
				FROM AffiliationStaging SFAffS
				WHERE Prov.SFID	= SFAffS.SFID)
		  --AND Prov.CREDate > '6/1/2012'

--update StaffGroup when Missing :

	
/* The statement below ensures that a rehire gets the right StaffGroup and Exchange Directory Info*/
	UPDATE ProviderMasterBase
	SET StaffGroup1 = '',
	StaffGroup2 = ''
	WHERE ProviderMasterID IN (SELECT RS.ProviderMasterID 
								FROM RehireStaging RS
								WHERE RS.Rehire = 'Y'
								AND LoadedToOnboard IS NULL)
								
	
	UPDATE ProviderMaster
		SET ExchangeDirectoryName = NULL
	WHERE ProviderMasterID IN (SELECT RS.ProviderMasterID 
								FROM RehireStaging RS
								JOIN ProviderMasterBase PMB
									ON RS.ProviderMasterID = PMB.ProviderMasterID
								WHERE RS.Rehire = 'Y'
								AND LoadedToOnboard IS NULL
								AND PMB.Status <> 0)
								
								
/* The statement below ensures if a provider drops a site the correct StaffGroup is assigned*/

	UPDATE ProviderMasterBase
	SET StaffGroup1 = '',
	StaffGroup2 = ''
	WHERE SFID IN (SELECT SFID 
					FROM AffiliationStaging
					WHERE Active = 'Y'
					AND (CEPSite = 'true'
						OR GalenSite = 'true'))
	AND Status = 0
	AND (Site1 <> '' OR Site2 <> '' OR Site3 <> '' OR Site4 <> '') 


	UPDATE ProviderMasterBase
	SET StaffGroup1 = 'CEP'
	WHERE SFID IN (SELECT SFID
					FROM AffiliationStaging
					WHERE Active = 'Y'
					AND CEPSite = 'true')
				
				
	UPDATE ProviderMasterBase
	SET StaffGroup2 = 'GALEN'
	WHERE SFID IN (SELECT SFID
					FROM AffiliationStaging
					WHERE Active = 'Y'
					AND GalenSite = 'true')


				  
--If the record has not made to Web yet it needs 
--to be updated from SFDC to see if it will make it now?
--CEP and non CEP will be together

	UPDATE  ProviderMasterBase SET 
			LastName 		= Prov.LastName, 	
			FirstName		= Prov.FirstName, 
			PreferredName		= Prov.PreferredName, 
			MiddleNameOrInitial	= Prov.MiddleNameOrInitial, 	
			Title 			= Prov.Title, 		
			EmailAddress		= Prov.EmailAddress1, 		
			PagerNbr		= Prov.PagerNbr, 	
			MaritalStatus		= Prov.MaritalStatus,
			SpouseName		= Prov.SpouseName, 		
			CEPEmail 		= Prov.CEPEmailAddress,
			CellPhoneNbr		= Prov.CellPhoneNbr
			FROM ProviderMasterStaging	SFPM
			INNER JOIN ProviderMaster 			Prov
				 ON SFPM.SFID = Prov.SFID
			INNER JOIN ProviderMasterBase			PMB
				 ON Prov.ProviderMasterID = PMB.ProviderMasterID
			WHERE SFPM.CompleteRecordFlag = 'Y'
			  AND Prov.WebID IS NULL
	 		  AND SFPM.ActiveFlag = 'Y'
			  AND NOT EXISTS
				(SELECT 1
					FROM ProviderStatusStaging PS
					WHERE Prov.SFID = PS.SFID
					  AND PS.WebID IS NOT NULL
					  AND PS.Active = 'Y')
				  

/* Clean Up on SSNs */
	UPDATE  ProviderMaster SET 
			SsnFormatted		= SFPM.SsnFormatted, 
			SSNUnformatted		= SFPM.SSNUnformatted		
		FROM  ProviderMasterStaging	SFPM
		INNER JOIN ProviderMaster 		Prov
			ON SFPM.SFID = Prov.SFID
		WHERE SFPM.SSNFormatted != Prov.SSNformatted
		

--Set Current Provider Flag = 'N' marks Separation

	UPDATE ProviderMaster SET
		CurrentProviderFlag = 'N'
		WHERE NOT EXISTS
		(SELECT * 
			FROM ProviderStatusStaging PS
			WHERE [To] IS NULL
			AND ProviderMaster.ProviderMasterID = PS.ProviderMasterID)
		  AND CurrentProviderFlag = 'Y'
		  
		  
-- Load Site information for New Hires

/* New Hires */

	/* New Hires - CASE 1 - CEP updates
					CASE 2 - GALEN Updates*/
	UPDATE ProviderMasterBase
	SET Site1 = HR.Code
	FROM ProviderMasterBase AS PMB
	INNER JOIN (SELECT * 
				FROM AffiliationStaging 
				WHERE CEPSite = 'true'
	)AS Aff ON Aff.SFID = PMB.SFID
	INNER JOIN (SELECT * 
				FROM Hospital_region 
				WHERE HospitalName NOT LIKE '%Hospitalist'
						AND HospitalName NOT LIKE '%Galen%'
	) HR ON HR.SFID = Aff.SiteSFID
	WHERE PMB.Status = 2
	AND Aff.Active = 'Y'
	
	UPDATE ProviderMasterBase
	SET Site1 = HR.Code
	FROM ProviderMasterBase AS PMB
	INNER JOIN (SELECT * 
				FROM AffiliationStaging 
				WHERE GalenSite = 'true'
	)AS Aff ON Aff.SFID = PMB.SFID
	INNER JOIN (SELECT * 
				FROM Hospital_region 
				WHERE HospitalName LIKE '%Hospitalist'
						AND HospitalName NOT LIKE '%Galen%'
	) HR ON HR.SFID = Aff.SiteSFID
	WHERE PMB.Status = 2
	AND Aff.Active = 'Y'

	
	UPDATE ProviderMasterBase
	SET Site2 = HR.Code
	FROM ProviderMasterBase AS PMB
	INNER JOIN (SELECT * 
				FROM AffiliationStaging 
				WHERE CEPSite = 'true'
	)AS Aff ON Aff.SFID = PMB.SFID
	INNER JOIN (SELECT * 
				FROM Hospital_region 
				WHERE HospitalName NOT LIKE '%Hospitalist'
						AND HospitalName NOT LIKE '%Galen%'
	) HR ON HR.SFID = Aff.SiteSFID
	WHERE PMB.Status = 2
	AND Aff.Active = 'Y'
	AND (Site1 <> HR.Code )
	
	
	UPDATE ProviderMasterBase
	SET Site2 = HR.Code
	FROM ProviderMasterBase AS PMB
	INNER JOIN (SELECT * 
				FROM AffiliationStaging 
				WHERE GalenSite = 'true'
	)AS Aff ON Aff.SFID = PMB.SFID
	INNER JOIN (SELECT * 
				FROM Hospital_region 
				WHERE HospitalName LIKE '%Hospitalist'
						AND HospitalName NOT LIKE '%Galen%'
	) HR ON HR.SFID = Aff.SiteSFID
	WHERE PMB.Status = 2
	AND Aff.Active = 'Y'
	AND (Site1 <> HR.Code )
	
	UPDATE ProviderMasterBase
	SET Site3 = HR.Code
	FROM ProviderMasterBase AS PMB
	INNER JOIN (SELECT * 
				FROM AffiliationStaging 
				WHERE CEPSite = 'true'
	)AS Aff ON Aff.SFID = PMB.SFID
	INNER JOIN (SELECT * 
				FROM Hospital_region 
				WHERE HospitalName NOT LIKE '%Hospitalist'
						AND HospitalName NOT LIKE '%Galen%'
	) HR ON HR.SFID = Aff.SiteSFID
	WHERE PMB.Status = 2
	AND Aff.Active = 'Y'
	AND (Site1 <> HR.Code 
		AND Site2 <> HR.Code)


	UPDATE ProviderMasterBase
	SET Site3 = HR.Code
	FROM ProviderMasterBase AS PMB
	INNER JOIN (SELECT * 
				FROM AffiliationStaging 
				WHERE GalenSite = 'true'
	)AS Aff ON Aff.SFID = PMB.SFID
	INNER JOIN (SELECT * 
				FROM Hospital_region 
				WHERE HospitalName LIKE '%Hospitalist'
						AND HospitalName NOT LIKE '%Galen%'
	) HR ON HR.SFID = Aff.SiteSFID
	WHERE PMB.Status = 2
	AND Aff.Active = 'Y'
	AND (Site1 <> HR.Code 
		AND Site2 <> HR.Code)
	
	UPDATE ProviderMasterBase
	SET Site4 = HR.Code
	FROM ProviderMasterBase AS PMB
	INNER JOIN (SELECT * 
				FROM AffiliationStaging 
				WHERE CEPSite = 'true'
	)AS Aff ON Aff.SFID = PMB.SFID
	INNER JOIN (SELECT * 
				FROM Hospital_region 
				WHERE HospitalName NOT LIKE '%Hospitalist'
						AND HospitalName NOT LIKE '%Galen%'
	) HR ON HR.SFID = Aff.SiteSFID
	WHERE PMB.Status = 2
	AND Aff.Active = 'Y'
	AND (Site1 <> HR.Code 
		AND Site2 <> HR.Code
		AND Site3 <> HR.Code)
	
	
	UPDATE ProviderMasterBase
	SET Site4 = HR.Code
	FROM ProviderMasterBase AS PMB
	INNER JOIN (SELECT * 
				FROM AffiliationStaging 
				WHERE GalenSite = 'true'
	)AS Aff ON Aff.SFID = PMB.SFID
	INNER JOIN (SELECT * 
				FROM Hospital_region 
				WHERE HospitalName LIKE '%Hospitalist'
						AND HospitalName NOT LIKE '%Galen%'
	) HR ON HR.SFID = Aff.SiteSFID
	WHERE PMB.Status = 2
	AND Aff.Active = 'Y'
	AND (Site1 <> HR.Code 
		AND Site2 <> HR.Code
		AND Site3 <> HR.Code)


/* The code below generates the corporate email address for a new Hire

Moved this process to generate email addresses after New Hires and Rehires have been loaded. Also their exchange in for needs to be updated by now.

	Execute usp_SFDC_GenerateCorporateEmailForNewHires*/



				
END

