﻿












-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LoadSEMAMDDepartmentSummary]
	-- Add the parameters for the stored procedure here
	-- Modified by Mohamed Mahmoud 11/9/2009 to update the units (after the splits from the hours)
	@PeriodStartDate	datetime	= NULL,
	@PeriodEndDate		datetime	= NULL
AS
BEGIN

		
	DECLARE		@err			int
	DECLARE		@PEndDefault	Binary 
	DECLARE		@DiffTable		TABLE(PayPeriod varchar(10), PayDate datetime, Diff int)
	DECLARE		@MinDiff		int
	DECLARE		@CreateDate		datetime
	DECLARE		@CalendarYear	varchar(4)
	DECLARE		@PayRollCheckDate	datetime
	DECLARE		@PayRollPayPeriod varchar(10)
	DECLARE		@ListofMDs	TABLE
	(
		CsuFlxIDeb int
	)
	DECLARE		@ListOfOldMids	TABLE
	(
		CsuFlxIDeb int
	)


	SET @PEndDefault = 0
	IF (@PeriodStartDate IS NULL)
		BEGIN
			SET @PeriodStartDate = (SELECT MAX(RangeEndDate) FROM SEMAMDSummaryTransaction)
		END

	IF (@PeriodEndDate IS NULL)
		BEGIN
			SET @PeriodEndDate = getdate()
			SET @PEndDefault = 1
		END


	SET @CreateDate = getdate()
	SET @CalendarYear = Year(@CreateDate)

	INSERT INTO @DiffTable 
		SELECT PayPeriod, PayDate, ABS(DATEDIFF(DAY, PayDate, @PeriodEndDate)) AS Diff 
		FROM MDPayRollSched
	SELECT @MinDiff = MIN(Diff) FROM @DiffTable
	
	---Update PayRollCheckDate, and PayRollPayPeriod

	SET @PayRollCheckDate = (SELECT PayDate
							FROM @DiffTable
							WHERE Diff = @MinDiff)
	SET @PayRollPayPeriod = (SELECT PayPeriod
							FROM @DiffTable
							WHERE Diff = @MinDiff)

	IF @PEndDefault = 1
		BEGIN
			SET @PeriodEndDate = @PayRollCheckDate
		END
	--This was added to accomodate for the year end turn over on 12/31 it will set the PeriodEndDate as 1/1 of the following year. 
	--This way all checks are picked upon 12/31, not just system checks, since 12/31 is not an official payroll date there are no 
	--system checks. It won't pick up any 1/1 checks b/c the staging table will not contain any.
 
	IF Month(@PeriodEndDate) = '12' AND Day(@PeriodEndDate) = '31' 
		BEGIN
			SET @PeriodEndDate = @PeriodEndDate + 1	
		END
	--This was added so that on the first payroll of the year the @PeriodStartDate will have 12/31 date of the previous year. This
	--way no checks are missed on 1/1. No 12/31 cchecks will be picked b/c the YTDEarningsStatementStagingPA table won't have any 
	--check from the previous year.
	IF Month(@PeriodStartDate) = '1' AND Day(@PeriodStartDate) = '1' 
		BEGIN
			SET @PeriodStartDate = @PeriodStartDate - 1	
		END
		
	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 1') 
			
		END

	INSERT INTO @ListofMDs (CsuFlxIDeb)
		SELECT EMPLOYEE FROM PROD..EMPLOYEE WHERE PAY_FREQUENCY = 4

		SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 2'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 2') 
			
		END
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	TRUNCATE TABLE PASummaryTransactionStaging


	/******************************************************************************************************
	First insert all of the checks that fall within the dates @PeriodStartDate and @PeriodEndDate

	Then include all of the manual/adjustment/reversal from the checkdate @PeriodStartDate

	Then include all of the NON-manual/adjustment/reversal from the checkDate @PeriodEndDate
	*******************************************************************************************************/
	

	---CheckDates inbtw	
	INSERT INTO dbo.PASummaryTransactionStaging ( CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
											CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
											MiddleName, FullName, PayCode, PayCodeDescr, TotalCurrentHours, 
											CurrentUnits, YTDUnits, TotalCurrentEarnings, TotalYTDHours, TotalYTDEarnings,
											HourlyRate, RangeStartDate, RangeEndDate, 
											CalendarYear, CreateDate, PayRollCheckDate, 
											PayRollPayPeriod, CsdFlxID)
		SELECT CheckDate, CheckNo, PayPeriod, Dept, Site, 
			   CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
			   MiddleName, FullName, PayCode, PayCodeDescr, TotalHoursbyPayCode, 
			   CurrUnits, YTDUnitsBySite, CurrEarnings, YTDHoursBySite, YTDEarningsBySite, 
			   HourlyRate, RangeStartDate = NULL, RangeEndDate = NULL, 
			   CalendarYear = @CalendarYear, CreateDate = @CreateDate, PayRollCheckDate = NULL, 
			   PayRollPayPeriod = NULL, CsdFlxID
		FROM YTDEarningsStatementStagingPA 
		WHERE CheckDate > @PeriodStartDate AND CheckDate < @PeriodEndDate AND CategoryFlag = 'K' 
			  AND CsuFlxIDeb IN (SELECT CsuFlxIDeb FROM @ListofMDs) 
	
	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 3'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 3') 
			
		END
	---M/A/R on @PeriodStartDate
	INSERT INTO dbo.PASummaryTransactionStaging ( CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
											CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
											MiddleName, FullName, PayCode, PayCodeDescr, TotalCurrentHours, 
											CurrentUnits, YTDUnits, TotalCurrentEarnings, TotalYTDHours, TotalYTDEarnings,
											HourlyRate, RangeStartDate, RangeEndDate, 
											CalendarYear, CreateDate, PayRollCheckDate, 
											PayRollPayPeriod, CsdFlxID)
		SELECT CheckDate, CheckNo, PayPeriod, Dept, Site, 
			   CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
			   MiddleName, FullName, PayCode, PayCodeDescr, TotalHoursbyPayCode, 
			   CurrUnits, YTDUnitsBySite, CurrEarnings, YTDHoursBySite, YTDEarningsBySite, 
			   HourlyRate, RangeStartDate = NULL, RangeEndDate = NULL, 
			   CalendarYear = @CalendarYear, CreateDate = @CreateDate, PayRollCheckDate = NULL, 
			   PayRollPayPeriod = NULL, CsdFlxID
		FROM YTDEarningsStatementStagingPA 
		WHERE CheckDate = @PeriodStartDate AND CategoryFlag = 'K' AND 
			  CsuFlxIDeb IN (SELECT CsuFlxIDeb FROM @ListofMDs) AND
			 ( CheckNo LIKE '%.9' OR --Include Reversal checks 
			  CheckNo LIKE '%.5' OR --Include Adjustment checks
			  CheckNo IN (SELECT DISTINCT CHECK_NBR 
							FROM dbo.PAYMASTR
							WHERE CHECK_TYPE = 'M' AND
								  CHECK_DATE = @PeriodStartDate)) --Include Manual checks
	
	SELECT @err = @@error
	IF @err <>  0
		BEGIN
