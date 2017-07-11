
CREATE PROCEDURE [dbo].[usp_LoadWebSiteLineHourly_SFDC] AS

/*Script populates the hourly rate by site for upload to the web.*/

	DELETE FROM AppStaging.DBO.WEBSITELINEHOURLYSTAGING WHERE CTRBSEHOUR = 0
	DELETE FROM AppStaging.DBO.WEBSITELINEHOURLYSTAGING WHERE CTRID = 22

	--UPDATE AppStaging.DBO.WEBSITELINEHOURLYSTAGING
	--	SET SITELOCATIONID = M.SITELOCATIONID
	--		FROM AppStaging.DBO.WEBSITELINEHOURLYSTAGING S, ApplicationIntegration.DBO.SITELOCATIONSITELINEMATCHES M
	--			WHERE S.CTRID = M.SITELINECTRID

	UPDATE AppStaging.DBO.WEBSITELINEHOURLYSTAGING
		SET WEBCODE = S.CODE,
			MARSPracticeCode = S.MARSPractice
			FROM AppStaging.DBO.WEBSITELINEHOURLYSTAGING W, 
						ApplicationIntegration.DBO.SystemSiteLookup S
				WHERE S.CtrID = W.CtrID

	/*UPDATE WebSiteLineHourlyStaging
		SET MARSPracticeCode = P.MARSPracticeCode
			FROM WebSiteLineHourlyStaging, ApplicationIntegration.dbo.SiteLocationLookup P
				WHERE WebSiteLineHourlyStaging.WebCode = P.WebCode
					AND P.WebCode is not null*/

	INSERT INTO WEBSTAGING.DBO.WEBSITELINEHOURLY
		(SiteName,
		WebCode,
		SiteLineHourly,
		MARSPracticeCode)
			SELECT 
			SiteLocationName,
			WebCode,
			CtrBseHour,
			MARSPracticeCode
				FROM AppStaging.DBO.WEBSITELINEHOURLYSTAGING
					WHERE WebCode IS NOT NULL

