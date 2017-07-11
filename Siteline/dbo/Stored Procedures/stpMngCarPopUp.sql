CREATE Procedure dbo.[stpMngCarPopUp]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@MngCarID int,
@MngCar_CtrID int 

AS

If @MngCarID = -1
	SELECT dbo.vwMngCar.*
		FROM dbo.vwMngCar
		ORDER BY MngCarKey

If @MngCarID = 0
	If @MngCar_CtrID = 0
		
		SELECT dbo.vwMngCar.*
		FROM dbo.vwMngCar
		WHERE (MngCarID = 0)
		ORDER BY MngCarKey
	Else
		SELECT dbo.vwMngCar.*
		FROM dbo.vwMngCar
		WHERE (MngCar_CtrID =@MngCar_CtrID)
		ORDER BY MngCarKey
Else
	SELECT dbo.vwMngCar.*
	FROM dbo.vwMngCar
	WHERE (MngCarID = @MngCarID)
	ORDER BY MngCarKey
	

return 