--			PRINT 'Error @ position 4'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 4') 
			
		END
	---Non-M/A/R on @PeriodEndDate 
	INSERT INTO dbo.PASummaryTransactionStaging ( CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
											CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
											MiddleName, FullName, PayCode, PayCodeDescr, TotalCurrentHours, 
											CurrentUnits, YTDUnits, TotalCurrentEarnings, TotalYTDHours, TotalYTDEarnings,
											HourlyRate, RangeStartDate, RangeEndDate, 
											CalendarYear, CreateDate, PayRollCheckDate, 
											PayRollPayPeriod, CsdFlxID)
		SELECT CheckDate, CheckNo, PayPeriod, Dept, Site, 
			   CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
			   MiddleName, FullName, PayCode, PayCodeDescr, TotalHoursbyPayCode, 
			   CurrUnits, YTDUnitsBySite, CurrEarnings, YTDHoursBySite, YTDEarningsBySite, 
			   HourlyRate, RangeStartDate = NULL, RangeEndDate = NULL, 
			   CalendarYear = @CalendarYear, CreateDate = @CreateDate, PayRollCheckDate = NULL, 
			   PayRollPayPeriod = NULL, CsdFlxID
		FROM YTDEarningsStatementStagingPA 
		WHERE CheckDate = @PeriodEndDate AND CategoryFlag = 'K' AND 
			  CsuFlxIDeb IN (SELECT CsuFlxIDeb FROM @ListofMDs)  AND
			 (CheckNo NOT LIKE '%.9' AND --EXclude Reversal checks 
			  CheckNo NOT LIKE '%.5' AND --EXclude Adjustment checks
			  CheckNo NOT IN (SELECT DISTINCT CHECK_NBR 
							  FROM dbo.PAYMASTR
							  WHERE CHECK_TYPE = 'M' AND
								    CHECK_DATE = @PeriodEndDate)) --EXclude Manual checks 


	SELECT @err = @@error
	IF @err <>  0
		BEGIN
