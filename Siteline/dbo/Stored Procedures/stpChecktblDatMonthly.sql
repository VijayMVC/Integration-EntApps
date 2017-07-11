CREATE Procedure dbo.stpChecktblDatMonthly
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
	if exists (select * from sysobjects where Name = 'tblTempDatMonthly' ) 
		Drop Table dbo.tblTempDatMonthly
		
	return 

