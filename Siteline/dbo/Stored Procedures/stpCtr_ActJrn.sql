CREATE Procedure stpCtr_ActJrn
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CtrID int
AsSELECT tblActJrn.*, tblCtr.CtrKey 
FROM tblCtr INNER JOIN tblActJrn ON tblCtr.CtrID = tblActJrn.ActJrn_CtrID 
Where (tblActJrn.ActJrn_CtrID =@CtrID)
ORDER BY tblActJrn.ActJrnDate DESC , tblActJrn.ActJrnID;
	/* set nocount on */
	return 

