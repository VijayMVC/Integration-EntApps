USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpMngCar1]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[stpMngCar1]
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
GO
