create PROCEDURE [dbo].[stpDeletetblPayByMonth] ( @PayMonth as datetime)

AS 
SET LOCK_TIMEOUT-1 
Set noCount On

-- =============================================
-- Author:		Owen Kennedy, Lussier Data
-- Create date: 2012-06-13
-- Description:	Used to delete tblPay records and null tblStt
--			records form the given month
--			ex.	exec [stpDeletetblPayByMonth] '08/01/2011'	
-- =============================================

/* Delete from tblPay where input date   */
delete from tblPay where PayMonth = @PayMonth

/* Set SttDate records to null    */
update     dbo.tblStt
SET       SttBillSpecScribesAmt =0, 
	SttBillSpecSitePersonnelAmt =0, 
	SttDocHourQty =0, 
	SttDocPaidAmt =0, 
	SttMDPaidAmt =0/*, 
	SttNonCurrMDPaidAmt =0*/,   -- No field exists with this name
	SttPACost =0, 
	SttPAHoursQty =0, 
	SttSurplusPayout =0, 
	SttNonCurrMDAmt =0, 
	SttNonCurrRDAmt =0, 
	SttRDPaidAmt =0
WHERE     SttDate = @PayMonth


