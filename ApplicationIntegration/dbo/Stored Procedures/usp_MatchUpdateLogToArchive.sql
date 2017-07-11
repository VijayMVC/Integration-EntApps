
CREATE PROCEDURE [dbo].[usp_MatchUpdateLogToArchive] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Match the Update Archive to the Log File
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	SELECT 	PMUL.ProviderMasterID,
		MIN(PMUL.PMULPrimeKey) AS PMULPrimeKey
		INTO #TempLogArchiveMatchMin
		FROM ProviderMasterUpdateLog PMUL
		WHERE PMUL.MatchedToArchiveFlag IS NULL
		  AND PMUL.AuthorApproval IS NOT NULL	
		  AND EXISTS
			(SELECT 1
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMUL.ProviderMasterID = PMUA.ProviderMasterID
				  AND PMUA.MatchedToLogFlag IS NULL)
		GROUP BY PMUL.ProviderMasterID

	SELECT 	PMUL.ProviderMasterID,
		MIN(PMUL.PMULPrimeKey) AS PMULPrimeKey
		INTO #TempLogArchiveMatchMax
		FROM ProviderMasterUpdateLog PMUL
		WHERE PMUL.MatchedToArchiveFlag IS NULL
		  AND PMUL.AuthorApproval IS NOT NULL	
		  AND EXISTS
			(SELECT 1
				FROM ProviderMasterUpdateArchive PMUA
				WHERE PMUL.ProviderMasterID = PMUA.ProviderMasterID
				  AND PMUA.MatchedToLogFlag IS NULL)
		GROUP BY PMUL.ProviderMasterID

	UPDATE ProviderMasterUpdateArchive SET 
		MatchedToLogFlag = 'Y',
		PMULPrimeKeyLog     = TLPM.PMULPrimeKey,
		PMULPrimeKeyApprove = TLPX.PMULPrimeKey
		FROM ProviderMasterUpdateArchive PMUA
		INNER JOIN #TempLogArchiveMatchMin TLPM
			ON PMUA.ProviderMasterID = TLPM.ProviderMasterID
		INNER JOIN #TempLogArchiveMatchMin TLPX
			ON PMUA.ProviderMasterID = TLPX.ProviderMasterID
		WHERE PMUA.MatchedToLogFlag IS NULL

	UPDATE ProviderMasterUpdateLog SET 
		MatchedToArchiveFlag = 'Y'
		FROM ProviderMasterUpdateLog PMUL
		INNER JOIN #TempLogArchiveMatchMin TLPM
			ON PMUL.ProviderMasterID = TLPM.ProviderMasterID
		WHERE PMUL.MatchedToArchiveFlag IS NULL
		  AND PMUL.AuthorApproval 	IS NOT NULL	

	UPDATE  ProviderMasterUpdateLog SET 
		MatchedToArchiveFlag = 'Y'
		WHERE MatchedToArchiveFlag IS NULL
		  AND AuthorApproval 	IS NOT NULL	
		  AND EXISTS
		(SELECT 1 
			FROM #TempLogArchiveMatchMin TLPM
			INNER JOIN ProviderMasterUpdateLog PMUL
				ON TLPM.PMULPrimeKey = PMUL.PMULPrimeKey
			WHERE PMUL.ProviderMasterID = ProviderMasterUpdateLog.ProviderMasterID)
	      
END

