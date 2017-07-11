USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpCmpLookup]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[stpCmpLookup]
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
GO
