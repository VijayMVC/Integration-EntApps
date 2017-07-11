CREATE PROCEDURE [dbo].[stpAppendtblPayGLInterface]
AS 

/*  
	To load data from GLInterface to tblPay where Check number not already
	In tblPay or Record has check type 'R' for reversal 
*/

declare @CurrentDate as datetime
set @CurrentDate = GETDATE()
Begin
INSERT INTO tblPay
                      (Pay_CtrID, Pay_CntID, PayMonth, PayPaidAmt, PayHours, PayPayType, PayPayCode, PayPayCodeSummary, PayJobCode, PayJobCodeSummary, 
                      PaySitelineClass, PayFullName, PayGLPostDate, PayCheckDate, PayProcLevel, PaySource, PayFileName, PayImportDate, PayDistCompany5, 
                      PayAccount3, PayAccountUnit, PayChkNbr, PayLawsonID)
SELECT     dbo.tblCtr.CtrID, dbo.tblCnt.CntID, 
	 convert(datetime,right([DATA-MONTH],2)+ '/'+'1/'+ left([DATA-MONTH],4),102),
	  convert(money,ISNULL(dbo.GLInterface.[DIST-AMT], 0)) AS Expr10, 
                      ISNULL(dbo.GLInterface.[DIST-HOURS], 0) AS Expr9, 
                      CASE PayCodeName WHEN 'OVD' THEN 'O' WHEN 'OVT' THEN 'O' WHEN 'OV7' THEN 'O' ELSE 'R' END AS Expr1, dbo.GLInterface.[PAY-CODE], 
                      dbo.tlkpPayCode.PayCodeDesc, dbo.GLInterface.[JOB-CODE], dbo.tlkpJobCode.JobCodeJBCDescription, 
                      CASE WHEN [PAY-CODE] = '87A' THEN [PayCodeSitelineClass] WHEN LEFT([JobCodeID], 1) 
                      = 'P' THEN [PayCodeSitelineClass] 
                      when LEFT([PAY-CODE], 1) = 'P'      then   [PayCodeSitelineClass] 
                      ELSE [JobCodeSitelineClass] END AS Expr2, dbo.GLInterface.[FULL-NAME-2], 
                      CAST(dbo.GLInterface.[POSTING-DATE-2] AS DateTime) AS Expr3, CAST(dbo.GLInterface.[PAYMENT-DATE-3] AS DateTime) AS Expr7, 
                      dbo.GLInterface.[DIST-PROC-LEV], 'Lawson' AS Expr4, 'GLInterface', @CurrentDate, 
                      dbo.GLInterface.[DIST-COMPANY-5], dbo.GLInterface.[ACCOUNT-3], dbo.GLInterface.[ACCT-UNIT-3], [CHECK-NBR], dbo.tblCnt.CntLawsonNumber
FROM         dbo.GLInterface LEFT OUTER JOIN
                      dbo.tlkpJobCode ON dbo.GLInterface.[JOB-CODE] = dbo.tlkpJobCode.JobCodeID LEFT OUTER JOIN
                      dbo.tblCnt ON dbo.GLInterface.[EMPLOYEE-2] = dbo.tblCnt.CntLawsonNumber LEFT OUTER JOIN
                      dbo.tlkpPayCode ON dbo.GLInterface.[PAY-CODE] = dbo.tlkpPayCode.PayCodeName LEFT OUTER JOIN
                      dbo.tblCtr ON dbo.GLInterface.[ACCT-UNIT-3] = dbo.tblCtr.CtrTIN
WHERE    ( (dbo.GLInterface.[JOB-CODE] IS NOT NULL) /*and [CHECK-NBR] not in (select distinct PayChkNbr from tblPay) *TOOK OUT 07/22/2012* */  )
		or ( (dbo.GLInterface.[JOB-CODE] IS NOT NULL) and [CHECK-TYPE] = 'R'  )
End



