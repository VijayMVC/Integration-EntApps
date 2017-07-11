CREATE PROCEDURE [dbo].[usp_WebCPACEvalHeaderStaging] AS

	/*12/30/04 by Antonia Miller.  Script populates codes needed by the web to
	create online CPAC evalations.
	10/25/05 Antonia Miller, revised to update Medical Director is evaluee to update ProviderMasterIDMD1 to that of
	Regional director instead of Medical Director's providermasterid.  This way the RD will evaluate the Med Dir*/


	/*Populate SiteLocationID*/
	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
		SET SiteLocationID1 = E.SiteLocationID
			FROM AppStaging.DBO.WebCPACEvalHeaderStaging, PMDBStaging.dbo.SITELOCATIONECHOMATCHES E
				WHERE E.ECHOSiteLocationName = Site1 and E.StaffGroup IN ('CEP', 'DEP', 'WEP', 'AEP')
				 AND Site1 IS NOT NULL


	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
		SET SiteLocationID2 = E.SiteLocationID
			FROM AppStaging.DBO.WebCPACEvalHeaderStaging, PMDBStaging.dbo.SITELOCATIONECHOMATCHES E
				WHERE E.ECHOSiteLocationName = Site2 and E.StaffGroup IN ('CEP', 'DEP', 'WEP', 'AEP')
				 AND Site2 IS NOT NULL

	/*SiteLocationID is mismatched between SiteLocationEchoMatches and SiteLocationLookup.  Do this to
	get a match on SiteLocationLookup.  This is because several same sites are entered into Echo, and 
	also, because of a sitename change.  This comes in from Echo as a new site, not an updated one*/
	
	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
	SET SITELOCATIONID1 = 815 WHERE SITE1 = 'Dekalb Medical Center' OR SITE1 = 'Dekalb Medical Center - Central'
	
	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
	SET SITELOCATIONID2 = 815 WHERE SITE2 = 'Dekalb Medical Center' OR SITE2 = 'Dekalb Medical Center - Central'
	
	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
	SET SITELOCATIONID1 = 810 WHERE SITE1 = 'Adventist Medical Center-Portland'
	
	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
	SET SITELOCATIONID2 = 810 WHERE SITE2 = 'Adventist Medical Center-Portland'

	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
	SET SITELOCATIONID1 = 22 WHERE SITE1 = 'John Muir Medical Center-Walnut Creek'
	
	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
	SET SITELOCATIONID2 = 22 WHERE SITE2 = 'John Muir Medical Center-Walnut Creek'

	UPDATE AppStaging.dbo.webcpacevalheaderstaging
	SET SITELOCATIONID1 = 817 WHERE SITE1 = 'Dekalb Medical Center Hillandale' OR  SITE1 = 'Dekalb Medical Center - Hillandale'

	UPDATE AppStaging.dbo.webcpacevalheaderstaging
	SET SITELOCATIONID2 = 817 WHERE SITE2 = 'Dekalb Medical Center Hillandale' OR  SITE2 = 'Dekalb Medical Center - Hillandale'

	UPDATE AppStaging.dbo.webcpacevalheaderstaging
	SET SITELOCATIONID1 = 840  WHERE SITE1 = 'Boswell Memorial Hospital'
	
	UPDATE AppStaging.dbo.webcpacevalheaderstaging
	SET SITELOCATIONID2 = 840 WHERE SITE2 = 'Boswell Memorial Hospital'

	UPDATE AppStaging.dbo.webcpacevalheaderstaging
	SET SITELOCATIONID1 = 839  WHERE SITE1 = 'Del E. Webb Memorial Hospital'
	
	UPDATE AppStaging.dbo.webcpacevalheaderstaging
	SET SITELOCATIONID2 = 839  WHERE SITE2 = 'Del E. Webb Memorial Hospital'

	UPDATE AppStaging.dbo.webcpacevalheaderstaging
	SET SITELOCATIONID1 = 118  WHERE SITE1 	LIKE ('%Doctors Medical Center of San Pablo')

	UPDATE AppStaging.dbo.webcpacevalheaderstaging
	SET SITELOCATIONID2 = 118  WHERE SITE2 	LIKE ('%Doctors Medical Center of San Pablo')

	UPDATE AppStaging.dbo.webcpacevalheaderstaging
	SET SITELOCATIONID1 = 157 WHERE SITELOCATIONID1 = 906

	UPDATE AppStaging.dbo.webcpacevalheaderstaging
	SET SITELOCATIONID2 = 157 WHERE SITELOCATIONID2 = 906

	UPDATE AppStaging.dbo.webcpacevalheaderstaging
	SET SITELOCATIONID1 = 52 WHERE SITELOCATIONID1 = 849

	UPDATE AppStaging.dbo.webcpacevalheaderstaging
	SET SITELOCATIONID2 = 52 WHERE SITELOCATIONID2 = 849


	/*Populate WebCode and RegionID*/

	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
		SET RegionID1 = S.RegionID, WebCodeSite1 = S.WebCode
			FROM AppStaging.DBO.WebCPACEvalHeaderStaging, PMDBStaging.dbo.SITELOCATIONLOOKUP S
				WHERE AppStaging.DBO.WebCPACEvalHeaderStaging.SiteLocationID1 = S.SiteLocationID
					AND S.WEBCODE IS NOT NULL and S.RegionID is not null

	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
		SET RegionID2 = S.RegionID, WebCodeSite2 = S.WebCode
			FROM AppStaging.DBO.WEBCPACEVALHEADERSTAGING, PMDBStaging.dbo.SITELOCATIONLOOKUP S
				WHERE AppStaging.DBO.WebCPACEvalHeaderStaging.SiteLocationID2 = S.SiteLocationID
					AND S.WEBCODE IS NOT NULL and S.RegionID is not null

	/*Populate ProviderMasterID*/

	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
		SET	ProviderMasterIDMD1 = T.PROVIDERMASTERID
			FROM AppStaging.DBO.WEBCPACEVALHEADERSTAGING, PMDBStaging.dbo.ProviderTitleHistory T
				WHERE AppStaging.DBO.WEBCPACEVALHEADERSTAGING.SiteLocationID1 = T.SiteLocationID
					AND T.TitleCode = 'MD' AND T.ActiveFlag = 'Y'

	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
		SET	ProviderMasterIDMD2 = T.PROVIDERMASTERID
			FROM AppStaging.DBO.WEBCPACEVALHEADERSTAGING, PMDBStaging.dbo.ProviderTitleHistory T
				WHERE AppStaging.DBO.WEBCPACEVALHEADERSTAGING.SiteLocationID2 = T.SiteLocationID
					AND T.TitleCode = 'MD' AND T.ActiveFlag = 'Y'


	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
		SET	ProviderMasterIDRD1 = T.PROVIDERMASTERID
	 		FROM AppStaging.DBO.WEBCPACEVALHEADERSTAGING, PMDBStaging.dbo.ProviderTitleHistory T
				WHERE AppStaging.DBO.WEBCPACEVALHEADERSTAGING.RegionID1 = T.RegionID
					AND T.TitleCode = 'RD' AND T.ActiveFlag = 'Y' AND T.RegionID is not null

	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
		SET	ProviderMasterIDRD2 = T.PROVIDERMASTERID
	 		FROM AppStaging.DBO.WEBCPACEVALHEADERSTAGING, PMDBStaging.dbo.ProviderTitleHistory T
				WHERE AppStaging.DBO.WEBCPACEVALHEADERSTAGING.RegionID2 = T.RegionID
					AND T.TitleCode = 'RD' AND T.ActiveFlag = 'Y' AND T.RegionID is not null


	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
		SET echo_dr_no_ext = 
		case when len(echo_dr_no_ext) = 7
			then '00' + echo_dr_no_ext
			when len(echo_dr_no_ext) = 8
			then '0' + echo_dr_no_ext
			else echo_dr_no_ext
			end
	
	UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
		SET	ProviderMasterID = P.PROVIDERMASTERID
			FROM AppStaging.DBO.WEBCPACEVALHEADERSTAGING, PMDBStaging.dbo.ProviderMaster P
				WHERE AppStaging.DBO.WEBCPACEVALHEADERSTAGING.echo_dr_no_ext = P.echo_dr_no_ext

	/*Populate WebRegionCode from RegionLookup table for Web*/
	
	UPDATE AppStaging.DBO.WEBCPACEVALHEADERSTAGING
		SET REGIONCODE1 = R.WebRegionCode
			FROM AppStaging.DBO.WEBCPACEVALHEADERSTAGING S, PMDBStaging.dbo.RegionLookup R
				WHERE S.RegionID1 = R.RegionID

	UPDATE AppStaging.DBO.WEBCPACEVALHEADERSTAGING
		SET REGIONCODE2 = R.WebRegionCode
			FROM AppStaging.DBO.WEBCPACEVALHEADERSTAGING S, PMDBStaging.dbo.RegionLookup R
				WHERE S.RegionID2 = R.RegionID

			update AppStaging.dbo.webcpacevalheaderstaging 
			set totalhours = replace(totalhoursimport,',','')
			

		
		UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
		SET AcceleratedAdv = 'No' WHERE 
		AcceleratedAdv = 'no' or AcceleratedAdv is null

		UPDATE AppStaging.DBO.WebCPACEvalHeaderStaging
		SET AcceleratedAdv = 'Yes' WHERE 
		AcceleratedAdv= 'yes'

	--If evaluee is a Medical Director, Update the Medical Director ID to that of the Regional Director's.
	UPDATE
	AppStaging.DBO.webcpacevalheaderstaging 
	SET ProviderMasterIDMD1 = ProviderMasterIDRD1
	WHERE meddirectorisevalueesite1 = 'Y'

	UPDATE
	AppStaging.DBO.webcpacevalheaderstaging 
	SET ProviderMasterIDMD2 = ProviderMasterIDRD2
	WHERE meddirectorisevalueesite2 = 'Y'

	UPDATE AppStaging.DBO.webcpacevalheaderstaging
	SET Credate = getdate()
