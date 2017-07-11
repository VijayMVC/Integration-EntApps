CREATE PROCEDURE [dbo].[stpAppendtblPayPayrollFile] ( @PR19FileName as varchar(255))
AS 

/*  To load data from Payroll file to tblPay
	Month Parameter taken from tlkpPayrollImportMonthParam which gets updated from Access Form
	@PR19FileName comes from File being loaded
*/


Declare @localPayMonth as datetime
declare @FileNameCount as int

--Set local variables
set @localPayMonth = (select distinct ImportMonth from tlkpPayrollImportMonthParam)
set @FileNameCount= (select COUNT(*) from tblPay where PayFileName = @PR19FileName) 

--Check filename field to see if PR197 already loaded, if not then insert
if @FileNameCount  = 0 begin  
INSERT INTO tblPay
                      (Pay_CtrID, Pay_CntID, PayMonth, PayPaidAmt, PayHours, PayPayType, PayPayCode, PayPayCodeSummary, PayJobCode, PayJobCodeSummary, 
                      PaySitelineClass, PayFullName, PayGLPostDate, PayCheckDate, PayProcLevel, PaySource, PayFileName, PayImportDate, PayDistCompany5, 
                      PayAccount3, PayAccountUnit, PayChkNbr, PayLawsonID )
SELECT   dbo.tblCtr.CtrID, dbo.tblCnt.CntID, 
	 @localPayMonth,
	  convert(money,ISNULL(dbo.PR197.[DIST-AMT], 0)) AS Expr10, 
                      ISNULL(dbo.PR197.[DIST-HOURS], 0) AS Expr9, 
                      CASE PayCodeName WHEN 'OVD' THEN 'O' WHEN 'OVT' THEN 'O' WHEN 'OV7' THEN 'O' ELSE 'R' END AS Expr1, dbo.PR197.[PAY-CODE], 
                      dbo.tlkpPayCode.PayCodeDesc, dbo.PR197.[JOB-CODE], dbo.tlkpJobCode.JobCodeJBCDescription, 
                      CASE WHEN [PAY-CODE] = '87A' THEN [PayCodeSitelineClass] WHEN LEFT([JobCodeID], 1) 
                      = 'P' THEN [PayCodeSitelineClass] 
                      when LEFT([PAY-CODE], 1) = 'P'      then   [PayCodeSitelineClass] 
                      ELSE [JobCodeSitelineClass] END AS Expr2, dbo.PR197.[FULL-NAME-2], 
                      CAST(dbo.PR197.[POSTING-DATE-2] AS DateTime) AS Expr3, CAST(dbo.PR197.[PAYMENT-DATE-3] AS DateTime) AS Expr7, 
                      dbo.PR197.[DIST-PROC-LEV], 'Lawson' AS Expr4, @PR19FileName, GETDATE() AS Expr5, 
                      dbo.PR197.[DIST-COMPANY-5], dbo.PR197.[ACCOUNT-3], dbo.PR197.[ACCT-UNIT-3], [CHECK-NBR]  , CntLawsonNumber          
FROM         dbo.PR197 LEFT OUTER JOIN
                      dbo.tlkpJobCode ON dbo.PR197.[JOB-CODE] = dbo.tlkpJobCode.JobCodeID LEFT OUTER JOIN
                      dbo.tblCnt ON dbo.PR197.[EMPLOYEE-2] = dbo.tblCnt.CntLawsonNumber LEFT OUTER JOIN
                      dbo.tlkpPayCode ON dbo.PR197.[PAY-CODE] = dbo.tlkpPayCode.PayCodeName LEFT OUTER JOIN
                      dbo.tblCtr ON dbo.PR197.[ACCT-UNIT-3] = dbo.tblCtr.CtrTIN/**/
WHERE     (dbo.PR197.[JOB-CODE] IS NOT NULL)

end










