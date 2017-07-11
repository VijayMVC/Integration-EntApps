USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwCmpCnt]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCmpCnt]
AS
SELECT     dbo.tblCmpCnt.*, dbo.tblCmp.CmpKey AS CmpKey
FROM         dbo.tblCmpCnt INNER JOIN
                      dbo.tblCmp ON dbo.tblCmpCnt.CmpCnt_CmpID = dbo.tblCmp.CmpID
GO
