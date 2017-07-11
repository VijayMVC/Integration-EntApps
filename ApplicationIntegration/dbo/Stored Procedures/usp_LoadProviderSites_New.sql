
CREATE PROCEDURE [dbo].[usp_LoadProviderSites_New] 
AS

/* 	Author: 	Reetika	
	Date:		4/30/2012
	Purpose:	Load Provider Site Information
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	DECLARE 	@COUNT 		INT
			


	/* New Hires - CASE 1 - CEP updates
					CASE 2 - GALEN Updates*/
	-- Load Site information for New Hires


	INSERT INTO SiteBase
	SELECT Aff.SFID, 
		Aff.ProviderMasterID,
		PMB.WebID, 
		Aff.SiteSFID, 
		Aff.WebCode, 
		Aff.SiteName,
		'N'
	FROM ProviderMasterBase AS PMB
	INNER JOIN AffiliationStaging AS Aff ON Aff.SFID = PMB.SFID
	WHERE PMB.Status = 2
	AND Aff.Active = 'Y'
	AND NOT EXISTS (SELECT 1 
					FROM SiteBase SB
					WHERE SB.SFID = Aff.SFID
						AND SB.ProviderMasterID = Aff.ProviderMasterID
						AND SB.WebCode = Aff.WebCode)
				
	--CEP			
	/*INSERT INTO SiteBase
	SELECT Aff.SFID, 
		Aff.ProviderMasterID,
		PMB.WebID, 
		Aff.SiteSFID, 
		HR.Code, 
		Aff.SiteName,
		'N'
	FROM ProviderMasterBase AS PMB
	INNER JOIN (SELECT * 
				FROM AffiliationStaging 
				WHERE CEPSite = 'true'
	)AS Aff ON Aff.SFID = PMB.SFID
	INNER JOIN (SELECT * 
				FROM Hospital_region 
				WHERE HospitalName NOT LIKE '%Hospitalist'
						AND HospitalName NOT LIKE '%Galen%'
	) HR ON HR.SFID = Aff.SiteSFID
	WHERE PMB.Status = 2
	AND Aff.Active = 'Y'
	AND NOT EXISTS (SELECT 1 
					FROM SiteBase SB
					WHERE SB.SFID = Aff.SFID
						AND SB.ProviderMasterID = Aff.ProviderMasterID
						AND SB.WebCode = HR.Code)
		
	UNION
	--GALEN
	SELECT Aff.SFID, 
		Aff.ProviderMasterID,
		PMB.WebID, 
		Aff.SiteSFID, 
		HR.Code, 
		Aff.SiteName,
		'N'
	FROM ProviderMasterBase AS PMB
	INNER JOIN (SELECT * 
				FROM AffiliationStaging 
				WHERE GalenSite = 'true'
	)AS Aff ON Aff.SFID = PMB.SFID
	INNER JOIN (SELECT * 
				FROM Hospital_region 
				WHERE HospitalName LIKE '%Hospitalist'
						AND HospitalName NOT LIKE '%Galen%'
	) HR ON HR.SFID = Aff.SiteSFID
	WHERE PMB.Status = 2
	AND Aff.Active = 'Y'
	AND NOT EXISTS (SELECT 1 
					FROM SiteBase SB
					WHERE SB.SFID = Aff.SFID
						AND SB.ProviderMasterID = Aff.ProviderMasterID
						AND SB.WebCode = HR.Code)*/
				

	--Get a list of new hires to set the PrimarySite
	
	SELECT DISTINCT SB.WebCode, SB.ProviderMasterID
	INTO #TempPrimarySite 
	FROM SiteBase SB
	JOIN ProviderMasterBase PMB
			ON SB.ProviderMasterID = PMB.ProviderMasterID
	WHERE PMB.Status = 2
		AND SB.ProviderMasterID NOT IN (SELECT DISTINCT ProviderMasterID
										FROM SiteBase
										WHERE PrimarySite = 'Y')

	
	UPDATE SiteBase
	SET PrimarySite = 'Y'
	WHERE WebCode IN (SELECT Top 1 WebCode
					FROM #TempPrimarySite TS
					WHERE TS.ProviderMasterID = SiteBase.ProviderMasterID)


	UPDATE ProviderMasterBase 
	SET Site1 = SB.WebCode
	FROM SiteBase SB
	WHERE SB.ProviderMasterID = ProviderMasterBase.ProviderMasterID
	AND ProviderMasterBase.Status = 2
	AND SB.PrimarySite = 'Y'
	AND (Site1 = ''
		OR Site1 IS NULL)
		
	UPDATE ProviderMasterBase 
	SET Site2 = SB.WebCode
	FROM SiteBase SB
	WHERE SB.ProviderMasterID = ProviderMasterBase.ProviderMasterID
	AND ProviderMasterBase.Status = 2
	AND SB.PrimarySite <> 'Y'
	AND (Site2 = ''
		OR Site2 IS NULL)
	AND SB.WebCode <> Site1
	
	
	
	UPDATE ProviderMasterBase 
	SET Site3 = SB.WebCode
	FROM SiteBase SB
	WHERE SB.ProviderMasterID = ProviderMasterBase.ProviderMasterID
	AND ProviderMasterBase.Status = 2
	AND SB.PrimarySite <> 'Y'
	AND (Site3 = ''
		OR Site3 IS NULL)
	AND SB.WebCode <> Site1
	AND SB.WebCode <> Site2
	
	
	UPDATE ProviderMasterBase 
	SET Site4 = SB.WebCode
	FROM SiteBase SB
	WHERE SB.ProviderMasterID = ProviderMasterBase.ProviderMasterID
	AND ProviderMasterBase.Status = 2
	AND SB.PrimarySite <> 'Y'
	AND (Site4 = ''
		OR Site4 IS NULL)
	AND SB.WebCode <> Site1
	AND SB.WebCode <> Site2
	AND SB.WebCode <> Site3
	
	
	--keeping PMB in sync with SiteBase	
	UPDATE ProviderMasterBase
	Set Site1 = ''
	WHERE NOT EXISTS (SELECT 1 FROM SiteBase
							WHERE ProviderMasterID = ProviderMasterBase.ProviderMasterID
							AND WebCode = ProviderMasterBase.Site1 )
	AND Site1 <> ''


	UPDATE ProviderMasterBase
	Set Site2 = ''
	WHERE NOT EXISTS (SELECT 1 FROM SiteBase
							WHERE ProviderMasterID = ProviderMasterBase.ProviderMasterID
							AND WebCode = ProviderMasterBase.Site2 )
	AND Site2 <> ''


	UPDATE ProviderMasterBase
	Set Site3 = ''
	WHERE NOT EXISTS (SELECT 1 FROM SiteBase
							WHERE ProviderMasterID = ProviderMasterBase.ProviderMasterID
							AND WebCode = ProviderMasterBase.Site3 )
	AND Site3 <> ''


	UPDATE ProviderMasterBase
	Set Site4 = ''
	WHERE NOT EXISTS (SELECT 1 FROM SiteBase
							WHERE ProviderMasterID = ProviderMasterBase.ProviderMasterID
							AND WebCode = ProviderMasterBase.Site4 )
	AND Site4 <> ''

	/*Temporary update to PMB - included code to just update those changed for now.*/
	--If Site1 gets dropped/Added
	UPDATE ProviderMasterBase 
	SET Site1 = SB.WebCode
	FROM SiteBase SB
	WHERE SB.ProviderMasterID = ProviderMasterBase.ProviderMasterID
	AND ProviderMasterBase.ProviderMasterID IN (SELECT ProviderMasterID FROM SiteUpdates)
	AND SB.PrimarySite = 'Y'
	
	
	UPDATE ProviderMasterBase 
	SET Site2 = SB.WebCode
	FROM SiteBase SB
	WHERE SB.ProviderMasterID = ProviderMasterBase.ProviderMasterID
		AND SB.WebCode <> ProviderMasterBase.Site1
		AND ProviderMasterBase.ProviderMasterID IN (SELECT ProviderMasterID FROM SiteUpdates)
		AND Site2 NOT IN (SELECT WebCode FROM SiteBase)
		
		
		
	UPDATE ProviderMasterBase 
	SET Site3 = SB.WebCode
	FROM SiteBase SB
	WHERE SB.ProviderMasterID = ProviderMasterBase.ProviderMasterID
		AND SB.WebCode <> ProviderMasterBase.Site1
		AND SB.WebCode <> ProviderMasterBase.Site2
		AND ProviderMasterBase.ProviderMasterID IN (SELECT ProviderMasterID FROM SiteUpdates)
		AND Site3 NOT IN (SELECT WebCode FROM SiteBase)		

	UPDATE ProviderMasterBase 
	SET Site4 = SB.WebCode
	FROM SiteBase SB
	WHERE SB.ProviderMasterID = ProviderMasterBase.ProviderMasterID
		AND SB.WebCode <> ProviderMasterBase.Site1
		AND SB.WebCode <> ProviderMasterBase.Site2
		AND SB.WebCode <> ProviderMasterBase.Site3
		AND ProviderMasterBase.ProviderMasterID IN (SELECT ProviderMasterID FROM SiteUpdates)
		AND Site4 NOT IN (SELECT WebCode FROM SiteBase)


