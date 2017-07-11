CREATE VIEW [dbo].[vw_k1validation]
AS
SELECT     TOP 100 PERCENT DOCNAME, ID1, EntityType, ProfitSharing, LossSharing, OwnerofCap, PartnersLiabOther, CapAcctBeg, PartnersShare, 
                      WithdrAndDistr, CapAcctEnd, OrdIncome, PortInterest, GuarPay, CharitableContr, InvestIncome, NetEarnings, DistrOfMoney, NonDedExpense, 
                      DeprAdjust
FROM         dbo.WebK1Staging
WHERE     (ID1 IN (659, 707))
ORDER BY ID1
