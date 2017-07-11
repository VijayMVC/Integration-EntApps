CREATE PROCEDURE dbo.stpMngCarMscLabel
(@MngCarMscID smallint, @MngCarMscLabel Varchar(20) OUTPUT)
AS 

SELECT    @MngCarMscLabel =  MngCarMscLabel
FROM         dbo.tlkpMngCarMsc
WHERE     (MngCarMscID = @MngCarMscID)

