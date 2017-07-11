USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpCtr_Cnt]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpCtr_Cnt]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@SiteCmpID int
As
SELECT tblCnt.*, tblCmpCnt.*
FROM tblCnt INNER JOIN tblCmpCnt ON tblCnt.CntID = tblCmpCnt.CmpCnt_CntID 
WHERE (tblCnt.CntInactiveYN=0) and (tblCmpCnt.CmpCnt_CmpID = @SiteCmpID)
Order By tblCnt.CntKey
	/* set nocount on */
	return
GO
