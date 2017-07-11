
CREATE PROCEDURE [dbo].[stpPaySttUpdate] (@UpdateType varchar(100))

AS 
SET LOCK_TIMEOUT-1 
Set noCount On

declare @localPayMonth as datetime

--Set Import month parameter based on Update data souce
if @UpdateType = 'PR197' begin  --PR197 file then get date from import form
	set @localPayMonth = (select distinct ImportMonth from tlkpPayrollImportMonthParam)
end
else if @UpdateType = 'GLInterface' begin --Get date from import PR197.DATA_MONTH
	set @localPayMonth =(SELECT distinct convert(datetime,right(DATA_MONTH,2)+ '/'+'1/'+ left(DATA_MONTH,4),102) FROM PR197 where DATA_MONTH is not null )
End
else if @UpdateType = 'UpdateStatisticsOnly' begin --Get date from import PR197.DATA_MONTH
	set @localPayMonth = (select distinct ImportMonth from tlkpPayrollImportMonthParam)
End
   
--select  @localPayMonth    --testing

----select @localPayMonth
UPDATE    dbo.vwPaySttUpdate
SET              SttDocHourQty = PaySttDocHourQty1, SttNonCurrMDAmt = PaySttNonCurrMDPaidAmt1, SttPACost = PaySttPACost1, 
						  SttPAhoursQty = PaySttPAHoursQty1, SttDocPaidAmt = PaySttDocPaidAmt1, SttMDPaidAmt = PaySttMDPaidAmt1, 
						  SttBillSpecScribesAmt = PaySttBillSpecScribesAmt1, SttSurplusPayout = PaySttSurplusPayout1, SttBillSpecSitePersonnelAmt =PaySttBillSpecSitePersonnelAmt1,
						  sttptcost = PaySttPTPayout1
WHERE     SttDate = @localPayMonth





/*  Changed from this previous code for handling multiple months
-- Stp Uses Cursor to load update vwPaySttUpdate 1 month at a time

DECLARE date_list CURSOR FOR
	SELECT distinct convert(datetime,right(DATA_MONTH,2)+ '/'+'1/'+ left(DATA_MONTH,4),102) FROM PR197
DECLARE @date_item varchar(100)
					

/* Append data 1 month at a time */
OPEN date_list 
FETCH NEXT FROM date_list INTO @date_item
WHILE @@FETCH_STATUS = 0
BEGIN
	
	UPDATE    dbo.vwPaySttUpdate
	SET              SttDocHourQty = PaySttDocHourQty1, SttNonCurrMDAmt = PaySttNonCurrMDPaidAmt1, SttPACost = PaySttPACost1, 
						  SttPAhoursQty = PaySttPAHoursQty1, SttDocPaidAmt = PaySttDocPaidAmt1, SttMDPaidAmt = PaySttMDPaidAmt1, 
						  SttBillSpecScribesAmt = PaySttBillSpecScribesAmt1, SttSurplusPayout = PaySttSurplusPayout1, SttBillSpecSitePersonnelAmt =PaySttBillSpecSitePersonnelAmt1
	WHERE     SttDate = @date_item
	
	FETCH NEXT FROM date_list INTO @date_item
END

close date_list
Deallocate date_list

Set NoCount off

*/
