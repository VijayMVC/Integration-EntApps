CREATE Procedure stpCtr_Bdg
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CtrID int
As
SELECT tblBdg.* FROM tblBdg 
Where (tblBdg.Bdg_CtrID=@CtrID)
ORDER BY tblBdg.BdgYear DESC;
	/* set nocount on */
	return 

