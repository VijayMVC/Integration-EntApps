CREATE PROCEDURE [dbo].[usp_LoadProviderCodeChanges] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Load PhysicianInfoCode Changes for Director Changes
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	/* Set Variables and Pre-Processing */
	DECLARE @Count			INT

	SET @Count = 0	

	TRUNCATE TABLE PhysicianInfoCodeChanges
	TRUNCATE TABLE PhysicianInfoCodeChangesOriginal

	/* Loading Original Table */

	INSERT INTO PhysicianInfoCodeChangesOriginal
		(ProviderMasterID,
		 WebID,
		 Code)
	SELECT DISTINCT 
		 Prov.ProviderMasterID,
		 PINf.ID,
		 PINF.Code
		 FROM PhysicianInfo PInf
		INNER JOIN ProviderMaster Prov
			ON PInf.ID = Prov.WebID
		INNER JOIN AffiliationStaging AS1
			ON Prov.ProviderMasterID = AS1.ProviderMasterID
		WHERE PInf.Code NOT LIKE '*%'
		  AND AS1.StaffGroup = 'CEP'
		  AND NOT 	(Prov.CurrentProviderFlag = 'N' 
			AND 	 PInf.Code = ' ')
		
	CREATE TABLE #TempCode 
		(ProviderMasterID	INT, 
		 WebID			INT, 
		 CodeOriginal		VARCHAR(255), 
		 CodeNew		VARCHAR(255), 
	 	 CommaPosition 		INT, 
		 FirstStringPosition 	INT,
		 LastStringPosition1 	INT,  
		 LastStringPosition2 	INT,
		 RDFlag			CHAR(1),
		 RDExistFlag		CHAR(1),
		 MDFlag			CHAR(1),
		 MDExistFlag		CHAR(1),
		 AMDFlag		CHAR(1),
		 AMDExistFlag		CHAR(1))

	/* Need to Separate Codes */

	INSERT INTO #TempCode 
		(ProviderMasterID, 
		 WebID, 
		 CodeOriginal)
	SELECT	 PICC.ProviderMasterID,
		 PICC.WebID,
		 PICC.Code 
			FROM PhysicianInfoCodeChangesOriginal PICC

	INSERT INTO PhysicianInfoCodeChanges
		(ProviderMasterID, 
		 WebID)
	SELECT DISTINCT 
		 TC.ProviderMasterID,
		 TC.WebID
		FROM #TempCode TC

	WHILE (@Count < 15)
		BEGIN
			UPDATE  #TempCode
				SET CodeOriginal = RTRIM(LTRIM(SUBSTRING(CodeOriginal,2,254)))
				WHERE SUBSTRING(CodeOriginal,1,1) IN (',',';')

			IF (SELECT COUNT(*)
				FROM #TempCode
				WHERE SUBSTRING(CodeOriginal,1,1) IN (',',';')) = 0
					BREAK
		
			SET @Count = @Count + 1
		END

	/* Set Flags */
	UPDATE #TempCode
		SET RDFlag = 'Y'
		WHERE EXISTS
			(SELECT 1
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID = #TempCode.ProviderMasterID
				  AND PTH.TitleCode = 'RD'
				  AND PTH.ActiveFlag = 'Y')
	UPDATE #TempCode
		SET MDFlag = 'Y'
		WHERE EXISTS
			(SELECT 1
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID = #TempCode.ProviderMasterID
				  AND PTH.TitleCode = 'MD'
				  AND PTH.ActiveFlag = 'Y')
	UPDATE #TempCode
		SET AMDFlag = 'Y'
		WHERE EXISTS
			(SELECT 1
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID = #TempCode.ProviderMasterID
				  AND PTH.TitleCode = 'AMD'
				  AND PTH.ActiveFlag = 'Y')

	SET @Count = 0
	WHILE @Count < 15
		BEGIN
			UPDATE #TempCode SET
				CommaPosition =  PATINDEX('%,%',CodeOriginal)

			UPDATE #TempCode SET
				CommaPosition =  PATINDEX('%;%',CodeOriginal) 
				WHERE CommaPosition = 0
				  AND CodeOriginal LIKE '%;%'

			UPDATE #TempCode SET 
				FirstStringPosition = CommaPosition - 1,
				LastStringPosition1 = CommaPosition + 1,  
				LastStringPosition2 = 254 - CommaPosition

			UPDATE #TempCode SET 
				CodeNew 	= CodeOriginal,
				CodeOriginal 	= NULL
				WHERE CommaPosition = 0

			UPDATE #TempCode SET 
				CodeNew = RTRIM(LTRIM(SUBSTRING(CodeOriginal,1,FirstStringPosition))),
				CodeOriginal = RTRIM(LTRIM(SUBSTRING(CodeOriginal,LastStringPosition1,LastStringPosition2)))
				WHERE FirstStringPosition > 0 
				  AND LastStringPosition2 > LastStringPosition1

			UPDATE #TempCode SET 
				RDExistFlag = CASE
					WHEN CodeNew = 'RD'
						THEN 'Y'
					ELSE RDExistFlag END,
				MDExistFlag = CASE
					WHEN CodeNew = 'MD'
						THEN 'Y'
					ELSE MDExistFlag END,
				AMDExistFlag = CASE
					WHEN CodeNew = 'AMD'
						THEN 'Y'
					ELSE AMDExistFlag END

			UPDATE PhysicianInfoCodeChanges
				SET Code = CASE
					WHEN TC.CodeNew = 'RD'
						THEN CASE 	WHEN TC.RDFlag IS NULL
									THEN PICC.Code
								WHEN TC.RDFlag = 'Y' AND PICC.Code IS NULL
									THEN TC.CodeNew
								WHEN TC.RDFlag = 'Y' AND PICC.Code = ' '
									THEN TC.CodeNew
								WHEN TC.RDFlag = 'Y' AND PICC.Code != ' '
									THEN PICC.Code + ',' + TC.CodeNew
								ELSE PICC.Code END
					WHEN TC.CodeNew = 'MD'
						THEN CASE 	WHEN TC.MDFlag IS NULL
									THEN PICC.Code
								WHEN TC.MDFlag = 'Y' AND PICC.Code IS NULL
									THEN TC.CodeNew
								WHEN TC.MDFlag = 'Y' AND PICC.Code = ' '
									THEN TC.CodeNew
								WHEN TC.MDFlag = 'Y' AND PICC.Code != ' '
									THEN PICC.Code + ',' + TC.CodeNew
								ELSE PICC.Code END
					WHEN TC.CodeNew = 'AMD'
						THEN CASE 	WHEN TC.AMDFlag IS NULL
									THEN PICC.Code
								WHEN TC.AMDFlag = 'Y' AND PICC.Code IS NULL
									THEN TC.CodeNew
								WHEN TC.AMDFlag = 'Y' AND PICC.Code = ' '
									THEN TC.CodeNew
								WHEN TC.AMDFlag = 'Y' AND PICC.Code != ' '
									THEN PICC.Code + ',' + TC.CodeNew
								ELSE PICC.Code END
					WHEN PICC.Code IS NULL
						THEN TC.CodeNew
					WHEN TC.CodeNew = ' ' OR TC.CodeNew IS NULL
						THEN PICC.Code
					ELSE PICC.Code + ',' + TC.CodeNew END
				FROM PhysicianInfoCodeChanges PICC
				INNER JOIN #TempCode TC
					  ON PICC.ProviderMasterID = TC.ProviderMasterID
					 AND PICC.WebID = TC.WebID
				WHERE TC.CodeNew IS NOT NULL

				SET @Count = @Count + 1
				
				IF (SELECT COUNT(*)
						FROM #TempCode TC 
						WHERE TC.CommaPosition != 0) = 0
					BREAK
				
				UPDATE #TempCode SET 
					CodeOriginal	= NULL,
					CodeNew 	= NULL
					WHERE CommaPosition = 0
					  AND 		(CodeOriginal 	IS NOT NULL
						OR	 CodeNew 	IS NOT NULL)
			END

		UPDATE PhysicianInfoCodeChanges
			SET Code = CASE WHEN TC.RDExistFlag IS NULL
					THEN CASE 	WHEN Code = ' ' OR CODE IS NULL
							THEN 'RD'
							ELSE 'RD,' + Code  END
					ELSE Code END
			FROM PhysicianInfoCodeChanges PICC
			INNER JOIN #TempCode TC 
				 ON PICC.ProviderMasterID 	= TC.ProviderMasterID
				AND PICC.WebID 			= TC.WebID
			WHERE TC.RDFlag = 'Y'

		UPDATE PhysicianInfoCodeChanges
			SET Code = CASE WHEN TC.MDExistFlag IS NULL
					THEN CASE 	WHEN Code = ' ' OR CODE IS NULL
							THEN 'MD'
							ELSE 'MD,' + Code  END
					ELSE Code END
			FROM PhysicianInfoCodeChanges PICC
			INNER JOIN #TempCode TC 
				 ON PICC.ProviderMasterID 	= TC.ProviderMasterID
				AND PICC.WebID 			= TC.WebID
			WHERE TC.MDFlag = 'Y'

		UPDATE PhysicianInfoCodeChanges
			SET Code = CASE WHEN TC.AMDExistFlag IS NULL
					THEN CASE 	WHEN Code = ' ' OR CODE IS NULL
							THEN 'AMD'
							ELSE 'AMD,' + Code  END
					ELSE Code END
			FROM PhysicianInfoCodeChanges PICC
			INNER JOIN #TempCode TC 
				 ON PICC.ProviderMasterID 	= TC.ProviderMasterID
				AND PICC.WebID 			= TC.WebID
			WHERE TC.AMDFlag = 'Y'

		UPDATE PhysicianInfoCodeChanges
			SET Code = ' '
			WHERE Code IS NULL

		DELETE FROM PhysicianInfoCodeChanges
			WHERE EXISTS
			(SELECT 1
				FROM PhysicianInfo PInf
				WHERE PInf.ID 	= PhysicianInfoCodeChanges.WebID
				 AND PInf.Code 	= PhysicianInfoCodeChanges.Code)

		/* Get rid of separated Provider */
		INSERT INTO PhysicianInfoCodeChanges
			(ProviderMasterID,
			 WebID,
			 Code)
		SELECT 	 DISTINCT
			 Prov.ProviderMasterID,
			 Prov.WebID,
			 ' '
			FROM ProviderMaster Prov
			INNER JOIN PhysicianInfo PInf
				ON Prov.WebID = PInf.ID
			INNER JOIN AffiliationStaging AS1
				ON AS1.ProviderMasterID = Prov.ProviderMasterID
			WHERE Prov.CurrentProviderFlag = 'N'
			  AND PInf.Code != ' '

END
