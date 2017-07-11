CREATE Procedure dbo.stpStatBatch
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@MthID int
As

Declare @MthDate Datetime

SELECT @MthDate=dbo.tblMth.MthDate from dbo.tblMth Where  dbo.tblMth.MthId= @MthID

SELECT dbo.tblMth.MthId,dbo.tblMth.MthDate, dbo.tblBdg.Bdg_CtrID, 
    dbo.tblCtr.CtrKey
FROM dbo.tblCtr RIGHT OUTER JOIN
    dbo.tblBdg ON 
    dbo.tblCtr.CtrID = dbo.tblBdg.Bdg_CtrID LEFT OUTER JOIN
    dbo.tblMth ON 
    dbo.tblBdg.BdgYear = dbo.tblMth.MthYear LEFT OUTER JOIN
    dbo.tblStt ON dbo.tblCtr.CtrID = dbo.tblStt.Stt_CtrID AND 
    dbo.tblMth.MthDate = dbo.tblStt.SttDate
WHERE (dbo.tblStt.SttID IS NULL) AND 
    (dbo.tblBdg.BdgID IS NOT NULL) AND (dbo.tblMth.MthId = @MthID)  And dbo.tblCtr.CtrInactiveYN = 0 AND dbo.tblCtr.CtrDateEffect <= @MthDate
    	--taken out 6/28/02 per LaTasha
	--AND (dbo.tblCtr.CtrSysCtrYN = - 1)
Order By  dbo.tblCtr.CtrKey
	


Return



