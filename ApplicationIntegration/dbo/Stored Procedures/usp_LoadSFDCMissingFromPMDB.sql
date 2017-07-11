CREATE Procedure [dbo].[usp_LoadSFDCMissingFromPMDB]

AS

--// =====================================================================
--// 
--//
--// Logic was embedded in a DTS Package..  Moved to a 
--// Stored Procedure for better maintainability.
--// =====================================================================


SET NOCOUNT ON 

BEGIN
	/* Preprocessing Staff */ 
	--// Delete from the Missing table if the info exists in the echo temp table and is complete.

	TRUNCATE TABLE AppStaging.dbo.TempSFDCMissingFromPMDB

	
	--//Insert Records into the Missing Table if it does not exist in PMDB
	--// ProviderMaster + PMB but exists in SFDC
	INSERT INTO AppStaging.dbo.TempSFDCMissingFromPMDB
		(SFID,
		 LastName,
		 FirstName,
		 Title,
		 SiteName, 
		 IncompleteSSNFlag,
		 NoEmailFlag,
		 NoSiteFlag,
		 NoLastNameFlag,
		 NoFirstNameFlag,
		 NoTitleFlag)
	SELECT   SFID,
		 LastName,
		 FirstName,
		 Title, 
		 SiteName,
		 CASE 	WHEN LEN(SSNUnformatted) < 9 
				THEN 'Y'
			WHEN SSNUnformatted IS NULL 
						THEN 'Y'
			ELSE 'N' END AS SSN1,
		CASE WHEN PS.Email IS NULL 
						THEN 'Y'
			 ELSE 'N' END AS Email,
		CASE WHEN PS.SiteName IS NULL 
						THEN 'Y'
			 ELSE 'N' END AS NoSiteFlag,
		CASE WHEN PS.LastName IS NULL 
						THEN 'Y'
			 ELSE 'N' END AS NoLastNameFlag,	
		CASE WHEN PS.FirstName IS NULL 
						THEN 'Y'
			 ELSE 'N' END AS NoFirstNameFlag,
		CASE WHEN PS.Title IS NULL 
						THEN 'Y'
			 ELSE 'N' END AS NoTitleFlag	 	 
		FROM ApplicationIntegration.dbo.ProviderMasterStaging PS
		WHERE CompleteRecordFlag = 'N'
		AND ActiveFlag = 'Y'
		  AND NOT EXISTS
			(SELECT 1
				FROM ProviderMaster Prov
				--INNER JOIN ProviderMasterBase PMB
				--	ON Prov.ProviderMasterID = PMB.ProviderMasterID
				WHERE Prov.SFID = PS.SFID)


	--//Do Blanket Update
	UPDATE AppStaging.dbo.TempSFDCMissingFromPMDB SET
			NoAddressFlag 		= 'N',
			NoRecordStatusFlag 	= 'N',
			NoStaffStatusFlag 	= 'N',
			NoSiteFlag			= 'N',
			NoFirstNameFlag		= 'N',
			NoLastNameFlag		= 'N',
			NoDateOfHireFlag	= 'N',
			NoDepartmentFlag	= 'N',
			NoTitleFlag			= 'N'

	--//Another Blanket Update from TempStaffHistory
	UPDATE AppStaging.dbo.TempSFDCMissingFromPMDB SET
		StaffGroup       = PS.StaffGroup,
		Facility 		 = PS.Facility,
		StaffStatus		 = PS.StaffStatus,
		RecordStatus	 = PS.RecordStatus
		FROM AppStaging.dbo.TempSFDCMissingFromPMDB 	SMP
		INNER JOIN ApplicationIntegration.dbo.ProviderStatusStaging	PS
			ON SMP.SFID =PS.SFID


	--//Update NoAddressFlag
	UPDATE AppStaging.dbo.TempSFDCMissingFromPMDB SET
		NoAddressFlag = 'Y'
		FROM AppStaging.dbo.TempSFDCMissingFromPMDB SMP
		WHERE NOT EXISTS
			(SELECT 1
				FROM ApplicationIntegration.dbo.AddressStaging ADS
				WHERE ADS.SFID = SMP.SFID
				  AND ADS.Type = 'Home')

	--//Update NoStaffStatusFlag
	UPDATE AppStaging.dbo.TempSFDCMissingFromPMDB SET
		NoStaffStatusFlag = 'Y'
		FROM AppStaging.dbo.TempSFDCMissingFromPMDB TSM
		WHERE StaffStatus IS NULL

	--//Update NoRecordStatusFlag
	UPDATE AppStaging.dbo.TempSFDCMissingFromPMDB SET
		NoRecordStatusFlag = 'Y'
		FROM AppStaging.dbo.TempSFDCMissingFromPMDB TSM
		WHERE RecordStatus IS NULL
			  
			  
	--//Update NoDateOfHireFlag
	UPDATE AppStaging.dbo.TempSFDCMissingFromPMDB SET
		NoDateOfHireFlag = 'Y'
		FROM AppStaging.dbo.TempSFDCMissingFromPMDB TSM
		WHERE TSM.SFID IN
		(SELECT PS.SFID
			FROM ApplicationIntegration.dbo.ProviderStatusStaging PS
			WHERE PS.[From] IS NULL
			  AND TSM.StaffGroup  = PS.StaffGroup
			  AND PS.CompleteRecordFlag = 'N'
			  AND PS.Active = 'Y')
			  
	--//Update NoDepartmentFlag
	UPDATE AppStaging.dbo.TempSFDCMissingFromPMDB SET
		NoDepartmentFlag = 'Y'
		FROM AppStaging.dbo.TempSFDCMissingFromPMDB TSM
		WHERE TSM.SFID IN
		(SELECT PS.SFID
			FROM ApplicationIntegration.dbo.ProviderStatusStaging PS
			WHERE PS.Department IS NULL
			  AND TSM.StaffGroup  = PS.StaffGroup
			  AND PS.CompleteRecordFlag = 'N'
			  AND PS.Active = 'Y')

	--//Delete ALL Former StaffStatus
	DELETE 	FROM AppStaging.dbo.TempSFDCMissingFromPMDB
		WHERE StaffStatus LIKE 'FORMER%'


	--// Insert Records that are int Both TempStaffHistory AND in TempEchoBase
	--// But not in ProviderMaster + ProviderMasterBase
	--// And Not in ProviderMaster + ProviderMasterBaseStaffGroup
	--// And Staff is Not like Former
	--INSERT INTO AppStaging.dbo.TempSFDCMissingFromPMDB
	--	(Echo_Dr_ID,
	-- 	 Echo_Dr_No_Ext,
	--	 StaffGroup,
	--	 Echo_Fac_Cd,
	--	 LastName,
	--	 FirstName,
	--	 Title,
	--	 Echo_Org_Name,
	--	 StaffStatus,
	--	 PartnerShipLevelCode,
	--	 PartnerShipLevel,
	--	 LessThan7DaysFlag)
	--SELECT	 TEB.Echo_Dr_ID,
	-- 	 TEB.Echo_Dr_No_Ext,
	--	 TSH.StaffGroup,
	--	 TSH.Echo_Fac_Cd,
	--	 TEB.LastName,
	--	 TEB.FirstName,
	--	 TEB.Title,
	--	 TEB.Echo_Org_Name,
	--	 TSH.StaffStatus,
	--	 TSH.EchoPartnerShipLevelCode,
	--	 TSH.PartnerShipLevel,
	--	 'Y'
	--	FROM AppStaging.dbo.TempStaffHistory TSH
	--	INNER JOIN AppStaging.dbo.TempEchoBase TEB 
	--		ON TSH.Echo_dr_ID = TEB.Echo_Dr_ID
	--	WHERE TEB.CompleteRecordFlag = 'Y'
	--	  AND NOT EXISTS
	--		(SELECT 1
	--			FROM ProviderMaster 			Prov
	--			INNER JOIN ProviderMasterBase 		PMB
	--				ON Prov.ProviderMasterID = PMB.ProviderMasterID
	--			WHERE Prov.Echo_Dr_ID = TEB.Echo_Dr_ID)
	--	  AND NOT EXISTS
	--		(SELECT 1
	--			FROM ProviderMaster 			Prov2
	--			INNER JOIN ProviderMasterBaseStaffGroup PMB2
	--				ON Prov2.ProviderMasterID = PMB2.ProviderMasterID
	--			WHERE Prov2.Echo_Dr_ID = TEB.Echo_Dr_ID)
	--	  AND NOT EXISTS
	--		(SELECT 1
	--			FROM AppStaging.dbo.TempSFDCMissingFromPMDB TEMB
	--			WHERE TEMB.Echo_Dr_ID = TEB.Echo_Dr_ID)
	--	  AND TSH.StaffStatus NOT LIKE 'Former%'



	DELETE FROM AppStaging.dbo.TempSFDCMissingFromPMDB 
		WHERE SiteName = 'Madera Community Hospital On-Call'
			  
END
