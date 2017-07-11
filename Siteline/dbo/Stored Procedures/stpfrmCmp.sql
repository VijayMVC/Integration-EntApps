Create Procedure stpfrmCmp
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CmpID int
As
	Select tblCmp.* from tblCmp 
	where CmpID = @CmpID
	return 

