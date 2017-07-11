CREATE Procedure dbo.SQL1
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CtrID int
As
SELECT tblCtr.CtrID, tblCtr.CtrPriorAdjCollWIPAmtDefault, tblCtr.CtrPriorCollectARDefault, tblCtr.CtrPriorLoanBalDefault
FROM tblCtr
WHERE (((tblCtr.CtrID)= @CtrID ));
	/* set nocount on */
	return 


