CREATE Procedure dbo.stpCtr
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CtrID int

As
If @CtrID = -1
	Select tblCtr.* from tblCtr Where CtrInactiveYN = 0 
	Order By CtrKey	
Else
	Select tblCtr.* from tblCtr Where CtrID = @CtrID
	Order By CtrKey	
return 

