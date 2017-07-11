USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[Debug_test]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Debug_test]
AS SELECT     *
FROM          dbo.tblMngCar INNER JOIN
                      dbo.tblMngCarCtr ON dbo.tblMngCar.MngCarID = dbo.tblMngCarCtr.MngCarCtr_MngCarID   /*INNER JOIN
                        dbo.tblCtr ON dbo.tblMngCarCtr.MngCarCtr_CtrID = dbo.tblCtr.CtrID INNER JOIN
                        dbo.tblCmp ON dbo.tblMngCar.MngCarIPA_CmpID = dbo.tblCmp.CmpID INNER JOIN
                        dbo.tlkpLiv ON dbo.tblMngCar.MngCar_LivTypID = dbo.tlkpLiv.LivTypID*/
GO
