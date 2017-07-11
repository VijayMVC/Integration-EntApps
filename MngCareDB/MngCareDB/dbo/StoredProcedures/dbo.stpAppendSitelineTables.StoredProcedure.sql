USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpAppendSitelineTables]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[stpAppendSitelineTables]

as

set nocount on

DELETE FROM tblSitelineCmp

DELETE FROM tblSitelineCtr


--Insert into tblSitelineCmp
INSERT INTO tblSitelineCmp
                      (CmpKey, CmpID, CmpSys_CmpID, CmpName, CmpCode, CmpAddress1, CmpAddress2, CmpCity, CmpState, CmpZip, CmpCountry, CmpPhone, CmpFax, CmpWeb, 
                      CmpSiteBedNo, CmpPhyGrpYN, CmpSysYN, CmpSiteYN, CmpBillAgentYN, CmpMalCarYN, CmpOtherYN, CmpTranscriptYN, CmpIPAYN, CmpContractingYN, 
                      CmpComment, CmpDateCreate, CmpDateEdit, CmpDateInactive, CmpInactiveYN, CmpFlagYN, CmpIPAContact, CmpIPA_CntID, CmpIPAEmail, CmpIPAComment, 
                      CmpCompanyNameBilling, CmpAddressBilling, CmpCityBilling, CmpStateBilling, CmpZipBilling, CmpPhoneBilling, CmpFaxBilling, CmpContactBilling, 
                      CmpEmailBilling, CmpCommentBilling, CmpCompanyNameRefund, CmpAddressRefund, CmpCityRefund, CmpStateRefund, CmpZipRefund, CmpPhoneRefund, 
                      CmpFaxRefund, CmpContactRefund, CmpEmailRefund, CmpCommentRefund, CmpCompanyNameAppeal, CmpAddressAppeal, CmpCityAppeal, CmpStateAppeal, 
                      CmpZipAppeal, CmpPhoneAppeal, CmpFaxAppeal, CmpContactAppeal, CmpEmailAppeal, CmpCommentAppeal, CmpCompanyNameContracting, 
                      CmpContracting_CmpID, CmpContracting_CntID, CmpAddressContracting, CmpCityContracting, CmpStateContracting, CmpZipContracting, CmpPhoneContracting, 
                      CmpFaxContracting, CmpContactContracting, CmpEmailContracting, CmpCommentContracting)
SELECT     CmpKey, CmpID, CmpSys_CmpID, CmpName, CmpCode, CmpAddress1, CmpAddress2, CmpCity, CmpState, CmpZip, CmpCountry, CmpPhone, CmpFax, CmpWeb, 
                      CmpSiteBedNo, CmpPhyGrpYN, CmpSysYN, CmpSiteYN, CmpBillAgentYN, CmpMalCarYN, CmpOtherYN, CmpTranscriptYN, CmpIPAYN, CmpContractingYN, 
                      CmpComment, CmpDateCreate, CmpDateEdit, CmpDateInactive, CmpInactiveYN, CmpFlagYN, CmpIPAContact, CmpIPA_CntID, CmpIPAEmail, CmpIPAComment, 
                      CmpCompanyNameBilling, CmpAddressBilling, CmpCityBilling, CmpStateBilling, CmpZipBilling, CmpPhoneBilling, CmpFaxBilling, CmpContactBilling, 
                      CmpEmailBilling, CmpCommentBilling, CmpCompanyNameRefund, CmpAddressRefund, CmpCityRefund, CmpStateRefund, CmpZipRefund, CmpPhoneRefund, 
                      CmpFaxRefund, CmpContactRefund, CmpEmailRefund, CmpCommentRefund, CmpCompanyNameAppeal, CmpAddressAppeal, CmpCityAppeal, CmpStateAppeal, 
                      CmpZipAppeal, CmpPhoneAppeal, CmpFaxAppeal, CmpContactAppeal, CmpEmailAppeal, CmpCommentAppeal, CmpCompanyNameContracting, 
                      CmpContracting_CmpID, CmpContracting_CntID, CmpAddressContracting, CmpCityContracting, CmpStateContracting, CmpZipContracting, CmpPhoneContracting, 
                      CmpFaxContracting, CmpContactContracting, CmpEmailContracting, CmpCommentContracting
FROM         SiteLine.dbo.tblCmp


