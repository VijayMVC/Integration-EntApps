CREATE Procedure stpCtr_Stt
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CtrID int
As
SELECT tblStt.* FROM tblStt 
Where (tblStt.Stt_CtrID=@CtrID)
ORDER BY tblStt.SttDate Desc;
	/* set nocount on */
	return 

