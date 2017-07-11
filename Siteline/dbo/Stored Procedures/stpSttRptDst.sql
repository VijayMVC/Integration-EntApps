Create Procedure stpSttRptDst
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@Stt_CtrID int,
@SttDate datetime

As
	SELECT vwSttBdg.* FROM vwSttBdg WHERE Stt_CtrID=@Stt_CtrID  AND SttDate =@SttDate
	return 

