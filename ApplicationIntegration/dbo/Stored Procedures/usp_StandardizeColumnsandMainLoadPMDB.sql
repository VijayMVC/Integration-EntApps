
CREATE PROCEDURE [dbo].[usp_StandardizeColumnsandMainLoadPMDB] 
AS

/* 	Author: 	Andrew Marsh
	Date:		7/9/2004
	Purpose:	Standardize Column VALUES for Matching Purposes and
				Match Source Recs
	Revision:	Andrew Marsh - 5/27/2004 -- Added ALL ProviderMasterIDs to CeridianAllMatches
				Regardless of whether they exist in Ceridian
			Andrew Marsh - 7/9/2004 -- Rewritten from usp_StandardizeColumnsandLoadRecordsFromSources --
				Modularized and Made to accommodate Multiple Clients
			Antonia Miller 6/2/2005 --Added stored procedure to integrate out of state WEP and DEP groups to --
			CEP website.
			Antonia Miller 2/12/2007 --Added NationalID to ProviderMaster.
*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN 
	DECLARE @CEPStaffGroup 		VARCHAR(50)

	SET @CEPStaffGroup 	= 'CEP'

	TRUNCATE TABLE ProviderMasterPrior
	
	INSERT INTO ProviderMasterPrior
		SELECT * 
			FROM ProviderMaster

	INSERT INTO AppStaging.dbo.StaffHistoryPrior
		SELECT * 
			FROM StaffHistory

	/* Standardize names for Comparison */
	/* Eliminate titles FROM names in Ceridian */


	EXEC usp_StandardizeProviderAddresses


	/* Reset Load Flags */
	UPDATE StaffGroupLookup SET
		ProcessedFlag = CASE 	WHEN StaffGroup = @CEPStaffGroup 	THEN 'Y'
					ELSE NULL END,
		ProcessedDate = CASE 	WHEN StaffGroup = @CEPStaffGroup 	THEN GETDATE()
					ELSE ProcessedDate END	

	/* Load Temp Echo Tables and Convert Echo Data */

	EXEC usp_SCML_LoadEchoTempTables 

	/* Load New Hires, Updates and Separations */

	EXEC usp_SCML_LoadNewHiresAndSeparations

	/* DOB, Gender, NationalID */
	UPDATE  ProviderMaster
		SET 	DateOfBirth 			= PEDN.BirthDate,
		 	Gender 				= PEDN.Gender,
			NationalID			= PEDN.NationalID
			FROM PhysicianEchoDrNameCurrent PEDN
			INNER JOIN ProviderMaster Prov
				 ON PEDN.Dr_ID = Prov.Echo_Dr_ID

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
	EXEC usp_SCML_PMDB_Matching

	/* Standardize Titles and Update Director Flags */

	EXEC usp_SCML_PMDB_UpdateDirectorsAndTitles	

	/* Load Education */
	UPDATE ProviderMaster SET 
		MedSchool = CASE 	WHEN SCHOOL2.txt IS NULL 	THEN ' ' 
					ELSE SCHOOL2.txt END
		FROM 	AppStaging.dbo.Echo_EDUCATE EDUCATE, 
			AppStaging.dbo.Echo_Educ_Arr as EDUC_ARR1,
			AppStaging.dbo.Echo_School AS SCHOOL2,
			PhysicianEchoDrNameCurrent AS DrName,
			ProviderMaster PMaster
		WHERE LEN(EDUCATE.SCH_TYPE) > 0 
			AND EDUC_ARR1.Cd = EDUCATE.SCH_TYPE                   
			AND LEN(EDUCATE.Cd) > 0 
			AND SCHOOL2.Cd = EDUCATE.Cd                         
			AND DrName.Dr_ID = EDUCATE.Dr_ID
			AND PMaster.Echo_Dr_No_Ext = DrName.Dr_No_Ext
			AND EDUC_ARR1.txt = 'Medical School'

	UPDATE ProviderMaster SET MedSchool = ' ' 
		WHERE MedSchool IS NULL

	/* If ever a CEP Partner */
	UPDATE ProviderMaster set
		CEPPartnerFlag = CASE
			WHEN EchoPartnerShipLevelCode in ('1','2','3','4', 'SP', 'F')
				THEN 'Y'
			WHEN EchoPartnerShipLevelCode in ('PE', 'EMP', 'HOS', 'EDB', 'PT', 'IS')
			 	THEN 'N'
			ELSE CEPPartnerFlag END

END

