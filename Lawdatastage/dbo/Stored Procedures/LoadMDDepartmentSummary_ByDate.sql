













-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LoadMDDepartmentSummary_ByDate]
	-- Add the parameters for the stored procedure here
	@PeriodStartDate	datetime	= '03/16/2015',
	@PeriodEndDate		datetime	= '04/15/2015'
AS
BEGIN
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE		@err			int
	DECLARE		@PEndDefault	Binary 
	DECLARE		@DiffTable		TABLE(PayPeriod varchar(10), PayDate datetime, Diff int)
	DECLARE		@MinDiff		int
	DECLARE		@PayRollCheckDate	datetime
	DECLARE		@PayRollPayPeriod varchar(10)
	DECLARE		@CreateDate		datetime
	DECLARE		@CalendarYear	varchar(4)

	SET @CreateDate = '2015-04-14 18:22:35.363'
	SET @CalendarYear = Year(@CreateDate)

	SET @PEndDefault = 0
	IF (@PeriodStartDate IS NULL)
		BEGIN
			SET @PeriodStartDate = '03/16/2015'
		END

	IF (@PeriodEndDate IS NULL)
		BEGIN
			SET @PeriodEndDate = '04/15/2015'
			SET @PEndDefault = 1
		END

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 1') 
			
		END

	INSERT INTO @DiffTable 
		SELECT PayPeriod, PayDate, ABS(DATEDIFF(DAY, PayDate, @PeriodEndDate)) AS Diff 
		FROM MDPayRollSched
	SELECT @MinDiff = MIN(Diff) FROM @DiffTable
	
	---Update PayRollCheckDate, and PayRollPayPeriod

	SET @PayRollCheckDate = '2015-04-15 00:00:00.000'
	SET @PayRollPayPeriod = '2015-040'

	IF @PEndDefault = 1
		BEGIN
			SET @PeriodEndDate = @PayRollCheckDate
		END


/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
REMOVED on 8/11/09 because new date logic means that this additional piece of code is no longer required.

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

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 2') 
			
		END

	TRUNCATE TABLE MDSummaryTransactionStaging
	

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 3') 
			
		END

/*+++++++++++++++++++++++++++++++++++++8/11/09++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
The CheckDates inbtw code was modified below on 8/11/09 to say E.CheckDate <= @PeriodEndDate instead of
	   E.CheckDate < @PeriodEndDate in the WHERE clause. This is due to the change in date range for check pulled 
       requested by payroll 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */


	/******************************************************************************************************
	First insert all of the checks that fall within the dates @PeriodStartDate and @PeriodEndDate

	Then include all of the manual/adjustment/reversal from the checkdate @PeriodStartDate

	Then include all of the NON-manual/adjustment/reversal from the checkDate @PeriodEndDate
	*******************************************************************************************************/
	
	---CheckDates inbtw	
	INSERT INTO dbo.MDSummaryTransactionStaging ( CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
											CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
											MiddleName, FullName, PayCode, PayCodeDescr, PayGroup,
											PayGroupDescr, TotalHours, 
											TotalEarnings, HourlyRate, RangeStartDate, RangeEndDate, 
											CalendarYear, CreateDate, PayRollCheckDate, 
											PayRollPayPeriod)
		SELECT E.CheckDate, E.CheckNo, E.PayPeriod, E.Dept, E.DeptDescr, 
			   E.CsuFlxIDeb, E.ProviderMasterID, E.LastName, E.FirstName, 
			   E.MiddleName, E.FullName, E.PayCode, E.PayCodeDescr, PayGroup = NULL, 
			   PayGroupDescr = NULL, E.TotalHoursbyPayCode, 
			   E.TotalEarnings, E.HourlyRate, RangeStartDate = NULL, RangeEndDate = NULL, 
			   CalendarYear = @CalendarYear, CreateDate = @CreateDate, PayRollCheckDate = NULL, 
			   PayRollPayPeriod = NULL
		FROM YTDEarningsStatementStagingMD E
		WHERE E.CheckDate > @PeriodStartDate AND E.CheckDate <= @PeriodEndDate AND E.CategoryFlag = 'B' ----Here it was changed to <= (8/11/09)
	
	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 4') 
			
		END
