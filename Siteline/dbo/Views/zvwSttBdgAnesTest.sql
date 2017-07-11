


CREATE VIEW [dbo].[zvwSttBdgAnesTest]
AS
SELECT   top 1   dbo.tblBdg.Bdg_CtrID, dbo.tblBdg.BdgYear, dbo.tblBdg.BdgID, dbo.tblBdg.BdgKey, dbo.tblBdg.BdgAvgChgPt, dbo.tblBdg.BdgBillFee, dbo.tblBdg.BdgBillRate, 
                      dbo.tblBdg.BdgBillSpec, dbo.tblBdg.BdgBlendedHrs, dbo.tblBdg.BdgBlendedPtsHr, dbo.tblBdg.BdgCEPRetentionAmt, dbo.tblBdg.BdgCEPRetentionPct, 
                      dbo.tblBdg.BdgCollPerPt, dbo.tblBdg.BdgContribCEP, dbo.tblBdg.BdgContribPct, dbo.tblBdg.BdgDocEarnedHrly, dbo.tblBdg.BdgDocHours, dbo.tblBdg.BdgDonations, 
                      dbo.tblBdg.BdgEncounters, dbo.tblBdg.BdgFixedLocalAmt, dbo.tblBdg.BdgGrossColl, dbo.tblBdg.BdgInterest, dbo.tblBdg.BdgInterestRate, dbo.tblBdg.BdgLclExp, 
                      dbo.tblBdg.BdgLclExpPct, dbo.tblBdg.BdgLclPct, dbo.tblBdg.BdgLclVarAmt, dbo.tblBdg.BdgMalpractice, dbo.tblBdg.BdgMDearned, dbo.tblBdg.BdgMDpct, 
                      dbo.tblBdg.BdgMPFlatFeeAmt, dbo.tblBdg.BdgMPRate, dbo.tblBdg.BdgNetPctofNOR, dbo.tblBdg.BdgNetRevPerPt, dbo.tblBdg.BdgNOR, dbo.tblBdg.BdgOffTop, 
                      dbo.tblBdg.BdgOthRcpts, dbo.tblBdg.BdgPACost, dbo.tblBdg.BdgPACostHr, dbo.tblBdg.BdgPACostPct, dbo.tblBdg.BdgPAHours, dbo.tblBdg.BdgPASupportCostAmt, 
                      dbo.tblBdg.BdgPASupportCostPct, dbo.tblBdg.BdgPatients, dbo.tblBdg.BdgPstChgs, dbo.tblBdg.BdgPTCost, dbo.tblBdg.BdgPITpct, dbo.tblBdg.BdgPITearned, 
                      dbo.tblBdg.BdgPITEarnedPct, dbo.tblBdg.BdgPTCostPct, dbo.tblBdg.BdgPtsPerHr, dbo.tblBdg.BdgRDearned, dbo.tblBdg.BdgRDpct, dbo.tblBdg.BdgStipendsRcvd, 
                      dbo.tblBdg.BdgTargetRate, dbo.tblBdg.BdgSiteNetInc, dbo.tblBdg.BdgSiteOverhead, dbo.tblBdg.BdgSiteOvrHdAmt, dbo.tblBdg.BdgSiteOvrHdPct, 
                      dbo.tblBdg.BdgTotalColl, dbo.tblBdg.BdgDateCreate, dbo.tblBdg.BdgDateEdit, dbo.tblBdg.BdgFlagYN, dbo.tblBdg.BdgInactiveYN, dbo.tblStt.SttDate, 
                      dbo.tblStt.Stt_CtrID, dbo.tblStt.Stt_BdgID, dbo.tblStt.Stt_BdgYear, dbo.tblStt.SttID, dbo.tblStt.SttKey, dbo.tblStt.SttLink, dbo.tblStt.SttAccExpenseAmt, 
                      dbo.tblStt.SttAdmitQty, dbo.tblStt.SttBillFee, dbo.tblStt.SttBillRate, dbo.tblStt.SttBillSpec, dbo.tblStt.SttBillSpecMBSIAmt, dbo.tblStt.SttBillSpecScribesAmt, 
                      dbo.tblStt.SttBillSpecScribesAdjAmt, dbo.tblStt.SttBillSpecSitePersonnelAmt, dbo.tblStt.SttBillSpecSitePersonnelAdjAmt, dbo.tblStt.SttBseHour, dbo.tblStt.SttChartQty, 
                      dbo.tblStt.SttChartPostQty, dbo.tblStt.SttChartMissQty, dbo.tblStt.SttChartMiss30Qty, dbo.tblStt.SttCashARAmt, dbo.tblStt.SttCEPSurchargePct, 
                      dbo.tblStt.SttCollectibleARAmt, dbo.tblStt.SttCollectWIP, dbo.tblStt.SttContribPct, dbo.tblStt.SttCurrLoanBal, dbo.tblStt.SttDiffAmt, dbo.tblStt.SttDiffRate, 
                      dbo.tblStt.SttDocHourQty, dbo.tblStt.SttDocPaidAdjAmt, dbo.tblStt.SttDocPaidAmt, dbo.tblStt.SttDonationAmt, dbo.tblStt.SttFixedLocalAmt, dbo.tblStt.SttIntRate, 
                      dbo.tblStt.SttLclExp, dbo.tblStt.SttLclPct, dbo.tblStt.SttLclVarAmt, dbo.tblStt.SttMDIncentiveAmt, dbo.tblStt.SttMDIncentivePct, dbo.tblStt.SttMDPaidAmt, 
                      dbo.tblStt.SttMDpct, dbo.tblStt.SttMPFlatFeeAmt, dbo.tblStt.SttMPRate, dbo.tblStt.SttMPUCRate, dbo.tblStt.SttNightPct, dbo.tblStt.SttNonCurrAdjAmt, 
                      dbo.tblStt.SttNonCurrMDAmt, dbo.tblStt.SttNonCurrRDAmt, dbo.tblStt.SttNorAmt, dbo.tblStt.SttOffTop, dbo.tblStt.SttOtherRcpts, dbo.tblStt.SttPAAdjAmt, 
                      dbo.tblStt.SttPACost, dbo.tblStt.SttPAhoursQty, dbo.tblStt.SttPASupportCostPct, dbo.tblStt.SttPatVisitQty, dbo.tblStt.SttPatVisitUCQty, dbo.tblStt.SttPatVisitReturnQty, 
                      dbo.tblStt.SttPhysTherVisitQty, dbo.tblStt.SttPstChgs, dbo.tblStt.SttPTCost, dbo.tblStt.SttPTAdjAmt, dbo.tblStt.SttPTOAccrualRate, dbo.tblStt.SttPtsKeyed, 
                      dbo.tblStt.SttRDIncentiveAmt, dbo.tblStt.SttRDIncentivePct, dbo.tblStt.SttRDPaidAmt, dbo.tblStt.SttRDpct, dbo.tblStt.SttRefAR, dbo.tblStt.SttSiteOvrHdPct, 
                      dbo.tblStt.SttSrpAdjAmt, dbo.tblStt.SttSrpAdjAmtComment, dbo.tblStt.SttSrpAdjAmtPct, dbo.tblStt.SttStatPITpct, dbo.tblStt.SttStipRcvd, dbo.tblStt.SttSurplusPayout, 
                      dbo.tblStt.SttSurplusReserveNote, dbo.tblStt.SttSurplusReservePct, dbo.tblStt.SttSurplusReserveAmt, dbo.tblStt.SttTargetRate, dbo.tblStt.SttPTOTrueUpAdj, 
                      dbo.tblStt.SttCommentOther, dbo.tblStt.SttUnspecifiedComment, dbo.tblStt.SttValuationGainLossComment, dbo.tblStt.SttWIPGainLossComment, 
                      dbo.tblStt.SttCommentInternal, dbo.tblStt.SttDateCreate, dbo.tblStt.SttDateEdit, dbo.tblStt.SttInactiveYN, dbo.tblStt.SttFlagYN, dbo.tblStt.SttAdjCollWIPAmt, 
                      dbo.tblStt.SttAvgChgPt, dbo.tblStt.SttBlendedHrs, dbo.tblStt.SttBlendedPtsPerHr, dbo.tblStt.SttCashExpAmt, dbo.tblStt.SttCashRcptAmt, dbo.tblStt.SttCEPSurchargeAmt, 
                      dbo.tblStt.SttCollFeeAmt, dbo.tblStt.SttCollFeeChgAmt, dbo.tblStt.SttCollPerPtAmt, dbo.tblStt.SttCompPITpct, dbo.tblStt.SttCompMDpct, dbo.tblStt.SttCompRDpct, 
                      dbo.tblStt.SttContribCEPAmt, dbo.tblStt.SttDayRate, dbo.tblStt.SttDocEarnedHourAmt, dbo.tblStt.SttDocPaidHourAmt, dbo.tblStt.SttDocPITearnedAmt, 
                      dbo.tblStt.SttEndCollectAR, dbo.tblStt.SttGrossCollAmt, dbo.tblStt.SttIntAmt, dbo.tblStt.SttLclExpPct, dbo.tblStt.SttMDEarnedAmt, dbo.tblStt.SttMDLclAmt, 
                      dbo.tblStt.SttMlpAmt, dbo.tblStt.SttNetAmt, dbo.tblStt.SttNetChangeinARAmt, dbo.tblStt.SttNetPctofNOR, dbo.tblStt.SttNetRevPerPtAmt, dbo.tblStt.SttNightRate, 
                      dbo.tblStt.SttNonCurrAdjPct, dbo.tblStt.SttPACostPct, dbo.tblStt.SttPAPaidHourAmt, dbo.tblStt.SttPASupportCostAmt, dbo.tblStt.SttPriorAdjCollWIPAmt, 
                      dbo.tblStt.SttPriorCollectAR, dbo.tblStt.SttPriorCollFeeAmt, dbo.tblStt.SttPriorLoanBal, dbo.tblStt.SttPTCostPct, dbo.tblStt.SttPTOAccrual, dbo.tblStt.SttPTOTotalCost, 
                      dbo.tblStt.SttPtsPerHr, dbo.tblStt.SttRDEarnedAmt, dbo.tblStt.SttRDLclAmt, dbo.tblStt.SttSiteNetIncAmt, dbo.tblStt.SttSiteOverheadAmt, dbo.tblStt.SttSurplusDeficitAmt, 
                      dbo.tblStt.SttTotalCollAmt, dbo.tblStt.SttTotalCollPerPt, dbo.tblStt.SttValuationGainLossAmt, dbo.tblStt.SttWIPGainLossAmt, dbo.tblStt.YtdSttPstChgs, 
                      dbo.tblStt.YtdBdgPstChgs, dbo.tblStt.YtdGrossColl, dbo.tblStt.YtdBdgGrossColl, dbo.tblStt.YtdSttTargetRate, dbo.tblStt.YtdBdgTargetRate, dbo.tblStt.YtdStipendsRcvd, 
                      dbo.tblStt.YtdBdgStipendsRcvd, dbo.tblStt.YtdOtherRcpts, dbo.tblStt.YtdBdgOthRcpts, dbo.tblStt.YtdValuationGainLoss, dbo.tblStt.YtdTotalColl, 
                      dbo.tblStt.YtdBdgTotalColl, dbo.tblStt.YtdMalpractice, dbo.tblStt.YtdBdgMalpractice, dbo.tblStt.YtdInterest, dbo.tblStt.YtdBdgInterest, dbo.tblStt.YtdSttBillFee, 
                      dbo.tblStt.YtdBdgBillFee, dbo.tblStt.YtdBillSpec, dbo.tblStt.YtdBdgBillSpec, dbo.tblStt.YtdSttOffTop, dbo.tblStt.YtdBdgOffTop, dbo.tblStt.YtdSiteOverhead, 
                      dbo.tblStt.YtdBdgSiteOverhead, dbo.tblStt.YtdNOR, dbo.tblStt.YtdBdgNOR, dbo.tblStt.YtdNetPctofNOR, dbo.tblStt.YtdBdgNetPctofNOR, dbo.tblStt.YtdSttDocPaidAmt, 
                      dbo.tblStt.YtdSttDocPaidAmtAdj, dbo.tblStt.YtdBdgPITEarned, dbo.tblStt.YtdPITearned, dbo.tblStt.YtdBdgPITearned2, dbo.tblStt.YtdPITpct, dbo.tblStt.YtdBdgPITPct, 
                      dbo.tblStt.YtdSttPACost, dbo.tblStt.YtdBdgPACost, dbo.tblStt.YtdSttPACostPct, dbo.tblStt.YtdBdgPACostPct, dbo.tblStt.YtdSttPTCost, dbo.tblStt.YtdBdgPTCost, 
                      dbo.tblStt.YtdSttPTCostPct, dbo.tblStt.YtdBdgPTCostPct, dbo.tblStt.YtdSttLclExp, dbo.tblStt.YtdBdgLclExp, dbo.tblStt.YtdSttLclExpPct, dbo.tblStt.YtdBdgLclExpPct, 
                      dbo.tblStt.YtdSttRDPaidAmt, dbo.tblStt.YtdBdgRDearned, dbo.tblStt.YtdRDpct, dbo.tblStt.YtdBdgRDpct, dbo.tblStt.YtdSttMDPaidAmt, dbo.tblStt.YtdBdgMDearned, 
                      dbo.tblStt.YtdMDpct, dbo.tblStt.YtdBdgMDpct, dbo.tblStt.YtdSttNonCurrAdjAmt, dbo.tblStt.YtdNonCurrAdjPct, dbo.tblStt.YtdSttSrpAdjAmt, dbo.tblStt.YtdSttSrpAdjAmtPct, 
                      dbo.tblStt.YtdContribCEP, dbo.tblStt.YtdBdgContribCEP, dbo.tblStt.YtdStatContribPct, dbo.tblStt.YtdBdgContribPct, dbo.tblStt.YtdSiteNetInc, dbo.tblStt.YtdBdgSiteNetInc, 
                      dbo.tblStt.YtdSttPatVisitQty, dbo.tblStt.YTDSttPatVisitUCQty, dbo.tblStt.YtdBdgPatients, dbo.tblStt.YtdSttAdmitQty, dbo.tblStt.YtdSttPhysTherVisitQty, 
                      dbo.tblStt.YtdSttPtsKeyed, dbo.tblStt.YtdSttDocPaidAmtHrly, dbo.tblStt.YtdDocEarnedHrly, dbo.tblStt.YtdBdgDocEarnedHrly, dbo.tblStt.YtdDocHours, 
                      dbo.tblStt.YtdBdgDocHours, dbo.tblStt.YtdPAHours, dbo.tblStt.YtdBdgPAHours, dbo.tblStt.YtdPAPaidHrly, dbo.tblStt.YtdBdgPAPaidHrly, dbo.tblStt.YtdPtsPerHr, 
                      dbo.tblStt.YtdBdgPtsPerHr, dbo.tblStt.YtdBlendedPtsPerHr, dbo.tblStt.YtdbdgBlendedPtsPerHr, dbo.tblStt.YtdNetRevPerPt, dbo.tblStt.YtdBdgNetRevPerPt, 
                      dbo.tblStt.YtdAvgChgPt, dbo.tblStt.YtdBdgAvgChgPt, dbo.tblStt.YtdCollPerPt, dbo.tblStt.YtdBdgCollPerPt, dbo.tblStt.YtdTotalCollPerPt, dbo.tblStt.YtdWIPGainLoss, 
                      dbo.tblStt.YtdSttDonationAmt, dbo.tblStt.YtdSttAccExpenseAmt, dbo.tblStt.YtdSttFixedLocalAmt, dbo.tblStt.YtdSttLclVarAmt, dbo.tblStt.YtdSttSurplusPayout, 
                      dbo.tblStt.YtdSttNonCurrMDAmt, dbo.tblStt.YtdSttNonCurrRDAmt, dbo.tblStt.YtdSttMDIncentiveAmt, dbo.tblStt.YtdSttRDIncentiveAmt, dbo.tblStt.YtdSttPAAdjAmt, 
                      dbo.tblStt.YtdSttCashARAmt, dbo.tblStt.YtdSttRefArAmt, dbo.tblStt.YtdSttMDEarnedAmt, dbo.tblStt.YtdSttRDEarnedAmt, dbo.tblStt.YtdSttCollFeeChgAmt, 
                      dbo.tblStt.YtdSttMPFlatFeeAmt, dbo.tblStt.YtdSttCEPSurchargeAmt, dbo.tblStt.YtdBdgCEPRetentionAmt, dbo.tblStt.YtdBdgSiteOvrHdAmt, 
                      dbo.tblStt.YtdSttBillSpecMBSIAmt, dbo.tblStt.YtdSttPTAdjAmt, dbo.tblStt.YtdSttPASupportCostAmt, dbo.tblStt.YtdBdgPASupportCostAmt, dbo.tblStt.YtdSttMDLclAmt, 
                      dbo.tblStt.YtdSttRDLclAmt, dbo.tblStt.YtdBdgDonations, dbo.tblStt.YtdSttPatVisitReturnQty, dbo.tblStt.YTDSttBillSpecScribesAmt, 
                      dbo.tblStt.YTDSttBillSpecSitePersonnelAmt, dbo.tblStt.YTDSttBillSpecScribesAdjAmt, dbo.tblStt.YTDSttBillSpecSitePersonnelAdjAmt, dbo.tblStt.YTDBdgEncounters, 
                      dbo.tblStt.YTDSttPTOAccrual, dbo.tblStt.YTDSttPTOTotalCost, dbo.tblStt.YTDSttPTOTrueUpAdj, dbo.tblCmp.CmpName AS Site, dbo.tblCtr.CtrID, 
                      dbo.tblCtr.CtrSite_CmpID, dbo.tblCtr.CtrSys_CmpID, dbo.tblCtr.CtrTranscript_CmpID, dbo.tblCtr.CtrBillAgt_CmpID, dbo.tblCtr.CtrPhyGrp_CmpID, 
                      dbo.tblCtr.CtrMlp_CmpID, dbo.tblCtr.CtrBillCmpIDNum, dbo.tblCtr.CtrMedDir_CntID, dbo.tblCtr.CtrCamAssigned_CntID, dbo.tblCtr.Ctr_CtrTypID, dbo.tblCtr.Ctr_RgnID, 
                      dbo.tblCtr.Ctr_MlpRgnID, dbo.tblCtr.CtrKey, dbo.tblCtr.CtrHPID, dbo.tblCtr.CtrPlatinumID, dbo.tblCtr.CtrDateStart, dbo.tblCtr.CtrDateEffect, dbo.tblCtr.CtrDateRenew, 
                      dbo.tblCtr.CtrDateEnd, dbo.tblCtr.CtrYrQty, dbo.tblCtr.CtrSysCtrYN, dbo.tblCtr.CtrAutoRenewYN, dbo.tblCtr.CtrEndNoCseYN, dbo.tblCtr.CtrNoCseDayQty, 
                      dbo.tblCtr.CtrEndCseYN, dbo.tblCtr.CtrCseDayQty, dbo.tblCtr.CtrRemDayQty, dbo.tblCtr.CtrPriorAdjCollWIPAmtDefault, dbo.tblCtr.CtrPriorCollectARDefault, 
                      dbo.tblCtr.CtrPriorCollFeeAmtDefault, dbo.tblCtr.CtrPriorLoanBalDefault, dbo.tblCtr.CtrStipAmt, dbo.tblCtr.CtrStipDesc, dbo.tblCtr.CtrOtherPayAmt, 
                      dbo.tblCtr.CtrOtherPayDesc, dbo.tblCtr.CtrEmpPhysPaid, dbo.tblCtr.CtrWrkCompPaidYN, dbo.tblCtr.CtrCompeteClauseYN, dbo.tblCtr.CtrBillRecDayQty, 
                      dbo.tblCtr.CtrBillAgtDateStart, dbo.tblCtr.CtrMlpDateEffect, dbo.tblCtr.CtrTrmCtrYN, dbo.tblCtr.CtrPrmBseYN, dbo.tblCtr.CtrRsdAff, dbo.tblCtr.CtrElecLogYN, 
                      dbo.tblCtr.CtrNrsInitProtoYN, dbo.tblCtr.CtrTriageProtoYN, dbo.tblCtr.CtrClnPthwyYN, dbo.tblCtr.CtrPrcGdeYN, dbo.tblCtr.CtrComputeAfcYN, 
                      dbo.tblCtr.CtrElecMedRcdYN, dbo.tblCtr.CtrObsvUnitYN, dbo.tblCtr.CtrChstPnYN, dbo.tblCtr.CtrFastTrkYn, dbo.tblCtr.CtrOccMedYN, dbo.tblCtr.CtrHspYN, 
                      dbo.tblCtr.CtrSameStoreYN, dbo.tblCtr.CtrGoodMethodYN, dbo.tblCtr.CtrChestPainYN, dbo.tblCtr.CtrElectronicTrackYN, dbo.tblCtr.CtrPainMgmt, 
                      dbo.tblCtr.CtrAllowNursesYN, dbo.tblCtr.CtrPhySpecificDataYN, dbo.tblCtr.CtrComplaintMgtPrgYN, dbo.tblCtr.CtrSatisfactionTool, dbo.tblCtr.CtrSatisfactionTeamYN, 
                      dbo.tblCtr.CtrEDVolume, dbo.tblCtr.CtrAdmissionPct, dbo.tblCtr.CtrTransferPct, dbo.tblCtr.CtrStatPITpct, dbo.tblCtr.CtrStatRDpct, dbo.tblCtr.CtrStatMDpct, 
                      dbo.tblCtr.CtrStatContribpct, dbo.tblCtr.CtrBseHour, dbo.tblCtr.CtrBillRate, dbo.tblCtr.CtrIncExpComment, dbo.tblCtr.CtrSiteOvrHdpct, dbo.tblCtr.CtrIntRate, 
                      dbo.tblCtr.CtrMlpFlatFee, dbo.tblCtr.CtrMplSecondRate, dbo.tblCtr.CtrLclPct, dbo.tblCtr.CtrLclFixedAmt, dbo.tblCtr.CtrMDIncentivePct, dbo.tblCtr.CtrRDIncentivePct, 
                      dbo.tblCtr.CtrSurplusReservePct, dbo.tblCtr.zCtrMPRate, dbo.tblCtr.CtrDateFeeInc, dbo.tblCtr.CtrPctInc, dbo.tblCtr.CtrNightPct, dbo.tblCtr.CtrDiffRate, 
                      dbo.tblCtr.CtrDiffAmt, dbo.tblCtr.CtrDayRate, dbo.tblCtr.CtrNightRate, dbo.tblCtr.CtrBedQty, dbo.tblCtr.CtrFastTrackBedQty, dbo.tblCtr.CtrOtherBedQty, 
                      dbo.tblCtr.CtrCriticalCareBedQty, dbo.tblCtr.CtrObservationBedQty, dbo.tblCtr.CtrEmail, dbo.tblCtr.CtrDateCreate, dbo.tblCtr.CtrDateEdit, dbo.tblCtr.CtrInactiveYn, 
                      dbo.tblCtr.CtrTraumaDesignation, dbo.tblCtr.CtrFlagYn, dbo.tblCtr.CtrComment, dbo.tblCtr.CtrRequireMailYN, dbo.tblCtr.CtrCEPSurchargePct, 
                      dbo.tblCtr.CtrMngCarBatchYN, dbo.tblCtr.CtrMisc1YN, dbo.tblCtr.CtrMisc2YN, dbo.tblCtr.CtrMisc3YN, dbo.tblCtr.CtrMisc4YN, dbo.tblCtr.CtrMisc5YN, 
                      dbo.tblCtr.CtrPASupportCostPct, dbo.tblCtr.CtrTIN, dbo.tblCtr.CtrDivision, LEFT(DATENAME(mm, dbo.tblStt.SttDate), 3) + ' ' + DATENAME(yyyy, dbo.tblStt.SttDate) 
                      AS ReportDate, dbo.tblMth.MthDays, dbo.tblMth.MthYearDays, tblCmp_1.CmpName AS MedicalGroup, 
                      CASE CtrPhyGrp_CmpID WHEN 1650 THEN 1 ELSE 0 END AS GalenYN, tblCnt_1.CntKey AS MedicalDirector, dbo.tblStt.SttPublishYN, dbo.tblStt.SttEncounterQty, 
                      dbo.tblStt.SttBilledUnitQty, dbo.tblStt.SttNetRevPerEncounter, dbo.tblStt.SttNetRevPerBilledUnit, dbo.tblStt.SttAvgChgEncounter, dbo.tblStt.SttAvgChgBilledUnit, 
                      dbo.tblStt.SttCollPerEncounter, dbo.tblStt.SttCollPerBilledUnit, dbo.tblStt.SttTotalCollAmtPerEncounter, dbo.tblStt.SttTotalCollAmtperBilledUnit, 
                      dbo.tblStt.YTDSttEncounterQty, dbo.tblStt.YTDSttBilledUnitQty, dbo.tblStt.YTDSttNetRevPerEncounter, dbo.tblStt.YTDSttNetRevPerBilledUnit, 
                      dbo.tblStt.YTDSttAvgChgEncounter, dbo.tblStt.YTDSttAvgChgBilledUnit, dbo.tblStt.YTDSttCollPerEncounter, dbo.tblStt.YTDSttCollPerBilledUnit, 
                      dbo.tblStt.YTDSttTotalCollAmtPerEncounter, dbo.tblStt.YTDSttTotalCollAmtperBilledUnit
FROM         dbo.tblCmp AS tblCmp_1 RIGHT OUTER JOIN
                      dbo.tblMth INNER JOIN
                      dbo.tblBdg INNER JOIN
                      dbo.tblStt ON dbo.tblBdg.BdgID = dbo.tblStt.Stt_BdgID INNER JOIN
                      dbo.tblCtr ON dbo.tblStt.Stt_CtrID = dbo.tblCtr.CtrID INNER JOIN
                      dbo.tblCmp ON dbo.tblCtr.CtrSite_CmpID = dbo.tblCmp.CmpID ON dbo.tblMth.MthDate = dbo.tblStt.SttDate ON 
                      tblCmp_1.CmpID = dbo.tblCtr.CtrPhyGrp_CmpID LEFT OUTER JOIN
                      dbo.tblCnt AS tblCnt_1 ON dbo.tblCtr.CtrMedDir_CntID = tblCnt_1.CntID LEFT OUTER JOIN
                      dbo.tblRgn ON dbo.tblCtr.Ctr_RgnID = dbo.tblRgn.RgnID
where Ctr_CtrTypID= 'ANES'




