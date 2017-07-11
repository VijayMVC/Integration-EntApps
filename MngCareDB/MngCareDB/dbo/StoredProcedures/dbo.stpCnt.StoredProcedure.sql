USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpCnt]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpCnt]
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
	return
GO
