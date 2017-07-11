CREATE PROCEDURE stpUpdateStats 
@CtrID int
AS
/*Create temporary table setting SttID of affected records */
Drop table tblResults
Create table tblResults (
  ResultsID int identity (1,1),
  ResultsForeignKey int)
  
insert into tblResults (ResultsForeignKey)
 Select SttID from tblStt
 Where (Stt_CtrID = @CtrID)
/*Declare variables for navigating in recordset */
Declare  @CountRecords int,
  @intCounter int
Select  @CountRecords = Count(*),
 @intCounter = 1
From tblResults
/*Set defaults for Prior Loan Balanace, Previous Collectible AR and Prior Adj Coll WIP */
Declare @PriorAdjCollWIPAmt money,
 @PriorCollectAR money,
 @PriorLoanBal money
SELECT @PriorAdjCollWIPAmt = CtrPriorAdjCollWIPAmtDefault, 
 @PriorCollectAR =CtrPriorCollectARDefault,
 @PriorLoanBal =CtrPriorLoanBalDefault
FROM tblCtr
Where CtrID = @CtrID
/*Set Looping *************************************************************************************/
While @intCounter <= @CountRecords
begin
/*Update prior balances */
Update vwResults
Set SttPriorAdjCollWIPAmt = @PriorAdjCollWIPAmt ,
 SttPriorCollectAR= @PriorCollectAR, 
     SttPriorLoanBal = @PriorLoanBal
WHERE ResultsID = @intCounter
/*Declare variables for fields that produce division by 0 errors */
Declare  @SttPtsKeyed float,
 @SttNorAmt money,
 @SttDocHourQty float,
 @SttPAhoursQty float,
 @SttBlendedHrs  float,
 @SttPatVisitQty float
/*Setting of variables that could cause division by 0 errors */ 
Select  @SttPtsKeyed = SttPtsKeyed,
 @SttDocHourQty = SttDocHourQty,
 @SttPAhoursQty = SttPAhoursQty,
 @SttBlendedHrs  = SttBlendedHrs,
 @SttPatVisitQty = SttPatVisitQty
From vwResults
WHERE ResultsID = @intCounter
/*  ********BEGIN OF UPDATES******* */
/*AVERAGE CHARGE PER PATIENT */
If @SttPtsKeyed = 0
Update  vwResults
Set SttAvgChgPt = 0
WHERE  ResultsID = @intCounter
Else
Update  vwResults
Set   SttAvgChgPt = SttPstChgs / SttPtsKeyed
WHERE  ResultsID = @intCounter
UPDATE vwResults
Set --Malpractice Anount
         SttMlpAmt = SttMPRate * SttPatVisitQty,
        
     --Total Cash Receipts
         SttCashRcptAmt = SttCashARAmt - SttRefAR + SttStipRcvd + SttOtherRcpts,
        
     --Interest Amount
        SttIntAmt = -(((SttPriorLoanBal + SttCashRcptAmt) * SttIntRate) /12),
        
     --'GrossCollectionAmount
         SttGrossCollAmt = SttPstChgs * SttTargetRate
