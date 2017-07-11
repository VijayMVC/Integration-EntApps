USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwRpt]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwRpt]
AS
SELECT      dbo.tblCnt.CntEmail, dbo.tblRptCtr.RptCtr_CtrID, dbo.tblCmp.CmpName, dbo.tblRptCtr.RptCtr_RptID, dbo.tblRptCtrCnt.RptCtrCntSuppressYN
FROM          dbo.tblCmp INNER JOIN
                        dbo.tblCtr INNER JOIN
                        dbo.tblRptCtr INNER JOIN
                        dbo.tblCnt INNER JOIN
                        dbo.tblRptCtrCnt ON dbo.tblCnt.CntID = dbo.tblRptCtrCnt.RptCtrCnt_CntID ON dbo.tblRptCtr.RptCtrID = dbo.tblRptCtrCnt.RptCtrCnt_RptCtrID ON 
                        dbo.tblCtr.CtrID = dbo.tblRptCtr.RptCtr_CtrID ON dbo.tblCmp.CmpID = dbo.tblCtr.CtrSite_CmpID
WHERE      (dbo.tblRptCtr.RptCtr_RptID = 'rptIncExpStmtSummary1')
GO
