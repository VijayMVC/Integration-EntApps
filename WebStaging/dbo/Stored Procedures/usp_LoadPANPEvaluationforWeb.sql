CREATE PROCEDURE [dbo].[usp_LoadPANPEvaluationforWeb] AS

/*Stored Procedure created to populate necessary codes / ID numbers for the web-based PA / NP
evaluation process. A. Miller 6/29/2005*/
-- Modified - 4/30/2009 - Mohamed Mahmoud to use lawson IDs instead of Ceridian

-- validation for missing WebIDs
-- select * from WebPANPEvalHeaderStaging where providermasterid not in 
-- (select webid from PMDBStaging.dbo.ProviderMaster where webid is not null)
-- update PMDBStaging.dbo.ProviderMaster set webid = 1036 where providermasterid = 876

/*Populate PA or NP ProviderMasterID*/
	UPDATE WebPANPEvalHeaderStaging
		SET ProviderMasterID = CW.WebID
			FROM WebPANPEvalHeaderStaging, PMDBStaging.dbo.LawsonPositionsPLs CW
				WHERE WebPANPEvalHeaderStaging.ClockNo = CW.Employee

	UPDATE WebPANPEvalHeaderStaging
		SET ProviderMasterID = CW.ProviderMasterID
			FROM WebPANPEvalHeaderStaging, PMDBStaging.dbo.ProviderMaster CW
				WHERE WebPANPEvalHeaderStaging.ProviderMasterID = CW.WebID

/*Popluate WebCode, SiteLocationID, RegionID*/
	UPDATE WebPANPEvalHeaderStaging
		SET WebCodeSite1 = S.WebCode
			FROM WebPANPEvalHeaderStaging, PMDBStaging.dbo.LS_pLevelLookup S
				WHERE WebPANPEvalHeaderStaging.CeridianDeptNo = S.ProcessLevel

	UPDATE WebPANPEvalHeaderStaging
		SET SiteLocationID1 = S.SiteLocationID
			FROM WebPANPEvalHeaderStaging, PMDBStaging.dbo.SiteLocationLookup S
				WHERE WebPANPEvalHeaderStaging.WebCodeSite1 = S.WebCode

	UPDATE WebPANPEvalHeaderStaging
		SET RegionID1 = S.RegionID
			FROM WebPANPEvalHeaderStaging, (SELECT * FROM PMDBStaging.dbo.SiteLocationLookup WHERE RegionID IS NOT NULL) S
				WHERE WebPANPEvalHeaderStaging.WebCodeSite1 = S.WebCode

-------
/*Populate Medical Director ProviderMasterID*/
	UPDATE WebPANPEvalHeaderStaging
		SET	ProviderMasterIDMD1 = T.PROVIDERMASTERID
			FROM WebPANPEvalHeaderStaging, PMDBStaging.dbo.ProviderTitleHistory T
				WHERE WebPANPEvalHeaderStaging.SiteLocationID1 = T.SiteLocationID
					AND T.TitleCode = 'MD' AND T.ActiveFlag = 'Y'

/*If Reviewer Clock No is provided, then someone other than the medical director (designee) will complete the evaluation*/

	
	UPDATE WebPANPEvalHeaderStaging
		SET ProviderMasterIDMD2 = ProviderMasterIDMD1
		where Reviewerclockno <> '' and Reviewerclockno <> 0
	
	UPDATE WebPANPEvalHeaderStaging
		SET	ProviderMasterIDMD1 = P.WebID
			FROM WebPANPEvalHeaderStaging, PMDBStaging.dbo.LawsonPositionsPLs P
				WHERE WebPANPEvalHeaderStaging.ReviewerClockNo = P.Employee
				AND WebPANPEvalHeaderStaging.ReviewerClockNo <> '' and WebPANPEvalHeaderStaging.ReviewerClockNo <> 0


	UPDATE WebPANPEvalHeaderStaging
		SET	ProviderMasterIDMD1 = P.ProviderMasterID
			FROM WebPANPEvalHeaderStaging, PMDBStaging.dbo.ProviderMaster P
				WHERE WebPANPEvalHeaderStaging.ReviewerClockNo = P.WebID
				AND WebPANPEvalHeaderStaging.ReviewerClockNo <> '' and WebPANPEvalHeaderStaging.ReviewerClockNo <> 0

/*Populate Regional Director ProviderMasterID*/
	UPDATE WebPANPEvalHeaderStaging
		SET	ProviderMasterIDRD1 = T.PROVIDERMASTERID
	 		FROM WebPANPEvalHeaderStaging, PMDBStaging.dbo.ProviderTitleHistory T
				WHERE WebPANPEvalHeaderStaging.RegionID1 = T.RegionID
					AND T.TitleCode = 'RD' AND T.ActiveFlag = 'Y' AND T.RegionID is not null


-- 	UPDATE WebPANPEvalHeaderStaging
-- 		SET	ProviderMasterIDRD1 = 757
-- 				WHERE WebPANPEvalHeaderStaging.RegionID1 = 7

	UPDATE WebPANPEvalHeaderStaging
		SET REGIONCODE1 = R.WebRegionCode
			FROM WebPANPEvalHeaderStaging S, PMDBStaging.dbo.RegionLookup R
				WHERE S.RegionID1 = R.RegionID
