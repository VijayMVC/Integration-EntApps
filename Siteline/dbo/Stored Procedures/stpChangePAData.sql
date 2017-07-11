CREATE Procedure stpChangePAData
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@HPID int,
@SttDate datetime
As
	Select vwChangePAData.* from vwChangePAData Where PaDataLbrChrgDept = @HPID and PaDataDate=@SttDate
	return 

