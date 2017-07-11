CREATE Procedure stpStt0
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
SELECT tblStt.*, tblMth.MthId AS Expr1
FROM tblCtr INNER JOIN
    tblStt ON tblCtr.CtrID = tblStt.Stt_CtrID INNER JOIN
    tblCmp ON tblCtr.CtrSite_CmpID = tblCmp.CmpID INNER JOIN
    tblMth ON tblStt.SttDate = tblMth.MthDate
Where SttID =1
ORDER BY tblCmp.CmpKey
	/* set nocount on */
	return 

