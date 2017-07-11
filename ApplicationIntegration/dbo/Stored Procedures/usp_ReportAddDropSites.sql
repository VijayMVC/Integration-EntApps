
CREATE PROCEDURE [dbo].[usp_ReportAddDropSites] AS
/*Script for DTS Package - 
		Send Out New Hires and Weekly Changes
	Revision:  Andrew Marsh -- 7/12/2004 -- Modify for Multiple Clients
		Antonia Miller - 9/7/2007 Added fields to WCAS, WCDS tables to separate sites so add and drop dates can be in reports
		Antonia Miller - 12/3/2007 Added Add and Drop Site Effective Dates.
		Mohamed Mahmoud - 5/5/2009 Added logic for SEMA AddSites
		Reetika Singh  - 5/20/2011 Replaced SEMA with GALEN
		Reetika Singh - As of 4/1/2011 SEMA is a part of CEP
*/
/* Weekly Changes Tab */

BEGIN
	/* Pre Processing */
	/* Finding out Add and Drop Sites */
	TRUNCATE TABLE AppStaging.dbo.WeeklyChangesTempSites
	TRUNCATE TABLE AppStaging.dbo.WeeklyChangesAddSites
	TRUNCATE TABLE AppStaging.dbo.WeeklyChangesDropSites

	INSERT INTO AppStaging.dbo.WeeklyChangesTempSites
	SELECT 	DISTINCT 
		PMUA.ProviderMasterID, 
		PMUA.Site1, 
		PMUA.Site2, 
		PMUA.Site3, 
		PMUA.Site4, 
		PMUA.Site1Old, 
		PMUA.Site2Old, 
		PMUA.Site3Old, 
		PMUA.Site4Old
		FROM ProviderMasterUpdateArchive PMUA
		INNER JOIN ProviderMasterBase PMB
			ON PMB.ProviderMasterID = PMUA.ProviderMasterID
		WHERE 	 PMUA.SentFlag IS NULL
		  AND 	 PMB.StaffGroup1 = 'CEP'
		  AND	(PMUA.Site1Old != ' ' 
		   OR 	 PMUA.Site2Old != ' '
		   OR	 PMUA.Site3Old != ' '
		   OR 	 PMUA.Site4Old != ' ')

	INSERT INTO AppStaging.dbo.WeeklyChangesTempSites
	SELECT 	DISTINCT 
		PMUA.ProviderMasterID, 
		PMUA.Site1, 
		PMUA.Site2, 
		PMUA.Site3, 
		PMUA.Site4, 
		PMUA.Site1Old, 
		PMUA.Site2Old, 
		PMUA.Site3Old, 
		PMUA.Site4Old
		FROM ProviderMasterUpdateArchive PMUA
		INNER JOIN ProviderMasterBase PMB
			ON PMB.ProviderMasterID = PMUA.ProviderMasterID
		WHERE 	 PMUA.SentFlag IS NULL
		  AND 	 PMB.StaffGroup2 = 'GALEN'
		  AND PMB.StaffGroup1 <> 'CEP'
		  AND	(PMUA.Site1Old != ' ' 
		   OR 	 PMUA.Site2Old != ' '
		   OR	 PMUA.Site3Old != ' '
		   OR 	 PMUA.Site4Old != ' ')

	INSERT INTO AppStaging.dbo.WeeklyChangesAddSites 
		(ProviderMasterID)
	SELECT DISTINCT WCTS.ProviderMasterID
		FROM AppStaging.dbo.WeeklyChangesTempSites WCTS

	UPDATE AppStaging.dbo.WeeklyChangesAddSites SET 
		Sites = HR.HospitalName,
		AppStaging.dbo.WeeklyChangesAddSites.Site1 = HR.HospitalName,
		AppStaging.dbo.WeeklyChangesAddSites.WebCode1 = HR.Code
		FROM AppStaging.dbo.WeeklyChangesTempSites WCTS
		INNER JOIN AppStaging.dbo.WeeklyChangesAddSites WCAS
			ON WCTS.ProviderMasterId = WCAS.ProviderMasterID
		LEFT OUTER JOIN Hospital_region HR
		  	ON WCTS.Site1 = HR.Code
		WHERE WCTS.Site1 != 'No S1'
		  AND WCTS.Site1 != Site1Old 
		  AND WCTS.Site1 != Site2Old 
		  AND WCTS.Site1 != Site3Old
		  AND WCTS.Site1 != Site4Old

	UPDATE AppStaging.dbo.WeeklyChangesAddSites SET 
		Sites = CASE 
			WHEN WCAS.Sites IS NULL THEN HR.HospitalName
			ELSE WCAS.Sites + ', ' + HR.HospitalName END,
		AppStaging.dbo.WeeklyChangesAddSites.Site2 = HR.HospitalName,
		AppStaging.dbo.WeeklyChangesAddSites.WebCode2 = HR.Code
		FROM AppStaging.dbo.WeeklyChangesTempSites WCTS
		INNER JOIN AppStaging.dbo.WeeklyChangesAddSites WCAS
			ON WCTS.ProviderMasterId = WCAS.ProviderMasterID
		INNER JOIN Hospital_region HR
			ON WCTS.Site2 = HR.Code
		WHERE WCTS.Site2 != 'No S2'
		  AND WCTS.Site2 != Site1Old 
		  AND WCTS.Site2 != Site2Old 
		  AND WCTS.Site2 != Site3Old
		  AND WCTS.Site2 != Site4Old

	UPDATE AppStaging.dbo.WeeklyChangesAddSites SET 
		Sites = CASE 
			WHEN WCAS.Sites IS NULL THEN HR.HospitalName
			ELSE WCAS.Sites + ', ' + HR.HospitalName END,
		AppStaging.dbo.WeeklyChangesAddSites.Site3 = HR.HospitalName,
		AppStaging.dbo.WeeklyChangesAddSites.WebCode3 = HR.Code
		FROM AppStaging.dbo.WeeklyChangesTempSites WCTS
		INNER JOIN AppStaging.dbo.WeeklyChangesAddSites WCAS
			ON WCTS.ProviderMasterId = WCAS.ProviderMasterID
		INNER JOIN Hospital_region HR
			ON WCTS.Site3 = HR.Code
		WHERE WCTS.Site3 != 'No S3'
		  AND WCTS.Site3 != Site1Old 
		  AND WCTS.Site3 != Site2Old 
		  AND WCTS.Site3 != Site3Old
		  AND WCTS.Site3 != Site4Old

	UPDATE AppStaging.dbo.WeeklyChangesAddSites SET 
		Sites = CASE 
			WHEN WCAS.Sites IS NULL THEN HR.HospitalName
			ELSE WCAS.Sites + ', ' + HR.HospitalName END,
		AppStaging.dbo.WeeklyChangesAddSites.Site4 = HR.HospitalName,
		AppStaging.dbo.WeeklyChangesAddSites.WebCode4 = HR.Code
		FROM AppStaging.dbo.WeeklyChangesTempSites WCTS
		INNER JOIN AppStaging.dbo.WeeklyChangesAddSites WCAS
			ON WCTS.ProviderMasterId = WCAS.ProviderMasterID
		INNER JOIN Hospital_region HR
			ON WCTS.Site4 = HR.Code
		WHERE WCTS.Site4 != 'No S4'
		  AND WCTS.Site4 != Site1Old 
		  AND WCTS.Site4 != Site2Old 
		  AND WCTS.Site4 != Site3Old
		  AND WCTS.Site4 != Site4Old

	UPDATE AppStaging.dbo.WeeklyChangesAddSites
		SET Sites = ' '
		WHERE Sites IS NULL

	INSERT INTO AppStaging.dbo.WeeklyChangesDropSites (ProviderMasterID)
	SELECT DISTINCT WCTS.ProviderMasterID
		FROM AppStaging.dbo.WeeklyChangesTempSites WCTS

	UPDATE AppStaging.dbo.WeeklyChangesDropSites
		SET Sites = HR.HospitalName,
		AppStaging.dbo.WeeklyChangesDropSites.Site1 = HR.HospitalName,
		AppStaging.dbo.WeeklyChangesDropSites.WebCode1 = HR.Code
		FROM AppStaging.dbo.WeeklyChangesTempSites WCTS
		INNER JOIN AppStaging.dbo.WeeklyChangesDropSites WCDS
			ON WCTS.ProviderMasterId = WCDS.ProviderMasterID
		INNER JOIN Hospital_region HR
			ON WCTS.Site1Old = HR.Code
		  	WHERE WCTS.Site1Old != ' ' 
		  	  AND WCTS.Site1Old != WCTS.Site1 
			  AND WCTS.Site1Old != WCTS.Site2 
			  AND WCTS.Site1Old != WCTS.Site3
			  AND WCTS.Site1Old != WCTS.Site4

	UPDATE AppStaging.dbo.WeeklyChangesDropSites
		SET Sites = CASE 
			WHEN WCDS.Sites IS NULL THEN HR.HospitalName	
			ELSE WCDS.Sites + ', ' + HR.HospitalName END,
		AppStaging.dbo.WeeklyChangesDropSites.Site2 = HR.HospitalName,
		AppStaging.dbo.WeeklyChangesDropSites.WebCode2 = HR.Code
		FROM AppStaging.dbo.WeeklyChangesTempSites WCTS
		INNER JOIN AppStaging.dbo.WeeklyChangesDropSites WCDS
			ON WCTS.ProviderMasterId = WCDS.ProviderMasterID
		INNER JOIN Hospital_region HR
			ON WCTS.Site2Old = HR.Code
		  	WHERE WCTS.Site2Old != ' ' 
		  	  AND WCTS.Site2Old != WCTS.Site1 
			  AND WCTS.Site2Old != WCTS.Site2 
			  AND WCTS.Site2Old != WCTS.Site3
			  AND WCTS.Site2Old != WCTS.Site4

	UPDATE AppStaging.dbo.WeeklyChangesDropSites
		SET Sites = CASE 
			WHEN WCDS.Sites IS NULL THEN HR.HospitalName	
			ELSE WCDS.Sites + ', ' + HR.HospitalName END,
		AppStaging.dbo.WeeklyChangesDropSites.Site3 = HR.HospitalName,
		AppStaging.dbo.WeeklyChangesDropSites.WebCode3 = HR.Code
		FROM AppStaging.dbo.WeeklyChangesTempSites WCTS
		INNER JOIN AppStaging.dbo.WeeklyChangesDropSites WCDS
			ON WCTS.ProviderMasterId = WCDS.ProviderMasterID
		INNER JOIN Hospital_region HR
			ON WCTS.Site3Old = HR.Code
		  	WHERE WCTS.Site3Old != ' ' 
		  	  AND WCTS.Site3Old != WCTS.Site1 
			  AND WCTS.Site3Old != WCTS.Site2 
			  AND WCTS.Site3Old != WCTS.Site3
			  AND WCTS.Site3Old != WCTS.Site4

	UPDATE AppStaging.dbo.WeeklyChangesDropSites
		SET Sites = CASE 
			WHEN WCDS.Sites IS NULL THEN HR.HospitalName	
			ELSE WCDS.Sites + ', ' + HR.HospitalName END,
		AppStaging.dbo.WeeklyChangesDropSites.Site4 = HR.HospitalName,
		AppStaging.dbo.WeeklyChangesDropSites.WebCode4 = HR.Code
		FROM AppStaging.dbo.WeeklyChangesTempSites WCTS
		INNER JOIN AppStaging.dbo.WeeklyChangesDropSites WCDS
			ON WCTS.ProviderMasterId = WCDS.ProviderMasterID
		INNER JOIN Hospital_region HR
			ON WCTS.Site4Old = HR.Code
		  	WHERE WCTS.Site4Old != ' ' 
		  	  AND WCTS.Site4Old != WCTS.Site1 
			  AND WCTS.Site4Old != WCTS.Site2 
			  AND WCTS.Site4Old != WCTS.Site3
			  AND WCTS.Site4Old != WCTS.Site4

	/*This code changed, must be matched with the web*/
	UPDATE AppStaging.dbo.WeeklyChangesDropSites
		SET WEBCODE1 = 'DEL1' WHERE WEBCODE1 = 'DEL3'
	UPDATE AppStaging.dbo.WeeklyChangesDropSites
		SET WEBCODE2 = 'DEL1' WHERE WEBCODE2 = 'DEL3'
	UPDATE AppStaging.dbo.WeeklyChangesDropSites
		SET WEBCODE3 = 'DEL1' WHERE WEBCODE3 = 'DEL3'
	UPDATE AppStaging.dbo.WeeklyChangesDropSites
		SET WEBCODE4 = 'DEL1' WHERE WEBCODE4 = 'DEL3'

	UPDATE AppStaging.dbo.WeeklyChangesAddSites
		SET WEBCODE1 = 'DEL1' WHERE WEBCODE1 = 'DEL3'
	UPDATE AppStaging.dbo.WeeklyChangesAddSites
		SET WEBCODE2 = 'DEL1' WHERE WEBCODE2 = 'DEL3'
	UPDATE AppStaging.dbo.WeeklyChangesAddSites
		SET WEBCODE3 = 'DEL1' WHERE WEBCODE3 = 'DEL3'
	UPDATE AppStaging.dbo.WeeklyChangesAddSites
		SET WEBCODE4 = 'DEL1' WHERE WEBCODE4 = 'DEL3'


	UPDATE AppStaging.dbo.WeeklyChangesDropSites
		SET WEBCODE1 = 'BOS1' WHERE WEBCODE1 = 'BOS3'
	UPDATE AppStaging.dbo.WeeklyChangesDropSites
		SET WEBCODE2 = 'BOS1' WHERE WEBCODE2 = 'BOS3'
	UPDATE AppStaging.dbo.WeeklyChangesDropSites
		SET WEBCODE3 = 'BOS1' WHERE WEBCODE3 = 'BOS3'
	UPDATE AppStaging.dbo.WeeklyChangesDropSites
		SET WEBCODE4 = 'BOS1' WHERE WEBCODE4 = 'BOS3'

	UPDATE AppStaging.dbo.WeeklyChangesAddSites
		SET WEBCODE1 = 'BOS1' WHERE WEBCODE1 = 'BOS3'
	UPDATE AppStaging.dbo.WeeklyChangesAddSites
		SET WEBCODE2 = 'BOS1' WHERE WEBCODE2 = 'BOS3'
	UPDATE AppStaging.dbo.WeeklyChangesAddSites
		SET WEBCODE3 = 'BOS1' WHERE WEBCODE3 = 'BOS3'
	UPDATE AppStaging.dbo.WeeklyChangesAddSites
		SET WEBCODE4 = 'BOS1' WHERE WEBCODE4 = 'BOS3'



