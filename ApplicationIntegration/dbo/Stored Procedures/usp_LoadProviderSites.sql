CREATE PROCEDURE [dbo].[usp_LoadProviderSites] 
AS

/* 	Author: 	Reetika	
	Date:		4/30/2012
	Purpose:	Load Provider Site Information
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	DECLARE 	@COUNT 		INT
			

	--/* Rehires */
	--DELETE	FROM ProviderSiteLocationStaffGroup
	--	WHERE EXISTS
	--		(SELECT 1 
	--			FROM StaffHistory SH
	--			WHERE SH.ProviderMasterID 	= ProviderSiteLocationStaffGroup.ProviderMasterID
	--			  AND SH.StaffGroup 		= ProviderSiteLocationStaffGroup.StaffGroup 
	--			  AND SH.ActiveFlag = 'Y')
	--	  AND NOT EXISTS
	--		(SELECT 1 
	--			FROM AppStaging.dbo.StaffHistoryPrior SH2				
	--			WHERE SH2.ProviderMasterID 	= ProviderSiteLocationStaffGroup.ProviderMasterID
	--			  AND SH2.StaffGroup 		= ProviderSiteLocationStaffGroup.StaffGroup 
	--			  AND SH2.ActiveFlag = 'Y')

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
	) HR ON HR.SFID = Aff.SiteSFID
	WHERE PMB.Status = 2
	AND Aff.Active = 'Y'
	AND (Site1 <> HR.Code 
		AND Site2 <> HR.Code
		AND Site3 <> HR.Code)

	/* Update Site1 Information from Download */
		/* CEP */
	UPDATE ProviderMasterBase SET 
		Site1 =  PMU.Site1
		FROM 	ProviderMasterUpdate 			PMU
		INNER JOIN	ProviderMasterBase 		PMB
			ON PMU.ProviderMasterID = PMB.ProviderMasterID
		WHERE PMU.UpdatedFlag = 'Y'
		  AND EXISTS
			(SELECT 1 
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMU.ProviderMasterID 	= PMUA.ProviderMasterID
			 	  AND PMU.TimeStmp		= PMUA.TimeStmp
				  AND PMU.Author 		= PMUA.Author
				  AND PMUA.UpdatedBaseFlag IS NULL)



	/* Update with new values */
		/* CEP */
	UPDATE ProviderMasterBase SET 
		Site2 = PMU.Site2
		FROM 	ProviderMasterUpdate 		PMU
		INNER JOIN	ProviderMasterBase 	PMB
			ON PMU.ProviderMasterID = PMB.ProviderMasterID
		WHERE PMU.UpdatedFlag = 'Y'
		  AND EXISTS
			(SELECT 1 
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMU.ProviderMasterID 	= PMUA.ProviderMasterID
			 	  AND PMU.TimeStmp		= PMUA.TimeStmp
				  AND PMU.Author 		= PMUA.Author
				  AND PMUA.UpdatedBaseFlag IS NULL)

		/* CEP */
	UPDATE ProviderMasterBase SET 
		Site3 = PMU.Site3
		FROM 	ProviderMasterUpdate 		PMU
		INNER JOIN	ProviderMasterBase 	PMB
			ON PMU.ProviderMasterID = PMB.ProviderMasterID
		WHERE PMU.UpdatedFlag = 'Y'
		  AND EXISTS
			(SELECT 1 
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMU.ProviderMasterID 	= PMUA.ProviderMasterID
			 	  AND PMU.TimeStmp		= PMUA.TimeStmp
				  AND PMU.Author 		= PMUA.Author
				  AND PMUA.UpdatedBaseFlag IS NULL)

		/* CEP */
	UPDATE ProviderMasterBase SET 
		Site4 = PMU.Site4
		FROM 	ProviderMasterUpdate 		PMU
		INNER JOIN	ProviderMasterBase 	PMB
			ON PMU.ProviderMasterID = PMB.ProviderMasterID
		WHERE PMU.UpdatedFlag = 'Y'
		  AND EXISTS
			(SELECT 1 
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMU.ProviderMasterID 	= PMUA.ProviderMasterID
			 	  AND PMU.TimeStmp		= PMUA.TimeStmp
				  AND PMU.Author 		= PMUA.Author
				  AND PMUA.UpdatedBaseFlag IS NULL)



		/* CEP */
	UPDATE ProviderMasterbase SET 
		Site1 = CASE 
			WHEN Site1 IS NULL THEN ' '
			ELSE Site1 END,
		Site2 = CASE 
			WHEN Site2 IS NULL THEN ' '
			ELSE Site2 END,
		Site3 = CASE 
			WHEN Site3 IS NULL THEN ' '
			ELSE Site3 END,
		Site4 = CASE 
			WHEN Site4 IS NULL THEN ' '
			ELSE Site4 END


		/* CEP */
	INSERT INTO ProviderMasterUpdateArchive
		(InternalUpdateFlag,
		SentValueChanged,
		StaffGroup1,
		StaffGroup2,
		ProviderMasterID, 
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
		Country1, 
		PhoneNbr1, 
		FaxNbr1, 
		AddressType2, 
		AddressForPayrollFlag2, 
		AddressForNonPayrollFlag2, 
		Address2, 
		City2, 
		State2, 
		ZipCode2, 
		Country2, 
		PhoneNbr2, 
		FaxNbr2, 
		AddressType3, 
		AddressForPayrollFlag3, 
		AddressForNonPayrollFlag3, 
		Address3, 
		City3, 
		State3, 
		ZipCode3, 
		Country3, 
		PhoneNbr3, 
		FaxNbr3, 
		PrimarySite, 
		Site1, 
		Site2, 
		Site3,
		Site4, 
		Site1Old, 
		Site2Old, 
		Site3Old,
		Site4Old, 
		TimeStmp, 
		Author, 
		UpdatedFlag)
	SELECT  'Y',
		'Y',
		PMB.StaffGroup1,
		PMB.StaffGroup2,
		PMB.ProviderMasterID, 
		PMB.WebID,
		PMB.TaxIDIncorporated, 
		PMB.LastName, 
		PMB.FirstName, 
		PMB.MiddleNameOrInitial, 
		PMB.PreferredName, 
		PMB.IncorporatedName, 
		PMB.Title, 
		PMB.MaritalStatus, 
		PMB.SpouseName, 
		PMB.EmailAddress, 
		PMB.CEPEmail, 
		PMB.CellPhoneNbr, 
		PMB.PagerNbr, 
		PMB.AddressType1, 
		PMB.AddressForPayrollFlag1, 
		PMB.AddressForNonPayrollFlag1, 
		PMB.Address1, 
		PMB.City1, 
		PMB.State1, 
		PMB.ZipCode1, 
		PMB.Country1, 
		PMB.PhoneNbr1, 
		PMB.FaxNbr1, 
		PMB.AddressType2, 
		PMB.AddressForPayrollFlag2, 
		PMB.AddressForNonPayrollFlag2, 
		PMB.Address2, 
		PMB.City2, 
		PMB.State2, 
		PMB.ZipCode2, 
		PMB.Country2, 
		PMB.PhoneNbr2, 
		PMB.FaxNbr2, 
		PMB.AddressType3, 
		PMB.AddressForPayrollFlag3, 
		PMB.AddressForNonPayrollFlag3, 
		PMB.Address3, 
		PMB.City3, 
		PMB.State3, 
		PMB.ZipCode3, 
		PMB.Country3, 
		PMB.PhoneNbr3, 
		PMB.FaxNbr3, 
		PMB.PrimarySite, 
		'No S1', 
		'No S2', 
		'No S3',
		'No S4',
		PMB.Site1, 
		PMB.Site2, 
		PMB.Site3, 
		PMB.Site4,  
		GETDATE(), 
		'Batch Separation', 
		'Y'
		FROM ProviderMasterBase PMB
		INNER JOIN ProviderMaster Prov
			 ON PMB.ProviderMasterID = Prov.ProviderMasterID
			AND Prov.CurrentProviderFlag = 'N'
			AND 		(PMB.Site1 != ' '
				OR	 PMB.Site2 != ' '
				OR	 PMB.Site3 != ' '
				OR	 PMB.Site4 != ' ')	

	

		/* CEP */	
	UPDATE ProviderMasterBase
		SET 	Site1 = ' ',
			Site2 = ' ',
			Site3 = ' ',
			Site4 = ' '
			FROM ProviderMasterBase PMB
			INNER JOIN ProviderMaster Prov
				 ON PMB.ProviderMasterID = Prov.ProviderMasterID
				AND Prov.CurrentProviderFlag = 'N'
				AND 		(PMB.Site1 != ' '
					OR	 PMB.Site2 != ' '
					OR	 PMB.Site3 != ' '
					OR	 PMB.Site4 != ' ')	

	
END
