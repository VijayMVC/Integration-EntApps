

CREATE PROCEDURE [dbo].[usp_ReportWeeklyChanges] AS
/*Script for DTS Package - 
		Weekly Changes
*/


BEGIN

	TRUNCATE TABLE ReportProviderWeeklyChanges
	

/* Weekly Changes Tab - CEP */
	INSERT INTO ReportProviderWeeklyChanges
	
	SELECT 	DISTINCT
		'CEP' AS StaffGroup,
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
		AddSites1  = 	CASE 
			WHEN WCAS.Site1 IS NULL 		THEN ' ' 
			ELSE WCAS.Site1 END,
		AddSitesDate1 = CASE 
			WHEN WCAS.Site1EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCAS.Site1EffectiveDate END,
		AddSites2  = 	CASE 
			WHEN WCAS.Site2 IS NULL 		THEN ' ' 
			ELSE WCAS.Site2 END,
		AddSitesDate2 = CASE 
			WHEN WCAS.Site2EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCAS.Site2EffectiveDate END,
		AddSites3  = 	CASE 
			WHEN WCAS.Site3 IS NULL 		THEN ' ' 
			ELSE WCAS.Site3 END,
		AddSitesDate3 = CASE 
			WHEN WCAS.Site3EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCAS.Site3EffectiveDate END,
		AddSites4  = 	CASE 
			WHEN WCAS.Site4 IS NULL 		THEN ' ' 
			ELSE WCAS.Site4 END,
		AddSitesDate4 = CASE 
			WHEN WCAS.Site4EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCAS.Site4EffectiveDate END,
		DropSites1 = 	CASE 
			WHEN WCDS.Site1 IS NULL 		THEN ' ' 
			ELSE WCDS.Site1 END,
		DropSitesDate1 = CASE 
			WHEN WCDS.Site1EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCDS.Site1EffectiveDate END,
		DropSites2 = 	CASE 
			WHEN WCDS.Site2 IS NULL 		THEN ' ' 
			ELSE WCDS.Site2 END,
		DropSitesDate2 = CASE 
			WHEN WCDS.Site2EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCDS.Site2EffectiveDate END,
		DropSites3 = 	CASE 
			WHEN WCDS.Site3 IS NULL 		THEN ' ' 
			ELSE WCDS.Site3 END,
		DropSitesDate3 = CASE 
			WHEN WCDS.Site3EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCDS.Site3EffectiveDate END,
		DropSites4 = 	CASE 
			WHEN WCDS.Site4 IS NULL 		THEN ' ' 
			ELSE WCDS.Site4 END,
		DropSitesDate4 = CASE 
			WHEN WCDS.Site4EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCDS.Site4EffectiveDate END,
		CASE 	WHEN Prov.CurrentProviderFlag = 'N' 	THEN 'Separated'
			ELSE ' ' END AS Separated,
		PMUA.Providermasterid,
		PMUL.Author /* , TimeStmp, author */,
		NULL AS ArchiveCreDate
	FROM ProviderMasterUpdateArchive 	PMUA
	INNER JOIN ProviderMasterBase PMB
		ON PMB.ProviderMasterID = PMUA.ProviderMasterID
	INNER JOIN ProviderMaster	Prov
		ON PMB.ProviderMasterID = Prov.ProviderMasterID
	LEFT OUTER JOIN AppStaging.dbo.WeeklyChangesAddSites WCAS 
		ON PMUA.ProviderMasterID = WCAS.ProviderMasterID
	LEFT OUTER JOIN AppStaging.dbo.WeeklyChangesDropSites WCDS
		ON PMUA.ProviderMasterID = WCDS.ProviderMasterID
	LEFT OUTER JOIN ProviderMasterUpdateLog PMUL
		ON PMUA.PMULPrimeKeyLog = PMUL.PMULPrimeKey
	WHERE PMUA.SentFlag IS NULL
	  AND 	 PMUA.StaffGroup1 = 'CEP'
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
	ORDER BY PMUA.Title, PMUA.LastName, CreDate
	
	
	

