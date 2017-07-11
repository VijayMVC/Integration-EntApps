USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpfrmMngCarIPA_Doc]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpfrmMngCarIPA_Doc](@CmpID int)
AS SELECT     MngCarIPADocID, MngCarIPADoc_MngCarIPAID, MngCarIPADocName, MngCarIPADocDescription, MngCarIPADocLink, MngCarIPADocLastEdit, MngCarIPADocType, 
                      MngCarIPADocDate
FROM         tblMngCarIPADoc
WHERE     (MngCarIPADoc_MngCarIPAID = @CmpID)
ORDER BY MngCarIPADocDate DESC, MngCarIPADocName
GO
