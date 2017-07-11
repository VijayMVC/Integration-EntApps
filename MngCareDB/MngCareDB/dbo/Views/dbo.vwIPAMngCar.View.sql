USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwIPAMngCar]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwIPAMngCar]
AS
SELECT DISTINCT 
                      TOP 100 PERCENT dbo.tlkpLiv.LivTypName, dbo.tblMngCar.MngCarIPA_CmpID AS IPAID, dbo.tblCtr.CtrSite_CmpID AS SiteID, dbo.tblMngCar.MngCarID, 
                      dbo.tblMngCar.MngCarEffectDate, dbo.tblMngCar.MngCarInactiveYN
FROM         dbo.tblMngCar INNER JOIN
                      dbo.tblCmp ON dbo.tblMngCar.MngCarIPA_CmpID = dbo.tblCmp.CmpID INNER JOIN
                      dbo.tblCtr ON dbo.tblMngCar.MngCar_CtrID = dbo.tblCtr.CtrID INNER JOIN
                      dbo.tblCmp tblCmp_1 ON dbo.tblCtr.CtrSite_CmpID = tblCmp_1.CmpID INNER JOIN
                      dbo.tlkpLiv ON dbo.tblMngCar.MngCar_LivTypID = dbo.tlkpLiv.LivTypID
ORDER BY dbo.tlkpLiv.LivTypName
GO
