CREATE VIEW dbo.zvwDeleteRecords
AS
SELECT     dbo.tblPay.*
FROM         dbo.tblPay
WHERE     (PayFileName = N'PR197wepmd - 20110715.csv')
