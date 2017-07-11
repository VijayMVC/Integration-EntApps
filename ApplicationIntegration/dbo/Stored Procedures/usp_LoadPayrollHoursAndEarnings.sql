
CREATE PROCEDURE [dbo].[usp_LoadPayrollHoursAndEarnings] 
AS

/*	Purpose:	Load Hours and Earnings for Payroll Payroll Reporting
	Revision:	Antonia Miller 8/18/05 See notes below concerning "Temporary" fix for
			DEK5
	Revision: 	Mohamed Mahmoud 11/07/2005, same as exception above for DEK3
			Antonia Miller 11/14/05 = updated value to 0 from 0,0 for many fields.

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
	SELECT @GetPriorDateAlpha = CONVERT ( VARCHAR (12), DATEADD(mm,-6,@GetDate) , 101)
	
	SELECT @CurrentYearMonthPeriod = DLU.YrMoPeriod
		FROM Date_Lu DLU
		WHERE DLU.DateMMDDYYYY = @GetDateAlpha

	SELECT @PriorYearMonthPeriod = DLU.YrMoPeriod
		FROM Date_Lu DLU
		WHERE DLU.DateMMDDYYYY = @GetPriorDateAlpha

	SELECT @StartLoadDate = MIN(DLU.DateMMDDYYYY)
		FROM Date_LU DLU
		WHERE DLU.YrMoPeriod = @PriorYearMonthPeriod

	DELETE FROM PayrollReporting_HoursAndEarnings
		WHERE YrMoPeriod >= @PriorYearMonthPeriod

	DELETE FROM PayrollReporting_HoursAndEarningsByProvider
		WHERE YrMoPeriod >= @PriorYearMonthPeriod

/*DEK3, DEK5, SAD3 now has commas in the data due to the way the data is
	coming from the web.  This will be fixed by the web area, but for now, must remove the 
	commas or the updates below won't convert to numeric*/

	UPDATE AppStaging.dbo.WebTC_detail
	SET BaseRate_A =  left(baserate_A, 3),
	Nitediff_A = 0,
	Evngdiff_A = 0,
	BaseRate_B = 0,
	Nitediff_B = 0,
	Evngdiff_B = 0,
	MtgRate = 0,
	BonusPay = 0,
	units1 = 0,
	units2 = 0,
	unitrate1 = 0,
	unitrate2 = 0,
	Projstipend = 0,
	Wknddiff_A = 0,
	Wknddiff_B = 0
	WHERE baserate_A like ('%,%') AND SITE IN ('DEK5','DEK3')

	UPDATE AppStaging.dbo.WebTC_detail
	SET BaseRate_A =  left(baserate_A, 2),
	Nitediff_A = 0,
	Evngdiff_A = 0,
	BaseRate_B = 0,
	Nitediff_B = 0,
	Evngdiff_B = 0,
	MtgRate = 0,
	BonusPay = 0,
	units1 = 0,
	units2 = 0,
	unitrate1 = 0,
	unitrate2 = 0,
	Projstipend = 0,
	Wknddiff_A = 0,
	Wknddiff_B = 0
	WHERE baserate_A like ('%,%') AND SITE = 'SAD3'



	UPDATE AppStaging.dbo.WebTC_detail SET
		BaseRate_N = BaseRate_A
		WHERE ISNUMERIC(BaseRate_A) = 1 

	UPDATE AppStaging.dbo.WebTC_detail SET
		Nitediff_N = Nitediff_A
		WHERE ISNUMERIC(Nitediff_A) = 1

	UPDATE AppStaging.dbo.WebTC_detail SET
		Evngdiff_N = Evngdiff_A
		WHERE ISNUMERIC(Evngdiff_A) = 1

	UPDATE AppStaging.dbo.WebTC_detail SET
		BaseRate_BN = BaseRate_B
		WHERE ISNUMERIC(BaseRate_B) = 1

	UPDATE AppStaging.dbo.WebTC_detail SET
		Nitediff_BN = Nitediff_B
		WHERE ISNUMERIC(Nitediff_B) = 1

	UPDATE AppStaging.dbo.WebTC_detail SET
		Evngdiff_B = 0 WHERE Evngdiff_B = '0,0'

	UPDATE AppStaging.dbo.WebTC_detail SET
		Evngdiff_BN = Evngdiff_B
		WHERE ISNUMERIC(Evngdiff_B) = 1

	UPDATE AppStaging.dbo.WebTC_detail SET
		MtgRate = 0 WHERE MtgRate = '0,0'

	UPDATE AppStaging.dbo.WebTC_detail SET
		MtgRate_N = MtgRate
		WHERE ISNUMERIC(MtgRate) = 1

	UPDATE AppStaging.dbo.WebTC_detail SET
		BonusPay = 0 WHERE BonusPay = '0,0'

	UPDATE AppStaging.dbo.WebTC_detail SET
		BonusPay_N = BonusPay
		WHERE ISNUMERIC(BonusPay) = 1
	
	UPDATE AppStaging.dbo.WebTC_detail SET
		units1 = 0 WHERE units1 = '0,0'

	UPDATE AppStaging.dbo.WebTC_detail SET
		units1_n = units1
		WHERE ISNUMERIC(units1) = 1

	UPDATE AppStaging.dbo.WebTC_detail SET
		units2 = 0 WHERE units2 = '0,0'

	UPDATE AppStaging.dbo.WebTC_detail SET
		units2_n = units2
		WHERE ISNUMERIC(units2) = 1

	UPDATE AppStaging.dbo.WebTC_detail SET
		unitrate1 = 0 WHERE unitrate1 = '0,0'

	UPDATE AppStaging.dbo.WebTC_detail SET
		units1rate_N = unitrate1
		WHERE ISNUMERIC(unitrate1) = 1

	UPDATE AppStaging.dbo.WebTC_detail SET
		unitrate2 = 0 WHERE unitrate2 = '0,0'

	UPDATE AppStaging.dbo.WebTC_detail SET
		units2rate_N = unitrate2
		WHERE ISNUMERIC(unitrate2) = 1


	UPDATE AppStaging.dbo.WebTC_detail SET
		Projstipend = 0 WHERE Projstipend = '0,0'

	UPDATE AppStaging.dbo.WebTC_detail SET
		Projstipend_N = Projstipend
		WHERE ISNUMERIC(Projstipend) = 1

	UPDATE AppStaging.dbo.WebTC_detail SET
		Wknddiff_A = 0 WHERE Wknddiff_A = '0,0'

	UPDATE AppStaging.dbo.WebTC_detail SET
		Wknddiff_N = Wknddiff_A
		WHERE ISNUMERIC(Wknddiff_A) = 1

	UPDATE AppStaging.dbo.WebTC_detail SET
		Wknddiff_B = 0 WHERE Wknddiff_B = '0,0'

	UPDATE AppStaging.dbo.WebTC_detail SET
		Wknddiff_BN = Wknddiff_B
		WHERE ISNUMERIC(Wknddiff_B) = 1

	UPDATE AppStaging.dbo.WebCAL_Schedule_Slots SET
		WeekendFlag = CASE 	WHEN DATENAME (dw,[date]) IN ('Sunday', 'Saturday')
						THEN 'Y'
					ELSE 'N' END

	CREATE TABLE #PayrollReporting_HoursAndEarnings (
		StaffGroup 		VARCHAR (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		WebCode			VARCHAR(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		EDorFastTrack 		VARCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		YrMoPeriod		CHAR (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		ClinicalHours 		MONEY NULL ,
		ClinicalEarnings 	MONEY NULL ,
		MeetingsHours 		MONEY NULL ,
		MeetingsEarnings 	MONEY NULL ,
		BonusPay 		MONEY NULL ,
		OtherEarnings 		MONEY NULL ,
		ProjectStipend 		MONEY NULL)

	CREATE TABLE #PayrollReporting_HoursAndEarningsByProvider (
		StaffGroup 		VARCHAR (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		WebCode			VARCHAR(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		ProviderMasterID	INT NULL ,
		EDorFastTrack 		VARCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		YrMoPeriod		CHAR (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		ClinicalHours 		MONEY NULL ,
		ClinicalEarnings 	MONEY NULL ,
		MeetingsHours 		MONEY NULL ,
		MeetingsEarnings 	MONEY NULL ,
		BonusPay 		MONEY NULL ,
		OtherEarnings 		MONEY NULL ,
		ProjectStipend 		MONEY NULL)

	/* By Site */

	INSERT INTO #PayrollReporting_HoursAndEarnings
		(StaffGroup,
		 WebCode,
		 EDorFastTrack,
		 YrMoPeriod,
		 ClinicalHours,
		 ClinicalEarnings)
	SELECT 	'CEP',
		 HR.Code,
		 CASE 	WHEN ISFTK != ' '
			THEN 'Fast Track'
			ELSE 'ED'	END AS FastTrackOrED,
		 DLU.YrMoPeriod, 
		 SUM(WCSL.HourNum) AS ClinicalHours,
		 SUM(CASE WHEN ISFTK = ' '
				THEN	CASE 
					WHEN WCSL.Flag = 'N' AND WCSL.flagWknd IN ('6','7')
						THEN (WTD.BaseRate_N + WTD.NiteDiff_N + WTD.Wknddiff_N) 
							* WCSL.HourNum
					WHEN WCSL.Flag = 'N' 
						THEN (WTD.BaseRate_N + WTD.NiteDiff_N) 
							* WCSL.HourNum
					WHEN WCSL.Flag = 'E' AND WCSL.flagWknd IN ('6','7')
						THEN (WTD.BaseRate_N + WTD.EvngDiff_N + WTD.Wknddiff_N)
							* WCSL.HourNum
					WHEN WCSL.Flag = 'E' 
						THEN (WTD.BaseRate_N + WTD.EvngDiff_N) 
							* WCSL.HourNum
					WHEN WCSL.flagWknd IN ('6','7')
						THEN (WTD.BaseRate_N + WTD.Wknddiff_N)
							* WCSL.HourNum
					ELSE	WTD.BaseRate_N	* WCSL.HourNum END
			  ELSE		CASE 	WHEN WCSL.Flag = 'N' AND WCSL.flagWknd IN ('6','7') 
							THEN (WTD.BaseRate_BN + WTD.NiteDiff_BN  + WTD.Wknddiff_BN) 
								* WCSL.HourNum
						WHEN WCSL.Flag = 'N' 
							THEN (WTD.BaseRate_BN + WTD.NiteDiff_BN) 
								* WCSL.HourNum
						WHEN WCSL.Flag = 'E' AND WCSL.flagWknd IN ('6','7') 
							THEN (WTD.BaseRate_BN + WTD.EvngDiff_BN + WTD.Wknddiff_BN) * WCSL.HourNum
						WHEN WCSL.Flag = 'E' 
							THEN (WTD.BaseRate_BN + WTD.EvngDiff_BN) * WCSL.HourNum
/*						WHEN WCSL.flagWknd IN ('6','7')
							THEN (WTD.BaseRate_N + WTD.Wknddiff_N)
								* WCSL.HourNum - No Weekend for Fast Track? */
						ELSE	WTD.BaseRate_BN	* WCSL.HourNum END
			  END	
		   ) AS ClinicalEarnings
		FROM AppStaging.dbo.WebTC_detail WTD
		INNER JOIN Hospital_region HR
			 ON WTD.Site = HR.Code
		INNER JOIN AppStaging.dbo.WebCAL_schedule_slots WCSL
			 ON WCSL.UID_N = WTD.UID
			AND WCSL.Site  = WTD.Site
		INNER JOIN Date_LU	DLU
			 ON WCSL.[Date] = DLU.DateMMDDYYYY
		INNER JOIN Date_LU	DLU2
			 ON WTD.Dat = DLU2.DateMMDDYYYY
			AND DLU.YrMoPeriod = DLU2.YrMoPeriod
		INNER JOIN ProviderMaster Prov
			 ON WTD.UID = Prov.WebID
		WHERE Prov.CEPPartnerFlag = 'Y'
		  AND DLU.YrMoPeriod >= @PriorYearMonthPeriod
		GROUP BY HR.Code, 
			 DLU.YrMoPeriod,
			 CASE 	WHEN ISFTK != ' '
					THEN 'Fast Track'
				ELSE 'ED'	END 

	INSERT INTO #PayrollReporting_HoursAndEarnings
		(StaffGroup,
		 WebCode,
		 EDorFastTrack,
		 YrMoPeriod,
		 MeetingsHours,
	 	 MeetingsEarnings,
		 BonusPay,
		 OtherEarnings,
		 ProjectStipend)
	SELECT 	 'CEP',
		 HR.Code,
		 'ED',
		 DLU.YrMoPeriod, 
		 SUM(MtgHr) 			AS MeetingHours,
		 SUM(MtgHR * MtgRate_N) 	AS MeetingEarings,
		 SUM(BonusPay_N) 		AS BonusPay,
		 SUM((Units1_N*units1rate_N)+ (Units2_N*units2rate_N)) 
						AS OtherEarnings,
		 SUM(ProjStipend_N) 		AS ProjectStipend
		FROM AppStaging.dbo.WebTC_detail WTD
		INNER JOIN Hospital_region HR
			 ON WTD.Site = HR.Code
		INNER JOIN ProviderMaster Prov
			 ON WTD.UID = Prov.WebID
		INNER JOIN Date_LU	DLU
			 ON WTD.Dat = DLU.DateMMDDYYYY
		WHERE DLU.YrMoPeriod >= @PriorYearMonthPeriod
		GROUP BY  HR.Code,
		 	  DLU.YrMoPeriod

	INSERT INTO PayrollReporting_HoursAndEarnings
		(StaffGroup,
		 WebCode,
		 EDorFastTrack,
		 YrMoPeriod,
		 ClinicalHours,
		 ClinicalEarnings,
		 MeetingsHours,
		 MeetingsEarnings,
		 BonusPay,
		 OtherEarnings,
		 ProjectStipend)
	SELECT 	 PRHE.StaffGroup,
		 PRHE.WebCode,
		 PRHE.EDorFastTrack,
		 PRHE.YrMoPeriod,
		 SUM(CASE 	WHEN PRHE.ClinicalHours 	IS NULL 
					THEN 0
				ELSE PRHE.ClinicalHours END),
		 SUM(CASE 	WHEN PRHE.ClinicalEarnings 	IS NULL 
					THEN 0
				ELSE PRHE.ClinicalEarnings END),
		 SUM(CASE 	WHEN PRHE.MeetingsHours 	IS NULL 
					THEN 0
				ELSE PRHE.MeetingsHours END),
		 SUM(CASE 	WHEN PRHE.MeetingsEarnings	IS NULL
					THEN 0
				ELSE PRHE.MeetingsEarnings  END),
		 SUM(CASE 	WHEN PRHE.BonusPay		IS NULL
					THEN 0
				ELSE PRHE.BonusPay  END),
		 SUM(CASE 	WHEN PRHE.OtherEarnings		IS NULL
					THEN 0
				ELSE PRHE.OtherEarnings END),
		 SUM(CASE 	WHEN PRHE.ProjectStipend	IS NULL
					THEN 0
				ELSE PRHE.ProjectStipend END)
		FROM #PayrollReporting_HoursAndEarnings PRHE
		GROUP BY PRHE.StaffGroup,
		 	 PRHE.WebCode,
		 	 PRHE.EDorFastTrack,
		 	 PRHE.YrMoPeriod

	UPDATE PayrollReporting_HoursAndEarnings SET
		CurrentPeriodFlag = 'Y'
		WHERE YrMoPeriod = @CurrentYearMonthPeriod

	/* By Provider Hours and Earnings */

	INSERT INTO #PayrollReporting_HoursAndEarningsByProvider
		(StaffGroup,
		 WebCode,
		 ProviderMasterID,
		 EDorFastTrack,
		 YrMoPeriod,
		 ClinicalHours,
		 ClinicalEarnings)
	SELECT 	 @CEPStaffGroup,
		 HR.Code,
		 Prov.ProviderMasterID,
		 CASE 	WHEN ISFTK != ' '
			THEN 'Fast Track'
			ELSE 'ED'	END AS FastTrackOrED,
		 DLU.YrMoPeriod, 
		 SUM(WCSL.HourNum) AS ClinicalHours,
		 SUM(CASE WHEN ISFTK = ' '
				THEN	CASE 
					WHEN WCSL.Flag = 'N' AND WCSL.flagWknd IN ('6','7')
						THEN (WTD.BaseRate_N + WTD.NiteDiff_N + WTD.Wknddiff_N) 
							* WCSL.HourNum
					WHEN WCSL.Flag = 'N' 
						THEN (WTD.BaseRate_N + WTD.NiteDiff_N) 
							* WCSL.HourNum
					WHEN WCSL.Flag = 'E' AND WCSL.flagWknd IN ('6','7')
						THEN (WTD.BaseRate_N + WTD.EvngDiff_N + WTD.Wknddiff_N)
							* WCSL.HourNum
					WHEN WCSL.Flag = 'E' 
						THEN (WTD.BaseRate_N + WTD.EvngDiff_N) 
							* WCSL.HourNum
					WHEN WCSL.flagWknd IN ('6','7')
						THEN (WTD.BaseRate_N + WTD.Wknddiff_N)
							* WCSL.HourNum
					ELSE	WTD.BaseRate_N	* WCSL.HourNum END
			  ELSE		CASE 	WHEN WCSL.Flag = 'N' AND WCSL.flagWknd IN ('6','7') 
							THEN (WTD.BaseRate_BN + WTD.NiteDiff_BN  + WTD.Wknddiff_BN) 
								* WCSL.HourNum
						WHEN WCSL.Flag = 'N' 
							THEN (WTD.BaseRate_BN + WTD.NiteDiff_BN) 
								* WCSL.HourNum
						WHEN WCSL.Flag = 'E' AND WCSL.flagWknd IN ('6','7') 
							THEN (WTD.BaseRate_BN + WTD.EvngDiff_BN + WTD.Wknddiff_BN) * WCSL.HourNum
						WHEN WCSL.Flag = 'E' 
							THEN (WTD.BaseRate_BN + WTD.EvngDiff_BN) * WCSL.HourNum
/*						WHEN WCSL.flagWknd IN ('6','7')
							THEN (WTD.BaseRate_N + WTD.Wknddiff_N)
								* WCSL.HourNum - No Weekend for Fast Track? */
						ELSE	WTD.BaseRate_BN	* WCSL.HourNum END
			  END	
		   ) AS ClinicalEarnings
		FROM AppStaging.dbo.WebTC_detail WTD
		INNER JOIN Hospital_region HR
			 ON WTD.Site = HR.Code
		INNER JOIN AppStaging.dbo.WebCAL_schedule_slots WCSL
			 ON WCSL.UID_N = WTD.UID
			AND WCSL.Site  = WTD.Site
		INNER JOIN Date_LU	DLU
			 ON WCSL.[Date] = DLU.DateMMDDYYYY
		INNER JOIN Date_LU	DLU2
			 ON WTD.Dat = DLU2.DateMMDDYYYY
			AND DLU.YrMoPeriod = DLU2.YrMoPeriod
		INNER JOIN ProviderMaster Prov
			 ON WTD.UID = Prov.WebID
		WHERE Prov.CEPPartnerFlag = 'Y'
		  AND DLU.YrMoPeriod >= @PriorYearMonthPeriod
		GROUP BY HR.Code, 
		 	 Prov.ProviderMasterID,
			 DLU.YrMoPeriod,
			 CASE 	WHEN ISFTK != ' '
					THEN 'Fast Track'
				ELSE 'ED'	END 

	INSERT INTO #PayrollReporting_HoursAndEarningsByProvider
		(StaffGroup,
		 WebCode,
		 ProviderMasterID,
		 EDorFastTrack,
		 YrMoPeriod,
		 MeetingsHours,
	 	 MeetingsEarnings,
		 BonusPay,
		 OtherEarnings,
		 ProjectStipend)
	SELECT 	 @CEPStaffGroup,
		 HR.Code,
		 Prov.ProviderMasterID,
		 'ED',
		 DLU.YrMoPeriod, 
		 SUM(MtgHr) 			AS MeetingHours,
		 SUM(MtgHR * MtgRate_N) 	AS MeetingEarings,
		 SUM(BonusPay_N) 		AS BonusPay,
		 SUM((Units1_N*units1rate_N)+ (Units2_N*units2rate_N)) 
						AS OtherEarnings,
		 SUM(ProjStipend_N) 		AS ProjectStipend
		FROM AppStaging.dbo.WebTC_detail WTD
		INNER JOIN Hospital_region HR
			 ON WTD.Site = HR.Code
		INNER JOIN ProviderMaster Prov
			 ON WTD.UID = Prov.WebID
		INNER JOIN Date_LU	DLU
			 ON WTD.Dat = DLU.DateMMDDYYYY
		WHERE DLU.YrMoPeriod >= @PriorYearMonthPeriod
		GROUP BY  HR.Code,
			  Prov.ProviderMasterID,
		 	  DLU.YrMoPeriod

	INSERT INTO PayrollReporting_HoursAndEarningsByProvider
		(StaffGroup,
		 WebCode,
		 ProviderMasterID,
		 EDorFastTrack,
		 YrMoPeriod,
		 ClinicalHours,
		 ClinicalEarnings,
		 MeetingsHours,
		 MeetingsEarnings,
		 BonusPay,
		 OtherEarnings,
		 ProjectStipend)
	SELECT 	 PRHE.StaffGroup,
		 PRHE.WebCode,
		 PRHE.ProviderMasterID,
		 PRHE.EDorFastTrack,		
		 PRHE.YrMoPeriod,
		 SUM(CASE 	WHEN PRHE.ClinicalHours 	IS NULL 
					THEN 0
				ELSE PRHE.ClinicalHours END),
		 SUM(CASE 	WHEN PRHE.ClinicalEarnings 	IS NULL 
					THEN 0
				ELSE PRHE.ClinicalEarnings END),
		 SUM(CASE 	WHEN PRHE.MeetingsHours 	IS NULL 
					THEN 0
				ELSE PRHE.MeetingsHours END),
		 SUM(CASE 	WHEN PRHE.MeetingsEarnings	IS NULL
					THEN 0
				ELSE PRHE.MeetingsEarnings  END),
		 SUM(CASE 	WHEN PRHE.BonusPay		IS NULL
					THEN 0
				ELSE PRHE.BonusPay  END),
		 SUM(CASE 	WHEN PRHE.OtherEarnings		IS NULL
					THEN 0
				ELSE PRHE.OtherEarnings END),
		 SUM(CASE 	WHEN PRHE.ProjectStipend	IS NULL
					THEN 0
				ELSE PRHE.ProjectStipend END)
		FROM #PayrollReporting_HoursAndEarningsByProvider PRHE
		GROUP BY PRHE.StaffGroup,
		 	 PRHE.WebCode,
			 PRHE.ProviderMasterID,
		 	 PRHE.EDorFastTrack,
		 	 PRHE.YrMoPeriod

	UPDATE PayrollReporting_HoursAndEarningsByProvider SET
		CurrentPeriodFlag = 'Y'
		WHERE YrMoPeriod = @CurrentYearMonthPeriod

END

