USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwFrmMngCarArchive]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwFrmMngCarArchive]
AS
SELECT     dbo.tblCtr.CtrID, dbo.tblCtr.CtrKey, dbo.tblCmp.CmpName AS ContractName
FROM         dbo.tblCtr INNER JOIN
                      dbo.tblCmp ON dbo.tblCtr.CtrSite_CmpID = dbo.tblCmp.CmpID
WHERE     (dbo.tblCtr.CtrInactiveYn = 0)
GO
