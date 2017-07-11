CREATE VIEW [dbo].[v_capaccr]
AS
SELECT     dbo.WebCapitalAndAccrualStaging.*, DOCNAME AS Expr1
FROM         dbo.WebCapitalAndAccrualStaging
WHERE     (DOCNAME LIKE 'ass%')
