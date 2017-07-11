USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwIPASite]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwIPASite]
AS
SELECT DISTINCT 
                      TOP 100 PERCENT tblCmp_1.CmpName AS SiteName, dbo.tblCmp.CmpName AS IpaCmpName, dbo.tblMngCar.MngCarIPA_CmpID, 
                      dbo.tblCtr.CtrSite_CmpID, dbo.tblMngCar.MngCarInactiveYN
FROM         dbo.tblMngCar INNER JOIN
                      dbo.tblCmp ON dbo.tblMngCar.MngCarIPA_CmpID = dbo.tblCmp.CmpID INNER JOIN
                      dbo.tblCtr ON dbo.tblMngCar.MngCar_CtrID = dbo.tblCtr.CtrID INNER JOIN
                      dbo.tblCmp tblCmp_1 ON dbo.tblCtr.CtrSite_CmpID = tblCmp_1.CmpID INNER JOIN
                      dbo.tlkpLiv ON dbo.tblMngCar.MngCar_LivTypID = dbo.tlkpLiv.LivTypID
WHERE     (tblCmp_1.CmpInactiveYN = 0)
ORDER BY tblCmp_1.CmpName
GO