--			PRINT 'Error @ position 5'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 5') 
			
		END
-----------------------------------------------------------------------------------------------------------
INSERT INTO @ListOfOldMids (CsuFlxIDeb)
	SELECT DISTINCT A.CsuFlxIDeb 
	FROM 
		(SELECT DISTINCT CsuFlxIDeb, Dept
		 FROM YTDEarningsStatementStagingPA
		 WHERE CheckDate < @PeriodEndDate AND CategoryFlag = 'K'
		 UNION
		 SELECT DISTINCT CsuFlxIDeb, Dept
		 FROM PASummaryTransactionStaging
		 Where CheckDate = @PeriodEndDate) A
		LEFT JOIN
		(SELECT DISTINCT CsuFlxIDeb, Dept
		 FROM PASummaryTransactionStaging) B
		ON A.CsuFlxIDeb = B.CsuFlxIDeb AND A.Dept = B.Dept
	WHERE B.CsuFlxIDeb IS  NULL AND A.CsuFlxIDeb IN (SELECT CsuFlxIDeb FROM @ListofMDs)

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
--			PRINT 'Error @ position 6'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 6') 
			
		END

INSERT INTO dbo.PASummaryTransactionStaging ( CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
											CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
											MiddleName, FullName, PayCode, PayCodeDescr, TotalCurrentHours, 
											CurrentUnits, YTDUnits, TotalCurrentEarnings, TotalYTDHours, TotalYTDEarnings,
											HourlyRate, RangeStartDate, RangeEndDate, 
											CalendarYear, CreateDate, PayRollCheckDate, 
											PayRollPayPeriod, CsdFlxID)
	SELECT CheckDate, CheckNo, PayPeriod, Dept, Site, CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
												MiddleName, FullName, PayCode, PayCodeDescr, TotalCurrentHours = NULL, 
												CurrUnits, YTDUnitsBySite, 
												TotalCurrentEarnings = NULL, YTDHoursBySite, YTDEarningsBySite,
												HourlyRate = NULL, RangeStartDate = NULL, RangeEndDate = NULL, 
												CalendarYear = @CalendarYear, CreateDate = @CreateDate, 
												PayRollCheckDate = NULL, 
												PayRollPayPeriod = NULL, CsdFlxID
	FROM YTDEarningsStatementStagingPA
	WHERE CheckNo in(
			SELECT  FCheckNo
			FROM 
				--This joins together all of the  values below
				(SELECT AllMidK2.CsuFlxIDeb FCsuFlxIDeb, AllMidK2.CheckDate FCheckDate, AllMidK2.CheckNo FCheckNo, 
					   AllMidK2.CsdFlxID FCsdFlxID, MaxCD.MaxCD_CheckDate FMaxCheckDate, MaxCsd.MaxCsd_CsdFlxID FMaxCsdFlxID
				FROM
					--This finds the max check ID for each provider, for each check date. 
					(SELECT AllMidK1.CsuFlxIDeb MaxCsd_CsuFlxIDeb, AllMidK1.CheckDate MaxCsd_CheckDate, 
						   MAX(AllMidK1.CsdFlxID) MaxCsd_CsdFlxID
					FROM 
						(SELECT CsuFlxIDeb, CheckDate, CheckNo, CsdFlxID
						 FROM YTDEarningsStatementStagingPA
						 WHERE CsuFlxIDeb in (SELECT CsuFlxIDeb FROM @ListOfOldMids) and CategoryFlag = 'K'
						 GROUP BY CsuFlxIDeb, CheckDate, CheckNo, CsdFlxID) AllMidK1
					GROUP BY AllMidK1.CsuFlxIDeb, AllMidK1.CheckDate) MaxCsd
					JOIN
					--This pulls all of the ID, check dates, check numbers and Check IDs that each of the Old Mids had through 
					--out the year
					(SELECT CsuFlxIDeb, CheckDate, CheckNo, CsdFlxID
					 FROM YTDEarningsStatementStagingPA
					 WHERE CsuFlxIDeb in (SELECT CsuFlxIDeb FROM @ListOfOldMids) and CategoryFlag = 'K'
					 GROUP BY CsuFlxIDeb, CheckDate, CheckNo, CsdFlxID) AllMidK2
					ON MaxCsd.MaxCsd_CsuFlxIDeb = AllMidK2.CsuFlxIDeb AND MaxCsd.MaxCsd_CheckDate = AllMidK2.CheckDate
					JOIN
					--This finds the max check date (before the payperiod we are considering) for each of the missing providers.
					(SELECT CsuFlxIDeb MaxCD_CsuFlxIDeb, Max(CheckDate) as MaxCD_CheckDate
						 FROM YTDEarningsStatementStagingPA
						WHERE CsuFlxIDeb in (SELECT CsuFlxIDeb FROM @ListOfOldMids) and CategoryFlag = 'K' and CheckDate < @PeriodEndDate
						GROUP BY CsuFlxIDeb) MaxCD
					ON AllMidK2.CsuFlxIDeb = MaxCD.MaxCD_CsuFlxIDeb) ChkNo
			WHERE FCheckDate = FMaxCheckDate AND FCsdFlxID = FMaxCsdFlxID)
	AND CategoryFlag = 'K'
	order by CsuFlxIDeb




	SELECT @err = @@error
	IF @err <>  0
		BEGIN
