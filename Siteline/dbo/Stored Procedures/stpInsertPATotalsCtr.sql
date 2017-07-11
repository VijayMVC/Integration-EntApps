CREATE Procedure stpInsertPATotalsCtr
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CtrID int, @Date datetime, @Hours float
As
	INSERT INTO dbo.tblPATotalsCtr
                      (CtrID, Date, SumOfLbrTotalHours)
VALUES     (@CtrID, @Date, @Hours)

	return 

