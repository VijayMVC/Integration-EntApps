CREATE PROCEDURE [dbo].[usp_LoadWebComplianceStaging] AS

/*Stored Procedure loads data from the PMDBStaging.dbo.ProviderEchoLicense table
to the compliance staging area for the web
Antonia Miller Updated 10-19-04 to include Compliance Issue Date.
Antonia Milller Updated 12-20-04 to include WebRegionCode to get Region Name
from Regions table so web can display proper region
Antonia Miller - Updated - 12/21/05 to include WEP, DEP)
Antonia Miller - Updated - 1/2/2007 - Moved program to maw-datastage1, 
changing the server and database names in this SP*/


	INSERT INTO AppStaging.dbo.WEBCOMPLIANCETRACKINGSTAGING
	(ProviderMasterID,
	LastName,
	FirstName,
	Title,
	webcode)
	
	SELECT     
		PM.ProviderMasterID, 
		PM.LastName, 
		PM.FirstName, 
		PM.Title,
		PMB.Site1

		FROM         
		PMDBStaging.dbo.ProviderMaster PM 
		INNER JOIN
		PMDBStaging.dbo.ProviderMasterBase PMB
		ON PM.ProviderMasterID = PMB.ProviderMasterID
			WHERE (PM.CurrentProviderFlag = 'Y') and 
			(PMB.Site1 is not null and Site1 <>'')

	INSERT INTO AppStaging.dbo.WEBCOMPLIANCETRACKINGSTAGING
	(ProviderMasterID,
	LastName,
	FirstName,
	Title,
	webcode)
	
	SELECT     
		PM.ProviderMasterID, 
		PM.LastName, 
		PM.FirstName, 
		PM.Title,
		PMB.Site2

		FROM         
		PMDBStaging.dbo.ProviderMaster PM 
		INNER JOIN
		PMDBStaging.dbo.ProviderMasterBase PMB
		ON PM.ProviderMasterID = PMB.ProviderMasterID
			WHERE (PM.CurrentProviderFlag = 'Y') and 
			(PMB.Site2 is not null and pmb.site2 <> '')


	INSERT INTO AppStaging.dbo.WEBCOMPLIANCETRACKINGSTAGING
		(ProviderMasterID,
		LastName,
		FirstName,
		Title,
		webcode)
	
		SELECT     
		PM.ProviderMasterID, 
		PM.LastName, 
		PM.FirstName, 
		PM.Title,
		PMB.Site3

		FROM         
		PMDBStaging.dbo.ProviderMaster PM 
		INNER JOIN
		PMDBStaging.dbo.ProviderMasterBase PMB
		ON PM.ProviderMasterID = PMB.ProviderMasterID
			WHERE (PM.CurrentProviderFlag = 'Y') and 
			(PMB.Site3 is not null and pmb.site3 <> '')


		INSERT INTO AppStaging.dbo.WEBCOMPLIANCETRACKINGSTAGING
		(ProviderMasterID,
		LastName,
		FirstName,
		Title,
		webcode)

		SELECT     
		PM.ProviderMasterID, 
		PM.LastName, 
		PM.FirstName, 
		PM.Title,
		PMB.Site4

		FROM         
		PMDBStaging.dbo.ProviderMaster PM 
		INNER JOIN
		PMDBStaging.dbo.ProviderMasterBase PMB
		ON PM.ProviderMasterID = PMB.ProviderMasterID
			WHERE (PM.CurrentProviderFlag = 'Y') and 
			(PMB.Site4 is not null and pmb.site4 <> '')

	UPDATE WebComplianceTrackingStaging
		SET RegionID = SL.RegionID
			FROM PMDBStaging.dbo.SiteLocationLookup SL,
			WebComplianceTrackingStaging CS
			WHERE SL.WebCode = CS.webcode

	UPDATE WebComplianceTrackingStaging
		SET RegionCode = RL.WebRegionCode
			FROM PMDBStaging.dbo.RegionLookup RL,
			WebComplianceTrackingStaging CS
			WHERE RL.RegionID = CS.RegionID

	UPDATE WebComplianceTrackingStaging
		SET ComplianceCompleted = 'Y', ComplianceCompletedDate = EL.ComplianceIssueDate
			FROM WebComplianceTrackingStaging CS, PMDBStaging.dbo.ProviderEchoLicense EL
				WHERE CS.ProviderMasterID = EL.ProviderMasterID
				AND EL.StaffGroup IN ('CEP', 'WEP', 'DEP', 'AEP')
				AND EL.ComplianceCurrentFlag = 'Y'

	UPDATE WebComplianceTrackingStaging
		SET ComplianceCompleted = 'N'
			WHERE ComplianceCompleted is null
