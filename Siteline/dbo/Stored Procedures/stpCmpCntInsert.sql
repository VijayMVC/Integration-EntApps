Create Procedure stpCmpCntInsert
@CntID int,
@CmpID int
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
Insert Into tblCmpCnt (CmpCnt_CmpID, CmpCnt_CntID)
Values (@CntID, @CmpID)
	/* set nocount on */
	return 