/* Remove duplicate sites and blank sites in the middle of the listing */
		/* CEP */
	UPDATE ProviderMasterBase SET 
		Site2 = CASE 
			WHEN PMB.Site1  = PMB.Site2
			 AND PMB.Site3  = PMB.Site2
			 AND PMB.Site4  = PMB.Site2 
				THEN ' '
			WHEN PMB.Site1  = PMB.Site2
			 AND PMB.Site3 != PMB.Site2 
				THEN PMB.Site3
			WHEN PMB.Site1  = PMB.Site2
			 AND PMB.Site4 != PMB.Site2 
				THEN PMB.Site4
			ELSE PMB.Site2 END,
		Site3 = CASE
			WHEN PMB.Site3  = PMB.Site1
			 AND PMB.Site3  = PMB.Site2
			  	THEN ' '
			WHEN PMB.Site2  = PMB.Site4
			 AND PMB.Site1  = PMB.Site3
			  	THEN ' '
			WHEN (PMB.Site3  = PMB.Site1
			  OR  PMB.Site3  = PMB.Site2
			  OR  PMB.Site1  = PMB.Site2)
			  AND PMB.Site4 != PMB.Site3
			  	THEN PMB.Site4
			WHEN (PMB.Site3  = PMB.Site1
			  OR  PMB.Site3  = PMB.Site2)
			  AND PMB.Site4 = PMB.Site3
			  	THEN ' '
			ELSE PMB.Site3 END,
		Site4 = CASE
			WHEN PMB.Site4  = PMB.Site1
			  OR PMB.Site4  = PMB.Site2
			  OR PMB.Site4  = PMB.Site3 
			  OR PMB.Site2	= PMB.Site3
			  OR PMB.Site1  = PMB.Site2
			  OR PMB.Site1  = PMB.Site3 THEN ' '
			ELSE PMB.Site4 END
		FROM ProviderMasterBase PMB
		INNER JOIN ProviderMasterUpdate PMU
			ON PMB.ProviderMasterID = PMU.ProviderMasterID


	UPDATE ProviderMasterBase
    SET Site1 = '',
		Site2 = '',
		Site3 = '',
		Site4 = ''
	WHERE ProviderMasterID NOT IN (SELECT ProviderMasterID FROM SiteBase)

		/* CEP */
	UPDATE ProviderMasterbase SET 
		Site1 = CASE 
			WHEN Site1 IS NULL THEN ' '
			ELSE Site1 END,
		Site2 = CASE 
			WHEN Site2 IS NULL THEN ' '
			ELSE Site2 END,
		Site3 = CASE 
			WHEN Site3 IS NULL THEN ' '
			ELSE Site3 END,
		Site4 = CASE 
			WHEN Site4 IS NULL THEN ' '
			ELSE Site4 END
			
			
	/* Delete sites when provider is separated */
	
	DELETE FROM SiteBase
	WHERE ProviderMasterID IN (SELECT ProviderMasterID
					FROM ProviderMaster
					WHERE CurrentProviderFlag = 'N')

		/* CEP */	
	UPDATE ProviderMasterBase
		SET 	Site1 = ' ',
			Site2 = ' ',
			Site3 = ' ',
			Site4 = ' '
			FROM ProviderMasterBase PMB
			INNER JOIN ProviderMaster Prov
				 ON PMB.ProviderMasterID = Prov.ProviderMasterID
				AND Prov.CurrentProviderFlag = 'N'
				AND 		(PMB.Site1 != ' '
					OR	 PMB.Site2 != ' '
					OR	 PMB.Site3 != ' '
					OR	 PMB.Site4 != ' ')	


		/* CEP */
	INSERT INTO ProviderMasterUpdateArchive
		(InternalUpdateFlag,
		SentValueChanged,
		StaffGroup1,
		StaffGroup2,
		ProviderMasterID, 
		WebID,
		TaxIDIncorporated, 
		LastName, 
		FirstName, 
		MiddleNameOrInitial, 
		PreferredName, 
		IncorporatedName, 
		Title, 
		MaritalStatus, 
		SpouseName, 
		EmailAddress, 
		CEPEmail, 
		CellPhoneNbr, 
		PagerNbr, 
		AddressType1, 
		AddressForPayrollFlag1, 
		AddressForNonPayrollFlag1, 
		Address1, 
		City1, 
		State1, 
		ZipCode1, 
		Country1, 
		PhoneNbr1, 
		FaxNbr1, 
		AddressType2, 
		AddressForPayrollFlag2, 
		AddressForNonPayrollFlag2, 
		Address2, 
		City2, 
		State2, 
		ZipCode2, 
		Country2, 
		PhoneNbr2, 
		FaxNbr2, 
		AddressType3, 
		AddressForPayrollFlag3, 
		AddressForNonPayrollFlag3, 
		Address3, 
		City3, 
		State3, 
		ZipCode3, 
		Country3, 
		PhoneNbr3, 
		FaxNbr3, 
		PrimarySite, 
		Site1, 
		Site2, 
		Site3,
		Site4, 
		Site1Old, 
		Site2Old, 
		Site3Old,
		Site4Old, 
		TimeStmp, 
		Author, 
		UpdatedFlag)
	SELECT  'Y',
		'Y',
		PMB.StaffGroup1,
		PMB.StaffGroup2,
		PMB.ProviderMasterID, 
		PMB.WebID,
		PMB.TaxIDIncorporated, 
		PMB.LastName, 
		PMB.FirstName, 
		PMB.MiddleNameOrInitial, 
		PMB.PreferredName, 
		PMB.IncorporatedName, 
		PMB.Title, 
		PMB.MaritalStatus, 
		PMB.SpouseName, 
		PMB.EmailAddress, 
		PMB.CEPEmail, 
		PMB.CellPhoneNbr, 
		PMB.PagerNbr, 
		PMB.AddressType1, 
		PMB.AddressForPayrollFlag1, 
		PMB.AddressForNonPayrollFlag1, 
		PMB.Address1, 
		PMB.City1, 
		PMB.State1, 
		PMB.ZipCode1, 
		PMB.Country1, 
		PMB.PhoneNbr1, 
		PMB.FaxNbr1, 
		PMB.AddressType2, 
		PMB.AddressForPayrollFlag2, 
		PMB.AddressForNonPayrollFlag2, 
		PMB.Address2, 
		PMB.City2, 
		PMB.State2, 
		PMB.ZipCode2, 
		PMB.Country2, 
		PMB.PhoneNbr2, 
		PMB.FaxNbr2, 
		PMB.AddressType3, 
		PMB.AddressForPayrollFlag3, 
		PMB.AddressForNonPayrollFlag3, 
		PMB.Address3, 
		PMB.City3, 
		PMB.State3, 
		PMB.ZipCode3, 
		PMB.Country3, 
		PMB.PhoneNbr3, 
		PMB.FaxNbr3, 
		PMB.PrimarySite, 
		'No S1', 
		'No S2', 
		'No S3',
		'No S4',
		PMB.Site1, 
		PMB.Site2, 
		PMB.Site3, 
		PMB.Site4,  
		GETDATE(), 
		'Batch Separation', 
		'Y'
		FROM ProviderMasterBase PMB
		INNER JOIN ProviderMaster Prov
			 ON PMB.ProviderMasterID = Prov.ProviderMasterID
			AND Prov.CurrentProviderFlag = 'N'
			AND PMB.ProviderMasterID NOT IN (SELECT ProviderMasterID
								FROM SiteBase)	
			AND NOT EXISTS (SELECT * 
							FROM ProviderMasterUpdateArchive PA
							WHERE PA.Author = 'Batch Separation'
							AND PA.SentFlag = 'Y'
							AND Prov.DateOfHire < PA.TimeStmp)

	
	