--			PRINT 'Error @ position 7'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 7') 
			
		END
-----------------------------------------------------------------------------------------------------------
	---Update RangeStartDate, RangeEndDate 
	UPDATE PASummaryTransactionStaging
	SET RangeStartDate = @PeriodStartDate,
		RangeEndDate = @PeriodEndDate
			
	---Update PayRollCheckDate, and PayRollPayPeriod
	UPDATE PASummaryTransactionStaging
	SET PayRollCheckDate = @PayRollCheckDate,
	PayRollPayPeriod = @PayRollPayPeriod

	---Put YTD hours and Current Hours from two overtime Paycodes OVT and OVD into units columns
--	UPDATE PASummaryTransactionStaging
--	SET CurrentUnits = TotalCurrentHours, 
--		YTDUnits = TotalYTDHours
--	WHERE PayCode in ('OVT', 'OVD', 'OV7') 

	---Make the hours columns NULL for these same paycode so that they are not added twice
	UPDATE PASummaryTransactionStaging
	SET TotalCurrentHours = NULL, 
		TotalYTDHours = NULL
	WHERE PayCode in ('OVT', 'OVD', 'OV7') 

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
--			PRINT 'Error @ position 8'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 8') 
			
		END
-------------------------------------------------------------------------------------------------
	---Check to see if this pay date is in the transaction table. If it is, then delete it and 
	---reload it.
	IF (@PayRollCheckDate IN (SELECT DISTINCT PayRollCheckDate FROM SEMAMDSummaryTransaction))
		BEGIN
--			PRINT 'You have already loaded this PayRollCheckDate into SEMAMDSummaryTransaction, Error postition 9'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage, PayRollCheckDate, RangeStartDate, RangeEndDate)
			VALUES ('PA', getdate(), 'You have already loaded this PayRollCheckDate into SEMAMDSummaryTransaction, Error postition 9',
					@PayRollCheckDate, @PeriodStartDate, @PeriodEndDate) 
			RETURN
