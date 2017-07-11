CREATE Procedure dbo.stpCnt
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CntID int 
AS

--Changed 5/2/02
If @CntID = 0
	Select tblCnt.* from tblCnt
	Where CntID = 0
	
	Else

	If @CntID > 0
		
		Select tblCnt.* from tblCnt
		Where CntID = @CntID
	Else
		Select tblCnt.* from tblCnt
		Order BY CntKey
/*If @CntID = 0
	Select vwCnt.* from vwCnt
	Where CntID = 0
	
	Else

	If @CntID > 0
		
		Select vwCnt.* from vwCnt
		Where CntID = @CntID
	Else
		Select vwCnt.* from vwCnt
		Order BY CntKey*/
	return 

