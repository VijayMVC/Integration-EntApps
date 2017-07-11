CREATE Procedure dbo.stpMngCar
@CtrID int 
AS
If @CtrID = 0
	Select vwFrmMngCar.* from vwFrmMngCar
	Where CtrID = 0
	
	Else

	If @CtrID > 0
		
		Select vwFrmMngCar.* from vwFrmMngCar
		Where CtrID = @CtrID
	Else
		Select vwFrmMngCar.* from vwFrmMngCar
		Order BY CtrKey
Return

