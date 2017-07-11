USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpfrmMngcar_MngCarExc]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpfrmMngcar_MngCarExc](@MngCarID char(50))
AS SELECT     MngCarExcID, MngCarExc_MngCarID, MngCarExcYesNo, MngCarExcDescription, MngCarExcComment
FROM         tblMngCarExc
WHERE     (MngCarExc_MngCarID = @MngCarID)
ORDER BY MngCarExcID DESC
GO