--Insert into tblSitelineCtr
INSERT INTO tblSitelineCtr
                      (CtrID, CtrSite_CmpID, CtrSys_CmpID, CtrTranscript_CmpID, CtrBillAgt_CmpID, CtrPhyGrp_CmpID, CtrMlp_CmpID, CtrBillCmpIDNum, CtrMedDir_CntID, 
                      CtrCamAssigned_CntID, Ctr_CtrTypID, Ctr_RgnID, Ctr_MlpRgnID, CtrKey, CtrHPID, CtrPlatinumID, CtrDateStart, CtrDateEffect, CtrDateRenew, CtrDateEnd, CtrYrQty, 
                      CtrSysCtrYN, CtrAutoRenewYN, CtrEndNoCseYN, CtrNoCseDayQty, CtrEndCseYN, CtrCseDayQty, CtrRemDayQty, CtrPriorAdjCollWIPAmtDefault, 
                      CtrPriorCollectARDefault, CtrPriorCollFeeAmtDefault, CtrPriorLoanBalDefault, CtrStipAmt, CtrStipDesc, CtrOtherPayAmt, CtrOtherPayDesc, CtrEmpPhysPaid, 
                      CtrWrkCompPaidYN, CtrCompeteClauseYN, CtrBillRecDayQty, CtrBillAgtDateStart, CtrMlpDateEffect, CtrTrmCtrYN, CtrPrmBseYN, CtrRsdAff, CtrElecLogYN, 
                      CtrNrsInitProtoYN, CtrTriageProtoYN, CtrClnPthwyYN, CtrPrcGdeYN, CtrComputeAfcYN, CtrElecMedRcdYN, CtrObsvUnitYN, CtrChstPnYN, CtrFastTrkYn, CtrOccMedYN, 
                      CtrHspYN, CtrSameStoreYN, CtrGoodMethodYN, CtrChestPainYN, CtrElectronicTrackYN, CtrPainMgmt, CtrAllowNursesYN, CtrPhySpecificDataYN, 
                      CtrComplaintMgtPrgYN, CtrSatisfactionTool, CtrSatisfactionTeamYN, CtrEDVolume, CtrAdmissionPct, CtrTransferPct, CtrStatPITpct, CtrStatRDpct, CtrStatMDpct, 
                     CtrStatContribpct, CtrBseHour, CtrBillRate, CtrIncExpComment, CtrSiteOvrHdpct, CtrIntRate, CtrMlpFlatFee, CtrMplSecondRate, CtrLclPct, CtrLclFixedAmt, 
                      CtrMDIncentivePct, CtrRDIncentivePct, CtrSurplusReservePct, zCtrMPRate, CtrDateFeeInc, CtrPctInc, CtrNightPct, CtrDiffRate, CtrDiffAmt, CtrDayRate, CtrNightRate, 
                      CtrBedQty, CtrFastTrackBedQty, CtrOtherBedQty, CtrCriticalCareBedQty, CtrObservationBedQty, CtrEmail, CtrDateCreate, CtrDateEdit, CtrInactiveYn, 
                      CtrTraumaDesignation, CtrFlagYn, CtrComment, CtrRequireMailYN, CtrCEPSurchargePct, CtrMngCarBatchYN, CtrMisc1YN, CtrMisc2YN, CtrMisc3YN, CtrMisc4YN, 
                      CtrMisc5YN, CtrPASupportCostPct, CtrTIN, CtrDivision)
SELECT     CtrID, CtrSite_CmpID, CtrSys_CmpID, CtrTranscript_CmpID, CtrBillAgt_CmpID, CtrPhyGrp_CmpID, CtrMlp_CmpID, CtrBillCmpIDNum, CtrMedDir_CntID, 
                      CtrCamAssigned_CntID, Ctr_CtrTypID, Ctr_RgnID, Ctr_MlpRgnID, CtrKey, CtrHPID, CtrPlatinumID, CtrDateStart, CtrDateEffect, CtrDateRenew, CtrDateEnd, CtrYrQty, 
                      CtrSysCtrYN, CtrAutoRenewYN, CtrEndNoCseYN, CtrNoCseDayQty, CtrEndCseYN, CtrCseDayQty, CtrRemDayQty, CtrPriorAdjCollWIPAmtDefault, 
                      CtrPriorCollectARDefault, CtrPriorCollFeeAmtDefault, CtrPriorLoanBalDefault, CtrStipAmt, CtrStipDesc, CtrOtherPayAmt, CtrOtherPayDesc, CtrEmpPhysPaid, 
                      CtrWrkCompPaidYN, CtrCompeteClauseYN, CtrBillRecDayQty, CtrBillAgtDateStart, CtrMlpDateEffect, CtrTrmCtrYN, CtrPrmBseYN, CtrRsdAff, CtrElecLogYN, 
                      CtrNrsInitProtoYN, CtrTriageProtoYN, CtrClnPthwyYN, CtrPrcGdeYN, CtrComputeAfcYN, CtrElecMedRcdYN, CtrObsvUnitYN, CtrChstPnYN, CtrFastTrkYn, CtrOccMedYN, 
                      CtrHspYN, CtrSameStoreYN, CtrGoodMethodYN, CtrChestPainYN, CtrElectronicTrackYN, CtrPainMgmt, CtrAllowNursesYN, CtrPhySpecificDataYN, 
                      CtrComplaintMgtPrgYN, CtrSatisfactionTool, CtrSatisfactionTeamYN, CtrEDVolume, CtrAdmissionPct, CtrTransferPct, CtrStatPITpct, CtrStatRDpct, CtrStatMDpct, 
                      CtrStatContribpct, CtrBseHour, CtrBillRate, CtrIncExpComment, CtrSiteOvrHdpct, CtrIntRate, CtrMlpFlatFee, CtrMplSecondRate, CtrLclPct, CtrLclFixedAmt, 
                      CtrMDIncentivePct, CtrRDIncentivePct, CtrSurplusReservePct, zCtrMPRate, CtrDateFeeInc, CtrPctInc, CtrNightPct, CtrDiffRate, CtrDiffAmt, CtrDayRate, CtrNightRate, 
                      CtrBedQty, CtrFastTrackBedQty, CtrOtherBedQty, CtrCriticalCareBedQty, CtrObservationBedQty, CtrEmail, CtrDateCreate, CtrDateEdit, CtrInactiveYn, 
                      CtrTraumaDesignation, CtrFlagYn, CtrComment, CtrRequireMailYN, CtrCEPSurchargePct, CtrMngCarBatchYN, CtrMisc1YN, CtrMisc2YN, CtrMisc3YN, CtrMisc4YN, 
                      CtrMisc5YN, CtrPASupportCostPct, CtrTIN, CtrDivision
FROM         SiteLine.dbo.tblCtr




set nocount off

return
GO
