/*Created 10/2004 to calculate Compliance Completed percentages by region to display on the web.

Antonia Miller - Updated - 1/2/2007 - Moved program to maw-datastage1, 
changing the server and database names in this SP*/


CREATE PROCEDURE [dbo].[usp_LoadWebComplianceStagingCalc] AS

CREATE TABLE #TEMPCALC
	(Region int,
	RegionCode varchar (10),
	WebCode varchar (10),
	CountRegionYes numeric (10,0),
	CountSiteYes numeric (10,0),
	CountTotalRegion numeric (10,0),
	CountTotalSite numeric (10,0),
	RegionFlag char(1),
	SiteFlag char(1),
	PercentComplete numeric (10,2),
	NumberIncomplete numeric (10,0))

	--Count of All Region entries
	INSERT INTO #TEMPCALC
	(Region,
	CountTotalRegion,
	RegionFlag)
	
	SELECT RegionID, COUNT (*), 'Y'
		FROM WebComplianceTrackingStaging 
			GROUP BY RegionID
			ORDER BY 1	

	--Count of All Site entries
	INSERT INTO #TEMPCALC
	(Region,
	WebCode,
	CountTotalSite,
	SiteFlag)
	
	SELECT regionid, webcode, COUNT (*), 'Y'
		FROM WebComplianceTrackingStaging 
			GROUP BY webcode, regionid
			ORDER BY 2	

--drop table #tempcalcreg
	CREATE TABLE #TEMPCALCREG
	(Region int,
	WebCode varchar (10),
	CountCompleted numeric (10,0),
	RegionFlag char(1),
	SiteFlag char(1))

	INSERT INTO #TEMPCALCREG
	(Region,
	CountCompleted,
	RegionFlag)

	(SELECT REGIONID, COUNT(RegionID), 'Y'
	FROM WebComplianceTrackingStaging
	WHERE ComplianceCompleted = 'Y'
	GROUP BY REGIONID)


	UPDATE #TEMPCALC
	SET CountRegionYes = C2.COUNTCOMPLETED
	FROM #TEMPCALC C1, #TEMPCALCREG C2
	WHERE C1.Region = C2.Region

	UPDATE #TEMPCALC
	SET CountRegionYes = 0 
	WHERE CountRegionYes is null

	UPDATE #TEMPCALC
	SET CountTotalRegion = 0 
	WHERE CountTotalRegion is null

	UPDATE #TEMPCALC
	SET RegionCode = RL.WebRegionCode
	FROM #TEMPCALC C, CEPIntegratedDB.dbo.RegionLookup RL
	WHERE C.Region = RL.RegionID
	

	INSERT INTO #TEMPCALCREG
	(Region,
	WebCode,
	CountCompleted,
	SiteFlag)

	(SELECT Regionid, webcode, COUNT(webcode), 'Y'
	FROM WebComplianceTrackingStaging
	WHERE ComplianceCompleted = 'Y'
	GROUP BY webcode, regionid)


	UPDATE #TEMPCALC
	SET CountSiteYes = C2.COUNTCOMPLETED
	FROM #TEMPCALC C1, #TEMPCALCREG C2
	WHERE C1.WebCode = C2.Webcode

	UPDATE #TEMPCALC
	SET CountSiteYes = 0
	WHERE CountSiteYes is null

	UPDATE #TEMPCALC
	SET CountTotalSite = 0 
	WHERE CountTotalSite is null

	UPDATE #TEMPCALC
	SET PercentComplete = CountRegionYes/CountTotalRegion where RegionFlag = 'Y'

	UPDATE #TEMPCALC
	SET PercentComplete = CountSiteYes/CountTotalSite where SiteFlag = 'Y'

	UPDATE #TEMPCALC
	SET NumberInComplete = CountTotalRegion - CountRegionYes where RegionFlag = 'Y'
	
	UPDATE #TEMPCALC
	SET NumberInComplete = CountTotalSite - CountSiteYes where SiteFlag = 'Y'


	INSERT INTO WebComplianceTrackingCalcStaging
	(RegionID,
	RegionCode,
	WebCode,
	PercentComplete,
	NumberIncomplete,
	RegionFlag)

	SELECT 
	Region, 
	RegionCode,
	webcode, 
	percentcomplete,
	NumberIncomplete,
	'Y'
		FROM #tempcalc 
		WHERE regionflag = 'Y' order by region

	INSERT INTO WebComplianceTrackingCalcStaging
	(RegionID,
	RegionCode,
	WebCode,
	PercentComplete,
	NumberIncomplete,
	SiteFlag)

	SELECT
	Region, 
	RegionCode,
	webcode,
	percentcomplete,
	numberincomplete,
	'Y'
		FROM #tempcalc 
		WHERE SiteFlag = 'Y' order by region, webcode


	INSERT INTO WebComplianceTrackingCalcTemp
	SELECT * FROM #TEMPCALC
