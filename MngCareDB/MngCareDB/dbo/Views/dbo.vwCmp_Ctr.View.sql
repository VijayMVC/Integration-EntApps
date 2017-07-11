USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwCmp_Ctr]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCmp_Ctr]
AS
SELECT     dbo.tblCtr.*, dbo.tblRgn.*, tblCnt1.CntKey AS CAM, tblCnt1.CntKey AS xx, tblCnt2.CntKey AS MedDir
FROM         dbo.tblCnt tblCnt1 RIGHT OUTER JOIN
                      dbo.tblCtr ON tblCnt1.CntID = dbo.tblCtr.CtrCamAssigned_CntID LEFT OUTER JOIN
                      dbo.tblCnt tblCnt2 ON dbo.tblCtr.CtrMedDir_CntID = tblCnt2.CntID LEFT OUTER JOIN
                      dbo.tblRgn ON dbo.tblCtr.Ctr_RgnID = dbo.tblRgn.RgnID
GO
