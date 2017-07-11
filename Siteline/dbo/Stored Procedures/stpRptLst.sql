CREATE Procedure dbo.stpRptLst
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
	SELECT tblRpt.*
FROM tblRpt
WHERE (NOT (RptID LIKE '%'))
ORDER BY RptTitle
	return 

