

CREATE Procedure dbo.stpUpdateSttDocPayrollRecalc
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/


@Dte datetime
as



UPDATE    dbo.tblStt
SET              SttDocHourQty = 0, SttDocPaidAmt = 0
WHERE     (SttDate = @Dte)

UPDATE    dbo.vwUpdateDocPayroll1
SET              SttDocPaidAmt = isnull(TotalEarnings,0)
WHERE     (SttDate = @Dte)

UPDATE    dbo.vwUpdateDocPayroll1A
SET              SttDocHourQty = isnull(TotalHours,0)
WHERE     (SttDate = @Dte)

UPDATE    dbo.tblStt
SET              SttMDPaidAmt = 0
where SttDate = @Dte

UPDATE    dbo.vwUpdateDocPayroll2
SET              SttMDPaidAmt = isnull(TotalEarnings,0)
where SttDate = @Dte


UPDATE    dbo.tblStt
SET              SttRDPaidAmt = 0
Where SttDate = @Dte

UPDATE    dbo.vwUpdateDocPayroll3
SET              SttRDPaidAmt = isnull(TotalEarnings,0)
Where SttDate = @Dte

UPDATE    dbo.tblStt
SET              SttNonCurrMDAmt = 0
WHERE     (SttDate = @Dte)

UPDATE    vwUpdateDocPayroll4
SET              SttNonCurrMDAmt = isnull(TotalEarnings,0)
WHERE     (SttDate = @Dte)

UPDATE    dbo.tblStt
SET              SttNonCurrRDAmt = 0
WHERE     (SttDate = @Dte)

UPDATE    vwUpdateDocPayroll5
SET              SttNonCurrRDAmt = isnull(TotalEarnings,0)
WHERE     (SttDate = @Dte)

UPDATE    dbo.tblStt
SET              SttSurplusPayout = 0
WHERE     (SttDate = @Dte)

UPDATE    vwUpdateDocPayroll6
SET              SttSurplusPayout = isnull(TotalEarnings,0)
WHERE     (SttDate = @Dte)


	return 