/*CALCULATE EARLIEST SCHEDULE DATE FOR AN ADDED SITE*/
	CREATE TABLE #TEMPFIRSTWORKDATE
	(ProvidermasterID int,
	MinDOS datetime,
	Lastname varchar (100),
	FirstName varchar (100),
	Title varchar (50),
	WebCode varchar (10),
	SiteLocationName varchar (100))

	INSERT INTO #TEMPFIRSTWORKDATE
	(ProvidermasterID,
	MinDOS,
	WebCode)
	SELECT DISTINCT dbo.ProviderMaster.ProviderMasterID,
	MIN(ProviderHoursDetail.DateOfService) MINDOS, Site
		FROM  dbo.ProviderMaster, ProviderHoursDetail
			WHERE ( ProviderHoursDetail.ProviderMasterID=dbo.ProviderMaster.ProviderMasterID  )
			GROUP BY dbo.ProviderMaster.ProviderMasterID, Site
			HAVING MIN(dateofservice) >= '1/1/2005'
	

	UPDATE #TEMPFIRSTWORKDATE
		SET LASTNAME = ProviderHoursDetail.Lastname,
		FIRSTNAME = ProviderHoursDetail.FirstName,
		TITLE = Providermaster.Title
		FROM #TEMPFIRSTWORKDATE, ProviderHoursDetail, ProviderMaster
				WHERE #TEMPFIRSTWORKDATE.Providermasterid = ProviderHoursDetail.Providermasterid
					and ProviderHoursDetail.ProvidermasterID = Providermaster.ProvidermasterID

