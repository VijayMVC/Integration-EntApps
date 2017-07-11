CREATE PROCEDURE [dbo].[usp_WebBiennialEvalHeaderStaging] AS


	/*12/27/06 by Antonia Miller.  Script populates codes needed by the web to
	create online Biennial evalations.*/
	
	/*Populate SiteLocationID*/
	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET SiteLocationID1 = E.SiteLocationID
			FROM WebStaging.dbo.WebBiennialEvalHeaderStaging, PMDBStaging.dbo.SITELOCATIONECHOMATCHES E
				WHERE E.ECHOSiteLocationName = Site1 and E.StaffGroup IN ('CEP', 'DEP', 'WEP', 'AEP', 'TXP')
				 AND Site1 IS NOT NULL


	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET SiteLocationID2 = E.SiteLocationID
			FROM WebStaging.dbo.WebBiennialEvalHeaderStaging, PMDBStaging.dbo.SITELOCATIONECHOMATCHES E
				WHERE E.ECHOSiteLocationName = Site2 and E.StaffGroup IN ('CEP', 'DEP', 'WEP', 'AEP', 'TXP')
				 AND Site2 IS NOT NULL


	/*SiteLocationID is mismatched between SiteLocationEchoMatches and SiteLocationLookup.  Do this to
	get a match on SiteLocationLookup.  This is because several same sites are entered into Echo, and 
	also, because of a sitename change.  This comes in from Echo as a new site, not an updated one.
	Need to start asking for source file to match with SiteLocationLookup where webcode is not null, or
	this will need to be re-written to use sitelocationlookup where regionid is not null and webcode is
	not null, instead of sitelocationechomatches table*/

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID1 = 815 WHERE SITE1 = 'Dekalb Medical Center'
	
	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID2 = 815 WHERE SITE2 = 'Dekalb Medical Center'
	
	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID1 = 817 WHERE SITE1 = 'Dekalb Medical Center Hillandale'
	
	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID2 = 817 WHERE SITE2 = 'Dekalb Medical Center Hillandale'

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID1 = 810 WHERE SITE1 = 'Adventist Medical Center-Portland'
	
	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID2 = 810 WHERE SITE2 = 'Adventist Medical Center-Portland'

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID1 = 22 WHERE SITE1 = 'John Muir Medical Center-Walnut Creek'
	
	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID2 = 22 WHERE SITE2 = 'John Muir Medical Center-Walnut Creek'

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID1 = 840  WHERE SITE1 = 'Boswell Memorial Hospital'
	
	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID2 = 840 WHERE SITE2 = 'Boswell Memorial Hospital'


	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID1 = 839  WHERE SITE1 = 'Del E. Webb Memorial Hospital'
	
	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID2 = 839  WHERE SITE2 = 'Del E. Webb Memorial Hospital'

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID1 = 118  WHERE SITE1 	LIKE ('%Doctors Medical Center of San Pablo')

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID2 = 118  WHERE SITE2 	LIKE ('%Doctors Medical Center of San Pablo')

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID1 = 259 WHERE SITE1 = 'San Bernardino County Detention Facility'

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET SITELOCATIONID1 = 259 WHERE SITE2 = 'San Bernardino County Detention Facility'
	
	--More than 1 site in DB, doesn't match ProviderTitleHistory
	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging SET SITELOCATIONID1 = 902 WHERE SITELOCATIONID1 = 904
	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging SET SITELOCATIONID2 = 902 WHERE SITELOCATIONID2 = 904
	
	/*Populate WebCode and RegionID*/

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET RegionID1 = S.RegionID, WebCodeSite1 = S.WebCode
			FROM WebStaging.dbo.WebBiennialEvalHeaderStaging, PMDBStaging.dbo.SITELOCATIONLOOKUP S
				WHERE WebStaging.dbo.WebBiennialEvalHeaderStaging.SiteLocationID1 = S.SiteLocationID
					AND S.WEBCODE IS NOT NULL

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET RegionID2 = S.RegionID, WebCodeSite2 = S.WebCode
			FROM WebStaging.dbo.WebBiennialEvalHeaderStaging, PMDBStaging.dbo.SITELOCATIONLOOKUP S
				WHERE WebStaging.dbo.WebBiennialEvalHeaderStaging.SiteLocationID2 = S.SiteLocationID
					AND S.WEBCODE IS NOT NULL

	/*Eastern Plumas has no region.  Use San Die*/

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET RegionID1 = 7 WHERE SITE1 LIKE ('EASTERN PLUMAS%')

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET RegionID2 = 7 WHERE SITE2 LIKE ('EASTERN PLUMAS%')

	/*Populate ProviderMasterID*/

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET	ProviderMasterIDMD1 = T.PROVIDERMASTERID
			FROM WebStaging.dbo.WebBiennialEvalHeaderStaging, PMDBStaging.dbo.ProviderTitleHistory T
				WHERE WebStaging.dbo.WebBiennialEvalHeaderStaging.SiteLocationID1 = T.SiteLocationID
					AND T.TitleCode = 'MD' AND T.ActiveFlag = 'Y'

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET	ProviderMasterIDMD2 = T.PROVIDERMASTERID
			FROM WebStaging.dbo.WebBiennialEvalHeaderStaging, PMDBStaging.dbo.ProviderTitleHistory T
				WHERE WebStaging.dbo.WebBiennialEvalHeaderStaging.SiteLocationID2 = T.SiteLocationID
					AND T.TitleCode = 'MD' AND T.ActiveFlag = 'Y'


	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET	ProviderMasterIDRD1 = T.PROVIDERMASTERID
	 		FROM WebStaging.dbo.WebBiennialEvalHeaderStaging, PMDBStaging.dbo.ProviderTitleHistory T
				WHERE WebStaging.dbo.WebBiennialEvalHeaderStaging.RegionID1 = T.RegionID
					AND T.TitleCode = 'RD' AND T.ActiveFlag = 'Y' AND T.RegionID is not null

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET	ProviderMasterIDRD2 = T.PROVIDERMASTERID
	 		FROM WebStaging.dbo.WebBiennialEvalHeaderStaging, PMDBStaging.dbo.ProviderTitleHistory T
				WHERE WebStaging.dbo.WebBiennialEvalHeaderStaging.RegionID2 = T.RegionID
					AND T.TitleCode = 'RD' AND T.ActiveFlag = 'Y' AND T.RegionID is not null


	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET echo_dr_no_ext = 
		case when len(echo_dr_no_ext) = 7
			then '00' + echo_dr_no_ext
			when len(echo_dr_no_ext) = 8
			then '0' + echo_dr_no_ext
			else echo_dr_no_ext
			end
	
	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET	ProviderMasterID = P.PROVIDERMASTERID
			FROM WebStaging.dbo.WebBiennialEvalHeaderStaging, PMDBStaging.dbo.ProviderMaster P
				WHERE WebStaging.dbo.WebBiennialEvalHeaderStaging.echo_dr_no_ext = P.echo_dr_no_ext

	/*Populate WebRegionCode from RegionLookup table for Web*/
	
	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET REGIONCODE1 = R.WebRegionCode
			FROM WebStaging.dbo.WebBiennialEvalHeaderStaging S, PMDBStaging.dbo.RegionLookup R
				WHERE S.RegionID1 = R.RegionID

	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
		SET REGIONCODE2 = R.WebRegionCode
			FROM WebStaging.dbo.WebBiennialEvalHeaderStaging S, PMDBStaging.dbo.RegionLookup R
				WHERE S.RegionID2 = R.RegionID

	/*If evaluee is a Medical Director, Update the Medical Director ID to that of the Regional Director's.*/
	
	UPDATE
	WebStaging.dbo.WebBiennialEvalHeaderStaging 
	SET ProviderMasterIDMD1 = ProviderMasterIDRD1, ProviderMasterIDRD1 = NULL
	WHERE meddirectorisevalueesite1 = 'Y'

	UPDATE
	WebStaging.dbo.WebBiennialEvalHeaderStaging 
	SET ProviderMasterIDMD2 = ProviderMasterIDRD2, ProviderMasterIDRD2 = NULL
	WHERE meddirectorisevalueesite2 = 'Y'

	
	/*Eastern Plumas does not have a medical director, therefore the VPO will complete the evaluation*/
	
	UPDATE
	WebStaging.dbo.WebBiennialEvalHeaderStaging 
	SET ProviderMasterIDMD1 = 535 --The providermasterID of the VPO
	WHERE Site1 like ('Eastern Plumas%')

	UPDATE
	WebStaging.dbo.WebBiennialEvalHeaderStaging 
	SET ProviderMasterIDMD2 = 535 --The providermasterID of the VPO
	WHERE Site2 like ('Eastern Plumas%') 


	/*Calexico's Medical Director will be evaluated by the VPO, but the Regional Director will do
	the RD evaluation*/
	
	UPDATE
	WebStaging.dbo.WebBiennialEvalHeaderStaging 
	SET ProviderMasterIDMD1 = 535 --The providermasterID of the VPO
	WHERE Site1 like ('Calexico%') 

	UPDATE
	WebStaging.dbo.WebBiennialEvalHeaderStaging 
	SET ProviderMasterIDMD2 = 535 --The providermasterID of the VPO
	WHERE Site2 like ('Calexico%') 


	/*If evaluee is a Regional Director, the site Medical Director will complete the evaluation and the VPO
	will serve as the Regional Director.*/

	UPDATE
	WebStaging.dbo.WebBiennialEvalHeaderStaging 
	SET ProviderMasterIDRD1 = 535 --The providermasterID of the VPO
	WHERE regdirectorisevalueesite1 = 'Y' 

	UPDATE
	WebStaging.dbo.WebBiennialEvalHeaderStaging 
	SET ProviderMasterIDRD2 = 535 --The providermasterID of the VPO
	WHERE regdirectorisevalueesite2 = 'Y' 


	UPDATE WebStaging.dbo.WebBiennialEvalHeaderStaging
	SET Credate = getdate()


	/*Special Instructions*/

	UPDATE webbiennialevalheaderstaging SET providermasteridrd1 = null WHERE site1 like ('easter%') 
	UPDATE webbiennialevalheaderstaging SET providermasteridrd2 = null WHERE site2 like ('easter%') 

	UPDATE webbiennialevalheaderstaging 
	SET providermasteridrd1 = 535
	WHERE regdirectorisevalueesite1 = 'Y'

	UPDATE webbiennialevalheaderstaging 
	SET providermasteridrd2 = 535
	WHERE regdirectorisevalueesite2 = 'Y'

	UPDATE webbiennialevalheaderstaging 
	SET providermasteridrd1 = null WHERE meddirectorisevalueesite1 = 'Y'

	UPDATE webbiennialevalheaderstaging 
	SET providermasteridrd2 = null WHERE meddirectorisevalueesite2 = 'Y'
