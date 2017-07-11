

CREATE PROCEDURE [dbo].[usp_SFDC_StandardizeColumnsandMainLoad] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Standardize Column VALUES for Matching Purposes and
				Match Source Recs
	Revision:	
*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN 

	TRUNCATE TABLE ProviderMasterPrior
	
	INSERT INTO ProviderMasterPrior
		SELECT * 
			FROM ProviderMasterTest
			
			
	/* Load Temp SFDC Tables and Convert Data */

	EXEC usp_SFDC_LoadStagingTables


	/* Standardize Addresses */

--select * from AddressStaging
--where Provider_Master_ID__c is null

 --Find a better place for this
	EXEC usp_SFDC_StandardizeProviderAddresses


	/* Reset Load Flags */
	--UPDATE StaffGroupLookup SET
	--	ProcessedFlag = CASE 	WHEN StaffGroup = @CEPStaffGroup 	THEN 'Y'
	--				ELSE NULL END,
	--	ProcessedDate = CASE 	WHEN StaffGroup = @CEPStaffGroup 	THEN GETDATE()
	--				ELSE ProcessedDate END	



	/* Load New Hires and Sites, Updates and Separations */

	EXEC dbo.usp_SFDC_LoadNewHiresAndSeparations

	/* DOB, Gender, NationalID */
	UPDATE  ProviderMaster
		SET 	DateOfBirth 			= SFPS.DateOfBirth,
		 	Gender 				= SFPS.Gender,
			NationalID			= SFPS.NationalID
			FROM ProviderMasterStaging SFPS
			INNER JOIN ProviderMaster Prov
				 ON SFPS.ProviderMasterID = Prov.ProviderMasterID

	/* Need SSN Formattings for Matching */

	UPDATE ProviderMaster
		SET SSNFormatted = SUBSTRING (SSNUnformatted,1,3) + '-' + 
			SUBSTRING (SSNUnformatted,4,2) + '-' +  SUBSTRING (SSNUnformatted,6,4)
		WHERE SSNFormatted IS NULL 
		  AND SSNUnformatted IS NOT NULL

	UPDATE ProviderMaster
		SET SSNUnformatted = REPLACE (SSNformatted, '-', '')
		WHERE SSNUnformatted IS NULL 
		  AND SSNformatted IS NOT NULL

	/* Match Records In Other Systems */

	/* SiteLine */
	UPDATE ProviderMaster SET 
		SitelineCntID 	= TbC.CntID,
		UpdDate 	= GETDATE()
		FROM Siteline_tblCnt TbC, ProviderMaster Prov
		WHERE ((TbC.CntNameFirst = Prov.FirstName AND TbC.CntNameLast = Prov.LastName)
			OR TbC.zcntssn = Prov.SSNFormatted)
			AND NOT EXISTS
				(SELECT 1 
					FROM ProviderMaster Prov2
					WHERE TbC.CntID = Prov2.SitelineCntID)
					  AND Prov.SitelineCntID IS NULL
		  AND Prov.CurrentProviderFlag = 'Y'

	/* Standardize Titles and Update Director Flags */
	--DO NOT RUN FOR NEW HIRES
	--EXEC dbo.usp_SFDC_UpdateDirectorsAndTitles

	/* Load Education */
	
	--Refresh SFDCEducationForWeb before this update

	--Refresh SFDCEducationForWeb before this update
	TRUNCATE TABLE SFDCEducationForWeb

	INSERT INTO SFDCEducationForWeb
	SELECT Prov.ProviderMasterID,
	Prov.WebID,
	SFEDU.Education_Type__c,
	SFSchool.Name,
	SFEDU.From__c,
	SFEDU.To__c,
	GETDATE(),
	GETDATE()
	FROM ProviderMaster Prov
	JOIN AppStaging.dbo.SFDCEducationStaging SFEDU 
			ON SFEDU.Contact__c = Prov.SFID
	JOIN Salesforce...E_T_Institution__c SFSchool  
			ON SFSchool.Id = SFEDU.Institution_1__c
	--WHERE Prov.CurrentProviderFlag = 'Y'
	ORDER BY ProviderMasterID
	

	--UPDATE ProviderMaster
	--SET	MedSchool = Education
	--FROM SFDCEducationForWeb SFED
	--WHERE SFED.ProviderMasterID = ProviderMaster.ProviderMasterID
	--	AND EducationType LIKE '%Medical School'

	--UPDATE ProviderMaster SET MedSchool = ' ' 
	--	WHERE MedSchool IS NULL
		
		
	--UPDATE ProviderMasterBase
	--SET	MedSchool = Education
	--FROM SFDCEducationForWeb SFED
	--WHERE SFED.ProviderMasterID = ProviderMasterBase.ProviderMasterID
	--	AND EducationType LIKE '%Medical School'
	
	/*12/11/2013 - Changed medical school to residency as per George and Jen Heil*/
	
	UPDATE ProviderMaster
		SET	MedSchool = Education
	FROM SFDCEducationForWeb SFED
	WHERE SFED.ProviderMasterID = ProviderMaster.ProviderMasterID
		AND EducationType = 'Residency'
		AND SFED.ToDate IN (SELECT MAX(ToDate)
						FROM ApplicationIntegration.dbo.SFDCEducationForWeb SE2
						WHERE SFED.ProviderMasterID = SE2.ProviderMasterID
						AND EducationType = 'Residency')
	
	UPDATE ProviderMaster SET MedSchool = ' ' 
	WHERE MedSchool IS NULL
						
	UPDATE ProviderMasterBase
		SET	MedSchool = Education
	FROM SFDCEducationForWeb SFED
	WHERE SFED.ProviderMasterID = ProviderMasterBase.ProviderMasterID
		AND EducationType = 'Residency'
		AND SFED.ToDate IN (SELECT MAX(ToDate)
						FROM ApplicationIntegration.dbo.SFDCEducationForWeb SE2
						WHERE SFED.ProviderMasterID = SE2.ProviderMasterID
						AND EducationType = 'Residency' )


	/* If ever a CEP Partner */
	UPDATE ProviderMaster
	SET	CEPPartnerFlag = CASE
			WHEN PartnershipLevel LIKE '%Partnership%'
				THEN 'Y'
			WHEN PartnershipLevel IN ('Physician Extender', 'Employee', 'Hospitalist', 
								'ED Backup Physician', 'Part Time', 'Independent Sub-Contractor')
			 	THEN 'N'
			ELSE CEPPartnerFlag END

END


