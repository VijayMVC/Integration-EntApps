CREATE Procedure dbo.stpAppendStt
@MthID int
As

/*taken out 6/28/02 per LaTasha AND (tblCtr.CtrSysCtrYN = - 1)*/ 


INSERT INTO dbo.tblStt (Stt_BdgID, Stt_CtrID, SttDate, SttKey, SttStatPITpct, SttMDpct, SttRDpct, SttContribPct, SttSiteOvrHdPct, SttIntRate, SttBillRate, SttBseHour, SttNightPct, SttDiffRate, SttDiffAmt, SttMPRate, SttMPFlatFeeAmt, SttLclPct, SttFixedLocalAmt, SttMDIncentivePct, SttRDIncentivePct, SttSurplusReservePct, SttCEPSurchargePct, SttPASupportCostPct, SttMPUCRate, SttSurplusReserveAmt) 
SELECT dbo.tblBdg.BdgID, dbo.tblCtr.CtrID, dbo.tblMth.MthDate, dbo.tblCtr.CtrKey + CONVERT(Varchar(50), dbo.tblMth.MthDate, 107) + '%NewRec' AS Expr1, dbo.tblCtr.CtrStatPITpct, dbo.tblCtr.CtrStatMDpct, dbo.tblCtr.CtrStatRDpct, dbo.tblCtr.CtrStatContribpct, dbo.tblCtr.CtrSiteOvrHdpct, dbo.tblCtr.CtrIntRate, dbo.tblCtr.CtrBillRate, dbo.tblCtr.CtrBseHour, dbo.tblCtr.CtrNightPct, dbo.tblCtr.CtrDiffRate, dbo.tblCtr.CtrDiffAmt, ISNULL(dbo.tlkpMlpRgn.MlpRgnRate, 0) AS Expr2, dbo.tblCtr.CtrMlpFlatFee, dbo.tblCtr.CtrLclPct, dbo.tblCtr.CtrLclFixedAmt, dbo.tblCtr.CtrMDIncentivePct, dbo.tblCtr.CtrRDIncentivePct, dbo.tblCtr.CtrSurplusReservePct, dbo.tblCtr.CtrCEPSurchargePct, dbo.tblCtr.CtrPASupportCostPct, dbo.tblCtr.CtrMplSecondRate, (SELECT SttSurplusReserveAmt FROM dbo.tblStt WHERE (SttDate = Dateadd(Month, - 1, [MthDate])) AND (Stt_CtrID = [CtrID])) AS Expr3 
FROM dbo.tblCtr LEFT OUTER JOIN dbo.tlkpMlpRgn ON dbo.tblCtr.Ctr_MlpRgnID = dbo.tlkpMlpRgn.MlpRgnID RIGHT OUTER JOIN dbo.tblBdg ON dbo.tblCtr.CtrID = dbo.tblBdg.Bdg_CtrID LEFT OUTER JOIN dbo.tblMth ON dbo.tblBdg.BdgYear = dbo.tblMth.MthYear LEFT OUTER JOIN dbo.tblStt ON dbo.tblCtr.CtrID = dbo.tblStt.Stt_CtrID AND dbo.tblMth.MthDate = dbo.tblStt.SttDate 
WHERE (dbo.tblStt.SttID IS NULL) AND (dbo.tblBdg.BdgID IS NOT NULL) AND (dbo.tblMth.MthId = @MthID) AND (dbo.tblCtr.CtrInactiveYn = 0)

--need to have update query here for SttKey.

Update vwSttKey
Set  SttKey = Left(Convert(Varchar(50),MthDate,107),3) + '/' + Right(Convert(Varchar(50),MthDate,107),2) + ' - ' + Site + ' (' + Convert(Varchar(10),SttID) + ')'
Where SttKey Like  '%NewRec'




	return 






