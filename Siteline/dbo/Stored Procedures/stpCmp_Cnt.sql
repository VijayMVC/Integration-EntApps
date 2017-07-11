CREATE Procedure stpCmp_Cnt
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CmpID int

As
	SELECT tblCnt.*, tblCmpCnt.*
FROM tblCnt INNER JOIN
   tblCmpCnt ON tblCnt.CntID = tblCmpCnt.CmpCnt_CntID
WHERE (tblCnt.CntInactiveYN = 0) AND 
   (tblCmpCnt.CmpCnt_CmpID = @CmpID)
Order BY tblCnt.CntKey

	return 