--			DELETE FROM SEMAMDSummaryTransaction
--			WHERE PayRollCheckDate = @PeriodEndDate 
		END

	---Append this PayRollCheckDate into the Transaction table from the staging table.
	INSERT INTO dbo.SEMAMDSummaryTransaction ( CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
											CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
											MiddleName, FullName, PayCode, PayCodeDescr, TotalCurrentHours, 
											TotalCurrentEarnings, TotalYTDHours, TotalYTDEarnings,
											HourlyRate, RangeStartDate, RangeEndDate, 
											CalendarYear, CreateDate, PayRollCheckDate, 
											PayRollPayPeriod, CsdFlxID, CurrentUnits, YTDUnits)
		SELECT CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
			   CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
			   MiddleName, FullName, PayCode, PayCodeDescr, TotalCurrentHours, 
			   TotalCurrentEarnings, TotalYTDHours, TotalYTDEarnings,
			   HourlyRate, RangeStartDate, RangeEndDate, 
			   CalendarYear, CreateDate, PayRollCheckDate, 
			   PayRollPayPeriod, CsdFlxID, CurrentUnits, YTDUnits
		FROM PASummaryTransactionStaging

	-----TIME TO INSERT INTO SUBTOTALS TABLE-----
	
	--See if PayRollCheckDate is in subtotals table, if it is delete it
	IF (@PayRollCheckDate IN (SELECT DISTINCT PayRollCheckDate FROM SEMAMDSummarySubtotals))
		BEGIN
--			PRINT 'You have already loaded this PayRollCheckDate into SEMAMDSummarySubtotals, Error postition 10'
			
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage, PayRollCheckDate, RangeStartDate, RangeEndDate)
			VALUES ('PA', getdate(), 'You have already loaded this PayRollCheckDate into SEMAMDSummarySubtotals, Error postition 10', 
					@PayRollCheckDate, @PeriodStartDate, @PeriodEndDate ) 
			
			RETURN
--			DELETE FROM SEMAMDSummarySubtotals
--			WHERE PayRollCheckDate = @PeriodEndDate 
		END


	---Insert Pay code Per person subtotals 
	------------------------------------------

CREATE TABLE #CheckDateRolledUp
(
	CheckDate			datetime,
	CsuFlxIDeb			int,
	ProviderMasterID	int,
	LastName			varchar(50),
	FirstName			varchar(30),
	MiddleName			varchar(30),
	FullName			varchar(100),
	PayCode				varchar(5),
	PayCodeDescr		varchar(30),
	Dept				varchar(6),
	DeptDescr			varchar(50),
	HourlyRate			decimal(13,4),
	CDTotCHours			decimal(10,2),
	CDTotCEarn			decimal(10,2),
	CDTotYTDHours		decimal(10,2),
	CDTotYTDEarn		decimal(10,2),
	CDCurrentUnits		decimal(10,2),
	CDYTDUnits			decimal(10, 2)
)

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
--			PRINT 'Error @ position 11'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 11') 
			
		END

