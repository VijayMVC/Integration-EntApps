CREATE PROCEDURE dbo.stpCheckPR197
@RecordCount int OUTPUT
AS 
SELECT   @RecordCount=  COUNT(FileName) 
FROM         dbo.tblTempPR197




