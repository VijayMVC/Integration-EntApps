
CREATE Procedure dbo.stpUpdateSttDocPayroll
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
	--ER profee
UPDATE tblStt 
 SET tblStt.SttDocPaidAmt = isnull([TotalEarnings],0)
From vwDocPayCtrTotalsERProfee
INNER JOIN tblStt ON (tblStt.Stt_CtrID = vwDocPayCtrTotalsERProfee.CtrID) AND (tblStt.SttDate = vwDocPayCtrTotalsERProfee.PayDateChgMonth)


UPDATE tblStt 
 SET tblStt.SttDocHourQty = isnull([TotalHours],0)
From vwDocPayCtrTotalsERProfeeHours
INNER JOIN tblStt ON (tblStt.Stt_CtrID = vwDocPayCtrTotalsERProfeeHours.CtrID) AND (tblStt.SttDate = vwDocPayCtrTotalsERProfeeHours.PayDateChgMonth)


--MD Paid
UPDATE tblStt 
SET tblStt.SttMDPaidAmt = isnull([TotalEarnings],0)
From vwDocPayCtrTotalsMDStipend
INNER JOIN tblStt ON (tblStt.SttDate = vwDocPayCtrTotalsMDStipend.PayDateChgMonth) AND (tblStt.Stt_CtrID = vwDocPayCtrTotalsMDStipend.CtrID) 

--RDPaid
UPDATE tblStt 
 SET tblStt.SttRDPaidAmt = isnull([TotalEarnings],0)
From vwDocPayCtrTotalsRDStipend
INNER JOIN tblStt ON (tblStt.Stt_CtrID = vwDocPayCtrTotalsRDStipend.CtrID) AND (tblStt.SttDate = vwDocPayCtrTotalsRDStipend.PayDateChgMonth)

--Surplus Payout
UPDATE tblStt 
SET tblStt.SttSurplusPayout = isnull([TotalEarnings],0)
From vwDocPayCtrTotalsSurplus
INNER JOIN tblStt ON (tblStt.Stt_CtrID = vwDocPayCtrTotalsSurplus.CtrID) AND (tblStt.SttDate = vwDocPayCtrTotalsSurplus.PayDateChgMonth)

--Non Curr MD Amt
UPDATE tblStt 
SET tblStt.SttNonCurrMDAmt = isnull([TotalEarnings],0)
From vwDocPayCtrTotalsNonCurrMD
INNER JOIN tblStt ON (tblStt.Stt_CtrID = vwDocPayCtrTotalsNonCurrMD.CtrID) AND (tblStt.SttDate = vwDocPayCtrTotalsNonCurrMD.PayDateChgMonth) 

--Non Curr RD Amt
UPDATE tblStt 
 SET tblStt.SttNonCurrRDAmt = isnull([TotalEarnings],0)
From vwDocPayCtrTotalsNonCurrRD
INNER JOIN tblStt ON (tblStt.Stt_CtrID = vwDocPayCtrTotalsNonCurrRD.CtrID) AND (tblStt.SttDate = vwDocPayCtrTotalsNonCurrRD.PayDateChgMonth)

/*
--Surplus Payout
UPDATE tblStt 
SET tblStt.SttSurplusPayout = isnull([TotalEarnings],0)
From vwDocPayCtrTotalsSurplus
INNER JOIN tblStt ON (tblStt.Stt_CtrID = vwDocPayCtrTotalsSurplus.CtrID) AND (tblStt.SttDate = vwDocPayCtrTotalsSurplus.PayDateChgMonth)
*/
	
return 









