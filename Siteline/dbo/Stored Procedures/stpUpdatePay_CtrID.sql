CREATE PROCEDURE dbo.stpUpdatePay_CtrID
AS UPDATE    dbo.vwPayNoCtr
SET              Pay_CtrID = CtrID
