
/*Stored Procedure is designed to add First Work Date for New Hires 
and Last Work Date for Separations from the web schedules.
Antonia Miller  5/7/2007 used for New Hire and Weekly Changes Report
 Modified by Mohamed Mahmoud - 1/30/2009 - to explicitly exclude 
 SEMA from report (per Angella Bernal)
 Reetika Singh - 5/20/2011 - to explicitly exclude GALEN from report (SEMA is part of CEP and GALEN in on WEB)
 */

CREATE PROCEDURE [dbo].[usp_ReportProviderStatusChangesWeekly] AS


TRUNCATE TABLE ReportProviderStatusChanges 

/*NEW HIRES*/
INSERT INTO ReportProviderStatusChanges 
	(StatusType ,
	FirstName ,
	LastName ,
	Title,
	Address1,
	CityStateZip,
	PhoneNbr1 ,
	CellPhoneNbr,
	PagerNbr,
	EmailAddress ,
	[CEP/AEP/DEP/WEP-Email],
	SiteLocationName,
	WebCode,
	DateOfHireInCredentialingSystem,
	PartnershipLevel,
	ProviderMasterID)

	SELECT DISTINCT
		CASE WHEN PMB.StaffGroup2 = 'GALEN'
				THEN 'Hosp - NEW HIRE'
				ELSE 'CEP - NEW HIRE' END,
		PMB.FirstName, 
		PMB.LastName, 
		PMB.Title,
		PMB.Address1, 
		RTRIM(LTRIM(PMB.City1)) + ', ' + PMB.State1 + ' ' + PMB.ZipCode1
			AS CityStateZip,
		PMB.PhoneNbr1, 
		PMB.CellPhoneNbr, 
		PMB.PagerNbr,
		PMB.EmailAddress, 
		PMB.CEPEmail, 
		HR.HospitalName, 
		HR.Code,
		Prov.DateOfHire, 
		Prov.PartnershipLevel,
		Prov.ProviderMasterID
			FROM ProviderMasterBase PMB
				INNER JOIN ProviderMaster Prov
				ON PMB.ProviderMasterID = Prov.ProviderMasterID
				INNER JOIN Hospital_region HR
		 		ON PMB.Site1 	  = HR.Code
					WHERE Prov.CurrentProviderFlag  = 'Y'
	  					AND Prov.WebID 		IS NOT NULL
	  					AND PMB.NewHireSentFlag 	IS NULL
	  					AND PMB.ProviderMasterID != 2557 /* Test ID */
						--AND Prov.DateOfHire >= GETDATE() - 15
						AND PMB.Status = 0
						ORDER BY PMB.LastName



/*CALCULATE EARLIEST SCHEDULE DATE*/

	CREATE TABLE #TEMPFIRSTWORKDATE
	(ProvidermasterID int,
	MinDOS datetime,
	Lastname varchar (100),
	FirstName varchar (100),
	Title varchar (50))

	INSERT INTO #TEMPFIRSTWORKDATE
	(ProvidermasterID,
	MinDOS)
	SELECT DISTINCT dbo.ProviderMaster.ProviderMasterID,
	MIN(ProviderHoursDetail.DateOfService) MINDOS
		FROM  dbo.ProviderMaster, ProviderHoursDetail
			WHERE ( ProviderHoursDetail.ProviderMasterID=dbo.ProviderMaster.ProviderMasterID  )
			GROUP BY dbo.ProviderMaster.ProviderMasterID
			HAVING MIN(dateofservice) >= '1/1/2005'
	

	UPDATE #TEMPFIRSTWORKDATE
		SET LASTNAME = ProviderHoursDetail.Lastname,
		FIRSTNAME = ProviderHoursDetail.FirstName,
		TITLE = Providermaster.Title
			FROM #TEMPFIRSTWORKDATE, ProviderHoursDetail, ProviderMaster
				WHERE #TEMPFIRSTWORKDATE.Providermasterid = ProviderHoursDetail.Providermasterid
					and ProviderHoursDetail.ProvidermasterID = Providermaster.ProvidermasterID

	UPDATE ReportProviderStatusChanges 
		SET FIRSTWORKDATE = #TEMPFIRSTWORKDATE.MINDOS, FIRSTWORKDATETIME = MINDOS, 
				LastWorkDate = 'X'
		FROM ReportProviderStatusChanges, #TEMPFIRSTWORKDATE
		WHERE ReportProviderStatusChanges.Providermasterid = #TEMPFIRSTWORKDATE.Providermasterid
		AND ReportProviderStatusChanges.StatusType LIKE '%NEW HIRE%'


	UPDATE ReportProviderStatusChanges 
	SET FirstWorkDate = REPLACE(ReportProviderStatusChanges.FirstWorkDate,'12:00AM', '')
	WHERE STATUSTYPE LIKE '%NEW HIRE%'

	UPDATE ReportProviderStatusChanges 
	SET FirstWorkDate = 'APPLICANT - NOT CURRENTLY ON WEB SCHEDULE', 
		LASTWORKDATE = 'X' WHERE FirstWorkDate IS NULL
	AND STATUSTYPE LIKE '%NEW HIRE%'


