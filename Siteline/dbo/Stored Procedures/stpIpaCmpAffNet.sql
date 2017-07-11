CREATE PROCEDURE dbo.[stpIpaCmpAffNet](@CmpID int)
AS SELECT     dbo.tblIPACmp.*
FROM         dbo.tblIPACmp
WHERE     (IPACmpIPA_CmpID = @CmpID) AND (IPACmpType = 2)