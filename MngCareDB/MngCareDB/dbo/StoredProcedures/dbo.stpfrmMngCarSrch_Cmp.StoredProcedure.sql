USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpfrmMngCarSrch_Cmp]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpfrmMngCarSrch_Cmp]
AS SELECT     dbo.tblCmp.*
FROM         dbo.tblCmp
GO
