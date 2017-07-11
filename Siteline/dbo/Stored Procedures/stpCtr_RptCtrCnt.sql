CREATE Procedure stpCtr_RptCtrCnt
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CtrID int
As
SELECT tblRptCtrCnt.* FROM tblRptCtrCnt 
WHERE (tblRptCtrCnt.RptCtrCnt_RptCtrID=@CtrID)
	/* set nocount on */
	return 