/* Update below ensures site 1-4 in PMB are all populated -- the query below gets MPID that do not have
site1-4 populated but have more than 4 sites in SiteBase*/

select SB.* into #Temp1
from SiteBase SB
join ProviderMasterBase PMB on PMB.ProviderMasterID = SB.ProviderMasterID
where WebCode not in (select Site1 from ProviderMasterBase PB
					where PB.ProviderMasterID = SB.ProviderMasterID
					and Site1 <> '')
and WebCode not in (select Site2 from ProviderMasterBase PB
					where PB.ProviderMasterID = SB.ProviderMasterID
					and Site2 <> '')
and WebCode not in (select Site3 from ProviderMasterBase PB
					where PB.ProviderMasterID = SB.ProviderMasterID
					and Site3 <> '')
and WebCode not in (select Site4 from ProviderMasterBase PB
					where PB.ProviderMasterID = SB.ProviderMasterID
					and Site4 <> '')
and (PMB.Site2 = '' or PMB.Site3 = '' or PMB.Site4 = '')
order by SB.WebID



UPDATE ProviderMasterBase 
	SET Site2 = SB.WebCode
	FROM #Temp1 SB
	WHERE SB.ProviderMasterID = ProviderMasterBase.ProviderMasterID
	AND SB.PrimarySite <> 'Y'
	AND (Site2 = ''
		OR Site2 IS NULL)
	AND SB.WebCode <> Site1
	
	
	
