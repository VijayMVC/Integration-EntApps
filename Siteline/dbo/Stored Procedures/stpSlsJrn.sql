CREATE Procedure stpSlsJrn
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CmpID int
As
If @CmpID = -1
	Select tblSlsJrn.* from tblSlsJrn Order By SlsJrnKey, SlsJrnDate
Else
	Select tblSlsJrn.* from tblSlsJrn Where SlsJrn_CmpID = @CmpID


	return 

