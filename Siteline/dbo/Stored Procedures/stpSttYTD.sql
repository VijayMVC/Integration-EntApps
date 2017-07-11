CREATE Procedure [dbo].[stpSttYTD]
/*
 (
  @parameter1 datatype = default value,
  @parameter2 datatype OUTPUT
 )
*/
@SttDate datetime,
@Stt_CtrID int,
@Stt_BdgID int,
@SttYear datetime,
@SttID int


As

set nocount on

Set @SttYear = Year(@SttDate)

Update tblStt
	Set ytdSttPstChgs = (SELECT SUM(tblStt.SttPstChgs)		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID


---SUM(tblStt.SttGrossCollAmt) AS AtdGrossColl
Update tblStt
	Set ytdGrossColl  =  (SELECT SUM(tblStt.SttGrossCollAmt)		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID


--- SUM(tblStt.SttStipRcvd) AS AtdStipendsRcvd,
Update tblStt
Set ytdStipendsRcvd = (SELECT SUM(tblStt.SttStipRcvd)		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---SUM(tblStt.SttOtherRcpts) AS AtdOtherRcpts
Update tblStt
Set ytdOtherRcpts = (SELECT SUM(tblStt.SttOtherRcpts)		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---SUM(tblStt.SttValuationGainLossAmt)    AS AtdValuationGainLoss,
Update tblStt
Set ytdValuationGainLoss = (SELECT SUM(tblStt.SttValuationGainLossAmt)		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---SUM(tblStt.SttTotalCollAmt)  AS AtdTotalColl, 
Update tblStt
Set ytdTotalColl = (SELECT SUM(tblStt.SttTotalCollAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID


---SUM(tblStt.SttMlpAmt) AS AtdMalpractice, 
Update tblStt
Set ytdMalpractice = (SELECT SUM(tblStt.SttMlpAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---    SUM(tblStt.SttIntAmt) AS AtdInterest
Update tblStt
Set ytdInterest  = (SELECT SUM(tblStt.SttIntAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---SUM(tblStt.SttBillFee)  AS AtdSttBillFee, 
Update tblStt
Set ytdSttBillFee = (SELECT SUM(tblStt.SttBillFee)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---SUM(tblStt.SttBillSpec) AS AtdBillSpec 
Update tblStt
Set ytdBillSpec = (SELECT SUM(tblStt.SttBillSpec)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttOffTop) AS AtdSttOffTop, 
Update tblStt
Set ytdSttOffTop = (SELECT SUM(tblStt.SttOffTop)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttSiteOverheadAmt) AS AtdSiteOverhead, 
Update tblStt
Set ytdSiteOverhead = (SELECT SUM(tblStt.SttSiteOverheadAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttNorAmt) AS AtdNOR, 
Update tblStt
Set ytdNOR = (SELECT SUM(tblStt.SttNorAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---SUM(tblStt.SttDocPaidAmt) AS AtdSttDocPaidAmt, 
Update tblStt
Set ytdSttDocPaidAmt = (SELECT SUM(tblStt.SttDocPaidAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---SUM(tblStt.SttDocPaidAdjAmt) AS AtdSttDocPaidAmtAdj, 
Update tblStt
Set ytdSttDocPaidAmtAdj = (SELECT SUM(tblStt.SttDocPaidAdjAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---SUM(tblStt.SttPACost) AS AtdSttPACost 
Update tblStt
Set ytdSttPACost = (SELECT SUM(tblStt.SttPACost)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---SUM(tblStt.SttPTCost) AS AtdSttPTCost, 
Update tblStt
Set ytdSttPTCost = (SELECT SUM(tblStt.SttPTCost)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttLclExp) AS AtdSttLclExp, 
Update tblStt
Set ytdSttLclExp = (SELECT SUM(tblStt.SttLclExp)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttRDPaidAmt) AS AtdSttRDPaidAmt, 
Update tblStt
Set ytdSttRDPaidAmt = (SELECT SUM(tblStt.SttRDPaidAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---    SUM(tblStt.SttMDPaidAmt) AS AtdSttMDPaidAmt, 
Update tblStt
Set ytdSttMDPaidAmt = (SELECT SUM(tblStt.SttMDPaidAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttNonCurrAdjAmt) AS AtdSttNonCurrAdjAmt, \
Update tblStt
Set ytdSttNonCurrAdjAmt = (SELECT SUM(tblStt.SttNonCurrAdjAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttSrpAdjAmt) AS AtdSttSrpAdjAmt, 
Update tblStt
Set ytdSttSrpAdjAmt = (SELECT SUM(tblStt.SttSrpAdjAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttContribCEPAmt) AS AtdContribCEP, 
Update tblStt
Set ytdContribCEP = (SELECT SUM(tblStt.SttContribCEPAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttSiteNetIncAmt) AS AtdSiteNetInc, 
Update tblStt
Set ytdSiteNetInc = (SELECT SUM(tblStt.SttSiteNetIncAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttPatVisitQty) AS AtdSttPatVisitQty, 
Update tblStt
Set ytdSttPatVisitQty = (SELECT SUM(tblStt.SttPatVisitQty)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---SUM(tblStt.SttPatVisitUCQty) AS AtdSttPatVisitUCQty, 
Update tblStt
Set ytdSttPatVisitUCQty = (SELECT SUM(tblStt.SttPatVisitUCQty)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

    
---SUM(tblStt.SttAdmitQty) AS AtdSttAdmitQty, 
Update tblStt
Set ytdSttAdmitQty = (SELECT SUM(tblStt.SttAdmitQty)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttPhysTherVisitQty) AS AtdSttPhysTherVisitQty, 
Update tblStt
Set ytdSttPhysTherVisitQty = (SELECT SUM(tblStt.SttPhysTherVisitQty)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttPtsKeyed) AS AtdSttPtsKeyed, 
Update tblStt
Set ytdSttPtsKeyed = (SELECT SUM(tblStt.SttPtsKeyed)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttDocHourQty) AS AtdDocHours, 
Update tblStt
Set ytdDocHours = (SELECT SUM(tblStt.SttDocHourQty)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttPAhoursQty) AS AtdPAHours, 
Update tblStt
Set ytdPAHours = (SELECT SUM(tblStt.SttPAhoursQty)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
    
---SUM(tblStt.SttWIPGainLossAmt) AS AtdWIPGainLoss
Update tblStt
Set ytdWIPGainLoss  = (SELECT SUM(tblStt.SttWIPGainLossAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID


/*new 1/17/01 ************************************************
YtdSttCashARAmt */

Update tblStt
Set ytdSttCashARAmt  = (SELECT SUM(tblStt.SttCashARAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID


----YtdSttRefArAmt
Update tblStt
Set YtdSttRefArAmt   = (SELECT SUM(tblStt.SttRefAr)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

----Below new 1/30/02********************************

--YtdSttAccExpenseAmt
Update tblStt
Set YtdSttAccExpenseAmt  = (SELECT SUM(tblStt.SttAccExpenseAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID



--YtdSttDonationAmt
Update tblStt
Set YtdSttDonationAmt = (SELECT SUM(tblStt.SttDonationAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttPAAdjAmt
Update tblStt
Set YtdSttPAAdjAmt= (SELECT SUM(tblStt.SttPAAdjAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttFixedLocalAmt
Update tblStt
Set YtdSttFixedLocalAmt= (SELECT SUM(tblStt.SttFixedLocalAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID


--YtdSttLclVarAmt
Update tblStt
Set YtdSttLclVarAmt = (SELECT SUM(tblStt.SttLclVarAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttSurplusPayout
Update tblStt
Set YtdSttSurplusPayout = (SELECT SUM(tblStt.SttSurplusPayout)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttNonCurrMDAmt
Update tblStt
Set YtdSttNonCurrMDAmt= (SELECT SUM(tblStt.SttNonCurrMDAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttNonCurrRDAmt
Update tblStt
Set YtdSttNonCurrRDAmt= (SELECT SUM(tblStt.SttNonCurrRDAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttMDIncentiveAmt
Update tblStt
Set YtdSttMDIncentiveAmt= (SELECT SUM(tblStt.SttMDIncentiveAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttRDIncentiveAmt
Update tblStt
Set YtdSttRDIncentiveAmt= (SELECT SUM(tblStt.SttRDIncentiveAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YTDSttMDEarnedAmt
Update tblStt
Set YtdSttMDEarnedAmt= (SELECT SUM(tblStt.SttMDEarnedAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID


--YtdSttRDEarnedAmt
Update tblStt
Set YtdSttRDEarnedAmt = (SELECT SUM(tblStt.SttRDEarnedAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttCollFeeChgAmt
Update tblStt
Set YtdSttCollFeeChgAmt = (SELECT SUM(tblStt.SttCollFeeChgAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttMPFlatFeeAmt
Update tblStt
Set YtdSttMPFlatFeeAmt = (SELECT SUM(tblStt.SttMPFlatFeeAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttCEPSurchargeAmt
Update tblStt
Set YtdSttCEPSurchargeAmt = (SELECT SUM(tblStt.SttCEPSurchargeAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttBillSpecMBSIAmt
Update tblStt
Set YtdSttBillSpecMBSIAmt = (SELECT SUM(tblStt.SttBillSpecMBSIAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---YtdSttPASupportCostAmt
Update tblStt
Set YtdSttPASupportCostAmt = (SELECT SUM(tblStt.SttPASupportCostAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--Added 3/10/2004 per Marty*****************************************************************************************
--YtdSttMDLclAmt
Update tblStt
Set YtdSttMDLclAmt = (SELECT SUM(tblStt.SttMDLclAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

---YtdSttRDLclAmt
Update tblStt
Set YtdSttRDLclAmt= (SELECT SUM(tblStt.SttRDLclAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID
--****************************************************************************************************************
--******Added 2/17/2005 per Marty
--YtdPITearned
Update tblStt
Set YtdPITearned = (SELECT SUM(tblStt.SttDocPITearnedAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID



--****************Added 6/19/2006 per Marty
--YtdSttPatVisitReturnQty
Update tblStt
Set YtdSttPatVisitReturnQty = (SELECT SUM(tblStt.SttPatVisitReturnQty)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--****************Added 2/28/2006 per Gaby
--YTDSttBillSpecScribesAmt
Update tblStt
Set YtdSttBillSpecScribesAmt = (SELECT SUM(tblStt.SttBillSpecScribesAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YTDSttBillSpecSitePersonnelAmt
Update tblStt
Set YtdSttBillSpecSitePersonnelAmt = (SELECT SUM(tblStt.SttBillSpecSitePersonnelAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttPTAdjAmt
Update tblStt
Set YtdSttPTAdjAmt = (SELECT SUM(tblStt.SttPTAdjAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID


--************************Added 6/15/2007 per Marty
--YTDSttBillSpecScribesAdjAmt
Update tblStt
Set YtdSttBillSpecScribesAdjAmt = (SELECT SUM(tblStt.SttBillSpecScribesAdjAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YtdSttBillSpecSitePersonnelAdjAmt
Update tblStt
Set YtdSttBillSpecSitePersonnelAdjAmt = (SELECT SUM(tblStt.SttBillSpecSitePersonnelAdjAmt)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID


--YTDSttPTOAccrual ***New 5/19/2009
Update tblStt
Set YtdSttPTOAccrual = (SELECT SUM(tblStt.SttPTOAccrual)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID


--YTDSttPTOTotalCost ***New 5/19/2009
Update tblStt
Set YtdSttPTOTotalCost = (SELECT SUM(tblStt.SttPTOTotalCost)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID


--YTDSttPTOTrueUpAdj ***New 5/21/2009
Update tblStt
Set YtdSttPTOTrueUpAdj  = (SELECT SUM(tblStt.SttPTOTrueUpAdj)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID


--YTDSttEncounterQty ***New 6/23/2015
Update tblStt
Set YTDSttEncounterQty  = (SELECT SUM(tblStt.SttEncounterQty)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID

--YTDSttBilledUnitQty ***New 6/23/2015
Update tblStt
Set YTDSttBilledUnitQty  = (SELECT SUM(tblStt.SttBilledUnitQty)
		FROM tblBdg INNER JOIN
   	 tblStt INNER JOIN
   	 tblMth ON tblStt.SttDate = tblMth.MthDate ON 
    	tblBdg.BdgID = tblStt.Stt_BdgID
	WHERE (Year(tblStt.SttDate) =@SttYear) AND (tblStt.SttDate <= @SttDate) AND (tblStt.Stt_CtrID = @Stt_CtrID) AND (tblStt.Stt_BdgID = @Stt_BdgID)) 	
Where tblStt.SttID = @SttID



set nocount off

 return 













