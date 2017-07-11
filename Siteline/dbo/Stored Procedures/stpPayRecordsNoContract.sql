CREATE PROCEDURE dbo.stpPayRecordsNoContract
AS SELECT DISTINCT PayAccountUnit, PayFullName
FROM         dbo.tblPay
WHERE     (PayAccountUnit IS NOT NULL) AND (Pay_CtrID IS NULL)
ORDER BY PayAccountUnit, PayFullName
