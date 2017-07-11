CREATE PROCEDURE dbo.stpAppendTempPay
@SQL varchar (5000)

AS

Truncate Table dbo.tblTempPay


Exec (@SQL)

	/* SET NOCOUNT ON */
	RETURN 


