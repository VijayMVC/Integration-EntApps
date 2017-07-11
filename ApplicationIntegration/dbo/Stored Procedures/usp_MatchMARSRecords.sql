
CREATE PROCEDURE [dbo].[usp_MatchMARSRecords] 
AS

/* 	Author: 	Andrew Marsh
	Date:		3/13/2003
	Purpose:	UPDATE MARS Records
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 
BEGIN

   /* Obtain Current IDs */
	UPDATE MARSProviderMasterCurrent SET 
		ProviderMasterID = PCMM.ProviderMasterID
		FROM MARSProviderMasterCurrent MPM
		INNER JOIN ProviderCrossMapMARS PCMM
			 ON MPM.practice = PCMM.MARSpractice 
			AND MPM.ProviderCode = PCMM.MARSProviderCode

   /*  Part 1 - Match on First AND Last Name */
	UPDATE MARSProviderMasterCurrent SET 
		ProviderMasterID = Prov.ProviderMasterID
		FROM MARSProviderMasterCurrent MPMC
		INNER JOIN ProviderMaster Prov		
			 ON REPLACE(MPMC.ProviderLast,'.','') 	= REPLACE(Prov.LastName,'.','') 
			AND MPMC.ProviderFirst 	= Prov.FirstName
		WHERE MPMC.ProviderMasterID IS NULL

   /*  Part 1 - Match on First AND Last Name */
	UPDATE MARSProviderMasterCurrent SET 
		ProviderMasterID = Prov.ProviderMasterID
		FROM MARSProviderMasterCurrent MPMC
		INNER JOIN ProviderMaster Prov		
			 ON REPLACE(MPMC.ProviderLast,'.','') 	= REPLACE(Prov.LastName,'.','') 
			AND MPMC.ProviderFirst 	= Prov.PreferredName
		WHERE MPMC.ProviderMasterID IS NULL

   /*  Part 2 - Separate Middle Name OR Initial out AND Match on First AND Last Name  */
	CREATE TABLE #TempName 
		(Practice 		CHAR(3), 
		 ProviderCode 		INT, 
		 ProviderFirst 		CHAR(30), 
		 ProviderFirstNew 	VARCHAR(30), 
		 ProviderMiddleNew 	VARCHAR(30), 
		 BlankPosition 		INT, 
		 FirstStringPosition 	INT, 
		 LastStringPosition1 	INT,  
		 LastStringPosition2 	INT)

	/* need to separate first FROM middle name */

	INSERT INTO #TempName 
		(Practice, 
		 ProviderCode,  
		 ProviderFirst, 
		 BlankPosition)
	SELECT 	Practice, 
		ProviderCode, 
		ProviderFirst, 
		PATINDEX('% %',ProviderFirst) 
		FROM MARSProviderMasterCurrent 
		WHERE ProviderFirst NOT IN ('SUSPENSE ACCOUNT DOCTOR', 'MAP, PHYSICIAN')
		AND ProviderMasterID IS NULL
	
	UPDATE #TempName SET FirstStringPosition = BlankPosition - 1,
	 LastStringPosition1 = BlankPosition + 1,  LastStringPosition2 = 30 - BlankPosition

	UPDATE #TempName SET 
		ProviderFirstNew 	= LEFT	(ProviderFirst,FirstStringPosition),
		ProviderMiddleNew 	= RIGHT	(ProviderFirst,LastStringPosition2)
		WHERE FirststringPosition > 0 
		  AND LastStringPosition2 > 0 

	UPDATE MARSProviderMasterCurrent SET 
		ProviderFirstNew 	= TN.ProviderFirstNew, 
		ProviderMiddleNew 	= TN.ProviderMiddleNew
		FROM MARSProviderMasterCurrent MPM
		INNER JOIN #TempName TN
			 ON MPM.Practice 	= TN.Practice
		  	AND MPM.ProviderCode 	= TN.ProviderCode

	UPDATE MARSProviderMasterCurrent SET 
		ProviderMasterID = Prov.ProviderMasterID
		FROM MARSProviderMasterCurrent MPM
		INNER JOIN ProviderMaster Prov
			 ON REPLACE(MPM.ProviderLast,'.','') = REPLACE(Prov.LastName,'.','')
		  	AND MPM.ProviderFirstNew 	= Prov.FirstName
		WHERE MPM.ProviderMasterID IS NULL

   /* Part 3 - Match to other names */
	UPDATE MARSProviderMasterCurrent
		SET ProviderMasterID = Prov.ProviderMasterID 
		FROM MARSProviderMasterCurrent MPM, ProviderMaster Prov, 
					AppStaging.dbo.SFDCContactStaging PEDR
			WHERE PEDR.Id = Prov.SFID
			  AND REPLACE(MPM.ProviderLast,'.','') = REPLACE(PEDR.LastName,'.','')
			  AND		(MPM.ProviderFirst 	= PEDR.FirstName 
				OR 	 MPM.ProviderFirstNew	= PEDR.FirstName)
			  AND MPM.ProviderMasterID IS NULL

	UPDATE MARSProviderMasterCurrent SET 
		ProviderMasterID = Prov.ProviderMasterID
		FROM 	MARSProviderMasterCurrent 	MPMC, 
			ProviderMaster 			Prov, 
			ProviderInfoWebCurrent 		PIWC
			WHERE  Prov.WebID 	= PIWC.ID
			  AND REPLACE(MPMC.ProviderLast,'.','') = REPLACE(PIWC.LastName,'.','') 
			  AND 	  (MPMC.ProviderFirst 	 = PIWC.FirstName 
				OR MPMC.ProviderFirstNew = PIWC.FirstName)
			  AND MPMC.ProviderMasterID IS NULL

/**** Hard code to handle issues with name mismatch between MBSI and PMDB ****/
	--Remove once MBSI updates are completed
	--Created on 3/31/2011 by J Rogers

			
	UPDATE MARSProviderMasterCurrent 
	SET ProviderMasterID = 2573
	WHERE ProviderCode = 20
		and practice = 'E65'
		
	UPDATE MARSProviderMasterCurrent 
	SET ProviderMasterID = 4771
	WHERE ProviderCode = 62
		and practice IN ('E32', 'E33')



   /* Part 4 - Determine which providers are still utilized */

	TRUNCATE TABLE MARSUnmatched
	TRUNCATE TABLE MARSMatchingResults

	INSERT INTO MARSUnmatched 
		(Practice, 
		 ProviderCode, 
		 ProviderLast, 
		 ProviderFirst)
	SELECT  Practice, 
		ProviderCode, 
		ProviderLast, 
		ProviderFirst
		FROM MARSProviderMasterCurrent 
			WHERE ProviderLast NOT IN ('SUSPENSE ACCOUNT DOCTOR', 'UNKNOWN')
			  AND ProviderMasterID IS NULL

END

