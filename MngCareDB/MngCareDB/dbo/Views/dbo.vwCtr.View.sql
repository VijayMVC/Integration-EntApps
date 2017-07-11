USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwCtr]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCtr]
AS
SELECT     tblCnt3.CntID AS Expr3, dbo.tblCtr.*, tblCmp6.CmpName AS Expr1, tblCmp1.CmpName AS Site, tblCmp2.CmpName AS System, 
                      tblCmp3.CmpName AS TranscriptCompany, tblCmp4.CmpName AS BillingAgent, tblCmp5.CmpName AS PhysicianGroup, 
                      tblCmp6.CmpName AS MalpracticeCompany, tblCnt4.CntKey AS Expr2, tblCnt1.CntKey AS MedicalDirector, tblCnt2.CntKey AS CAM, 
                      tblCnt3.CntKey AS RegionalDirector, tblCnt4.CntKey AS AssistantDirector, tblCmp1.CmpCity AS SiteCity, tblCmp1.CmpState AS SiteState, 
                      tblCmp1.CmpZip AS SiteZip, dbo.tblRgn.RgnName AS RgnName, tblCnt2.CntTitle AS CAMTitle, tblCnt2.CntPhonePref AS CAMPhone, 
                      tblCmp1.CmpAddress1 AS SiteAddress1, tblCmp1.CmpAddress2 AS SiteAddress2, tblCmp1.CmpPhone AS SitePhone, tblCmp1.CmpFax AS SiteFax, 
                      dbo.tlkpMlpRgn.MlpRgnID AS MlpRgnID, dbo.tlkpMlpRgn.MlpRgnRate AS MlpRgnRate
FROM         dbo.tlkpMlpRgn RIGHT OUTER JOIN
                      dbo.tblCmp tblCmp1 INNER JOIN
                      dbo.tblCtr ON tblCmp1.CmpID = dbo.tblCtr.CtrSite_CmpID ON dbo.tlkpMlpRgn.MlpRgnID = dbo.tblCtr.Ctr_MlpRgnID LEFT OUTER JOIN
                      dbo.tblCnt tblCnt2 ON dbo.tblCtr.CtrCamAssigned_CntID = tblCnt2.CntID LEFT OUTER JOIN
                      dbo.tblCnt tblCnt4 RIGHT OUTER JOIN
                      dbo.tblRgn ON tblCnt4.CntID = dbo.tblRgn.RgnDirAss_CntID LEFT OUTER JOIN
                      dbo.tblCnt tblCnt3 ON dbo.tblRgn.RgnDir_CntID = tblCnt3.CntID ON dbo.tblCtr.Ctr_RgnID = dbo.tblRgn.RgnID LEFT OUTER JOIN
                      dbo.tblCnt tblCnt1 ON dbo.tblCtr.CtrMedDir_CntID = tblCnt1.CntID LEFT OUTER JOIN
                      dbo.tblCmp tblCmp6 ON dbo.tblCtr.CtrMlp_CmpID = tblCmp6.CmpID LEFT OUTER JOIN
                      dbo.tblCmp tblCmp5 ON dbo.tblCtr.CtrPhyGrp_CmpID = tblCmp5.CmpID LEFT OUTER JOIN
                      dbo.tblCmp tblCmp4 ON dbo.tblCtr.CtrBillAgt_CmpID = tblCmp4.CmpID LEFT OUTER JOIN
                      dbo.tblCmp tblCmp3 ON dbo.tblCtr.CtrTranscript_CmpID = tblCmp3.CmpID LEFT OUTER JOIN
                      dbo.tblCmp tblCmp2 ON dbo.tblCtr.CtrSys_CmpID = tblCmp2.CmpID
GO
