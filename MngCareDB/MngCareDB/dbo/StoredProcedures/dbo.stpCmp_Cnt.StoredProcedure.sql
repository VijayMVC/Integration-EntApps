USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpCmp_Cnt]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpCmp_Cnt]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CmpID int
As
	SELECT tblCnt.*, tblCmpCnt.*
FROM tblCnt INNER JOIN
   tblCmpCnt ON tblCnt.CntID = tblCmpCnt.CmpCnt_CntID
WHERE (tblCnt.CntInactiveYN = 0) AND 
   (tblCmpCnt.CmpCnt_CmpID = @CmpID)
Order BY tblCnt.CntKey
	return
GO
