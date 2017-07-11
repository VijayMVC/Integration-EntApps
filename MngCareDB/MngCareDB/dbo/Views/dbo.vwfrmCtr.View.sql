USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwfrmCtr]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwfrmCtr]
AS
SELECT     dbo.tblCtr.*, dbo.tblCmp.CmpAddress1 AS Expr1, dbo.tblCmp.CmpAddress2 AS Expr2, dbo.tblCmp.CmpCity AS Expr3, dbo.tblCmp.CmpState AS Expr4, 
                      dbo.tblCmp.CmpZip AS Expr5, dbo.tblCmp.CmpCountry AS Expr6, dbo.tblCmp.CmpPhone AS Expr7, dbo.tblCmp.CmpFax AS Expr8
FROM         dbo.tblCmp INNER JOIN
                      dbo.tblCtr ON dbo.tblCmp.CmpID = dbo.tblCtr.CtrSite_CmpID
GO
