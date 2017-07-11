CREATE PROCEDURE dbo.stpMngCarBatchExit
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
AS

--DELETE FROM dbo.tblTmpMngcar

	
	UPDATE    dbo.tblCtr 
	SET              CtrMngCarBatchYN = 0
	WHERE     (CtrMngCarBatchYN = 1)

	RETURN 



