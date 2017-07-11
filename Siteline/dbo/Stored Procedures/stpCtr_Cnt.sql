CREATE Procedure stpCtr_Cnt
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@SiteCmpID int
As
SELECT tblCnt.*, tblCmpCnt.*
FROM tblCnt INNER JOIN tblCmpCnt ON tblCnt.CntID = tblCmpCnt.CmpCnt_CntID 
WHERE (tblCnt.CntInactiveYN=0) and (tblCmpCnt.CmpCnt_CmpID = @SiteCmpID)
Order By tblCnt.CntKey
	/* set nocount on */
	return 

