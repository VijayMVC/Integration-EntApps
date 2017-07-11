USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwCnt]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCnt]
AS
SELECT     dbo.tblCnt.*
FROM         dbo.tblCnt
WHERE     (CntInactiveYN = 0)
GO
