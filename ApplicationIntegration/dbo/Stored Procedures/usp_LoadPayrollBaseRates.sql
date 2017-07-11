
CREATE PROCEDURE [dbo].[usp_LoadPayrollBaseRates] 
AS

/* 	
	Purpose:	Load Base Rate Tables for Payroll
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN 
	DECLARE @CEPStaffGroup		VARCHAR(50),
		@GetDate		DATETIME,
		@GetDateAlpha		VARCHAR(50),
		@GetPriorDateAlpha	VARCHAR(50),
		@PriorYearMonthPeriod	CHAR(6),
		@CurrentYearMonthPeriod CHAR(6),
		@StartLoadDate		DATETIME
	
	SET @CEPStaffGroup = 'CEP'
	SET @GetDate = GETDATE()

	SELECT @GetDateAlpha 	  = CONVERT ( VARCHAR (12), DATEADD(mm,-1,@GetDate) , 101)
	SELECT @GetPriorDateAlpha = CONVERT ( VARCHAR (12), DATEADD(mm,-2,@GetDate) , 101)
	
	SELECT @CurrentYearMonthPeriod = DLU.YrMoPeriod
		FROM Date_Lu DLU
		WHERE DLU.DateMMDDYYYY = @GetDateAlpha

	SELECT @PriorYearMonthPeriod = DLU.YrMoPeriod
		FROM Date_Lu DLU
		WHERE DLU.DateMMDDYYYY = @GetPriorDateAlpha

	SELECT @StartLoadDate = MIN(DLU.DateMMDDYYYY)
		FROM Date_LU DLU
		WHERE DLU.YrMoPeriod = @PriorYearMonthPeriod

	DELETE FROM PayrollReporting_BaseRates
		WHERE YrMoPeriod >= @PriorYearMonthPeriod

	CREATE TABLE #TempRates
		(WebCode 	INT,
		 YrMoPeriod		CHAR(6),
		 BaseRateA		NUMERIC(9,4),
		 CountBaseA		INT,
		 NiteDiffA		NUMERIC(9,4),
		 CountNiteA		INT,
		 MtgRate		NUMERIC(9,4),
		 CountMtg		INT
		 )		

	INSERT INTO #TempRates
		(WebCode,
		 YrMoPeriod,
		 BaseRateA,
		 NiteDiffA,
		 MtgRate) 
	SELECT 	DISTINCT
		HR.Code,
		DLU.YrMoPeriod,
		WTD.BaseRate_A,
		WTD.NiteDiff_A,
		WTD.MtgRate
		FROM AppStaging.dbo.WebTC_detail	WTD
		INNER JOIN ProviderMaster 		Prov
			ON WTD.Uid = Prov.WebID
		INNER JOIN Hospital_region HR
			ON HR.Code = WTD.Site
		INNER JOIN Date_LU			DLU
			ON DLU.DateMMDDYYYY = WTD.Dat
		WHERE DLU.YrMoPeriod >= @PriorYearMonthPeriod
		  AND WTD.uid != 0
		  AND NOT EXISTS
			(SELECT 1
				FROM CeridianAllMatches CAM
				WHERE Prov.ProviderMasterID = CAM.ProviderMasterID
				  AND CAM.CeridianClockNbr IS NULL)		

	UPDATE #TempRates SET 
		CountBaseA = 
			(SELECT COUNT(*)
				FROM AppStaging.dbo.WebTC_detail	WTD	
				INNER JOIN ProviderMaster 		Prov
					ON WTD.Uid = Prov.WebID
				INNER JOIN Hospital_region HR
					ON HR.Code = WTD.Site
				INNER JOIN Date_LU			DLU
					ON WTD.Dat = DLU.DateMMDDYYYY
				WHERE DLU.YrMoPeriod		= TR.YrMoPeriod
				  AND WTD.BaseRate_A 		= TR.BaseRateA
				  AND HR.Code 	= TR.WebCode)
		FROM #TempRates			TR

	UPDATE #TempRates SET 
		CountNiteA = 
			(SELECT COUNT(*)
				FROM AppStaging.dbo.WebTC_detail	WTD	
				INNER JOIN ProviderMaster 		Prov
					ON WTD.Uid = Prov.WebID
				INNER JOIN Hospital_region HR
					ON HR.Code = WTD.Site
				INNER JOIN Date_LU			DLU
					ON WTD.Dat = DLU.DateMMDDYYYY
				WHERE DLU.YrMoPeriod		= TR.YrMoPeriod
				  AND WTD.NiteDiff_A 		= TR.NiteDiffA
				  AND HR.Code 	= TR.WebCode)
		FROM #TempRates			TR

	UPDATE #TempRates SET 
		 CountMtg = 
			(SELECT COUNT(*)
				FROM AppStaging.dbo.WebTC_detail	WTD	
				INNER JOIN ProviderMaster 		Prov
					ON WTD.Uid = Prov.WebID
				INNER JOIN Hospital_region HR
					ON HR.Code = WTD.Site
				INNER JOIN Date_LU			DLU
					ON WTD.Dat = DLU.DateMMDDYYYY
				WHERE DLU.YrMoPeriod		= TR.YrMoPeriod
				  AND WTD.MtgRate 		= TR.MtgRate
				  AND HR.Code 	= TR.WebCode)
		FROM #TempRates			TR

	INSERT INTO PayrollReporting_BaseRates
		(StaffGroup,
		 WebCode, 
		 YrMoPeriod,
		 BaseRate,
		 CountBaseRate,
		 NiteDiffRate,
		 CountNiteDiffRate,
		 MeetingRate,
		 CountMeetingRate)
	SELECT 	DISTINCT 
		 @CEPStaffGroup,
		 TR.WebCode,
		 TR.YrMoPeriod,
		 TR.BaseRateA,
		 TR.CountBaseA,
		 TR.NiteDiffA,
		 TR.CountNiteA,
		 TR.MtgRate,
		 TR.CountMtg	
		FROM #TempRates			TR

	UPDATE PayrollReporting_BaseRates SET
		CurrentPeriodFlag = 'Y'
		WHERE YrMoPeriod = @CurrentYearMonthPeriod
		
END