/*+++++++++++++++++++++++++++++++++++++8/12/09++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
REMOVED because new date logic requires that NO checks from @PeriodStartDate be pulled into the department summary



/*+++++++++++++++++++++++++++++++++++++8/11/09++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
 8/11/09 Leaving this in for the transition pay period. Will be removed from the script going forward 
after the transiton pay period
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

	---M/A/R on @PeriodStartDate
	INSERT INTO dbo.MDSummaryTransactionStaging ( CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
											CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
											MiddleName, FullName, PayCode, PayCodeDescr, PayGroup,
											PayGroupDescr, TotalHours, 
											TotalEarnings, HourlyRate, RangeStartDate, RangeEndDate, 
											CalendarYear, CreateDate, PayRollCheckDate, 
											PayRollPayPeriod)
		SELECT CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
			   CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
			   MiddleName, FullName, PayCode, PayCodeDescr, PayGroup = NULL, 
			   PayGroupDescr = NULL, TotalHoursbyPayCode, 
			   TotalEarnings, HourlyRate, RangeStartDate = NULL, RangeEndDate = NULL, 
			   CalendarYear = @CalendarYear, CreateDate = @CreateDate, PayRollCheckDate = NULL, 
			   PayRollPayPeriod = NULL
		FROM YTDEarningsStatementStagingMD 
		WHERE CheckDate = @PeriodStartDate AND CategoryFlag = 'B' AND
			 ( CheckNo LIKE '%.9' OR --Include Reversal checks 
			  CheckNo LIKE '%.5' OR --Include Adjustment checks
			  CheckNo IN (SELECT DISTINCT CHECK_NBR 
							FROM dbo.PAYMASTR
							WHERE CHECK_TYPE = 'M' AND
								  CHECK_DATE = @PeriodStartDate)) --Include Manual checks
	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 5') 
			
		END


/*+++++++++++++++++++++++++++++++++++++8/11/09++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
8/11/09 NO LONGER NEED THIS B/C THESE CHECKS ARE INCLUDED IN THE THE INBTW CODE ABOVE. IT IS NOW <=


	---Non-M/A/R on @PeriodEndDate 
	INSERT INTO dbo.MDSummaryTransactionStaging ( CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
											CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
											MiddleName, FullName, PayCode, PayCodeDescr, PayGroup,
											PayGroupDescr, TotalHours, 
											TotalEarnings, HourlyRate, RangeStartDate, RangeEndDate, 
											CalendarYear, CreateDate, PayRollCheckDate, 
											PayRollPayPeriod)
		SELECT CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
			   CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
			   MiddleName, FullName, PayCode, PayCodeDescr, PayGroup = NULL, 
			   PayGroupDescr = NULL, TotalHoursbyPayCode, 
			   TotalEarnings, HourlyRate, RangeStartDate = NULL, RangeEndDate = NULL, 
			   CalendarYear = @CalendarYear, CreateDate = @CreateDate, PayRollCheckDate = NULL, 
			   PayRollPayPeriod = NULL		
		FROM YTDEarningsStatementStagingMD 
		WHERE CheckDate = @PeriodEndDate AND CategoryFlag = 'B' AND
			 (CheckNo NOT LIKE '%.9' AND --EXclude Reversal checks 
			  CheckNo NOT LIKE '%.5' AND --EXclude Adjustment checks
			  CheckNo NOT IN (SELECT DISTINCT CHECK_NBR 
							  FROM dbo.PAYMASTR
							  WHERE CHECK_TYPE = 'M' AND
								    CHECK_DATE = @PeriodEndDate)) --EXclude Manual checks 

+++++++++++++++++++++++++++++++++++++8/11/09++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 6') 
			
		END
	---Update the MDSummaryTransactionStaging table with the correct PayGroup and PayGroupDescr
	---There are only two groups: Stipend and Professional Fee
	---The Pay Codes 'P21' and 'P22' belong to the Stipend group. The rest belong to Professional Fee

	UPDATE MDSummaryTransactionStaging
	SET PayGroup = 'STP', PayGroupDescr = 'Stipend'
	WHERE PayCode IN ('P21', 'P22')
	
	UPDATE MDSummaryTransactionStaging
	SET PayGroup = 'FEE', PayGroupDescr = 'Professional Fee'
	WHERE PayCode NOT IN ('P21', 'P22')

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 7') 
			
		END
	---Update RangeStartDate, RangeEndDate 
	UPDATE MDSummaryTransactionStaging
	SET RangeStartDate = @PeriodStartDate,
		RangeEndDate = @PeriodEndDate
	
		
	---Update PayRollCheckDate, and PayRollPayPeriod
	UPDATE MDSummaryTransactionStaging
	SET PayRollCheckDate = @PayRollCheckDate,
	PayRollPayPeriod = @PayRollPayPeriod

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 8') 
		END
	---Check to see if this pay date is in the transaction table. If it is, then raise error 

	IF (@PayRollCheckDate IN (SELECT DISTINCT PayRollCheckDate FROM MDSummaryTransaction))
		BEGIN
--			DELETE FROM MDSummaryTransaction
--			WHERE PayRollCheckDate = @PeriodEndDate 

--			RAISERROR ('This Payroll CheckDate:  already exists. If you would like 
--						to replace it, please delete it from the tables MDSummaryTransaction & 
--						and MDSummarySubtotals and rerun the stored procedure', 11, 1)
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage, PayRollCheckDate, RangeStartDate, RangeEndDate)
			VALUES ('MD', getdate(), 'You have already loaded this PayRollCheckDate into MDSummaryTransaction, Error postition 9',
					@PayRollCheckDate, @PeriodStartDate, @PeriodEndDate) 
			RETURN

		END

	---Append this PayRollCheckDate into the Transaction table from the staging table.
	INSERT INTO dbo.MDSummaryTransaction ( CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
											CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
											MiddleName, FullName, PayCode, PayCodeDescr, PayGroup,
											PayGroupDescr, TotalHours, 
											TotalEarnings, HourlyRate, RangeStartDate, RangeEndDate, 
											CalendarYear, CreateDate, PayRollCheckDate, 
											PayRollPayPeriod)
		SELECT CheckDate, CheckNo, PayPeriod, Dept, DeptDescr, 
			   CsuFlxIDeb, ProviderMasterID, LastName, FirstName, 
			   MiddleName, FullName, PayCode, PayCodeDescr, PayGroup,
			   PayGroupDescr, TotalHours, 
			   TotalEarnings, HourlyRate, RangeStartDate, RangeEndDate, 
			   CalendarYear, CreateDate, PayRollCheckDate, 
			   PayRollPayPeriod 
		FROM MDSummaryTransactionStaging

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 10') 
		END

	-----TIME TO INSERT INTO SUBTOTALS TABLE-----
	
	--See if PayRollCheckDate is in subtotals table, if it is then raise error
	IF (@PayRollCheckDate IN (SELECT DISTINCT PayRollCheckDate FROM MDSummarySubtotals))
		BEGIN
--			DELETE FROM MDSummarySubtotals
--			WHERE PayRollCheckDate = @PeriodEndDate 
--			RAISERROR ('This Payroll CheckDate: already exists. If you would like 
--						to replace it, please delete it from the tables MDSummaryTransaction & 
--						and MDSummarySubtotals and rerun the stored procedure', 11, 1)
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage, PayRollCheckDate, RangeStartDate, RangeEndDate)
			VALUES ('MD', getdate(), 'You have already loaded this PayRollCheckDate into MDSummarySubtotals, Error postition 11',
					@PayRollCheckDate, @PeriodStartDate, @PeriodEndDate) 
			RETURN
		END

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 12') 
		END

	---Insert Pay code subtotals 
	INSERT INTO MDSummarySubtotals ( PayRollCheckDate, PayRollPayPeriod, Dept, DeptDescr, 
								PayCode, PayCodeDescr, PayGroup, PayGroupDescr, TotalHours, 
								TotalEarnings, IsPayCodeSubTotal, IsPayGroupSubTotal, IsSiteSubTotal, 
								RangeStartDate, RangeEndDate, CalendarYear, CreateDate)
		SELECT PayRollCheckDate, PayRollPayPeriod, Dept, DeptDescr,
			   PayCode, PayCodeDescr, PayGroup, PayGroupDescr, SUM(TotalHours), 
			   SUM(TotalEarnings), IsPayCodeSubTotal = 'Yes', IsPayGroupSubTotal = NULL, 
			   IsSiteSubTotal = NULL, RangeStartDate, RangeEndDate, CalendarYear, CreateDate  
		FROM MDSummaryTransactionStaging
		GROUP BY Dept, DeptDescr, PayGroup, PayGroupDescr, PayCode, PayCodeDescr, 
				 PayRollCheckDate, PayRollPayPeriod, RangeStartDate, RangeEndDate,
				 CalendarYear, CreateDate

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 13') 
		END

	---Insert Pay Group subtotals
	INSERT INTO MDSummarySubtotals ( PayRollCheckDate, PayRollPayPeriod, Dept, DeptDescr, 
								PayCode, PayCodeDescr, PayGroup, PayGroupDescr, TotalHours, 
								TotalEarnings, IsPayCodeSubTotal, IsPayGroupSubTotal, IsSiteSubTotal, 
								RangeStartDate, RangeEndDate, CalendarYear, CreateDate)
	
		SELECT PayRollCheckDate, PayRollPayPeriod, Dept, DeptDescr,
			   PayCode = NULL, PayCodeDescr = NULL, PayGroup, PayGroupDescr, SUM(TotalHours), 
			   SUM(TotalEarnings), IsPayCodeSubTotal = NULL, IsPayGroupSubTotal = 'Yes', 
			   IsSiteSubTotal = NULL, RangeStartDate, RangeEndDate, CalendarYear, CreateDate  
		FROM MDSummaryTransactionStaging
		GROUP BY Dept, DeptDescr, PayGroup, PayGroupDescr, 
				 PayRollCheckDate, PayRollPayPeriod, RangeStartDate, RangeEndDate,
				 CalendarYear, CreateDate

	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 14')
		END
 
	---Insert Site subtotals
	INSERT INTO MDSummarySubtotals ( PayRollCheckDate, PayRollPayPeriod, Dept, DeptDescr, 
								PayCode, PayCodeDescr, PayGroup, PayGroupDescr, TotalHours, 
								TotalEarnings, IsPayCodeSubTotal, IsPayGroupSubTotal, IsSiteSubTotal, 
								RangeStartDate, RangeEndDate, CalendarYear, CreateDate)
		SELECT PayRollCheckDate, PayRollPayPeriod, Dept, DeptDescr,
			   PayCode = NULL, PayCodeDescr = NULL, PayGroup = NULL, PayGroupDescr = NULL, 
			   SUM(TotalHours), SUM(TotalEarnings), IsPayCodeSubTotal = NULL, 
			   IsPayGroupSubTotal = NULL, IsSiteSubTotal = 'Yes', RangeStartDate, RangeEndDate, 
			   CalendarYear, CreateDate  
		FROM MDSummaryTransactionStaging
		GROUP BY Dept, DeptDescr,
				 PayRollCheckDate, PayRollPayPeriod, RangeStartDate, RangeEndDate,
				 CalendarYear, CreateDate
	
	SELECT @err = @@error
	IF @err <>  0
		BEGIN
			--PRINT 'Error @ position 1'
			INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage)
			VALUES ('MD', getdate(), 'Error @ position 15') 
		END

	INSERT INTO ErrorMsg (SPName, ErrorDate, ErrorMessage, PayRollCheckDate, RangeStartDate, RangeEndDate)
			VALUES ('MD', getdate(), 'MDDepartmentSummary SP reached the end', @PayRollCheckDate, @PeriodStartDate, @PeriodEndDate ) 

END














