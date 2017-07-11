CREATE Procedure dbo.stpActJrn
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@ActJrnID int,
@CtrID int,
@CntName varchar (50)
As

If @CtrID = 0
	If @ActJrnID = 0
		If @CntName = 'x'
			Select tblActJrn.*
			From tblActJrn
			Where ActJrnID = 0
		Else
			Select tblActJrn.*
			From tblActJrn
			Where ActJrnCtrCnt = @CntName

	Else
		Select tblActJrn.*
		From tblActJrn
		Where ActJrnID = @ActjrnID 
Else
	Select tblActJrn.*
	From tblActJrn
	Where ActJrn_CtrID = @CtrID

return 

