USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwIPA]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwIPA]
AS
SELECT DISTINCT TOP 100 PERCENT dbo.tblCmp.CmpName AS IpaCmp, dbo.tblCmp.CmpID, dbo.tblMngCar.MngCarInactiveYN
FROM            dbo.tblMngCar INNER JOIN
                         dbo.tblCmp ON dbo.tblMngCar.MngCarIPA_CmpID = dbo.tblCmp.CmpID
ORDER BY dbo.tblCmp.CmpName
GO
