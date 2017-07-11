CREATE Procedure stpBdg
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@CtrID int,
@BdgID int,
@BdgYear int
As
If @BdgID= 0	
	If @CtrID= 0
		If @BdgYear =0
			SELECT vwfrmBdg.*FROM vwfrmBdg
			Where Bdg_CtrID = 0 And BdgID=0
			Order By CtrKey
		Else
			SELECT vwfrmBdg.*FROM vwfrmBdg
			Where BdgYear = @BdgYear
			Order By CtrKey
	Else
		SELECT vwfrmBdg.*FROM vwfrmBdg
		Where Bdg_CtrID = @CtrID
		Order By CtrKey
Else
	SELECT vwfrmBdg.*FROM vwfrmBdg
	Where BdgID = @BdgID 
	Order By CtrKey

return 

