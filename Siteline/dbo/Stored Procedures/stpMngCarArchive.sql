CREATE Procedure dbo.stpMngCarArchive
@CtrID int 
AS
If @CtrID = 0
	Select vwFrmMngCarArchive.* from vwFrmMngCarArchive
	Where CtrID = 0
	
	Else

	If @CtrID > 0
		
		Select vwFrmMngCarArchive.* from vwFrmMngCarArchive
		Where CtrID = @CtrID
	Else
		Select vwFrmMngCarArchive.* from vwFrmMngCarArchive
		Order BY CtrKey
Return
