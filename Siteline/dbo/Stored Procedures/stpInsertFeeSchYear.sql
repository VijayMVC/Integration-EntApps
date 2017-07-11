CREATE PROCEDURE dbo.stpInsertFeeSchYear
(@CmpID int,
@Year varchar(15), @ID int OUTPUT)
AS INSERT INTO dbo.tlkpFeeSchYr
                      (FeeSchYr_CmpID, FeeSchYrName)
VALUES     (@CmpID, @Year)

set @ID = @@Identity
RETURN