/*SEPARATIONS*/
--drop table #tempseparations
	SELECT 	DISTINCT
		CASE 	WHEN PMUL.CreDate IS NULL 
				THEN PMUA.CreDate
			ELSE PMUL.CreDate END AS CreDate,
		PMUA.FirstName, 
		CASE 	WHEN PMUA.PreferredName = 'True' THEN '''' + PMUA.PreferredName
			ELSE PMUA.PreferredName END AS PreferredName, 
		PMUA.LastName, 
		CASE 	WHEN PMUA.FirstNameOld != ' ' AND PMUA.LastNameOld != ' '
				THEN PMUA.FirstNameOld + ' ' + PMUA.LastNameOld
			WHEN PMUA.FirstNameOld != ' '
				THEN PMUA.FirstNameOld + ' ' + PMUA.LastName
			WHEN PMUA.LastNameOld != ' '
				THEN PMUA.FirstName + ' ' + PMUA.LastNameOld
			ELSE ' ' END AS PriorName,
		PMUA.Title,
		Email =		CASE 
			WHEN PMUA.EmailAddressOld != ' ' 	THEN PMUA.EmailAddress 
			ELSE ' ' END,
		Cell = 		CASE 
			WHEN PMUA.CellPhoneNbrOld != ' ' 	THEN PMUA.CellPhoneNbr 
			ELSE ' ' END,
		Pager =		CASE 
			WHEN PMUA.PagerNbrOld != ' ' 		THEN PMUA.PagerNbr 
			ELSE ' ' END,
		Address1 = 	CASE 
			WHEN PMUA.Address1Old 	!= ' ' 
			  OR PMUA.City1Old 	!= ' ' 
			  OR PMUA.State1Old 	!= ' ' 
			  OR PMUA.ZipCode1Old 	!= ' '
			 THEN 	PMUA.Address1 
		 		ELSE ' ' END,	
		CityStateZip1 = CASE 
			WHEN PMUA.Address1Old 	!= ' ' 
			  OR PMUA.City1Old 	!= ' ' 
			  OR PMUA.State1Old 	!= ' ' 
			  OR PMUA.ZipCode1Old 	!= ' '
			 THEN 	PMUA.City1 + ', ' + 
				PMUA.State1 	+ ' ' 	+ PMUA.ZipCode1
			 ELSE ' ' END,	
		PhoneNbr1 = 	CASE 
			WHEN PMUA.PhoneNbr1Old != ' ' 		THEN PMUA.PhoneNbr1 
			ELSE ' ' END,
		FaxNbr1 = 	CASE 
			WHEN PMUA.FaxNbr1Old != ' ' 		THEN PMUA.FaxNbr1 
			ELSE ' ' END,
		Addresstype2 = 	CASE 
			WHEN PMUA.PhoneNbr2Old != ' ' 
			  OR PMUA.FaxNbr2Old != ' ' 		THEN PMUA.Addresstype2
			ELSE ' ' END,
		PhoneNbr2 = 	CASE 
			WHEN PMUA.PhoneNbr2Old != ' ' 		THEN PMUA.PhoneNbr2 
			ELSE ' ' END,
		FaxNbr2 = 	CASE 
			WHEN PMUA.FaxNbr2Old != ' '		THEN PMUA.FaxNbr2 
			ELSE ' ' END,
		AddSites  = 	CASE 
			WHEN WCAS.Sites IS NULL 		THEN ' ' 
			ELSE WCAS.Sites END,
		DropSites = 	CASE 
			WHEN WCDS.Sites IS NULL 		THEN ' ' 
			ELSE WCDS.Sites END,
		CASE 	WHEN Prov.CurrentProviderFlag = 'N' 	THEN 'Separated'
			ELSE ' ' END AS Separated,
		PMUA.Providermasterid,
		PMUL.Author		 /* , TimeStmp, author */,
		PMUA.CreDate As ArchiveCreDate
	INTO #TEMPSEPARATIONS
	FROM ProviderMasterUpdateArchive 	PMUA
	INNER JOIN ProviderMasterBase	PMB
		ON PMUA.ProviderMasterID = PMB.ProviderMasterID
	INNER JOIN ProviderMaster Prov
		ON PMUA.ProviderMasterID = Prov.ProviderMasterID
	LEFT OUTER JOIN AppStaging.dbo.WeeklyChangesAddSites WCAS 
		ON PMUA.ProviderMasterID = WCAS.ProviderMasterID
	LEFT OUTER JOIN AppStaging.dbo.WeeklyChangesDropSites WCDS
		ON PMUA.ProviderMasterID = WCDS.ProviderMasterID
	LEFT OUTER JOIN ProviderMasterUpdateLog PMUL
		ON PMUA.PMULPrimeKeyLog = PMUL.PMULPrimeKey
	WHERE PMUA.SentFlag IS NULL
	  --AND PMB.StaffGroup2 IS NULL
	  AND 	(EXISTS
			(SELECT 1
				FROM AppStaging.dbo.WeeklyChangesDropSites WCDS2
				WHERE PMUA.ProviderMasterID = WCDS2.ProviderMasterID
				  AND WCDS2.Sites IS NOT NULL
				  AND WCDS2.Sites != ' ')
		OR EXISTS
			(SELECT 1
				FROM AppStaging.dbo.WeeklyChangesAddSites WCAS2
				WHERE PMUA.ProviderMasterID = WCAS2.ProviderMasterID
				  AND WCAS2.Sites IS NOT NULL
				  AND WCAS2.Sites != ' ')
		OR 		(PMUA.FirstNameOld 	!= ' '
			OR	 PMUA.LastNameOld 	!= ' '
			OR	 PMUA.EmailAddressOld 	!= ' '
			OR	 PMUA.CellPhoneNbrOld 	!= ' ' 	
			OR	 PMUA.PagerNbrOld 	!= ' '
			OR	 PMUA.Address1Old 	!= ' ' 
			OR 	 PMUA.City1Old 		!= ' ' 
			OR 	 PMUA.State1Old 	!= ' ' 
			OR 	 PMUA.ZipCode1Old 	!= ' '
			OR 	 PMUA.PhoneNbr1Old 	!= ' ' 	
			OR	 PMUA.FaxNbr1Old 	!= ' '
			OR	 PMUA.PhoneNbr2Old 	!= ' '
			OR 	 PMUA.FaxNbr2Old 	!= ' '
				)
		)
	 AND PMUA.Author != 'web batch addition'
	ORDER BY PMUA.Title, PMUA.LastName, PMUA.CreDate

	-- Exclude old separations
	DELETE #TEMPSEPARATIONS
	WHERE Separated = 'Separated'
	AND ProviderMasterID IN (SELECT ProviderMasterID 
				FROM ProviderStatusStaging WHERE [To] < GETDATE() - 15)


	INSERT INTO ReportProviderStatusChanges 
	(StatusType,
	ProviderMasterID,
	LASTNAME,
	FIRSTNAME,
	TITLE,
	FIRSTWORKDATE,
	ADDRESS1,
	CITYSTATEZIP,
	PHONENBR1, 
	CELLPHONENBR,
	PAGERNBR,
	EMAILADDRESS,
	[CEP/AEP/DEP/WEP-Email],
	DateofHireInCredentialingSystem,
	SiteLocationName,
	PartnershipLevel)
		SELECT DISTINCT
		'SEPARATION',
		PROVIDERMASTERID,
		LASTNAME,
		FIRSTNAME,
		TITLE,
		'X',
		'X',
		'X',
		'X',
		'X',
		'X',
		'X',
		'X',
		'X',
		'X',
		'X'
			FROM #TEMPSEPARATIONS
			WHERE #TEMPSEPARATIONS.Separated = 'Separated'



	CREATE TABLE #TEMPLASTWORKDATE
	(Providermasterid int,
	MaxDOS datetime,
	Lastname varchar (100),
	Firstname varchar (100),
	Title varchar (60))

	INSERT INTO #TEMPLASTWORKDATE
	(Providermasterid, 
	MaxDOS)
	SELECT DISTINCT 
	dbo.ProviderMaster.ProviderMasterID,
 	MAX(ProviderHoursDetail.DateOfService) MAXDOS
		FROM dbo.ProviderMaster, ProviderHoursDetail

			WHERE (ProviderHoursDetail.ProviderMasterID=dbo.ProviderMaster.ProviderMasterID)
				GROUP BY dbo.ProviderMaster.ProviderMasterID

	UPDATE #TEMPLASTWORKDATE
	SET LASTNAME = ProviderHoursDetail.Lastname,
	FIRSTNAME = ProviderHoursDetail.FirstName,
	TITLE = Providermaster.Title
		FROM #TEMPLASTWORKDATE, ProviderHoursDetail, ProviderMaster
			WHERE #TEMPLASTWORKDATE.Providermasterid = ProviderHoursDetail.Providermasterid
				and ProviderHoursDetail.ProvidermasterID = Providermaster.ProvidermasterID

	UPDATE ReportProviderStatusChanges 
	SET LASTWORKDATE = #TEMPLASTWORKDATE.MAXDOS
		FROM ReportProviderStatusChanges, #TEMPLASTWORKDATE
			WHERE ReportProviderStatusChanges.Providermasterid = #TEMPLASTWORKDATE.Providermasterid
				AND ReportProviderStatusChanges.StatusType = 'Separation'



	UPDATE ReportProviderStatusChanges 
		SET LASTWORKDATE = MAXDOS
			FROM ReportProviderStatusChanges, #TEMPLASTWORKDATE
				WHERE ReportProviderStatusChanges.Providermasterid = #TEMPLASTWORKDATE.Providermasterid
					AND ReportProviderStatusChanges.StatusType = 'SEPARATED'


	UPDATE ReportProviderStatusChanges 
		SET LastWorkDate = REPLACE(ReportProviderStatusChanges.LastWorkDate,'12:00AM', '')

	UPDATE ReportProviderStatusChanges
		SET LastWorkDate = 'APPLICANT - NEVER WORKED'
		FROM ReportProviderStatusChanges WHERE StatusType = 'SEPARATION' AND LastWorkDate is null 
		AND NOT EXISTS (SELECT 1 FROM ProviderHoursDetail
		WHERE ProviderHoursDetail.ProviderMasterID = ReportProviderStatusChanges.ProviderMasterID)


	UPDATE ReportProviderStatusChanges 
		SET DateofHireinCredentialingSystem = REPLACE(ReportProviderStatusChanges.DateofHireinCredentialingSystem,'12:00AM', '')

