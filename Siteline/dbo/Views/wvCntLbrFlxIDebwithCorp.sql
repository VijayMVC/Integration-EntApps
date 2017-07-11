CREATE VIEW [dbo].wvCntLbrFlxIDebwithCorp
AS
SELECT CntID, CntLbrFlxIDEb AS FlxID
FROM dbo.tblCnt
UNION
SELECT CntID, CntCorpLbrFlxIDEb AS FlxID
FROM dbo.tblCnt
