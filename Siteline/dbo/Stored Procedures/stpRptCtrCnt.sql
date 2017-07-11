CREATE Procedure dbo.stpRptCtrCnt
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@RptID varchar(50),
@CtrID int

As

If @CtrID = 0

	Select vwRptCtrCnt.* from vwRptCtrCnt
	Where RptCtr_RptID = @RptID
	Order by CtrKey
	
Else

	Select vwRptCtrCnt.* from vwRptCtrCnt
	Where RptCtr_RptID = @RptID And RptCtr_CtrID = @CtrID
	--Order by CtrKey

	return 