/*CALCULATE THE LAST SHIFT WORKED AT A DROPPED SITE*/
	CREATE TABLE #TEMPLASTWORKDATE
	(ProvidermasterID int,
	MAXDOS datetime,
	Lastname varchar (100),
	FirstName varchar (100),
	Title varchar (50),
	WebCode varchar (10),
	SiteLocationName varchar (100))

	INSERT INTO #TEMPLASTWORKDATE
	(ProvidermasterID,
	MAXDOS,
	WebCode)
	SELECT DISTINCT dbo.ProviderMaster.ProviderMasterID,
	MAX(ProviderHoursDetail.DateOfService) MAXDOS, Site
		FROM  dbo.ProviderMaster, ProviderHoursDetail
			WHERE ( ProviderHoursDetail.ProviderMasterID=dbo.ProviderMaster.ProviderMasterID  )
			GROUP BY dbo.ProviderMaster.ProviderMasterID, Site
			HAVING MIN(dateofservice) >= '1/1/2005'
	


/*DROP SITE EFFECTIVE DATES (MAXIMUM SCHEDULE DATE)*/
	UPDATE AppStaging.DBO.WEEKLYCHANGESDROPSITES
		SET SITE1EFFECTIVEDATE =  #TEMPLASTWORKDATE.MAXDOS
			FROM AppStaging.DBO.WEEKLYCHANGESDROPSITES, #TEMPLASTWORKDATE
				WHERE AppStaging.DBO.WEEKLYCHANGESDROPSITES.PROVIDERMASTERID = #TEMPLASTWORKDATE.PROVIDERMASTERID
				AND AppStaging.DBO.WEEKLYCHANGESDROPSITES.WEBCODE1 = #TEMPLASTWORKDATE.WEBCODE

	UPDATE AppStaging.DBO.WEEKLYCHANGESDROPSITES
		SET SITE2EFFECTIVEDATE =  #TEMPLASTWORKDATE.MAXDOS
			FROM AppStaging.DBO.WEEKLYCHANGESDROPSITES, #TEMPLASTWORKDATE
				WHERE AppStaging.DBO.WEEKLYCHANGESDROPSITES.PROVIDERMASTERID = #TEMPLASTWORKDATE.PROVIDERMASTERID
				AND AppStaging.DBO.WEEKLYCHANGESDROPSITES.WEBCODE2 = #TEMPLASTWORKDATE.WEBCODE

	UPDATE AppStaging.DBO.WEEKLYCHANGESDROPSITES
		SET SITE3EFFECTIVEDATE =  #TEMPLASTWORKDATE.MAXDOS
			FROM AppStaging.DBO.WEEKLYCHANGESDROPSITES, #TEMPLASTWORKDATE
				WHERE AppStaging.DBO.WEEKLYCHANGESDROPSITES.PROVIDERMASTERID = #TEMPLASTWORKDATE.PROVIDERMASTERID
				AND AppStaging.DBO.WEEKLYCHANGESDROPSITES.WEBCODE3 = #TEMPLASTWORKDATE.WEBCODE

	UPDATE AppStaging.DBO.WEEKLYCHANGESDROPSITES
		SET SITE4EFFECTIVEDATE =  #TEMPLASTWORKDATE.MAXDOS
			FROM AppStaging.DBO.WEEKLYCHANGESDROPSITES, #TEMPLASTWORKDATE
				WHERE AppStaging.DBO.WEEKLYCHANGESDROPSITES.PROVIDERMASTERID = #TEMPLASTWORKDATE.PROVIDERMASTERID
				AND AppStaging.DBO.WEEKLYCHANGESDROPSITES.WEBCODE4 = #TEMPLASTWORKDATE.WEBCODE

	UPDATE AppStaging.DBO.WEEKLYCHANGESDROPSITES
		SET SITE1EFFECTIVEDATE = 'NEVER WORKED AT SITE'
			WHERE WEBCODE1 IS NOT NULL AND SITE1EFFECTIVEDATE IS NULL

	UPDATE AppStaging.DBO.WEEKLYCHANGESDROPSITES
		SET SITE2EFFECTIVEDATE = 'NEVER WORKED AT SITE'
			WHERE WEBCODE2 IS NOT NULL AND SITE2EFFECTIVEDATE IS NULL

	UPDATE AppStaging.DBO.WEEKLYCHANGESDROPSITES
		SET SITE3EFFECTIVEDATE = 'NEVER WORKED AT SITE'
			WHERE WEBCODE3 IS NOT NULL AND SITE3EFFECTIVEDATE IS NULL

	UPDATE AppStaging.DBO.WEEKLYCHANGESDROPSITES
		SET SITE4EFFECTIVEDATE = 'NEVER WORKED AT SITE'
			WHERE WEBCODE4 IS NOT NULL AND SITE4EFFECTIVEDATE IS NULL


	UPDATE AppStaging.DBO.WEEKLYCHANGESDROPSITES
		SET 	SITE1EFFECTIVEDATE = REPLACE (SITE1EFFECTIVEDATE, '12:00AM', ''),
			SITE2EFFECTIVEDATE = REPLACE (SITE2EFFECTIVEDATE, '12:00AM', ''),
			SITE3EFFECTIVEDATE = REPLACE (SITE3EFFECTIVEDATE, '12:00AM', ''),
			SITE4EFFECTIVEDATE = REPLACE (SITE4EFFECTIVEDATE, '12:00AM', '')

