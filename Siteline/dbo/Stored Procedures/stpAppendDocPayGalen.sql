CREATE PROCEDURE dbo.stpAppendDocPayGalen
AS INSERT INTO dbo.tblDocPay
                         (DocPayLbrMagic, DocPayLbrFlxIDEb, DocPayLbrFlxIDP2, DocPayLbrCRC, DocPayLbrSource, DocPayLbrNote, DocPayLbrFlxID, DocPayLbrDateAdd, DocPayLbrDateMod, DocPayLbrDateDel, DocPayLbrDateBeg, 
                         DocPayLbrDateEnd, DocPayLbrDateRBeg, DocPayLbrDateREnd, DocPayLbrUserName, DocPayLbrRecType, DocPayLbrArchive, DocPayLbrPayPeriod, DocPayLbrPSID, DocPayLbrDivDept, DocPayLbrDistCode, 
                         DocPayLbrPayClass, DocPayLbrRateCode, DocPayLbrTotalHours, DocPayLbrTotalEarnings, DocPayLbrRatePaid, DocPayLbrChrgDivDept, DocPayLbrDistData, DocPayLbrAdjCode, DocPayLbrPayFreq, 
                         DocPayLbrSocNumber, DocPayLbrEmpName, DocPayLbrMiscData, DocPayLbrMaritalStatus, DocPayLbrSex, DocPayLbrUCState, DocPayLbrSecPayCode, DocPayLbrVoidManCode, DocPayLbrVacCode, 
                         DocPayLbrSickCode, DocPayLbrBaseRateDec, DocPayLbrBaseRate, DocPayLbrDiv, DocPayLbrChrgDiv, DocPayLbrDept, DocPayLbrChrgDept, DocPaySite, DocPayPaycode, DocPayPaytype)
SELECT        dbo.tblTempPAData.LbrMagic, dbo.tblTempPAData.LbrFlxIDEb, dbo.tblTempPAData.LbrFlxIDP2, dbo.tblTempPAData.LbrCRC, dbo.tblTempPAData.LbrSource, dbo.tblTempPAData.LbrNote, 
                         dbo.tblTempPAData.LbrFlxID, dbo.tblTempPAData.LbrDateAdd, dbo.tblTempPAData.LbrDateMod, dbo.tblTempPAData.LbrDateDel, dbo.tblTempPAData.LbrDateBeg, dbo.tblTempPAData.LbrDateEnd, 
                         dbo.tblTempPAData.LbrDateRBeg, dbo.tblTempPAData.LbrDateREnd, dbo.tblTempPAData.LbrUserName, dbo.tblTempPAData.LbrRecType, dbo.tblTempPAData.LbrArchive, dbo.tblTempPAData.LbrPayPeriod, 
                         dbo.tblTempPAData.LbrPSID, dbo.tblTempPAData.LbrDivDept, dbo.tblTempPAData.LbrDistCode, dbo.tblTempPAData.LbrPayClass, dbo.tblTempPAData.LbrRateCode, dbo.tblTempPAData.LbrTotalHours, 
                         dbo.tblTempPAData.LbrTotalEarnings, dbo.tblTempPAData.LbrRatePaid, dbo.tblTempPAData.LbrChrgDivDept, dbo.tblTempPAData.LbrDistData, dbo.tblTempPAData.LbrAdjCode, dbo.tblTempPAData.LbrPayFreq, 
                         dbo.tblTempPAData.LbrSocNumber, dbo.tblTempPAData.LbrEmpName, dbo.tblTempPAData.LbrMiscData, dbo.tblTempPAData.LbrMaritalStatus, dbo.tblTempPAData.LbrSex, dbo.tblTempPAData.LbrUCState, 
                         dbo.tblTempPAData.LbrSecPayCode, dbo.tblTempPAData.LbrVoidManCode, dbo.tblTempPAData.LbrVacCode, dbo.tblTempPAData.LbrSickCode, dbo.tblTempPAData.LbrBaseRateDec, 
                         dbo.tblTempPAData.LbrBaseRate, dbo.tblTempPAData.LbrDiv, dbo.tblTempPAData.LbrChrgDiv, dbo.tblTempPAData.LbrDept, dbo.tblTempPAData.LbrChrgDept, dbo.tblCtr.CtrKey, 11 AS Expr1, 
                         'ER Profee - current month' AS Expr2
FROM            dbo.tblTempPAData INNER JOIN
                         dbo.tblCtr ON dbo.tblTempPAData.LbrChrgDept = dbo.tblCtr.CtrPlatinumID
WHERE        (dbo.tblTempPAData.LbrChrgDiv = 1)
