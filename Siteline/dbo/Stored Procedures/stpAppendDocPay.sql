CREATE Procedure dbo.stpAppendDocPay
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@DocPayAffected int OUTPUT

As
declare @DocPayCountStart int, @DocPayCountEnd int

SELECT  @DocPayCountStart = COUNT(DocPayID) FROM dbo.tblDocPay 

alter table dbo.tblDocPay disable trigger tblDocPay_Insert

	INSERT INTO tblDocPay (DocPayLbrMagic, DocPayLbrFlxIDEb, DocPayLbrFlxIDP2, DocPayLbrCRC, DocPayLbrSource, DocPayLbrNote, DocPayLbrFlxID, DocPayLbrDateAdd, DocPayLbrDateMod, DocPayLbrDateDel, DocPayLbrDateBeg, DocPayLbrDateEnd, DocPayLbrDateRBeg, DocPayLbrDateREnd, DocPayLbrUserName, DocPayLbrRecType, DocPayLbrArchive, DocPayLbrPayPeriod, DocPayLbrPSID, DocPayLbrDivDept, DocPayLbrDistCode, DocPayLbrPayClass, DocPayLbrRateCode, DocPayLbrTotalHours, DocPayLbrTotalEarnings, DocPayLbrRatePaid, DocPayLbrChrgDivDept, DocPayLbrDistData, DocPayLbrAdjCode, DocPayLbrPayFreq, DocPayLbrSocNumber, DocPayLbrEmpName, DocPayLbrMiscData, DocPayLbrMaritalStatus, DocPayLbrSex, DocPayLbrUCState, DocPayLbrSecPayCode, DocPayLbrVoidManCode, DocPayLbrVacCode, DocPayLbrSickCode, DocPayLbrBaseRateDec, DocPayLbrBaseRate, DocPayLbrDiv, DocPayLbrChrgDiv, DocPayLbrDept, DocPayLbrChrgDept,  DocPaySite, DocPayPaycode, DocPayPaytype)
SELECT dbo.tblTempDatMonthly.LbrMagic, 
    dbo.tblTempDatMonthly.LbrFlxIDEb, 
    dbo.tblTempDatMonthly.LbrFlxIDP2, 
    dbo.tblTempDatMonthly.LbrCRC, 
    dbo.tblTempDatMonthly.LbrSource, 
    dbo.tblTempDatMonthly.LbrNote, 
    dbo.tblTempDatMonthly.LbrFlxID, 
    dbo.tblTempDatMonthly.LbrDateAdd, 
    dbo.tblTempDatMonthly.LbrDateMod, 
    dbo.tblTempDatMonthly.LbrDateDel, 
    dbo.tblTempDatMonthly.LbrDateBeg, 
    dbo.tblTempDatMonthly.LbrDateEnd, 
    dbo.tblTempDatMonthly.LbrDateRBeg, 
    dbo.tblTempDatMonthly.LbrDateREnd, 
    dbo.tblTempDatMonthly.LbrUserName, 
    dbo.tblTempDatMonthly.LbrRecType, 
    dbo.tblTempDatMonthly.LbrArchive, 
    dbo.tblTempDatMonthly.LbrPayPeriod, 
    dbo.tblTempDatMonthly.LbrPSID, 
    dbo.tblTempDatMonthly.LbrDivDept, 
    dbo.tblTempDatMonthly.LbrDistCode, 
    dbo.tblTempDatMonthly.LbrPayClass, 
    dbo.tblTempDatMonthly.LbrRateCode, 
    dbo.tblTempDatMonthly.LbrTotalHours, 
    dbo.tblTempDatMonthly.LbrTotalEarnings, 
    dbo.tblTempDatMonthly.LbrRatePaid, 
    dbo.tblTempDatMonthly.LbrChrgDivDept, 
    dbo.tblTempDatMonthly.LbrDistData, 
    dbo.tblTempDatMonthly.LbrAdjCode, 
    dbo.tblTempDatMonthly.LbrPayFreq, 
    dbo.tblTempDatMonthly.LbrSocNumber, 
    dbo.tblTempDatMonthly.LbrEmpName, 
    dbo.tblTempDatMonthly.LbrMiscData, 
    dbo.tblTempDatMonthly.LbrMaritalStatus, 
    dbo.tblTempDatMonthly.LbrSex, 
    dbo.tblTempDatMonthly.LbrUCState, 
    dbo.tblTempDatMonthly.LbrSecPayCode, 
    dbo.tblTempDatMonthly.LbrVoidManCode, 
    dbo.tblTempDatMonthly.LbrVacCode, 
    dbo.tblTempDatMonthly.LbrSickCode, 
    dbo.tblTempDatMonthly.LbrBaseRateDec, 
    dbo.tblTempDatMonthly.LbrBaseRate, 
    dbo.tblTempDatMonthly.LbrDiv, 
    dbo.tblTempDatMonthly.LbrChrgDiv, 
    dbo.tblTempDatMonthly.LbrDept, 
    dbo.tblTempDatMonthly.LbrChrgDept, 
     
    dbo.tblTempDatMonthly.Site, dbo.tblTempDatMonthly.Paycode, 
    dbo.tblTempDatMonthly.Paytype
FROM dbo.tblDocPay RIGHT OUTER JOIN
    dbo.tblTempDatMonthly ON 
    dbo.tblDocPay.DocPayLbrFlxID = dbo.tblTempDatMonthly.LbrFlxID
WHERE (dbo.tblDocPay.DocPayID IS NULL)

SELECT  @DocPayCountEnd = COUNT(DocPayID) FROM dbo.tblDocPay 

Set @DocPayAffected = (@DocPayCountEnd-@DocPayCountStart)

alter table dbo.tblDocPay enable trigger tblDocPay_Insert
	return 