INSERT INTO #CheckDateRolledUp(	CheckDate,
								CsuFlxIDeb, ProviderMasterID, LastName, FirstName,
								MiddleName, FullName,
								PayCode,PayCodeDescr,
								Dept,DeptDescr,
								HourlyRate,
								CDTotCHours,CDTotCEarn,
								CDTotYTDHours,CDTotYTDEarn, CDCurrentUnits, CDYTDUnits)
	SELECT X.CheckDate AS CheckDate,
			X.CsuFlxIDeb AS CsuFlxIDeb, X.ProviderMasterID AS ProviderMasterID, 
			X.LastName AS LastName, X.FirstName AS FirstName, 
			X.MiddleName AS MiddleName, X.FullName AS FullName,
			X.PayCode AS PayCode, X.PayCodeDescr AS PayCodeDescr, 
			X.Dept AS Dept, X.DeptDescr AS DeptDescr,
			X.MHR AS MHR,
			X.CDTotCHours AS CDTotCHours, X.CDTotCEarn AS CDTotCEarn,
			PASTS.TotalYTDHours AS CDTotYTDHours, PASTS.TotalYTDEarnings AS  CDTotYTDEarn,
			X.CDCurrentUnits AS CDCurrentUnits, PASTS.YTDUnits AS CDYTDUnits
			
	FROM
		(--Start X
		--If there is more than one check on a particular check date for a particular person, then this finds
		--the bigger CsdFDlxID and adds up the current hours and earnings
		SELECT CheckDate, 
				CsuFlxIDeb, ProviderMasterID, LastName, FirstName, MiddleName, FullName,
				PayCode, PayCodeDescr, 
				Dept, DeptDescr,
				MAX(HourlyRate) AS MHR,
				SUM(TotalCurrentHours) AS CDTotCHours,
				SUM(TotalCurrentEarnings) AS CDTotCEarn, 
				MAX(CsdFlxID) AS CDMaxCID,
				SUM(CurrentUnits) AS CDCurrentUnits
		FROM (  --Start W
				--This accounts for when you have the same paycode on the same check w/ two different
				--hourly rates. Since the YTD values are going to be the same I can just take the max.
				SELECT CheckDate, CheckNo,
					CsuFlxIDeb, ProviderMasterID, LastName, FirstName, MiddleName, FullName,
					PayCode, PayCodeDescr, 
					Dept, DeptDescr,
					MAX(HourlyRate) AS HourlyRate,
					SUM(TotalCurrentHours) AS TotalCurrentHours,
					SUM(TotalCurrentEarnings) AS TotalCurrentEarnings, 
					MAX(TotalYTDHours) AS TotalYTDHours,
					MAX(TotalYTDEarnings) AS TotalYTDEarnings,
					CsdFlxID,
					SUM(CurrentUnits) AS CurrentUnits,
					MAX(YTDUnits) AS YTDUnits
				  FROM PASummaryTransactionStaging
				  GROUP BY CheckDate, CheckNo,
							CsuFlxIDeb, ProviderMasterID, LastName, FirstName, MiddleName, FullName,
							PayCode, PayCodeDescr, 
							Dept, DeptDescr, CsdFlxID) W
		GROUP BY CheckDate,
					CsuFlxIDeb, ProviderMasterID, LastName, FirstName, MiddleName, FullName,
					PayCode, PayCodeDescr, 
					Dept, DeptDescr) X
		JOIN 
		(--Start PASTS
		 --This is the same as W. We are using the join to match the max(CsdFlxID) in X with the CsdFlxID
		 -- in PASTS. This way you will get the row with the biggest CsdFlxID for each CheckDate, for
		 -- for each person 

			  SELECT CheckDate, CheckNo,
				CsuFlxIDeb, ProviderMasterID, LastName, FirstName, MiddleName, FullName,
				PayCode, PayCodeDescr, 
				Dept, DeptDescr,
				MAX(HourlyRate) AS HourlyRate,
				SUM(TotalCurrentHours) AS TotalCurrentHours,
				SUM(TotalCurrentEarnings) AS TotalCurrentEarnings, 
				MAX(TotalYTDHours) AS TotalYTDHours,
				MAX(TotalYTDEarnings) AS TotalYTDEarnings,
				CsdFlxID,	
				SUM(CurrentUnits) As CurrentUnits,
				MAX(YTDUnits) As YTDUnits		

			  FROM PASummaryTransactionStaging
			  GROUP BY CheckDate, CheckNo,
						CsuFlxIDeb, ProviderMasterID, LastName, FirstName, MiddleName, FullName,
						PayCode, PayCodeDescr, 
						Dept, DeptDescr, CsdFlxID) PASTS
		ON X.CheckDate = PASTS.CheckDate AND
			X.CsuFlxIDeb = PASTS.CsuFlxIDeb AND
			X.PayCode = PASTS.PayCode AND
			X.Dept = PASTS.Dept AND
			X.CDMaxCID = PASTS.CsdFlxID
	order by X.CheckDate, X.CsuFlxIDeb, X.Dept,X.PayCode


	SELECT @err = @@error
	IF @err <>  0
		BEGIN
