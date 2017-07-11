CREATE Procedure dbo.stpAppendPATotalsCtr
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
INSERT INTO tblPATotalsCtr ( CtrID, [Date], SumOfLbrTotalHours )
SELECT tblCtr.CtrID, tblPAData.PaDataDate, Sum(tblPAData.PaDataLbrTotalHours) AS SumOfPaDataLbrTotalHours
FROM vwTempPaData INNER JOIN (tblCtr INNER JOIN tblPAData ON tblCtr.CtrPlatinumID = tblPAData.PaDataLbrChrgDept) ON vwTempPaData.CHGMONTH = tblPAData.PaDataDate
WHERE (tblPAData.PaDataLbrChrgDiv<>10) AND (tblPAData.PaDataLbrChrgDiv<>22) AND (tblPAData.PaDataLbrChrgDiv<>33) AND (tblPAData.PaDataLbrChrgDept<>120) AND (tblPAData.PaDataLbrPayClass<>3)
GROUP BY tblCtr.CtrID, tblPAData.PaDataDate
ORDER BY tblCtr.CtrID, tblPAData.PaDataDate
	return 


