CREATE Procedure stpCnt_Cmp
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CntID int
As
SELECT tblCmp.CmpKey AS CmpKey, tblCmpCnt.*
FROM tblCmp INNER JOIN
    tblCmpCnt ON tblCmp.CmpID = tblCmpCnt.CmpCnt_CmpID
WHERE (tblCmpCnt.CmpCnt_CntID = @CntID)
Order By CmpKey Asc
	/* set nocount on */
	return 

