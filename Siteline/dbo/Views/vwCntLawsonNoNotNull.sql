CREATE VIEW dbo.vwCntLawsonNoNotNull
WITH SCHEMABINDING 
AS
SELECT     CntLawsonNumber, CntID
FROM         dbo.tblCnt
WHERE     (CntLawsonNumber IS NOT NULL)
