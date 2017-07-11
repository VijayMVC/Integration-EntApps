CREATE VIEW dbo.vwStt
AS
SELECT     tblCmp2.CmpName AS System, tblCmp3.CmpName AS TranscriptCompany, tblCmp4.CmpName AS BillingAgent, tblCmp5.CmpName AS PhysicianGroup, 
                      tblCmp6.CmpName AS MalpracticeCompany, tblCnt1.CntKey AS MedicalDirector, tblCnt2.CntKey AS CAM, tblCnt3.CntKey AS RegionalDirector, 
                      tblCnt4.CntKey AS AssistantDirector, tblCmp1.CmpCity AS SiteCity, tblCmp1.CmpState AS SiteState, tblCmp1.CmpZip AS SiteZip, dbo.tblRgn.RgnName, 
                      tblCnt2.CntTitle AS CAMTitle, tblCnt2.CntPhonePref AS CAMPhone, dbo.tblStt.SttDate, dbo.tblStt.Stt_CtrID, dbo.tblStt.Stt_BdgID, dbo.tblStt.Stt_BdgYear, dbo.tblStt.SttID, 
                      dbo.tblStt.SttKey, dbo.tblStt.SttLink, dbo.tblStt.SttAccExpenseAmt, dbo.tblStt.SttAdmitQty, dbo.tblStt.SttBillFee, dbo.tblStt.SttBillRate, dbo.tblStt.SttBillSpec, 
                      dbo.tblStt.SttBillSpecMBSIAmt, dbo.tblStt.SttBillSpecScribesAmt, dbo.tblStt.SttBillSpecScribesAdjAmt, dbo.tblStt.SttBillSpecSitePersonnelAmt, 
                      dbo.tblStt.SttBillSpecSitePersonnelAdjAmt, dbo.tblStt.SttBseHour, dbo.tblStt.SttChartQty, dbo.tblStt.SttChartPostQty, dbo.tblStt.SttChartMissQty, 
                      dbo.tblStt.SttChartMiss30Qty, dbo.tblStt.SttCashARAmt, dbo.tblStt.SttCEPSurchargePct, dbo.tblStt.SttCollectibleARAmt, dbo.tblStt.SttCollectWIP, dbo.tblStt.SttContribPct, 
                      dbo.tblStt.SttCurrLoanBal, dbo.tblStt.SttDiffAmt, dbo.tblStt.SttDiffRate, dbo.tblStt.SttDocHourQty, dbo.tblStt.SttDocPaidAdjAmt, dbo.tblStt.SttDocPaidAmt, 
                      dbo.tblStt.SttDonationAmt, dbo.tblStt.SttFixedLocalAmt, dbo.tblStt.SttIntRate, dbo.tblStt.SttLclExp, dbo.tblStt.SttLclPct, dbo.tblStt.SttLclVarAmt, 
                      dbo.tblStt.SttMDIncentiveAmt, dbo.tblStt.SttMDIncentivePct, dbo.tblStt.SttMDPaidAmt, dbo.tblStt.SttMDpct, dbo.tblStt.SttMPFlatFeeAmt, dbo.tblStt.SttMPRate, 
                      dbo.tblStt.SttMPUCRate, dbo.tblStt.SttNightPct, dbo.tblStt.SttNonCurrAdjAmt, dbo.tblStt.SttNonCurrMDAmt, dbo.tblStt.SttNonCurrRDAmt, dbo.tblStt.SttNorAmt, 
                      dbo.tblStt.SttOffTop, dbo.tblStt.SttOtherRcpts, dbo.tblStt.SttPAAdjAmt, dbo.tblStt.SttPACost, dbo.tblStt.SttPAhoursQty, dbo.tblStt.SttPASupportCostPct, 
                      dbo.tblStt.SttPatVisitQty, dbo.tblStt.SttPatVisitUCQty, dbo.tblStt.SttPatVisitReturnQty, dbo.tblStt.SttPhysTherVisitQty, dbo.tblStt.SttPstChgs, dbo.tblStt.SttPTCost, 
                      dbo.tblStt.SttPTAdjAmt, dbo.tblStt.SttPTOAccrualRate, dbo.tblStt.SttPtsKeyed, dbo.tblStt.SttRDIncentiveAmt, dbo.tblStt.SttRDIncentivePct, dbo.tblStt.SttRDPaidAmt, 
                      dbo.tblStt.SttRDpct, dbo.tblStt.SttRefAR, dbo.tblStt.SttSiteOvrHdPct, dbo.tblStt.SttSrpAdjAmt, dbo.tblStt.SttSrpAdjAmtComment, dbo.tblStt.SttSrpAdjAmtPct, 
                      dbo.tblStt.SttStatPITpct, dbo.tblStt.SttStipRcvd, dbo.tblStt.SttSurplusPayout, dbo.tblStt.SttSurplusReserveNote, dbo.tblStt.SttSurplusReservePct, 
                      dbo.tblStt.SttSurplusReserveAmt, dbo.tblStt.SttTargetRate, dbo.tblStt.SttPTOTrueUpAdj, dbo.tblStt.SttCommentOther, dbo.tblStt.SttUnspecifiedComment, 
                      dbo.tblStt.SttValuationGainLossComment, dbo.tblStt.SttWIPGainLossComment, dbo.tblStt.SttCommentInternal, dbo.tblStt.SttDateCreate, dbo.tblStt.SttDateEdit, 
                      dbo.tblStt.SttInactiveYN, dbo.tblStt.SttFlagYN, dbo.tblStt.SttAdjCollWIPAmt, dbo.tblStt.SttAvgChgPt, dbo.tblStt.SttBlendedHrs, dbo.tblStt.SttBlendedPtsPerHr, 
                      dbo.tblStt.SttCashExpAmt, dbo.tblStt.SttCashRcptAmt, dbo.tblStt.SttCEPSurchargeAmt, dbo.tblStt.SttCollFeeAmt, dbo.tblStt.SttCollFeeChgAmt, dbo.tblStt.SttCollPerPtAmt, 
                      dbo.tblStt.SttCompPITpct, dbo.tblStt.SttCompMDpct, dbo.tblStt.SttCompRDpct, dbo.tblStt.SttContribCEPAmt, dbo.tblStt.SttDayRate, dbo.tblStt.SttDocEarnedHourAmt, 
                      dbo.tblStt.SttDocPaidHourAmt, dbo.tblStt.SttDocPITearnedAmt, dbo.tblStt.SttEndCollectAR, dbo.tblStt.SttGrossCollAmt, dbo.tblStt.SttIntAmt, dbo.tblStt.SttLclExpPct, 
                      dbo.tblStt.SttMDEarnedAmt, dbo.tblStt.SttMDLclAmt, dbo.tblStt.SttMlpAmt, dbo.tblStt.SttNetAmt, dbo.tblStt.SttNetChangeinARAmt, dbo.tblStt.SttNetPctofNOR, 
                      dbo.tblStt.SttNetRevPerPtAmt, dbo.tblStt.SttNightRate, dbo.tblStt.SttNonCurrAdjPct, dbo.tblStt.SttPACostPct, dbo.tblStt.SttPAPaidHourAmt, 
                      dbo.tblStt.SttPASupportCostAmt, dbo.tblStt.SttPriorAdjCollWIPAmt, dbo.tblStt.SttPriorCollectAR, dbo.tblStt.SttPriorCollFeeAmt, dbo.tblStt.SttPriorLoanBal, 
                      dbo.tblStt.SttPTCostPct, dbo.tblStt.SttPTOAccrual, dbo.tblStt.SttPTOTotalCost, dbo.tblStt.SttPtsPerHr, dbo.tblStt.SttRDEarnedAmt, dbo.tblStt.SttRDLclAmt, 
                      dbo.tblStt.SttSiteNetIncAmt, dbo.tblStt.SttSiteOverheadAmt, dbo.tblStt.SttSurplusDeficitAmt, dbo.tblStt.SttTotalCollAmt, dbo.tblStt.SttTotalCollPerPt, 
                      dbo.tblStt.SttValuationGainLossAmt, dbo.tblStt.SttWIPGainLossAmt, dbo.tblStt.YtdSttPstChgs, dbo.tblStt.YtdBdgPstChgs, dbo.tblStt.YtdGrossColl, 
                      dbo.tblStt.YtdBdgGrossColl, dbo.tblStt.YtdSttTargetRate, dbo.tblStt.YtdBdgTargetRate, dbo.tblStt.YtdStipendsRcvd, dbo.tblStt.YtdBdgStipendsRcvd, 
                      dbo.tblStt.YtdOtherRcpts, dbo.tblStt.YtdBdgOthRcpts, dbo.tblStt.YtdValuationGainLoss, dbo.tblStt.YtdTotalColl, dbo.tblStt.YtdBdgTotalColl, dbo.tblStt.YtdMalpractice, 
                      dbo.tblStt.YtdBdgMalpractice, dbo.tblStt.YtdInterest, dbo.tblStt.YtdBdgInterest, dbo.tblStt.YtdSttBillFee, dbo.tblStt.YtdBdgBillFee, dbo.tblStt.YtdBillSpec, 
                      dbo.tblStt.YtdBdgBillSpec, dbo.tblStt.YtdSttOffTop, dbo.tblStt.YtdBdgOffTop, dbo.tblStt.YtdSiteOverhead, dbo.tblStt.YtdBdgSiteOverhead, dbo.tblStt.YtdNOR, 
                      dbo.tblStt.YtdBdgNOR, dbo.tblStt.YtdNetPctofNOR, dbo.tblStt.YtdBdgNetPctofNOR, dbo.tblStt.YtdSttDocPaidAmt, dbo.tblStt.YtdSttDocPaidAmtAdj, 
                      dbo.tblStt.YtdBdgPITEarned, dbo.tblStt.YtdPITearned, dbo.tblStt.YtdBdgPITearned2, dbo.tblStt.YtdPITpct, dbo.tblStt.YtdBdgPITPct, dbo.tblStt.YtdSttPACost, 
                      dbo.tblStt.YtdBdgPACost, dbo.tblStt.YtdSttPACostPct, dbo.tblStt.YtdBdgPACostPct, dbo.tblStt.YtdSttPTCost, dbo.tblStt.YtdBdgPTCost, dbo.tblStt.YtdSttPTCostPct, 
                      dbo.tblStt.YtdBdgPTCostPct, dbo.tblStt.YtdSttLclExp, dbo.tblStt.YtdBdgLclExp, dbo.tblStt.YtdSttLclExpPct, dbo.tblStt.YtdBdgLclExpPct, dbo.tblStt.YtdSttRDPaidAmt, 
                      dbo.tblStt.YtdBdgRDearned, dbo.tblStt.YtdRDpct, dbo.tblStt.YtdBdgRDpct, dbo.tblStt.YtdSttMDPaidAmt, dbo.tblStt.YtdBdgMDearned, dbo.tblStt.YtdMDpct, 
                      dbo.tblStt.YtdBdgMDpct, dbo.tblStt.YtdSttNonCurrAdjAmt, dbo.tblStt.YtdNonCurrAdjPct, dbo.tblStt.YtdSttSrpAdjAmt, dbo.tblStt.YtdSttSrpAdjAmtPct, 
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
                      dbo.tblStt.YTDSttPTOAccrual, dbo.tblStt.YTDSttPTOTotalCost, dbo.tblStt.YTDSttPTOTrueUpAdj, 
                      dbo.tblStt.SttChartQty + dbo.tblStt.SttChartPostQty + dbo.tblStt.SttChartMissQty + dbo.tblStt.SttChartMiss30Qty AS TotalWip, dbo.tblCtr.CtrID, dbo.tblCtr.CtrSite_CmpID, 
                      dbo.tblCtr.CtrSys_CmpID, dbo.tblCtr.CtrTranscript_CmpID, dbo.tblCtr.CtrBillAgt_CmpID, dbo.tblCtr.CtrPhyGrp_CmpID, dbo.tblCtr.CtrMlp_CmpID, 
                      dbo.tblCtr.CtrBillCmpIDNum, dbo.tblCtr.CtrMedDir_CntID, dbo.tblCtr.CtrCamAssigned_CntID, dbo.tblCtr.Ctr_CtrTypID, dbo.tblCtr.Ctr_RgnID, dbo.tblCtr.Ctr_MlpRgnID, 
                      dbo.tblCtr.CtrKey, dbo.tblCtr.CtrHPID, dbo.tblCtr.CtrPlatinumID, dbo.tblCtr.CtrDateStart, dbo.tblCtr.CtrDateEffect, dbo.tblCtr.CtrDateRenew, dbo.tblCtr.CtrDateEnd, 
                      dbo.tblCtr.CtrYrQty, dbo.tblCtr.CtrSysCtrYN, dbo.tblCtr.CtrAutoRenewYN, dbo.tblCtr.CtrEndNoCseYN, dbo.tblCtr.CtrNoCseDayQty, dbo.tblCtr.CtrEndCseYN, 
                      dbo.tblCtr.CtrCseDayQty, dbo.tblCtr.CtrRemDayQty, dbo.tblCtr.CtrPriorAdjCollWIPAmtDefault, dbo.tblCtr.CtrPriorCollectARDefault, dbo.tblCtr.CtrPriorCollFeeAmtDefault, 
                      dbo.tblCtr.CtrPriorLoanBalDefault, dbo.tblCtr.CtrStipAmt, dbo.tblCtr.CtrStipDesc, dbo.tblCtr.CtrOtherPayAmt, dbo.tblCtr.CtrOtherPayDesc, dbo.tblCtr.CtrEmpPhysPaid, 
                      dbo.tblCtr.CtrWrkCompPaidYN, dbo.tblCtr.CtrCompeteClauseYN, dbo.tblCtr.CtrBillRecDayQty, dbo.tblCtr.CtrBillAgtDateStart, dbo.tblCtr.CtrMlpDateEffect, 
                      dbo.tblCtr.CtrTrmCtrYN, dbo.tblCtr.CtrPrmBseYN, dbo.tblCtr.CtrRsdAff, dbo.tblCtr.CtrElecLogYN, dbo.tblCtr.CtrNrsInitProtoYN, dbo.tblCtr.CtrTriageProtoYN, 
                      dbo.tblCtr.CtrClnPthwyYN, dbo.tblCtr.CtrPrcGdeYN, dbo.tblCtr.CtrComputeAfcYN, dbo.tblCtr.CtrElecMedRcdYN, dbo.tblCtr.CtrObsvUnitYN, dbo.tblCtr.CtrChstPnYN, 
                      dbo.tblCtr.CtrFastTrkYn, dbo.tblCtr.CtrOccMedYN, dbo.tblCtr.CtrHspYN, dbo.tblCtr.CtrSameStoreYN, dbo.tblCtr.CtrGoodMethodYN, dbo.tblCtr.CtrChestPainYN, 
                      dbo.tblCtr.CtrElectronicTrackYN, dbo.tblCtr.CtrPainMgmt, dbo.tblCtr.CtrAllowNursesYN, dbo.tblCtr.CtrPhySpecificDataYN, dbo.tblCtr.CtrComplaintMgtPrgYN, 
                      dbo.tblCtr.CtrSatisfactionTool, dbo.tblCtr.CtrSatisfactionTeamYN, dbo.tblCtr.CtrEDVolume, dbo.tblCtr.CtrAdmissionPct, dbo.tblCtr.CtrTransferPct, dbo.tblCtr.CtrStatPITpct, 
                      dbo.tblCtr.CtrStatRDpct, dbo.tblCtr.CtrStatMDpct, dbo.tblCtr.CtrStatContribpct, dbo.tblCtr.CtrBseHour, dbo.tblCtr.CtrBillRate, dbo.tblCtr.CtrIncExpComment, 
                      dbo.tblCtr.CtrSiteOvrHdpct, dbo.tblCtr.CtrIntRate, dbo.tblCtr.CtrMlpFlatFee, dbo.tblCtr.CtrMplSecondRate, dbo.tblCtr.CtrLclPct, dbo.tblCtr.CtrLclFixedAmt, 
                      dbo.tblCtr.CtrMDIncentivePct, dbo.tblCtr.CtrRDIncentivePct, dbo.tblCtr.CtrSurplusReservePct, dbo.tblCtr.zCtrMPRate, dbo.tblCtr.CtrDateFeeInc, dbo.tblCtr.CtrPctInc, 
                      dbo.tblCtr.CtrNightPct, dbo.tblCtr.CtrDiffRate, dbo.tblCtr.CtrDiffAmt, dbo.tblCtr.CtrDayRate, dbo.tblCtr.CtrNightRate, dbo.tblCtr.CtrBedQty, dbo.tblCtr.CtrFastTrackBedQty, 
                      dbo.tblCtr.CtrOtherBedQty, dbo.tblCtr.CtrCriticalCareBedQty, dbo.tblCtr.CtrObservationBedQty, dbo.tblCtr.CtrEmail, dbo.tblCtr.CtrDateCreate, dbo.tblCtr.CtrDateEdit, 
                      dbo.tblCtr.CtrInactiveYn, dbo.tblCtr.CtrTraumaDesignation, dbo.tblCtr.CtrFlagYn, dbo.tblCtr.CtrComment, dbo.tblCtr.CtrRequireMailYN, dbo.tblCtr.CtrCEPSurchargePct, 
                      dbo.tblCtr.CtrMngCarBatchYN, dbo.tblCtr.CtrMisc1YN, dbo.tblCtr.CtrMisc2YN, dbo.tblCtr.CtrMisc3YN, dbo.tblCtr.CtrMisc4YN, dbo.tblCtr.CtrMisc5YN, 
                      dbo.tblCtr.CtrPASupportCostPct, dbo.tblCtr.CtrTIN, dbo.tblCtr.CtrDivision, CASE CtrPhyGrp_CmpID WHEN 1650 THEN 1 ELSE 0 END AS GalenYN, 
                      tblCmp1.CmpName AS Site, dbo.tblStt.SttPublishYN, dbo.tblStt.SttEncounterQty, dbo.tblStt.SttBilledUnitQty, dbo.tblStt.SttNetRevPerEncounter, 
                      dbo.tblStt.SttNetRevPerBilledUnit, dbo.tblStt.SttAvgChgEncounter, dbo.tblStt.SttAvgChgBilledUnit, dbo.tblStt.SttCollPerEncounter, dbo.tblStt.SttCollPerBilledUnit, 
                      dbo.tblStt.SttTotalCollAmtPerEncounter, dbo.tblStt.SttTotalCollAmtperBilledUnit, dbo.tblStt.YTDSttEncounterQty, dbo.tblStt.YTDSttBilledUnitQty, 
                      dbo.tblStt.YTDSttNetRevPerEncounter, dbo.tblStt.YTDSttNetRevPerBilledUnit, dbo.tblStt.YTDSttAvgChgEncounter, dbo.tblStt.YTDSttAvgChgBilledUnit, 
                      dbo.tblStt.YTDSttCollPerEncounter, dbo.tblStt.YTDSttCollPerBilledUnit, dbo.tblStt.YTDSttTotalCollAmtPerEncounter, dbo.tblStt.YTDSttTotalCollAmtperBilledUnit
