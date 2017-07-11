USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpfrmCmp]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[stpfrmCmp]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CmpID int
As
	Select tblCmp.* from tblCmp 
	where CmpID = @CmpID
	return
GO