/* Weekly Changes Tab - GALEN */
	INSERT INTO ReportProviderWeeklyChanges
	
	SELECT 	DISTINCT 'GALEN' AS StaffGroup,
		CASE WHEN PMUL.CreDate IS NULL
			THEN PMUA.CreDate ELSE PMUL.CreDate END AS CreDate,
		PMUA.FirstName, 
		CASE 	WHEN PMUA.PreferredName = 'True' 
				THEN '''' + PMUA.PreferredName
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
		AddSites1  = 	CASE 
			WHEN WCAS.Site1 IS NULL 		THEN ' ' 
			ELSE WCAS.Site1 END,
		AddSitesDate1 = CASE 
			WHEN WCAS.Site1EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCAS.Site1EffectiveDate END,
		AddSites2  = 	CASE 
			WHEN WCAS.Site2 IS NULL 		THEN ' ' 
			ELSE WCAS.Site2 END,
		AddSitesDate2 = CASE 
			WHEN WCAS.Site2EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCAS.Site2EffectiveDate END,
		AddSites3  = 	CASE 
			WHEN WCAS.Site3 IS NULL 		THEN ' ' 
			ELSE WCAS.Site3 END,
		AddSitesDate3 = CASE 
			WHEN WCAS.Site3EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCAS.Site3EffectiveDate END,
		AddSites4  = 	CASE 
			WHEN WCAS.Site4 IS NULL 		THEN ' ' 
			ELSE WCAS.Site4 END,
		AddSitesDate4 = CASE 
			WHEN WCAS.Site4EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCAS.Site4EffectiveDate END,
		DropSites1 = 	CASE 
			WHEN WCDS.Site1 IS NULL 		THEN ' ' 
			ELSE WCDS.Site1 END,
		DropSitesDate1 = CASE 
			WHEN WCDS.Site1EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCDS.Site1EffectiveDate END,
		DropSites2 = 	CASE 
			WHEN WCDS.Site2 IS NULL 		THEN ' ' 
			ELSE WCDS.Site2 END,
		DropSitesDate2 = CASE 
			WHEN WCDS.Site2EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCDS.Site2EffectiveDate END,
		DropSites3 = 	CASE 
			WHEN WCDS.Site3 IS NULL 		THEN ' ' 
			ELSE WCDS.Site3 END,
		DropSitesDate3 = CASE 
			WHEN WCDS.Site3EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCDS.Site3EffectiveDate END,
		DropSites4 = 	CASE 
			WHEN WCDS.Site4 IS NULL 		THEN ' ' 
			ELSE WCDS.Site4 END,
		DropSitesDate4 = CASE 
			WHEN WCDS.Site4EffectiveDate IS NULL 		THEN ' ' 
			ELSE WCDS.Site4EffectiveDate END,
		CASE 	WHEN Prov.CurrentProviderFlag = 'N' 	THEN 'Separated'
			ELSE ' ' END AS Separated,
		PMUA.Providermasterid,
		PMUL.Author ,
		NULL AS ArchiveCreDate
	FROM ProviderMasterUpdateArchive 	PMUA
	INNER JOIN ProviderMasterBase PMB
		ON PMB.ProviderMasterID = PMUA.ProviderMasterID
	INNER JOIN ProviderMaster	Prov
		ON PMB.ProviderMasterID = Prov.ProviderMasterID
	LEFT OUTER JOIN AppStaging.dbo.WeeklyChangesAddSites WCAS 
		ON PMUA.ProviderMasterID = WCAS.ProviderMasterID
	LEFT OUTER JOIN AppStaging.dbo.WeeklyChangesDropSites WCDS
		ON PMUA.ProviderMasterID = WCDS.ProviderMasterID
	LEFT OUTER JOIN ProviderMasterUpdateLog PMUL
		ON PMUA.PMULPrimeKeyLog = PMUL.PMULPrimeKey
	WHERE PMUA.SentFlag IS NULL
	  AND 	 PMB.StaffGroup2 = 'GALEN'
	  AND PMB.ProviderMasterID NOT IN (SELECT ProviderMasterID 
									FROM ReportProviderWeeklyChanges
									WHERE StaffGroup = 'CEP')
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
	ORDER BY PMUA.Title, PMUA.LastName, CreDate



		
END


