Create Procedure stpCtr_RptCtr
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CtrID int

As
SELECT tblRptCtr.*, tblRpt.RptTitle 
FROM tblRpt INNER JOIN tblRptCtr ON tblRpt.RptID = tblRptCtr.RptCtr_RptID
Where ( tblRptCtr.RptCtr_CtrID = @CtrID)
Order By  tblRptCtr.RptCtr_RptID
	/* set nocount on */
	return 