/*
INSERT INTO tblPay
                      (Pay_CtrID, Pay_CntID, PayMonth, PayPaidAmt, PayHours, PayPayType, PayPayCode, PayPayCodeSummary, PayJobCode, PayJobCodeSummary, 
                      PaySitelineClass, PayFullName, PayGLPostDate, PayCheckDate, PayProcLevel, PaySource, PayFileName, PayImportDate, PayDistCompany5, 
                      PayAccount3, PayAccountUnit, PayChkNbr, PayLawsonID)
SELECT     dbo.tblCtr.CtrID, dbo.tblCnt.CntID, 
	 convert(datetime,right([DATA-MONTH],2)+ '/'+'1/'+ left([DATA-MONTH],4),102),
	  convert(money,ISNULL(dbo.GLInterface.[DIST-AMT], 0)) AS Expr10, 
                      ISNULL(dbo.GLInterface.[DIST-HOURS], 0) AS Expr9, 
                      CASE PayCodeName WHEN 'OVD' THEN 'O' WHEN 'OVT' THEN 'O' WHEN 'OV7' THEN 'O' ELSE 'R' END AS Expr1, dbo.GLInterface.[PAY-CODE], 
                      dbo.tlkpPayCode.PayCodeDesc, dbo.GLInterface.[JOB-CODE], dbo.tlkpJobCode.JobCodeJBCDescription, 
                      CASE WHEN [PAY-CODE] = '87A' THEN [PayCodeSitelineClass] WHEN LEFT([JobCodeID], 1) 
                      = 'P' THEN [PayCodeSitelineClass] ELSE [JobCodeSitelineClass] END AS Expr2, dbo.GLInterface.[FULL-NAME-2], 
                      CAST(dbo.GLInterface.[POSTING-DATE-2] AS DateTime) AS Expr3, CAST(dbo.GLInterface.[PAYMENT-DATE-3] AS DateTime) AS Expr7, 
                      dbo.GLInterface.[DIST-PROC-LEV], 'Lawson' AS Expr4, 'GLInterface', @CurrentDate, 
                      dbo.GLInterface.[DIST-COMPANY-5], dbo.GLInterface.[ACCOUNT-3], dbo.GLInterface.[ACCT-UNIT-3], [CHECK-NBR], dbo.tblCnt.CntLawsonNumber
FROM         dbo.GLInterface LEFT OUTER JOIN
                      dbo.tlkpJobCode ON dbo.GLInterface.[JOB-CODE] = dbo.tlkpJobCode.JobCodeID LEFT OUTER JOIN
                      dbo.tblCnt ON dbo.GLInterface.[EMPLOYEE-2] = dbo.tblCnt.CntLawsonNumber LEFT OUTER JOIN
                      dbo.tlkpPayCode ON dbo.GLInterface.[PAY-CODE] = dbo.tlkpPayCode.PayCodeName LEFT OUTER JOIN
                      dbo.tblCtr ON dbo.GLInterface.[ACCT-UNIT-3] = dbo.tblCtr.CtrTIN
WHERE    ( (dbo.GLInterface.[JOB-CODE] IS NOT NULL) /*and [CHECK-NBR] not in (select distinct PayChkNbr from tblPay) *TOOK OUT 07/22/2012* */  )
		or ( (dbo.GLInterface.[JOB-CODE] IS NOT NULL) and [CHECK-TYPE] = 'R'  )
*/
Begin
--Update drop down look table tlkpMthYr with Date from current load if it is not in the table
Declare @dtDateMonth as datetime
set @dtDateMonth  = (select distinct convert(datetime,right([DATA_MONTH],2)+ '/'+'1/'+ left([DATA_MONTH],4),102) 
						from dbo.PR197)
If @dtDateMonth not in (select MthYrID from tlkpMthYr )
begin 
insert into tlkpMthYr(MthYrID) values (@dtDateMonth)
end 
End


