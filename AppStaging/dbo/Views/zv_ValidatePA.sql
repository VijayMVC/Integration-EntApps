CREATE VIEW [dbo].[zv_ValidatePA]
AS
SELECT     dbo.YTDEarningsStatementPAStaging.*, CsuFlxIDeb AS Expr1, LastName AS Expr2, ProviderMasterID AS Expr3, CategoryFlag AS Expr4
FROM         dbo.YTDEarningsStatementPAStaging
WHERE     (CsuFlxIDeb = 52215) AND (CategoryFlag = 'm')
