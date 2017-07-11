USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwCmp_Cnt]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCmp_Cnt]
AS
SELECT     dbo.tblCnt.*, dbo.tblCmpCnt.CmpCnt_CmpID AS Expr1, dbo.tblCmpCnt.CmpCntRole AS Expr2
FROM         dbo.tblCnt INNER JOIN
                      dbo.tblCmpCnt ON dbo.tblCnt.CntID = dbo.tblCmpCnt.CmpCnt_CntID
GO
