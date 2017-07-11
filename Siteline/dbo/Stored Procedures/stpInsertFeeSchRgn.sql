CREATE PROCEDURE dbo.stpInsertFeeSchRgn
(@CmpID int,
@RgnName varchar(25), @ID int OUTPUT)
AS INSERT INTO dbo.tlkpFeeSchRgn
                      (FeeSchRgn_CmpID, FeeSchRgnName)
VALUES     (@CmpID, @RgnName)

set @ID = @@Identity
RETURN