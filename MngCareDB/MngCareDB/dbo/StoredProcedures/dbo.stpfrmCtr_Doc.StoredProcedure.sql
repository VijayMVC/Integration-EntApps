USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpfrmCtr_Doc]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[stpfrmCtr_Doc](@CtrID int)
AS SELECT     CtrDocID, CtrDoc_CtrID, CtrDocName, CtrDocDescription, CtrDocLink, CtrDocLastEdit, CtrDocType, 
                      CtrDocDate
FROM         tblCtrDoc
WHERE     (CtrDoc_CtrID = @CtrID)
ORDER BY CtrDocDate DESC, CtrDocName
GO
