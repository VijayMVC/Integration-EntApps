USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpBllCmp]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[stpBllCmp] 
 @BllCmpID int 
AS
If @BllCmpID = 0
	Select tblBllCmp.* from tblBllCmp
	Where BllCmpID = 0
	
	Else
	If @BllCmpID > 0
		
		Select tblBllCmp.* from tblBllCmp
		Where BllCmpID = @BllCmpID
	Else
		Select tblBllCmp.* from tblBllCmp
		Order BY BllCmpName
GO