UPDATE ProviderMasterBase 
	SET Site3 = SB.WebCode
	FROM #Temp1 SB
	WHERE SB.ProviderMasterID = ProviderMasterBase.ProviderMasterID
	AND SB.PrimarySite <> 'Y'
	AND (Site3 = ''
		OR Site3 IS NULL)
	AND SB.WebCode <> Site1
	AND SB.WebCode <> Site2
	
	
UPDATE ProviderMasterBase 
	SET Site4 = SB.WebCode
	FROM #Temp1 SB
	WHERE SB.ProviderMasterID = ProviderMasterBase.ProviderMasterID
	AND SB.PrimarySite <> 'Y'
	AND (Site4 = ''
		OR Site4 IS NULL)
	AND SB.WebCode <> Site1
	AND SB.WebCode <> Site2
	AND SB.WebCode <> Site3
	
	
	
	--Clean up SiteBase Duplicates
	
	IF OBJECT_ID('tempdb..#TempBase') IS NOT NULL
				/*Then it exists*/
				   DROP TABLE #TempBase
	
	SELECT * into #TempBase
	FROM SiteBase
	
	TRUNCATE TABLE SiteBase
	
	INSERT INTO SiteBase
	SELECT DISTINCT * FROM #TempBase
	
	DECLARE @SiteCount int;
	
	SET @SiteCount = (SELECT COUNT(*) FROM SiteBase)
	
	IF (@SiteCount  < 10 ) 
	BEGIN
		raiserror('SiteBase load error', 12, -1) with log;
	END
			
	
END
