USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpRptLst]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpRptLst]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
	SELECT tblRpt.*
FROM tblRpt
WHERE (NOT (RptID LIKE '%'))
ORDER BY RptTitle
	return
GO