WHERE  ResultsID = @intCounter
--Collections per patients
If @SttPtsKeyed = 0 
Update  vwResults
Set SttCollPerPtAmt = 0
WHERE  ResultsID = @intCounter
Else
Update  vwResults
Set SttCollPerPtAmt = SttGrossCollAmt/SttPtsKeyed
WHERE  ResultsID = @intCounter
Update vwResults
Set --adj collectible wip amount
         SttAdjCollWIPAmt = (SttChartQty + SttChartPostQty) * SttCollPerPtAmt,    
     --'Collection fee amount
        SttCollFeeAmt = SttBillRate * (SttCollectibleARAmt - SttCollectWIP + SttAdjCollWIPAmt),
     --'Ending collectible AR  
         SttEndCollectAR = SttCollectibleARAmt - SttCollectWIP - SttCollFeeAmt + SttAdjCollWIPAmt, 
     --'WIP Gain Loss Amount
         SttWIPGainLossAmt = SttAdjCollWIPAmt - SttPriorAdjCollWIPAmt,
     --Valuation Gain Loss Amount
         SttValuationGainLossAmt = SttEndCollectAR + SttCashARAmt - (SttWIPGainLossAmt + SttRefAR + SttGrossCollAmt + SttPriorCollectAR),
     --'Site Overhead Amount
         SttSiteOverheadAmt = (SttGrossCollAmt + SttWIPGainLossAmt + SttValuationGainLossAmt) * SttSiteOvrHdPct,    
     --'Total collection amount
         SttTotalCollAmt = SttValuationGainLossAmt + SttGrossCollAmt + SttStipRcvd + SttOtherRcpts + SttWIPGainLossAmt, 
       --'''NOR
         SttNorAmt = SttTotalCollAmt - SttBillFee - SttBillSpec - SttMlpAmt - SttIntAmt - SttOffTop - SttSiteOverheadAmt,
 --'Contrib cep amount
 SttContribCEPAmt = SttNorAmt * SttContribPct,        
     --'Site net income
         SttSiteNetIncAmt = SttNorAmt - (SttDocPaidAmt + SttDocPaidAdjAmt + SttMDPaidAmt + SttRDPaidAmt + SttPACost + SttLclExp + SttNonCurrAdjAmt + (SttNorAmt * SttContribPct) + SttSrpAdjAmt + SttPTCost),
     --'Doc PIT Earned
      SttDocPITearnedAmt = (SttNorAmt * SttStatPITpct) - (SttLclExp + SttPACost + SttPTCost)
WHERE  ResultsID = @intCounter
/*Trap all where Doc Hours = 0 to avoid division by 0 errors
 DocEarned Per Hour
 'Doc Paid per hour amount
 'Patients per hour */
If @SttDocHourQty = 0
 Update vwResults       
 Set SttDocEarnedHourAmt = 0,
  SttDocPaidHourAmt = 0,
  SttPtsPerHr = 0
 WHERE  ResultsID = @intCounter
Else
 Update vwResults       
 Set SttDocEarnedHourAmt = SttDocPITearnedAmt / SttDocHourQty,
  SttDocPaidHourAmt = (SttDocPaidAmt + SttDocPaidAdjAmt) / SttDocHourQty,
  SttPtsPerHr = SttPatVisitQty / SttDocHourQty
 WHERE  ResultsID = @intCounter
--   'PA paid per hour
If @SttPAhoursQty = 0        
 Update vwResults
 Set SttPAPaidHourAmt = 0
 WHERE  ResultsID = @intCounter
Else
 Update vwResults
 Set SttPAPaidHourAmt = SttPACost / SttPAhoursQty
 WHERE  ResultsID = @intCounter
--'Blended Hours
Update vwResults
Set         SttBlendedHrs = SttDocHourQty + SttPAhoursQty
WHERE  ResultsID = @intCounter
--Set Blended Hours variable for trapping X/0 errors 
Select  @SttBlendedHrs  = SttBlendedHrs
From vwResults
WHERE ResultsID = @intCounter
--'Blended patients per hour
If  @SttBlendedHrs = 0
 Update vwResults
 Set        SttBlendedPtsPerHr = 0
 WHERE  ResultsID = @intCounter
Else
 Update vwResults
 Set         SttBlendedPtsPerHr = SttPatVisitQty / SttBlendedHrs
 WHERE  ResultsID = @intCounter
Update vwResults
   --'Cash Expense Amount
Set SttCashExpAmt = SttSiteNetIncAmt - SttTotalCollAmt,
        
    --'Current Loan Balance   
         SttCurrLoanBal = SttCashExpAmt + SttCashRcptAmt + SttPriorLoanBal
WHERE  ResultsID = @intCounter
----Isolate stt pat visit when = 0
If @SttPatVisitQty = 0 
 Update vwResults  
 Set  --'net revenue per patient
  SttNetRevPerPtAmt = 0,
  -- 'total collections per patient
  SttTotalCollPerPt = 0  
 WHERE  ResultsID = @intCounter
Else
 Update vwResults  
 Set  --'net revenue per patient
  SttNetRevPerPtAmt = SttNorAmt / SttPatVisitQty,
  -- 'total collections per patient
  SttTotalCollPerPt = SttTotalCollAmt / SttPatVisitQty  
 WHERE  ResultsID = @intCounter
/* Calculations based upon NOR AMOUNT
 ***********************************/
---Set Nor Amount Variable ********************************
Select @SttNorAmt = SttNorAmt
From vwResults
WHERE  ResultsID = @intCounter
If @SttNorAmt = 0
Update VwResults
Set --'Comp. PIT%
           SttCompPITpct = 0,       
           SttCompMDpct = 0,       
     --Comp RD %
           --SttCompPITpct = 0,  ????????????????????????????
            --'Non Current Adj %
        SttNonCurrAdjPct = 0,
            --'PA Cost %
            SttPACostPct = 0,
 --'Local Expense
             SttLclExpPct = 0,
            -- SttNetPctofNOR
 SttNetPctofNOR = 0,        
     --'PTCost
            SttPTCostPct = 0
 WHERE  ResultsID = @intCounter
Else
 Update vwResults
 Set --'Comp. PIT%
            SttCompPITpct = (SttDocPaidAmt + SttDocPaidAdjAmt) / SttNorAmt,
     --'Comp MD %
            SttCompMDpct = SttMDPaidAmt / SttNorAmt,
 --'Comp RD %
            --SttCompPITpct = SttRDPaidAmt / SttNorAmt,     ??????????????????????????????????   
     --'Non Current Adj %
            SttNonCurrAdjPct = SttNonCurrAdjAmt / SttNorAmt,
    -- 'PA Cost %
            SttPACostPct = SttPACost / SttNorAmt,
 --'Local Expense
            SttLclExpPct = SttLclExp / SttNorAmt,
 -- 'Net % of Nor
         SttNetPctofNOR = SttSiteNetIncAmt / SttNorAmt,
 -- 'PTCost
           SttPTCostPct = SttPTCost / SttNorAmt
 WHERE  ResultsID = @intCounter
Update vwResults
Set     --net change in AR
         SttNetChangeinARAmt = SttValuationGainLossAmt + SttGrossCollAmt - SttCashARAmt + SttRefAR + SttWIPGainLossAmt,
     --'net amount
         SttNetAmt = SttEndCollectAR + SttCurrLoanBal,
          --Surpls deficit Amount
         SttSurplusDeficitAmt = SttNetAmt
WHERE  ResultsID = @intCounter
  --******Set variable for next statistic************
Select
@PriorAdjCollWIPAmt = SttAdjCollWIPAmt,
@PriorCollectAR = SttEndCollectAR,
@PriorLoanBal = SttCurrLoanBal
From vwResults
WHERE  ResultsID = @intCounter
Set @intCounter = @intCounter+1
End
--drop table tblResults
Return 0
