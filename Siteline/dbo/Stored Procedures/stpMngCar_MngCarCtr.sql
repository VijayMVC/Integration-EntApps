CREATE Procedure dbo.stpMngCar_MngCarCtr
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CtrID int

As
	select tblMngCar.* from tblMngCar where MngCar_CtrID = @CtrID And MngCarInactiveYN = 0
	--Order By Contract, IpaCmp, LivTypName
	Order By MngCarKey
	return 

