Create Procedure stpMngCar1
@CtrID int 
AS
If @CtrID = 0
	Select tblMngCar.* from tblMngCar
	Where MngCar_CtrID = 0
	
	Else

	If @CtrID > 0
		
		Select tblMngCar.* from tblMngCar
		Where MngCar_CtrID = @CtrID
	Else
		Select tblMngCar.* from tblMngCar
		Order BY MngCarKey
Return
