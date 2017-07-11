USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpfrmCmp_Doc]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[stpfrmCmp_Doc](@CmpID int)
AS SELECT     CmpDocID, CmpDoc_CmpID, CmpDocName, CmpDocDescription, CmpDocLink, CmpDocLastEdit, CmpDocType, 
                      CmpDocDate
FROM         tblCmpDoc
WHERE     (CmpDoc_CmpID = @CmpID)
ORDER BY CmpDocDate DESC, CmpDocName
GO
