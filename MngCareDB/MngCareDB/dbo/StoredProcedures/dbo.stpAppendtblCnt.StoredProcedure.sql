USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpAppendtblCnt]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpAppendtblCnt]
AS INSERT INTO dbo.tblCnt
                         (CntNameLast, CntNameFirst, CntSSN, CntLbrFlxIDEb, CntEmail, CntTitle, CntDocYN, CntInactiveYN, CntDateCreate, CntDateEdit, CntKey)
SELECT        RTRIM(LTRIM([Last Name])) AS Expr6, RTRIM(LTRIM([First Name])) AS Expr7, SSN, [Flx ID], EmailAddress1, Title, 1 AS Expr1, 0 AS Expr2, GETDATE() AS Expr3, GETDATE() AS Expr4, LTRIM(RTRIM([Last Name])) 
                         + ', ' + LTRIM(RTRIM([First Name])) AS Expr5
FROM            dbo.vwCntLbrFlxIDEb
GO