/*ADD SITE EFFECTIVE DATES (MINIMUM SCHEDULE DATE)*/

	UPDATE AppStaging.DBO.WEEKLYCHANGESADDSITES
		SET SITE1EFFECTIVEDATE =  #TEMPFIRSTWORKDATE.MINDOS
			FROM AppStaging.DBO.WEEKLYCHANGESADDSITES, #TEMPFIRSTWORKDATE
				WHERE AppStaging.DBO.WEEKLYCHANGESADDSITES.PROVIDERMASTERID = #TEMPFIRSTWORKDATE.PROVIDERMASTERID
				AND AppStaging.DBO.WEEKLYCHANGESADDSITES.WEBCODE1 = #TEMPFIRSTWORKDATE.WEBCODE

	UPDATE AppStaging.DBO.WEEKLYCHANGESADDSITES
		SET SITE2EFFECTIVEDATE =  #TEMPFIRSTWORKDATE.MINDOS
			FROM AppStaging.DBO.WEEKLYCHANGESADDSITES, #TEMPFIRSTWORKDATE
				WHERE AppStaging.DBO.WEEKLYCHANGESADDSITES.PROVIDERMASTERID = #TEMPFIRSTWORKDATE.PROVIDERMASTERID
				AND AppStaging.DBO.WEEKLYCHANGESADDSITES.WEBCODE2 = #TEMPFIRSTWORKDATE.WEBCODE

	UPDATE AppStaging.DBO.WEEKLYCHANGESADDSITES
		SET SITE3EFFECTIVEDATE =  #TEMPFIRSTWORKDATE.MINDOS
			FROM AppStaging.DBO.WEEKLYCHANGESADDSITES, #TEMPFIRSTWORKDATE
				WHERE AppStaging.DBO.WEEKLYCHANGESADDSITES.PROVIDERMASTERID = #TEMPFIRSTWORKDATE.PROVIDERMASTERID
				AND AppStaging.DBO.WEEKLYCHANGESADDSITES.WEBCODE3 = #TEMPFIRSTWORKDATE.WEBCODE

	UPDATE AppStaging.DBO.WEEKLYCHANGESADDSITES
		SET SITE4EFFECTIVEDATE =  #TEMPFIRSTWORKDATE.MINDOS
			FROM AppStaging.DBO.WEEKLYCHANGESADDSITES, #TEMPFIRSTWORKDATE
				WHERE AppStaging.DBO.WEEKLYCHANGESADDSITES.PROVIDERMASTERID = #TEMPFIRSTWORKDATE.PROVIDERMASTERID
				AND AppStaging.DBO.WEEKLYCHANGESADDSITES.WEBCODE4 = #TEMPFIRSTWORKDATE.WEBCODE


	
	UPDATE AppStaging.DBO.WEEKLYCHANGESADDSITES
		SET SITE1EFFECTIVEDATE = 'NOT YET ON WEB SCHEDULE'
			WHERE WEBCODE1 IS NOT NULL AND SITE1EFFECTIVEDATE IS NULL

	UPDATE AppStaging.DBO.WEEKLYCHANGESADDSITES
		SET SITE2EFFECTIVEDATE = 'NOT YET ON WEB SCHEDULE'
			WHERE WEBCODE2 IS NOT NULL AND SITE2EFFECTIVEDATE IS NULL

	UPDATE AppStaging.DBO.WEEKLYCHANGESADDSITES
		SET SITE3EFFECTIVEDATE = 'NOT YET ON WEB SCHEDULE'
			WHERE WEBCODE3 IS NOT NULL AND SITE3EFFECTIVEDATE IS NULL

	UPDATE AppStaging.DBO.WEEKLYCHANGESADDSITES
		SET SITE4EFFECTIVEDATE = 'NOT YET ON WEB SCHEDULE'
			WHERE WEBCODE4 IS NOT NULL AND SITE4EFFECTIVEDATE IS NULL

	UPDATE AppStaging.DBO.WEEKLYCHANGESADDSITES
		SET 	SITE1EFFECTIVEDATE = REPLACE (SITE1EFFECTIVEDATE, '12:00AM', ''),
			SITE2EFFECTIVEDATE = REPLACE (SITE2EFFECTIVEDATE, '12:00AM', ''),
			SITE3EFFECTIVEDATE = REPLACE (SITE3EFFECTIVEDATE, '12:00AM', ''),
			SITE4EFFECTIVEDATE = REPLACE (SITE4EFFECTIVEDATE, '12:00AM', '')


		
END

