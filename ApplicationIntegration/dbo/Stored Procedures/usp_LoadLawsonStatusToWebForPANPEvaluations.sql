
CREATE PROCEDURE [dbo].[usp_LoadLawsonStatusToWebForPANPEvaluations]
AS
BEGIN
	/* This procedure loads the LS_StatusLookup table to be used on the web
		to help identify which people need performance evaluations
		It loads a lot of extra people/positions rather than try to keep up with all
		the possible positions which could be PAs or NPs. The extraneous positions
		will simply be ignored by the web application.
	*/

	-- For validation queries see Validation_LS_StatusLookup.sql

	TRUNCATE TABLE WebStaging.dbo.LS_StatusLookup;

	------------------------------------------------------------
	-- Get all current positions
	------------------------------------------------------------
	-- Note the join into LawsonIDMatch -> ProviderMaster -> ProviderMasterBase
	-- This will help limit the number of records which get transferred into the table
	INSERT INTO WebStaging.dbo.LS_StatusLookup 
	(Employee, ProviderMasterID, ProcessLevel, Position, EmpStatus, DateHired, 
		EffectDate, EndDate, PayRate, PosLevel)
	SELECT DISTINCT p.EMPLOYEE, pmb.ProviderMasterID, p.PROCESS_LEVEL, p.R_POSITION, e.EMP_STATUS,  
	e.DATE_HIRED, 
		p.EFFECT_DATE, p.END_DATE, p.PAY_RATE, p.POS_LEVEL
	FROM AppStaging.dbo.LawsonPAEMPPOS AS p
		INNER JOIN AppStaging.dbo.LawsonEMPLOYEE AS e ON p.EMPLOYEE = e.EMPLOYEE
		INNER JOIN ApplicationIntegration.dbo.LawsonIDMatch AS lid on e.EMPLOYEE = lid.LawsonEmpNo
		INNER JOIN ApplicationIntegration.dbo.ProviderMasterBase AS pmb on lid.ProviderMasterID = pmb.ProviderMasterID
	WHERE p.END_DATE = '1753-01-01 00:00:00.000'
		AND p.PROCESS_LEVEL < 8000
		AND pmb.CEPLevel = 'P'
		AND pmb.Status = 0
		AND pmb.StaffGroup1 = 'CEP';

	-- ----------------------------------------------------------
	-- Get most recent positions for people which have ended 
	--		(unless that same position is still active for a later date)
	------------------------------------------------------------
	-- This temp table is to find a listing of the max end_date for each employee/process_level/position
	-- and then will be used to determine what the last ended position was for the employee/process/level
	-- Created as a temporary table to make the following SQL statement easier to read
	CREATE TABLE #TEMPMaxPositionEndDates  (
				[EMPLOYEE] [int] NULL,
				[PROCESS_LEVEL] [varchar](5) NULL,
				[R_POSITION] [varchar](12) NULL,
				[MaxEND_DATE] [datetime] NULL
			);

	INSERT INTO #TEMPMaxPositionEndDates
		SELECT DISTINCT p.EMPLOYEE, p.PROCESS_LEVEL, p.R_POSITION, max(p.END_DATE) AS MaxEND_DATE
			FROM AppStaging.dbo.LawsonPAEMPPOS AS p
			INNER JOIN AppStaging.dbo.LawsonEMPLOYEE AS e
			ON p.EMPLOYEE = e.EMPLOYEE
			WHERE p.END_DATE <> '1753-01-01 00:00:00.000'   -- only want positions already ended
			AND p.PROCESS_LEVEL < 8000
			GROUP BY p.EMPLOYEE, p.PROCESS_LEVEL, p.R_POSITION;

	-- Note the join into LawsonIDMatch -> ProviderMasterBase
	-- This will help limit the number of records which get transferred into the table
	-- by only adding  CEPLevel=P and Status=0 (active)
	-- and it uses the temp table to find the most recent end date for a position
	INSERT INTO WebStaging.dbo.LS_StatusLookup 
		(Employee, ProviderMasterID, ProcessLevel, Position, EmpStatus, DateHired, EffectDate, EndDate, 
		PayRate, PosLevel)
	SELECT DISTINCT p.EMPLOYEE, pmb.ProviderMasterID, p.PROCESS_LEVEL, p.R_POSITION, e.EMP_STATUS,  
		e.DATE_HIRED, p.EFFECT_DATE, p.END_DATE, p.PAY_RATE, p.POS_LEVEL
	FROM AppStaging.dbo.LawsonPAEMPPOS P
		INNER JOIN AppStaging.dbo.LawsonEMPLOYEE E ON p.EMPLOYEE = e.EMPLOYEE
		INNER JOIN ApplicationIntegration.dbo.LawsonIDMatch AS lid on e.EMPLOYEE = lid.LawsonEmpNo
		INNER JOIN ApplicationIntegration.dbo.ProviderMasterBase AS pmb on lid.ProviderMasterID = pmb.ProviderMasterID
		INNER JOIN #TEMPMaxPositionEndDates AS mx 
						on p.EMPLOYEE = mx.EMPLOYEE
						AND p.PROCESS_LEVEL = mx.PROCESS_LEVEL
						AND p.R_POSITION = mx.R_POSITION
	WHERE p.END_DATE <> '1753-01-01 00:00:00.000'
		AND mx.MaxEND_DATE = p.END_DATE  -- only want records with the latest End date for the Process_Level and Position
		AND p.PROCESS_LEVEL < 8000
		AND pmb.CEPLevel = 'P'
		AND pmb.Status = 0
		AND pmb.StaffGroup1 = 'CEP'
		-- And now excludes active positions already in target table.
		AND NOT EXISTS ( SELECT 1 FROM WebStaging.dbo.LS_StatusLookup AS sl 
							WHERE sl.Employee = p.EMPLOYEE
							AND sl.ProcessLevel = p.PROCESS_LEVEL
							AND sl.Position = p.R_POSITION
						);

	DROP TABLE #TEMPMaxPositionEndDates;

	-- -------------------------------------------
	-- Fix the date fields for compatibility with Web database
	-- -------------------------------------------
	UPDATE WebStaging.dbo.LS_StatusLookup set DateHired = NULL where DateHired = '1/1/1753'; -- 0
	UPDATE WebStaging.dbo.LS_StatusLookup set EffectDate = NULL where EffectDate = '1/1/1753'; -- 0
	UPDATE WebStaging.dbo.LS_StatusLookup set EndDate = NULL where EndDate = '1/1/1753'; -- all current positions

	-- -------------------------------------------
	-- Update IsLeadPANP field
	-- -------------------------------------------
	UPDATE WebStaging.dbo.LS_StatusLookup
	SET IsLeadPANP = 'Y'
	FROM WebStaging.dbo.LS_StatusLookup as sl INNER JOIN AppStaging.dbo.LawsonPAPosition AS pap
	on sl.ProcessLevel = pap.PROCESS_LEVEL and sl.Position = pap.R_POSITION
	WHERE (
		pap.DESCRIPTION like 'PA LD%'
		or 
		pap.DESCRIPTION like 'NP LD%'
		or 
		pap.DESCRIPTION like 'PA LEAD%'
		)
	and pap.END_DATE = '1/1/1753' -- make sure you get the active position record
	and pap.PROCESS_LEVEL < 8000;


	-- -------------------------------------------
	-- Update IsPrimaryProcessLevel
	--		Only updating this value for active positions
	-- -------------------------------------------
	UPDATE WebStaging.dbo.LS_StatusLookup 
	SET IsPrimaryProcessLevel = 'Y' 
	WHERE PosLevel = 1
        AND EndDate is null;


	-- -------------------------------------------
	-- Update SickLeavePastYear
	-- -------------------------------------------
	/* Only grouping by Employee and ProcessLevel so if a there is an inactive position
			listed for the processl level it will show the same vacation time taken.
		 No need to do any limiting here because the table should only be populated with
		 records from the past year
		 SELECT EMPLOYEE, PROCESS_LEVEL, R_POSITION, * FROM PRTIME 
		 WHERE PAY_SUM_GRP = 'E4' 
	 		AND PROCESS_LEVEL < 8000
	 		AND TR_DATE >= GetDate() - 365
		 ORDER BY TR_DATE
	*/
	UPDATE WebStaging.dbo.LS_StatusLookup
	SET SickLeavePastTwelveMonths = st.SickHours
	FROM WebStaging.dbo.LS_StatusLookup as sl INNER JOIN 
		(
			SELECT EMPLOYEE, PROCESS_LEVEL, sum(HOURS) AS SickHours
			FROM AppStaging.dbo.LawsonPRTIME_EPSickTime
			GROUP BY EMPLOYEE, PROCESS_LEVEL
		) AS st
	on sl.Employee = st.EMPLOYEE 
	AND sl.ProcessLevel = st.PROCESS_LEVEL;
	

	-- -------------------------------------------
	-- Update PAY_EFFECT_DATE
	-- This data will not be supplied due to the difficulty in getting it 100% accurate
	-- -------------------------------------------



END;

