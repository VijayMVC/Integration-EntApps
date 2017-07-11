

CREATE PROCEDURE [dbo].[usp_ReportWeeklyChanges_New] AS

/*Script for DTS Package - 
		Weekly Changes
*/


BEGIN

	TRUNCATE TABLE ReportProviderWeeklyChanges
	

/* Weekly Changes Tab - CEP */
	INSERT INTO ReportProviderWeeklyChanges
	
	SELECT 	DISTINCT
		CASE WHEN PMB.StaffGroup2 = 'GALEN'
			THEN 'GALEN' 
			ELSE 'CEP' END AS StaffGroup,
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
		PMUA.MaritalStatus,
		PMUA.MaritalStatusOld,
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
			WHEN PMUA.Address1Old 	!= ' ' OR  PMUA.Address2Old 	!= ' '
			  OR PMUA.City1Old 	!= ' ' OR PMUA.City2Old 	!= ' '
			  OR PMUA.State1Old 	!= ' ' OR PMUA.State2Old 	!= ' ' 
			  OR PMUA.ZipCode1Old 	!= ' ' OR PMUA.ZipCode2Old 	!= ' '
			 THEN 	PMUA.Address1 
		 		ELSE ' ' END,	
		CityStateZip1 = CASE 
			WHEN PMUA.Address1Old 	!= ' ' OR  PMUA.Address2Old 	!= ' '
			  OR PMUA.City1Old 	!= ' ' OR PMUA.City2Old 	!= ' '
			  OR PMUA.State1Old 	!= ' ' OR PMUA.State2Old 	!= ' ' 
			  OR PMUA.ZipCode1Old 	!= ' ' OR PMUA.ZipCode2Old 	!= ' '
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
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		CASE 	WHEN Prov.CurrentProviderFlag = 'N' 	THEN 'Separated'
			ELSE ' ' END AS Separated,
		NULL,
		PMUA.Providermasterid,
		PMUA.Author /* , TimeStmp, author */,
		NULL AS ArchiveCreDate
	FROM ProviderMasterUpdateArchive 	PMUA
	INNER JOIN ProviderMasterBase PMB
		ON PMB.ProviderMasterID = PMUA.ProviderMasterID
	INNER JOIN ProviderMaster	Prov
		ON PMB.ProviderMasterID = Prov.ProviderMasterID
	JOIN ProviderMasterUpdateLog PMUL
		ON PMUA.PMULPrimeKeyLog = PMUL.PMULPrimeKey
	Left OUTER JOIN SiteUpdateLog SL
		ON SL.ProviderMasterID = PMUL.ProviderMasterID
	WHERE PMUA.SentFlag IS NULL
		  AND (PMUA.FirstNameOld 	!= ' '
			OR	 PMUA.LastNameOld 	!= ' '
			OR	 PMUA.EmailAddressOld 	!= ' '
			OR	 PMUA.CellPhoneNbrOld 	!= ' ' 	
			OR	 PMUA.PagerNbrOld 	!= ' '
			OR	 PMUA.Address1Old 	!= ' ' 
			OR 	 PMUA.City1Old 		!= ' ' 
			OR 	 PMUA.State1Old 	!= ' ' 
			OR 	 PMUA.ZipCode1Old 	!= ' '
			OR	 PMUA.Address2Old 	!= ' ' 
			OR 	 PMUA.City2Old 		!= ' ' 
			OR 	 PMUA.State2Old 	!= ' ' 
			OR 	 PMUA.ZipCode2Old 	!= ' '
			OR 	 PMUA.PhoneNbr1Old 	!= ' ' 	
			OR	 PMUA.FaxNbr1Old 	!= ' '
			OR	 PMUA.PhoneNbr2Old 	!= ' '
			OR 	 PMUA.FaxNbr2Old 	!= ' '
			OR	 PMUA.MaritalStatusOld != ' '
			OR	 SL.SentFlag IS NULL)
		 AND PMUA.Author != 'web batch addition'
	ORDER BY StaffGroup, PMUA.Title, PMUA.LastName, CreDate
	
	
	--Separations and Emeritus Status
	INSERT INTO ReportProviderWeeklyChanges
	SELECT 	DISTINCT
		CASE WHEN PMB.StaffGroup2 = 'GALEN'
			THEN 'GALEN' 
			ELSE 'CEP' END AS StaffGroup,
		PMUA.CreDate,
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
		PMUA.MaritalStatus,
		PMUA.MaritalStatusOld,
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
			WHEN PMUA.Address1Old 	!= ' ' OR  PMUA.Address2Old 	!= ' '
			  OR PMUA.City1Old 	!= ' ' OR PMUA.City2Old 	!= ' '
			  OR PMUA.State1Old 	!= ' ' OR PMUA.State2Old 	!= ' ' 
			  OR PMUA.ZipCode1Old 	!= ' ' OR PMUA.ZipCode2Old 	!= ' '
			 THEN 	PMUA.Address1 
		 		ELSE ' ' END,	
		CityStateZip1 = CASE 
			WHEN PMUA.Address1Old 	!= ' ' OR  PMUA.Address2Old 	!= ' '
			  OR PMUA.City1Old 	!= ' ' OR PMUA.City2Old 	!= ' '
			  OR PMUA.State1Old 	!= ' ' OR PMUA.State2Old 	!= ' ' 
			  OR PMUA.ZipCode1Old 	!= ' ' OR PMUA.ZipCode2Old 	!= ' '
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
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		CASE 	WHEN Prov.CurrentProviderFlag = 'N' 	THEN 'Separated'
			ELSE ' ' END AS Separated,
		NULL,
		PMUA.Providermasterid,
		PMUA.Author /* , TimeStmp, author */,
		NULL AS ArchiveCreDate
	FROM ProviderMasterUpdateArchive 	PMUA
	INNER JOIN ProviderMasterBase PMB
		ON PMB.ProviderMasterID = PMUA.ProviderMasterID
	INNER JOIN ProviderMaster	Prov
		ON PMB.ProviderMasterID = Prov.ProviderMasterID
	WHERE PMUA.SentFlag IS NULL
		  AND PMUA.Author = 'Batch Separation'
		  AND Prov.CurrentProviderFlag = 'N'
		  AND PMB.ProviderMasterID NOT IN (SELECT ProviderMasterID FROM SiteBase)
		  AND PMB.ProviderMasterID NOT IN (SELECT ProviderMasterID FROM ReportProviderWeeklyChanges)
	ORDER BY StaffGroup, PMUA.Title, PMUA.LastName, PMUA.CreDate
	
	
	/*Update to add Date a provider is separated form CEP -- Date is being pulled from "To"
	  field on ProviderStatus object in Salesforce 
	  
	  select distinct * from ReportProviderWeeklyChanges
	  where Separated = 'Separated'*/

	SELECT PS.ProviderMasterID, Max(PS.[To]) AS [To]
	INTO #Separated
	FROM ProviderStatusStaging PS
	WHERE [To] IS NOT NULL
	AND PS.ProviderMasterID IN (SELECT DISTINCT ProviderMasterID 
								FROM ReportProviderWeeklyChanges
								WHERE Separated = 'Separated')
	GROUP BY PS.ProviderMasterID

	UPDATE ReportProviderWeeklyChanges
	SET DateSeparated = Sep.[To]
	FROM #Separated Sep
	WHERE Sep.ProviderMasterID = ReportProviderWeeklyChanges.Providermasterid

	
	/*Sites - Added/Dropped*/
	
	
	/*CALCULATE EARLIEST/LATEST SCHEDULE DATE FOR AN ADDED/DROPPED SITE*/
	CREATE TABLE #TEMPWORKDATE
	(ProvidermasterID int,
	MinDOS datetime,
	MaxDOS datetime,
	WebCode varchar (10))

	INSERT INTO #TEMPWORKDATE
	(ProvidermasterID,
	MinDOS,
	MaxDOS,
	WebCode)
	SELECT DISTINCT ProviderMasterID,
			MIN(ProviderHoursDetail.DateOfService) MINDOS, 
			MAX(ProviderHoursDetail.DateOfService) MAXDOS,
			Site
		FROM ProviderHoursDetail
		GROUP BY ProviderMasterID, Site
		HAVING MIN(dateofservice) >= '1/1/2005'
		

		
	TRUNCATE TABLE dbo.WeeklySiteChanges
	
	INSERT INTO WeeklySiteChanges	
	SELECT DISTINCT 
		PMB.ProviderMasterID,
		CASE WHEN PMB.StaffGroup2 = 'GALEN'
			THEN 'GALEN' 
			ELSE 'CEP' END AS StaffGroup,
		--CASE 	WHEN PMUL.CreDate IS NULL 
		--		THEN PMUA.CreDate
		--	ELSE PMUL.CreDate END 
		SL.TimeStmp AS CreDate,
		PMB.LastName, 
		PMB.FirstName,
		PMUA.Title,
		SL.SiteAction, 
		SL.WebCode, 
		HR.HospitalName,
		NULL AS FirstWorkDate,
		NULL AS LatestWorkDate,
		SL.Author
	FROM SiteUpdateLog SL
	JOIN Hospital_region HR
		ON HR.Code = SL.WebCode
	JOIN ProviderMasterUpdateArchive 	PMUA
			ON PMUA.ProviderMasterID = SL.ProviderMasterID
	INNER JOIN ProviderMasterBase PMB
		ON PMB.ProviderMasterID = PMUA.ProviderMasterID
	INNER JOIN ProviderMaster	Prov
		ON PMB.ProviderMasterID = Prov.ProviderMasterID
	JOIN ProviderMasterUpdateLog PMUL
		ON PMUA.PMULPrimeKeyLog = PMUL.PMULPrimeKey
	WHERE SL.SentFlag IS NULL
	AND PMUA.SentFlag IS NULL
	AND PMUA.Author != 'web batch addition'
	ORDER BY StaffGroup, PMUA.Title, PMB.LastName, CreDate
	
	
	UPDATE WeeklySiteChanges
	SET FirstWorkDate = TW.MinDOS,
		LatestWorkDate = ''
	FROM #TEMPWORKDATE TW
	WHERE TW.ProvidermasterID = WeeklySiteChanges.ProviderMasterID
		AND TW.WebCode = WeeklySiteChanges.WebCode
		AND WeeklySiteChanges.SiteAction = 'ADD - SITE'
		
	UPDATE WeeklySiteChanges
	SET FirstWorkDate = '',
		LatestWorkDate = TW.MaxDOS
	FROM #TEMPWORKDATE TW
	WHERE TW.ProvidermasterID = WeeklySiteChanges.ProviderMasterID
		AND TW.WebCode = WeeklySiteChanges.WebCode
		AND WeeklySiteChanges.SiteAction = 'DROP - SITE'
		
		
	UPDATE WeeklySiteChanges
	SET LatestWorkDate = 'NEVER WORKED AT SITE'
	WHERE LatestWorkDate IS NULL
	AND WeeklySiteChanges.SiteAction = 'DROP - SITE'
	
	UPDATE WeeklySiteChanges
	SET FirstWorkDate = 'NOT YET ON WEB SCHEDULE'
	WHERE FirstWorkDate IS NULL
	AND WeeklySiteChanges.SiteAction = 'ADD - SITE'
	
	UPDATE WeeklySiteChanges
	SET FirstWorkDate = REPLACE (FirstWorkDate, '12:00AM', ''),
		LatestWorkDate = REPLACE (LatestWorkDate, '12:00AM', ''),
		CreDate = REPLACE (CreDate, '12:00AM', '')
	
	
	UPDATE WeeklySiteChanges
	SET FirstWorkDate = ''
	WHERE FirstWorkDate IS NULL
	
	UPDATE WeeklySiteChanges
	SET LatestWorkDate = ''
	WHERE LatestWorkDate IS NULL
	
	
END


