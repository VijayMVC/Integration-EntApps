CREATE Procedure [dbo].[stpSttSearchKey]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
SELECT DISTINCT 
    	tblCtr.CtrKey  AS Expr1, 
	tblCtr.CtrID,
	tblCmp.CmpKey
FROM tblCmp INNER JOIN
    tblCtr INNER JOIN
    tblStt ON tblCtr.CtrID = tblStt.Stt_CtrID ON 
    tblCmp.CmpID = tblCtr.CtrSite_CmpID
WHERE (tblCtr.CtrInactiveYn = 0) AND 
    (tblCmp.CmpKey + ' - ' + tblCtr.Ctr_CtrTypID IS NOT NULL)
ORDER BY tblCtr.CtrKey;
	/* set nocount on */
	return 


/*
SELECT DISTINCT 
    	tblCmp.CmpKey + ' - ' + tblCtr.Ctr_CtrTypID AS Expr1, 
	tblCtr.CtrID,
	tblCmp.CmpKey
FROM tblCmp INNER JOIN
    tblCtr INNER JOIN
    tblStt ON tblCtr.CtrID = tblStt.Stt_CtrID ON 
    tblCmp.CmpID = tblCtr.CtrSite_CmpID
WHERE (tblCtr.CtrInactiveYn = 0) AND 
    (tblCmp.CmpKey + ' - ' + tblCtr.Ctr_CtrTypID IS NOT NULL)
ORDER BY tblCmp.CmpKey;
	/* set nocount on */
	return 
	*/