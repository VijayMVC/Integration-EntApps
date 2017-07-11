USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpCmp]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpCmp] 
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
GO
