
CREATE Procedure dbo.stpCntLbrFlxIDEb
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/


As
drop table  dbo.tblTempCntLbrFlxIDEb

SELECT Distinct tblCnt.CntCorpLbrFlxIDEb As Column1
INTO dbo.tblTempCntLbrFlxIDEb
FROM tblCnt where  tblCnt.CntCorpLbrFlxIDEb is not null
Union
SELECT Distinct tblCnt.CntLbrFlxIDEb as Column1
FROM tblCnt where  tblCnt.CntLbrFlxIDEb is not null



/*SELECT tblDocPay.*
FROM tblCnt INNER JOIN tblDocPay ON Column1 = tblDocPay.DocPayLbrFlxIDEb
WHERE Column1 Is Null AND tblDocPay.DocPayID Is Not Null*/

	return 