FROM         dbo.tblStt INNER JOIN
                      dbo.tblCmp AS tblCmp1 INNER JOIN
                      dbo.tblCtr ON tblCmp1.CmpID = dbo.tblCtr.CtrSite_CmpID ON dbo.tblStt.Stt_CtrID = dbo.tblCtr.CtrID LEFT OUTER JOIN
                      dbo.tblCnt AS tblCnt2 ON dbo.tblCtr.CtrCamAssigned_CntID = tblCnt2.CntID LEFT OUTER JOIN
                      dbo.tblCnt AS tblCnt4 RIGHT OUTER JOIN
                      dbo.tblRgn ON tblCnt4.CntID = dbo.tblRgn.RgnDirAss_CntID LEFT OUTER JOIN
                      dbo.tblCnt AS tblCnt3 ON dbo.tblRgn.RgnDir_CntID = tblCnt3.CntID ON dbo.tblCtr.Ctr_RgnID = dbo.tblRgn.RgnID LEFT OUTER JOIN
                      dbo.tblCnt AS tblCnt1 ON dbo.tblCtr.CtrMedDir_CntID = tblCnt1.CntID LEFT OUTER JOIN
                      dbo.tblCmp AS tblCmp6 ON dbo.tblCtr.CtrMlp_CmpID = tblCmp6.CmpID LEFT OUTER JOIN
                      dbo.tblCmp AS tblCmp5 ON dbo.tblCtr.CtrPhyGrp_CmpID = tblCmp5.CmpID LEFT OUTER JOIN
                      dbo.tblCmp AS tblCmp4 ON dbo.tblCtr.CtrBillAgt_CmpID = tblCmp4.CmpID LEFT OUTER JOIN
                      dbo.tblCmp AS tblCmp3 ON dbo.tblCtr.CtrTranscript_CmpID = tblCmp3.CmpID LEFT OUTER JOIN
                      dbo.tblCmp AS tblCmp2 ON dbo.tblCtr.CtrSys_CmpID = tblCmp2.CmpID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1 [56] 4 [18] 2))"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[53] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 9
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblStt (dbo)"
            Begin Extent = 
               Top = 0
               Left = 148
               Bottom = 108
               Right = 373
            End
            DisplayFlags = 280
            TopColumn = 288
         End
         Begin Table = "tblCmp1"
            Begin Extent = 
               Top = 131
               Left = 449
               Bottom = 325
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 7
               Left = 959
               Bottom = 115
               Right = 1183
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt2"
            Begin Extent = 
               Top = 150
               Left = 819
               Bottom = 258
               Right = 995
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt4"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblRgn (dbo)"
            Begin Extent = 
               Top = 286
               Left = 987
               Bottom = 537
               Right = 1150
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt3"
            Begin Extent = 
               Top = 330
               Left = 38
               Bottom = 438
               Right = 214
            End
            ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt1"
            Begin Extent = 
               Top = 382
               Left = 730
               Bottom = 490
               Right = 906
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp6"
            Begin Extent = 
               Top = 416
               Left = 193
               Bottom = 524
               Right = 356
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp5"
            Begin Extent = 
               Top = 388
               Left = 471
               Bottom = 496
               Right = 634
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp4"
            Begin Extent = 
               Top = 508
               Left = 258
               Bottom = 616
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp3"
            Begin Extent = 
               Top = 518
               Left = 517
               Bottom = 626
               Right = 680
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp2"
            Begin Extent = 
               Top = 183
               Left = 1188
               Bottom = 337
               Right = 1351
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 6555
         Alias = 2565
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwStt';

