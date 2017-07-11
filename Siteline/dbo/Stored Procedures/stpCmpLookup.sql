Create Procedure stpCmpLookup
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
	SELECT DISTINCT 
    tblCmp.CmpKey, tblCmp.CmpID, tblCmp.CmpAddress1, 
    tblCmp.CmpAddress2, tblCmp.CmpCity, tblCmp.CmpState, 
    tblCmp.CmpZip, tblCmp.CmpCountry, tblCmp.CmpPhone, 
    tblCmp.CmpFax
FROM tblCmp
WHERE (((tblCmp.CmpKey) IS NOT NULL))
ORDER BY tblCmp.CmpKey
	/* set nocount on */
	return 

