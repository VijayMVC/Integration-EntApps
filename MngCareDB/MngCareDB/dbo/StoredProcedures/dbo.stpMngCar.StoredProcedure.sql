USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpMngCar]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpMngCar]
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
GO
