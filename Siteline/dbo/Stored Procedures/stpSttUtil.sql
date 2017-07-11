CREATE Procedure stpSttUtil
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@Date datetime
As

drop table tblTemps

Create table tblTemps (
  		SttID int,
  		Stt_CtrID int,
		SttDate datetime)			

  
insert into tblTemps (SttID, Stt_CtrID, SttDate)
 SELECT SttID, Stt_CtrID, SttDate
FROM dbo.tblStt
WHERE SttDate = @Date



INSERT INTO dbo_tblStt ( Stt_CtrID, SttDate, Stt_BdgID,  SttStatPITpct, SttMDpct, 
SttRDpct, SttContribPct, SttSiteOvrHdPct, SttIntRate, SttBillRate, SttBseHour, SttNightPct, SttDiffRate, SttMPRate )

SELECT dbo.tblCtr.CtrID, @Date AS Expr2, dbo.tblBdg.BdgID, 
    dbo.tblCtr.CtrStatPITpct, dbo.tblCtr.CtrStatMDpct, 
    dbo.tblCtr.CtrStatRDpct, dbo.tblCtr.CtrStatContribpct, 
    dbo.tblCtr.CtrSiteOvrHdpct, dbo.tblCtr.CtrIntRate, 
    dbo.tblCtr.CtrBillRate, dbo.tblCtr.CtrBseHour, 
    dbo.tblCtr.CtrNightPct, dbo.tblCtr.CtrDiffRate, 
    ISNULL(dbo.tlkpMlpRgn.MlpRgnRate, 0) AS Expr1
FROM dbo.tblCtr INNER JOIN
    dbo.tblBdg ON 
    dbo.tblCtr.CtrID = dbo.tblBdg.Bdg_CtrID LEFT OUTER JOIN
    dbo.tlkpMlpRgn ON 
    dbo.tblCtr.Ctr_MlpRgnID = dbo.tlkpMlpRgn.MlpRgnID LEFT OUTER
     JOIN
    dbo.tblTemps ON 
    dbo.tblCtr.CtrID = dbo.tblTemps.Stt_CtrID
WHERE (dbo.tblCtr.CtrSysCtrYN = - 1) AND 
    (dbo.tblTemps.SttID IS NULL) AND 
    (dbo.tblBdg.BdgYear = Year(@Date))


Return