--			PRINT 'Error @ position 12'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 12') 
			
		END
--select  CheckDate, CsuFlxIDeb, PayCode, Dept, HourlyRate, CDTotCHours, CDTotCEarn, 
--			CDTotYTDHours,CDTotYTDEarn
-- from #CheckDateRolledUp
--where CsuFlxIDeb = 1799 and PayCode = 'E1' and Dept = 2228

---Now its time to group together the checkdates
INSERT INTO dbo.SEMAMDSummarySubtotals (PayRollCheckDate,
										PayRollPayPeriod,
										IsPayCodePerPersonSubTotal,
										IsEmployeeSubTotal,
										IsSiteSubTotal,
										RangeStartDate,
										RangeEndDate,
										CalendarYear,
										CreateDate,
										CsuFlxIDeb, 
										ProviderMasterID, LastName, FirstName, 
										MiddleName, FullName,
										PayCode, PayCodeDescr, 
										Dept, DeptDescr,
										HourlyRate,
										TotalCurrentHours,
										TotalCurrentEarnings,
										TotalYTDHours,
										TotalYTDEarnings, 
										CurrentUnits,
										YTDUnits)
	SELECT PayRollCheckDate = @PayRollCheckDate,
			PayRollPayPeriod = @PayRollPayPeriod,
			IsPayCodePerPersonSubTotal = 'Yes',
			IsEmployeeSubTotal = NULL,
			IsSiteSubTotal = NULL,
			RangeStartDate = @PeriodStartDate,
			RangeEndDate = @PeriodEndDate,
			CalendarYear = @CalendarYear,
			CreateDate = @CreateDate,
		   Y.CsuFlxIDeb, Y.ProviderMasterID, Y.LastName, Y.FirstName, Y.MiddleName, Y.FullName,
		   Y.PayCode, Y.PayCodeDescr, Y.Dept, Y.DeptDescr, Y.MMHR,
		   Y.PPTotCHours,Y.PPTotCEarn, 
		   B.CDTotYTDHours AS PPTotYTDHours, B.CDTotYTDEarn AS PPTotYTDHours,
		   Y.PPCurrentUnits, B.CDYTDUnits AS PPYTDUnits
	FROM
		(SELECT CsuFlxIDeb, ProviderMasterID, LastName, FirstName, MiddleName, FullName,
				PayCode, PayCodeDescr, Dept, DeptDescr, MAX(HourlyRate) AS MMHR,
				SUM(CDTotCHours) AS PPTotCHours, SUM(CDTotCEarn) AS PPTotCEarn,
				MAX(CheckDate) AS MaxCD, SUM(CDCurrentUnits) AS PPCurrentUnits
		FROM #CheckDateRolledUp
		--where CsuFlxIDeb = 1799 and PayCode = 'E1' and Dept = 2228
		GROUP BY CsuFlxIDeb, ProviderMasterID, LastName, FirstName, MiddleName, FullName,
				 PayCode, PayCodeDescr, Dept, DeptDescr) Y
		JOIN
		#CheckDateRolledUp B
		ON Y.CsuFlxIDeb = B.CsuFlxIDeb AND
			Y.PayCode = B.PayCode AND
			Y.Dept = B.Dept AND
			Y.MaxCD = B.CheckDate
	
	SELECT @err = @@error
	IF @err <>  0
		BEGIN
--			PRINT 'Error @ position 13'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 13') 
			
		END
DROP TABLE #CheckDateRolledUp

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
--			PRINT 'Error @ position 14'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 14') 
			
		END
	---Insert Employee Subtotal
