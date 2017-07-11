USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpMngCar_MngCarCtr]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpMngCar_MngCarCtr]
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
GO
