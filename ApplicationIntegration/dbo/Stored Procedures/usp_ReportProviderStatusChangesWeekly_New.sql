
/*Stored Procedure is designed to add First Work Date for New Hires 
and Last Work Date for Separations from the web schedules.
Antonia Miller  5/7/2007 used for New Hire and Weekly Changes Report
 Modified by Mohamed Mahmoud - 1/30/2009 - to explicitly exclude 
 SEMA from report (per Angella Bernal)
 Reetika Singh - 5/20/2011 - to explicitly exclude GALEN from report (SEMA is part of CEP and GALEN in on WEB)
 */

CREATE PROCEDURE [dbo].[usp_ReportProviderStatusChangesWeekly_New] AS


TRUNCATE TABLE ReportProviderStatusChanges 

/*NEW HIRES*/
INSERT INTO ReportProviderStatusChanges 
	(StatusType ,
	FirstName ,
	LastName ,
	Title,
	MaritalStatus,
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
		'NEW HIRE',
		PMB.FirstName, 
		PMB.LastName, 
		PMB.Title,
		PMB.MaritalStatus,
		PMB.Address1, 
		RTRIM(LTRIM(PMB.City1)) + ', ' + PMB.State1 + ' ' + PMB.ZipCode1
			AS CityStateZip,
		PMB.PhoneNbr1, 
		PMB.CellPhoneNbr, 
		PMB.PagerNbr,
		PMB.EmailAddress, 
		PMB.CEPEmail, 
		SB.HospitalName, 
		SB.WebCode,
		Prov.DateOfHire, 
		Prov.PartnershipLevel,
		Prov.ProviderMasterID
			FROM ProviderMasterBase PMB
				INNER JOIN ProviderMaster Prov
				ON PMB.ProviderMasterID = Prov.ProviderMasterID
				INNER JOIN SiteBase SB
		 				ON PMB.ProviderMasterID	  =  SB.ProviderMasterID
					WHERE Prov.CurrentProviderFlag  = 'Y'
	  					AND SB.PrimarySite = 'Y'
	  					AND Prov.WebID 		IS NOT NULL
	  					AND PMB.NewHireSentFlag 	IS NULL
	  					AND PMB.Status = 0
						ORDER BY PMB.LastName



/*CALCULATE EARLIEST/LATEST SCHEDULE DATE*/

	CREATE TABLE #TEMPWORKDATE
	(ProvidermasterID int,
	MinDOS datetime,
	MaxDOS datetime)

	INSERT INTO #TEMPWORKDATE
	(ProvidermasterID,
	MinDOS,
	MaxDOS)
	SELECT DISTINCT ProviderMasterID,
			MIN(DateOfService) MINDOS,
			MAX(DateOfService) MAXDOS
	FROM  ProviderHoursDetail
	GROUP BY ProviderMasterID
	HAVING MIN(dateofservice) >= '1/1/2005'
	

	
	UPDATE ReportProviderStatusChanges 
		SET FIRSTWORKDATE = #TEMPWORKDATE.MINDOS, 
			FIRSTWORKDATETIME = MINDOS, 
			LastWorkDate = 'X'
		FROM ReportProviderStatusChanges, #TEMPWORKDATE
		WHERE ReportProviderStatusChanges.Providermasterid = #TEMPWORKDATE.Providermasterid
		AND ReportProviderStatusChanges.StatusType = 'NEW HIRE'


	UPDATE ReportProviderStatusChanges 
	SET FirstWorkDate = REPLACE(ReportProviderStatusChanges.FirstWorkDate,'12:00AM', '')
	WHERE STATUSTYPE = 'NEW HIRE'

	UPDATE ReportProviderStatusChanges 
	SET FirstWorkDate = 'APPLICANT - NOT CURRENTLY ON WEB SCHEDULE', 
	LASTWORKDATE = 'X' 
	WHERE FirstWorkDate IS NULL
	AND STATUSTYPE = 'NEW HIRE'


/*SEPARATIONS*/
--drop table #tempseparations
	SELECT 	DISTINCT
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
		CASE 	WHEN Prov.CurrentProviderFlag = 'N' 	THEN 'Separated'
			ELSE ' ' END AS Separated,
		PMUA.Providermasterid
	INTO #TEMPSEPARATIONS
	FROM ProviderMasterUpdateArchive 	PMUA
	INNER JOIN ProviderMasterBase	PMB
		ON PMUA.ProviderMasterID = PMB.ProviderMasterID
	INNER JOIN ProviderMaster Prov
		ON PMUA.ProviderMasterID = Prov.ProviderMasterID
	WHERE PMUA.SentFlag IS NULL
	  AND PMB.StaffGroup2 IS NULL
     AND PMUA.Author != 'web batch addition'
	ORDER BY PMUA.Title, PMUA.LastName

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


	UPDATE ReportProviderStatusChanges 
	SET LASTWORKDATE = #TEMPWORKDATE.MAXDOS
		FROM ReportProviderStatusChanges, #TEMPWORKDATE
			WHERE ReportProviderStatusChanges.Providermasterid = #TEMPWORKDATE.Providermasterid
				AND ReportProviderStatusChanges.StatusType = 'SEPARATION'


	UPDATE ReportProviderStatusChanges 
		SET LastWorkDate = REPLACE(ReportProviderStatusChanges.LastWorkDate,'12:00AM', '')

	UPDATE ReportProviderStatusChanges
		SET LastWorkDate = 'APPLICANT - NEVER WORKED'
	FROM ReportProviderStatusChanges 
	WHERE StatusType = 'SEPARATION' AND LastWorkDate is null 
		AND NOT EXISTS (SELECT 1 
					FROM ProviderHoursDetail
					WHERE ProviderHoursDetail.ProviderMasterID 
										= ReportProviderStatusChanges.ProviderMasterID)


	UPDATE ReportProviderStatusChanges 
		SET DateofHireinCredentialingSystem = REPLACE(ReportProviderStatusChanges.DateofHireinCredentialingSystem,'12:00AM', '')



	-- Adding Practice Location
	
	UPDATE ReportProviderStatusChanges
	SET PracticeLocation = C.Practice_Location__c 
	FROM Hospital_region HR
	JOIN Salesforce.dbo.Contract C
			ON C.Id = HR.TCstruct
	WHERE ReportProviderStatusChanges.WebCode = HR.Code

