CREATE Procedure stpRptCtrCntFilter
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CtrID int
As
	SELECT tblCtr.CtrKey, tblCnt.CntKey, tblCnt.CntEmail, tblRptCtr.RptCtr_RptID, tblRptCtr.RptCtr_CtrID, tblRptCtrCnt.RptCtrCntSuppressYN 
	FROM tblCtr INNER JOIN tblRptCtr ON tblCtr.CtrID = tblRptCtr.RptCtr_CtrID INNER JOIN tblCnt 
	INNER JOIN tblRptCtrCnt ON tblCnt.CntID = tblRptCtrCnt.RptCtrCnt_CntID ON tblRptCtr.RptCtrID = tblRptCtrCnt.RptCtrCnt_RptCtrID 
	WHERE (tblCtr.CtrKey IS NOT NULL) AND (tblCtr.CtrInactiveYn = 0) And RptCtr_CtrID = @CtrID
	ORDER BY tblCtr.CtrKey, tblCnt.CntKey
	return 

