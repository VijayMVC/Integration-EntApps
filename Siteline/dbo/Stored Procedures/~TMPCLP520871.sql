﻿CREATE PROCEDURE dbo.[~TMPCLP520871]
(@MthYrID nvarchar(50))
AS INSERT INTO dbo.tblPR197MD
                      ([COMPANY-4], [NAME-3], [DIST-COMPANY-4], [PAYMENT-DATE-3], [DIST-COMPANY-5], [ACCT-UNIT-3], [ACCOUNT-3], [SUB-ACCT-3], [POSTING-DATE-2], 
                      [DESCRIPTION-3], [CONTINUED-2], [EMPLOYEE-2], [FULL-NAME-2], [DIST-UNITS], [DIST-HOURS], [DIST-AMT], [CHECK-NBR], [TEMP-STAR], [GL-DATE-2], 
                      [CHECK-TYPE], [PAY-CODE], [DED-CODE], [JOB-CODE], [DIST-PROC-LEV], [DEPARTMENT-3], [DIST-UNITS-2], [DIST-HOURS-2], [DIST-AMT-2], ACTIVITY, 
                      [ACCT-CATEGORY], POSITION, Description, DataSetDate, PR197MDFileName, PR197MD_MthYrID)
SELECT     [COMPANY-4], [NAME-3], [DIST-COMPANY-4], [PAYMENT-DATE-3], [DIST-COMPANY-5], [ACCT-UNIT-3], [ACCOUNT-3], [SUB-ACCT-3], [POSTING-DATE-2], 
                      [DESCRIPTION-3], [CONTINUED-2], [EMPLOYEE-2], [FULL-NAME-2], [DIST-UNITS], [DIST-HOURS], [DIST-AMT], [CHECK-NBR], [TEMP-STAR], [GL-DATE-2], 
                      [CHECK-TYPE], [PAY-CODE], [DED-CODE], [JOB-CODE], [DIST-PROC-LEV], [DEPARTMENT-3], [DIST-UNITS-2], [DIST-HOURS-2], [DIST-AMT-2], ACTIVITY, 
                      [ACCT-CATEGORY], POSITION, Description, DataSetDate, FileName, @MthYrID AS Expr1
FROM         dbo.PR197MD