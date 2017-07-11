USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpUpdateCmpCnt]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpUpdateCmpCnt]
AS INSERT INTO dbo.tblCmpCnt
                         (CmpCnt_CntID, CmpCnt_CmpID)
SELECT DISTINCT dbo.tblCnt.CntID, dbo.tblCmp.CmpID
FROM            dbo.tblCnt INNER JOIN
                         dbo.tblDocPay ON dbo.tblCnt.CntLbrFlxIDEb = dbo.tblDocPay.DocPayLbrFlxIDEb INNER JOIN
                         dbo.tblCtr ON dbo.tblDocPay.DocPayLbrChrgDept = dbo.tblCtr.CtrPlatinumID INNER JOIN
                         dbo.tblCmp ON dbo.tblCtr.CtrSite_CmpID = dbo.tblCmp.CmpID LEFT OUTER JOIN
                         dbo.tblCmpCnt ON dbo.tblCnt.CntID = dbo.tblCmpCnt.CmpCnt_CntID AND dbo.tblCmp.CmpID = dbo.tblCmpCnt.CmpCnt_CmpID
WHERE        (dbo.tblCnt.CntID IS NOT NULL) AND (dbo.tblCmp.CmpID IS NOT NULL) AND (dbo.tblCmpCnt.CmpCntID IS NULL)
GO
