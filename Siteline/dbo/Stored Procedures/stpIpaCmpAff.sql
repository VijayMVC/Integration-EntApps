CREATE PROCEDURE dbo.stpIpaCmpAff(@CmpID int)
AS SELECT     dbo.tblIPACmp.*
FROM         dbo.tblIPACmp
WHERE     (IPACmpIPA_CmpID = @CmpID) AND (IPACmpType = 1)