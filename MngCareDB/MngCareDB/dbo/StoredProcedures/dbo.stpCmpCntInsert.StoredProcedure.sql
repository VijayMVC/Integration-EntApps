USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpCmpCntInsert]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[stpCmpCntInsert]
@CntID int,
@CmpID int
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
Insert Into tblCmpCnt (CmpCnt_CmpID, CmpCnt_CntID)
Values (@CntID, @CmpID)
	/* set nocount on */
	return
GO
