USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpMngCarArchive]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpMngCarArchive]
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
GO
