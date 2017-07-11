Create Procedure stpChecktblTempPAData
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
		if exists (select * from sysobjects where Name = 'tblTempPAData' ) 
		Drop Table dbo.tblTempPAData
	return 

