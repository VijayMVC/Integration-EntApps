
CREATE  PROCEDURE [dbo].[usp_LoadLawsonPositionsToWeb]
AS
BEGIN

	--As of 4/1/2011 SEMA is a part of CEP

-- This procedure is used for gathering all of the positions out of Lawson, getting the correct WebID from 
-- various locations and then moving the WebID, EMPLOYEE, R_POSITION to the web 
--      lookup tables (LS_positionLookup, LS_PositionLookup_SEMA, and LS_Term)
-- It is assumed the procedure will be stored and run on the same database containing the primary 
--      tables used (LawsonPositionsPLs, ProviderMaster, etc.) 

	TRUNCATE TABLE LawsonPositionsPLs;
	TRUNCATE TABLE LawsonEmpStatus;

    -- The LawsonPositionsPLs table is a temporary table where the positions are initially inserted 
    --        and then WebIDs are updated here before being pushed out to the web

	-- Populate LawsonPositionsPLs from Lawson tables refreshed by package) 
	INSERT INTO LawsonPositionsPLs (EMPLOYEE, R_POSITION, PROCESS_LEVEL, SSN, LastName, FirstName, MiddleName)
		SELECT DISTINCT P.EMPLOYEE, P.R_POSITION, P.PROCESS_LEVEL, LEFT(REPLACE(FICA_NBR,'-',''),20) AS SSN, EMP.LAST_NAME,EMP.FIRST_NAME,EMP.MIDDLE_NAME
		FROM [AppStaging].[dbo].[LawsonPAEMPPOS] P
		INNER JOIN [AppStaging].[dbo].[LawsonEMPLOYEE] EMP
		ON P.EMPLOYEE = EMP.EMPLOYEE
		WHERE P.END_DATE = '1753-01-01 00:00:00.000'
		UNION
		SELECT DISTINCT P.EMPLOYEE, P.R_POSITION, P.PROCESS_LEVEL, LEFT(REPLACE(FICA_NBR,'-',''),20) AS SSN, EMP.LAST_NAME,EMP.FIRST_NAME,EMP.MIDDLE_NAME
		FROM [AppStaging].[dbo].[LawsonPAEMPPOS] P
		INNER JOIN [AppStaging].[dbo].[LawsonEMPLOYEE] EMP
		ON P.EMPLOYEE = EMP.EMPLOYEE
		WHERE P.EMPLOYEE NOT IN
		(
		SELECT DISTINCT EMPLOYEE 
		FROM [AppStaging].[dbo].[LawsonPAEMPPOS] P
		WHERE P.END_DATE = '1753-01-01 00:00:00.000' 
		)
		AND CONVERT(CHAR(10),P.EMPLOYEE) + P.R_POSITION IN (
			SELECT CONVERT(CHAR(10),EMPLOYEE) + MAX(R_POSITION) AS POSITION
			FROM [AppStaging].[dbo].[LawsonPAEMPPOS]
			WHERE EMPLOYEE NOT IN
				(
				SELECT DISTINCT EMPLOYEE 
				FROM [AppStaging].[dbo].[LawsonPAEMPPOS] P
				WHERE P.END_DATE = '1753-01-01 00:00:00.000' 
				)
			GROUP BY EMPLOYEE, PROCESS_LEVEL
		)

	-- Populate LawsonEmpStatus from Lawson
	INSERT INTO LawsonEmpStatus ( EMPLOYEE, TERM_DATE, EMP_STATUS )
	SELECT EMPLOYEE, TERM_DATE, EMP_STATUS
	FROM [AppStaging].[dbo].[LawsonEMPLOYEE]
	WHERE PROCESS_LEVEL <> '9200'
		AND PROCESS_LEVEL NOT LIKE '8%'


	-- Match for ‘MedAmerica’ people using EMPLOYEE and table from Web LS_EmplLookup
	--        For now only do this for MedAmerica employees (PROCESS_LEVEL = 9100)
	--		NOTE: LS_EmplLookup is a Lawson EMPLOYEE to WebID table manually maintained via the web
	UPDATE LawsonPositionsPLs 
	SET WebID = el.ID
	FROM LawsonPositionsPLs as pl 
	INNER JOIN [WebStaging].[dbo].[LS_EmplLookup] AS el
	ON pl.EMPLOYEE = el.LawsonNum
	WHERE pl.WebID IS NULL and pl.PROCESS_LEVEL = 9100;

	-- Match for ‘CEP America’ (using SSN) via ProviderMaster and ProviderMasterBase 
	UPDATE LawsonPositionsPLs 
	SET WebID = PMB.WebID
	FROM ProviderMaster P
	INNER JOIN ProviderMasterBase PMB
	ON P.ProviderMasterID = PMB.ProviderMasterID
	INNER JOIN LawsonPositionsPLs CW
	ON RTRIM(CW.SSN) = RTRIM(P.SSNUnformatted)
	WHERE CW.WebID IS NULL;

	-- Match for GALEN (using SSN) via ProviderMaster and ProviderMasterBaseStaffGroup
	--UPDATE LawsonPositionsPLs 
	--SET WebID = PMB.WebID
	--FROM ProviderMaster P
	--INNER JOIN ProviderMasterBaseStaffGroup PMB
	--ON P.ProviderMasterID = PMB.ProviderMasterID
	--INNER JOIN LawsonPositionsPLs CW
	--ON RTRIM(CW.SSN) = RTRIM(P.SSNUnformatted)
	--WHERE CW.WebID IS NULL;


	-- Try to match more WebIDs for GALEN  with slightly different where clause
    -- *********************
	-- *** IMPORTANT NOTE*** This may ovewrite an existing WebID in the temporary able
	-- 31 records are updated. After some investigation, these people are in both the
	-- ProviderMasterBase and ProviderMasterBaseStaffGroup tables with different WebIDs 
	-- in each table. 
	-- The first grab (above) gets the WebIDs out of ProviderMasterBase
	-- The second grab from PMBSG doesn't get any of these because their WebID is already filled in
	-- This next statement then grabs the WebIDs from PMBSG where the PROCESS_LEVEL >= 8000 
	-- 31 if you don't check for CW.WebID already existing and let it overwrite a value already retreived
	-- 0 if you don't let if overwrite a WebID already retreived
	-- Someday this could be looked into more as to where the ids were coming from the first time around
	--UPDATE LawsonPositionsPLs 
	--SET WebID = PMBSG.WebID
	--FROM ProviderMaster P
	--INNER JOIN ProviderMasterBaseStaffGroup PMBSG
	--ON P.ProviderMasterID = PMBSG.ProviderMasterID
	--INNER JOIN LawsonPositionsPLs CW
	--ON RTRIM(CW.SSN) = RTRIM(P.SSNUnformatted)
	--WHERE CW.PROCESS_LEVEL >= 8000
	--	AND PMBSG.WebID IS NOT NULL
	--	AND CW.WebID <> PMBSG.WebID;


	-- Final match using LS_EmplLookup from web; but not limited to MedAmerica this time.
	UPDATE LawsonPositionsPLs 
	SET WebID = el.ID
	FROM LawsonPositionsPLs as pl 
	INNER JOIN [WebStaging].[dbo].[LS_EmplLookup] AS el
	ON pl.EMPLOYEE = el.LawsonNum
	WHERE pl.WebID IS NULL;

	-- Match for ‘any group’ (using SSN) via ProviderMaster 
	-- As of 2-Apr-10 this is matching approximately 11 people all but one are 'PTNR-UNA1000' positions
	--            the other one just needs fixed in ProviderMasterBase and ProviderMasterBaseStaffGroup
    -- This is done as the last matching step
	UPDATE LawsonPositionsPLs 
	SET WebID = P.WebID
	FROM ProviderMaster P
	INNER JOIN LawsonPositionsPLs CW
	ON RTRIM(CW.SSN) = RTRIM(P.SSNUnformatted)
	WHERE CW.WebID IS NULL and P.WebID is not null;

	-- ------------------------------------------------
	-- Hard coding necessary to get all the records to match the old production table 
	-- ------------------------------------------------
	UPDATE LawsonPositionsPLs SET WebID = 2050 WHERE EMPLOYEE = 1981;
	UPDATE LawsonPositionsPLs SET WebID = 5746 WHERE EMPLOYEE = 2514;
	UPDATE LawsonPositionsPLs SET WebID = 5872 WHERE EMPLOYEE = 6001;
	UPDATE LawsonPositionsPLs SET WebID = 5951 WHERE EMPLOYEE = 6003;
	UPDATE LawsonPositionsPLs SET WebID = 5614 WHERE EMPLOYEE = 2185;

    -- Extra position in Lawson for Fritz Leidig
	DELETE LawsonPositionsPLs  WHERE EMPLOYEE = 267   AND PROCESS_LEVEL >= 8000;

	-- Transfer positions to web staging tables tables
    -- The transfer of this data to the web happens outside of the procedure as part of the DTS package 
	TRUNCATE TABLE [WebStaging].[dbo].[LS_positionLookup];
	--TRUNCATE TABLE [WebStaging].[dbo].[LS_positionLookup_SEMA];
	TRUNCATE TABLE [WebStaging].[dbo].[LS_Term];

	-- Non-SEMA positions
	INSERT INTO [WebStaging].[dbo].[LS_positionLookup] 
		(WebID, EMPLOYEE, PROCESS_LEVEL, R_POSITION, EMP_STATUS, CreDate)
	SELECT DISTINCT LPPL.WebID, LPPL.EMPLOYEE, LPPL.PROCESS_LEVEL, LPPL.R_POSITION,
		LE.EMP_STATUS, GetDate()
	FROM LawsonPositionsPLs LPPL
		INNER JOIN AppStaging.dbo.LawsonEMPLOYEE LE ON LE.employee = LPPL.EMPLOYEE
	WHERE LPPL.PROCESS_LEVEL <> '9200'
	AND LPPL.PROCESS_LEVEL not between '8100' and '8199';


	INSERT INTO [WebStaging].[dbo].[LS_Term] (WebID, EMPLOYEE, TERM_DATE, EMP_STATUS)
	SELECT DISTINCT LPPL.WebID, LES.EMPLOYEE, LES.TERM_DATE, 
			LES.EMP_STATUS
	FROM LawsonEmpStatus LES
	LEFT OUTER JOIN LawsonPositionsPLs LPPL
	ON LES.EMPLOYEE = LPPL.EMPLOYEE;

	-- First update the TERM_DATE to null
	UPDATE [WebStaging].[dbo].[LS_Term] SET TERM_DATE = NULL 
		WHERE TERM_DATE = '1753-01-01 00:00:00.000';
	
	
	UPDATE [WebStaging].[dbo].[LS_Term] 
	SET WebID = NULL 
	WHERE EMPLOYEE = 11001
		
END;