INSERT INTO dbo.SEMAMDSummarySubtotals (PayRollCheckDate,
										PayRollPayPeriod,
										IsPayCodePerPersonSubTotal,
										IsEmployeeSubTotal,
										IsSiteSubTotal,
										RangeStartDate,
										RangeEndDate,
										CalendarYear,
										CreateDate,
										CsuFlxIDeb, 
										ProviderMasterID, LastName, FirstName, 
										MiddleName, FullName,
										PayCode, PayCodeDescr, 
										Dept, DeptDescr,
										HourlyRate,
										TotalCurrentHours,
										TotalCurrentEarnings,
										TotalYTDHours,
										TotalYTDEarnings, 
										CurrentUnits,
										YTDUnits)
	SELECT PayRollCheckDate = @PayRollCheckDate,
				PayRollPayPeriod = @PayRollPayPeriod,
				IsPayCodePerPersonSubTotal = NULL,
				IsEmployeeSubTotal = 'Yes',
				IsSiteSubTotal = NULL,
				RangeStartDate = @PeriodStartDate,
				RangeEndDate = @PeriodEndDate,
				CalendarYear = @CalendarYear,
				CreateDate = @CreateDate,
			   CsuFlxIDeb, ProviderMasterID, LastName, FirstName, MiddleName, FullName,
			   PayCode = NULL, PayCodeDescr = NULL, Dept, DeptDescr, HourlyRate = NULL,
			   SUM(TotalCurrentHours),SUM(TotalCurrentEarnings), 
			   SUM(TotalYTDHours),SUM(TotalYTDEarnings),
				SUM(CurrentUnits), SUM(YTDUnits)
	FROM SEMAMDSummarySubtotals 
	WHERE PayRollCheckDate = @PayRollCheckDate AND IsPayCodePerPersonSubTotal = 'Yes'
	GROUP BY CsuFlxIDeb,  ProviderMasterID, LastName, FirstName, MiddleName, FullName,
				Dept, DeptDescr

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
--			PRINT 'Error @ position 15'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 15') 
			
		END

	---Insert Site subtotals
INSERT INTO dbo.SEMAMDSummarySubtotals (PayRollCheckDate,
										PayRollPayPeriod,
										IsPayCodePerPersonSubTotal,
										IsEmployeeSubTotal,
										IsSiteSubTotal,
										RangeStartDate,
										RangeEndDate,
										CalendarYear,
										CreateDate,
										CsuFlxIDeb, 
										ProviderMasterID, LastName, FirstName, 
										MiddleName, FullName,
										PayCode, PayCodeDescr, 
										Dept, DeptDescr,
										HourlyRate,
										TotalCurrentHours,
										TotalCurrentEarnings,
										TotalYTDHours,
										TotalYTDEarnings, 
										CurrentUnits,
										YTDUnits)
	SELECT PayRollCheckDate = @PayRollCheckDate,
				PayRollPayPeriod = @PayRollPayPeriod,
				IsPayCodePerPersonSubTotal = NULL,
				IsEmployeeSubTotal = NULL,
				IsSiteSubTotal = 'Yes',
				RangeStartDate = @PeriodStartDate,
				RangeEndDate = @PeriodEndDate,
				CalendarYear = @CalendarYear,
				CreateDate = @CreateDate,
			    CsuFlxIDeb = NULL, ProviderMasterID = NULL, LastName = NULL, 
				FirstName = NULL, MiddleName = NULL, FullName = NULL,
			   PayCode = NULL, PayCodeDescr = NULL, Dept, DeptDescr, HourlyRate = NULL,
			   SUM(TotalCurrentHours),SUM(TotalCurrentEarnings), 
			   SUM(TotalYTDHours),SUM(TotalYTDEarnings),
				SUM(CurrentUnits), SUM(YTDUnits)
	FROM SEMAMDSummarySubtotals 
	WHERE PayRollCheckDate = @PayRollCheckDate AND IsEmployeeSubTotal = 'Yes'
	GROUP BY Dept, DeptDescr

	UPDATE SEMAMDSummarySubtotals
	SET Client = 'SEMA', DisplayGroup = 1

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
--			PRINT 'Error @ position 16'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('PA', getdate(), 'Error @ position 16.') 
			
		END

	INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage, PayRollCheckDate, RangeStartDate, RangeEndDate)
			VALUES ('PA', getdate(), 'Looks like it made it to the end', @PayRollCheckDate, @PeriodStartDate, @PeriodEndDate ) 
END













