CREATE PROCEDURE [stpCmp] 


 @CmpID int 
AS
If @CmpID = 0
	Select tblCmp.* from tblCmp
	Where CmpID = 0
	
	Else

	If @CmpID > 0
		
		Select tblCmp.* from tblCmp
		Where CmpID = @CmpID
	Else
		Select tblCmp.* from tblCmp
		Order BY CmpKey
