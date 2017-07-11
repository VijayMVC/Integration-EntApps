
CREATE VIEW [dbo].[vw_ProviderMasterUpdateLog] 
AS

/* 	Author: 	Andrew Marsh
	Date:		4/28/2004
	Purpose:	View combines 
			ProviderMasterUpdateLog with the SiteLocationLookup Tables
	Revision:	

*/
SELECT  PMUL.*,
	CASE 	WHEN SLL1.SiteLocationName IS NULL THEN ' '
		ELSE SLL1.SiteLocationName END AS SiteLoc1,
	CASE 	WHEN SLL1A.SiteLocationName IS NULL THEN ' '
		ELSE SLL1A.SiteLocationName END AS SiteLoc1Old,
	CASE 	WHEN SLL2.SiteLocationName IS NULL THEN ' '
		ELSE SLL2.SiteLocationName END AS SiteLoc2,
	CASE 	WHEN SLL2A.SiteLocationName IS NULL THEN ' '
		ELSE SLL2A.SiteLocationName END AS SiteLoc2Old,
	CASE 	WHEN SLL3.SiteLocationName IS NULL THEN ' '
		ELSE SLL3.SiteLocationName END AS SiteLoc3,
	CASE 	WHEN SLL3A.SiteLocationName IS NULL THEN ' '
		ELSE SLL3A.SiteLocationName END AS SiteLoc3Old,
	CASE 	WHEN SLL4.SiteLocationName IS NULL THEN ' '
		ELSE SLL4.SiteLocationName END AS SiteLoc4,
	CASE 	WHEN SLL4A.SiteLocationName IS NULL THEN ' '
		ELSE SLL4A.SiteLocationName END AS SiteLoc4Old
	FROM ProviderMasterUpdateLog		PMUL	WITH (NOLOCK) 
	LEFT OUTER JOIN SiteLocationLookup 	SLL1	WITH (NOLOCK)
		ON PMUL.Site1 = SLL1.WebCode
	LEFT OUTER JOIN SiteLocationLookup 	SLL1A	WITH (NOLOCK)
		ON PMUL.Site1Old = SLL1A.WebCode
	LEFT OUTER JOIN SiteLocationLookup 	SLL2	WITH (NOLOCK)
		ON PMUL.Site2 = SLL2.WebCode
	LEFT OUTER JOIN SiteLocationLookup 	SLL2A	WITH (NOLOCK)
		ON PMUL.Site2Old = SLL2A.WebCode
	LEFT OUTER JOIN SiteLocationLookup 	SLL3	WITH (NOLOCK)
		ON PMUL.Site3 = SLL3.WebCode
	LEFT OUTER JOIN SiteLocationLookup 	SLL3A	WITH (NOLOCK)
		ON PMUL.Site3Old = SLL3A.WebCode
	LEFT OUTER JOIN SiteLocationLookup 	SLL4	WITH (NOLOCK)
		ON PMUL.Site4 = SLL4.WebCode
	LEFT OUTER JOIN SiteLocationLookup 	SLL4A	WITH (NOLOCK)
		ON PMUL.Site4Old = SLL4A.WebCode



