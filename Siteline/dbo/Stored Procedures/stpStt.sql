CREATE Procedure dbo.stpStt
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/

@CtrID int,
@SttID int,
@SttDate datetime
As



If @SttID= 0	
	If @CtrID= 0
		If @SttDate = '1/1/1800'
			SELECT vwStt1.*FROM vwStt1
			Where Stt_CtrID = 0 And SttID=0
			Order By Site, SttDate
		Else
			SELECT vwStt1.*FROM vwStt1
			Where SttDate = @SttDate
			Order By Site, SttDate
	Else
		SELECT vwStt1.*FROM vwStt1
		Where Stt_CtrID = @CtrID
		Order By Site, SttDate
Else
	SELECT vwStt1.*FROM vwStt1
	Where SttID = @SttID 
	Order By Site, SttDate

--return 





