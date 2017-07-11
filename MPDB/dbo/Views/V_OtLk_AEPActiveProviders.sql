

CREATE  VIEW [dbo].[V_OtLk_AEPActiveProviders] 
AS

	SELECT DISTINCT 
		PMB.ProviderMasterID, 
		LastName, 
		PreferredName, 
		Title, 
		EmailAddress, 
		(Case WHEN(SLoc1.Site1) IS NOT NULL
			THEN SLoc1.Site1 
			ELSE '' END + 
		Case WHEN(SLoc2.Site2) IS NOT NULL
			THEN '/' + SLoc2.Site2 
			ELSE '' END + 
		Case WHEN(SLoc3.Site3) IS NOT NULL
			THEN '/' + SLoc3.Site3 
			ELSE '' END +  
		Case WHEN(SLoc4.Site4) IS NOT NULL
			THEN '/' + SLoc4.Site4
			ELSE '' END ) As Company
	FROM dbo.TempStaffHistory AS SH
	JOIN dbo.ProviderMasterBase AS PMB 
		ON PMB.ProviderMasterID = SH.ProviderMasterID
	LEFT OUTER JOIN (SELECT WebCode, SiteLocationName AS Site1
			FROM dbo.SiteLocationLookup 
	) AS SLoc1 ON SLoc1.WebCode = PMB.Site1
	LEFT OUTER JOIN (SELECT WebCode, SiteLocationName AS Site2
			FROM dbo.SiteLocationLookup 
	) AS SLoc2 ON SLoc2.WebCode = PMB.Site2
	LEFT OUTER JOIN (SELECT WebCode, SiteLocationName AS Site3
			FROM dbo.SiteLocationLookup 
	) AS SLoc3 ON SLoc3.WebCode = PMB.Site3
	LEFT OUTER JOIN (SELECT WebCode, SiteLocationName AS Site4
			FROM dbo.SiteLocationLookup 
	) AS SLoc4 ON SLoc4.WebCode = PMB.Site4
	WHERE StaffGroup = 'AEP'
		AND StaffSubGroup LIKE 'Current%'
		AND PMB.Title NOT LIKE 'P%A%'

	



