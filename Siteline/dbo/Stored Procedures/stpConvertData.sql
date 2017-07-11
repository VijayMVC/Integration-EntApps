CREATE Procedure stpConvertData
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
	Delete tblStt
	Delete tblBdg
	Delete tblAct
	Delete tblActJrn
	Delete tblRptCtrCnt
	Delete tblRptCtr
	Delete tblRgn
	Delete tblSlsJrn
	Delete tblCtr
	Delete tblCmpCnt
	Delete tblCmp
	Delete tblCnt
	Delete tblGlbStt
	Delete tblHlp
	Delete tblMth
	Delete tblSts
	Delete tlkpCtrTyp
	Delete tlkpFld
	Delete tlkpHon
	Delete tlkpHypLnk
	Delete tlkpMlpRgn
	--Delete tlkpMthYr

--- LookUp Tables

--tlkpCtrTyp
	INSERT INTO tlkpCtrTyp ( CtrTypID )
	SELECT tlkpCtrTyp1.CtrTypID
	FROM tlkpCtrTyp1

--tlkpFld
	INSERT INTO tlkpFld ( FldID, FldCaption, FldFlagYN )
	SELECT tlkpFld1.FldID, tlkpFld1.FldCaption, tlkpFld1.FldFlagYN
	FROM tlkpFld1

--tlkpHon
	INSERT INTO tlkpHon ( HonID )
	SELECT tlkpHon1.HonID
	FROM tlkpHon1

--tlkpHypLnk
	INSERT INTO tlkpHypLnk ( HypLnkID, HypLnkPth )
	SELECT tlkpHypLnk1.HypLnkID, tlkpHypLnk1.HypLnkPth
	FROM tlkpHypLnk1
	
-- tlkpMlpRgn
	INSERT INTO tlkpMlpRgn ( MlpRgnID, MlpRgnRate )
	SELECT tlkpMlpRgn1.MlpRgnID, tlkpMlpRgn1.MlpRgnRate
	FROM tlkpMlpRgn1

--tlkpMthY
	/*INSERT INTO tlkpMthYr ( MthYrID, MthYrSort )
	SELECT tlkpMthYr1.MthYrID, tlkpMthYr1.MthYrSort
	FROM tlkpMthYr1*/


--DATA TABLES

--tblCmp
	INSERT INTO tblCmp ( CmpKey, CmpID, CmpName, CmpCode, CmpAddress1, CmpAddress2, CmpCity, CmpState, CmpZip, CmpCountry, CmpPhone, CmpFax, CmpWeb, CmpSiteBedNo, CmpPhyGrpYN, CmpSysYN, CmpSiteYN, CmpBillAgentYN, CmpMalCarYN, CmpOtherYN, CmpTranscriptYN, CmpComment, CmpDateCreate, CmpDateEdit, CmpDateInactive, CmpInactiveYN, CmpFlagYN )
	SELECT tblCmp1.CmpKey, tblCmp1.CmpID, tblCmp1.CmpName, tblCmp1.CmpCode, tblCmp1.CmpAddress1, tblCmp1.CmpAddress2, tblCmp1.CmpCity, tblCmp1.CmpState, tblCmp1.CmpZip, tblCmp1.CmpCountry, tblCmp1.CmpPhone, tblCmp1.CmpFax, tblCmp1.CmpWeb, tblCmp1.CmpSiteBedNo, tblCmp1.CmpPhyGrpYN, tblCmp1.CmpSysYN, tblCmp1.CmpSiteYN, tblCmp1.CmpBillAgentYN, tblCmp1.CmpMalCarYN, tblCmp1.CmpOtherYN, tblCmp1.CmpTranscriptYN, tblCmp1.CmpComment, tblCmp1.CmpDateCreate, tblCmp1.CmpDateEdit, tblCmp1.CmpDateInactive, tblCmp1.CmpInactiveYN, tblCmp1.CmpFlagYN
	FROM tblCmp1

--tblCnt
	INSERT INTO tblCnt ( CntKey, CntID, Cnt_CmpID, Cnt_HonID, CntTitle, CntNameFirst, CntNameMiddle, CntNameLast, CntNameSuffix, CntAddress1, CntAddress2, CntCity, CntState, CntZip, CntCountry, CntEmail, CntPhonePref, CntPhonePrefSelect, CntPhoneHome, CntPhoneWork, CntPhoneCell, CntPhoneAlt, CntPager, CntFaxHome, CntFaxWork, CntPhoneVoicemail, CntCALicNo, CntDocNo, CntSSN, CntDOB, CntDateCreate, CntDateEdit, CntDateInactive, CntInactiveYN, CntFlagYN, CntComment, CntDocYN, CntPAYN, CntCAMYN, CntRegDirYN, CntRegAssYN, CntMedDirYN, CntNurseMgrYN, CntQIDirYN, CntAdminYN, CntDirEd )
	SELECT tblCnt1.CntKey, tblCnt1.CntID, tblCnt1.Cnt_CmpID, tblCnt1.Cnt_HonID, tblCnt1.CntTitle, tblCnt1.CntNameFirst, tblCnt1.CntNameMiddle, tblCnt1.CntNameLast, tblCnt1.CntNameSuffix, tblCnt1.CntAddress1, tblCnt1.CntAddress2, tblCnt1.CntCity, tblCnt1.CntState, tblCnt1.CntZip, tblCnt1.CntCountry, tblCnt1.CntEmail, tblCnt1.CntPhonePref, tblCnt1.CntPhonePrefSelect, tblCnt1.CntPhoneHome, tblCnt1.CntPhoneWork, tblCnt1.CntPhoneCell, tblCnt1.CntPhoneAlt, tblCnt1.CntPager, tblCnt1.CntFaxHome, tblCnt1.CntFaxWork, tblCnt1.CntPhoneVoicemail, tblCnt1.CntCALicNo, tblCnt1.CntDocNo, tblCnt1.CntSSN, tblCnt1.CntDOB, tblCnt1.CntDateCreate, tblCnt1.CntDateEdit, tblCnt1.CntDateInactive, tblCnt1.CntInactiveYN, tblCnt1.CntFlagYN, tblCnt1.CntComment, tblCnt1.CntDocYN, tblCnt1.CntPAYN, tblCnt1.CntCAMYN, tblCnt1.CntRegDirYN, tblCnt1.CntRegAssYN, tblCnt1.CntMedDirYN, tblCnt1.CntNurseMgrYN, tblCnt1.CntQIDirYN, tblCnt1.CntAdminYN, tblCnt1.CntDirEd
	FROM tblCnt1

--tblCmpCnt
	INSERT INTO tblCmpCnt ( CmpCntID, CmpCnt_CmpID, CmpCnt_CntID, CmpCntRole )
	SELECT tblCmpCnt1.CmpCntID, tblCmpCnt1.CmpCnt_CmpID, tblCmpCnt1.CmpCnt_CntID, tblCmpCnt1.CmpCntRole
	FROM tblCmpCnt1

--tblRgn
	INSERT INTO tblRgn ( RgnID, RgnDir_CntID, RgnDirAss_CntID, RgnName )
	SELECT tblRgn1.RgnID, tblRgn1.RgnDir_CntID, tblRgn1.RgnDirAss_CntID, tblRgn1.RgnName
	FROM tblRgn1

--tblCtr
	INSERT INTO tblCtr ( CtrID, CtrSite_CmpID, CtrSys_CmpID, CtrTranscript_CmpID, CtrBillAgt_CmpID, CtrPhyGrp_CmpID, CtrMlp_CmpID, CtrBillCmpID, CtrMedDir_CntID, CtrCamAssigned_CntID, Ctr_CtrTypID, Ctr_RgnID, Ctr_MlpRgnID, CtrKey, CtrHPID, CtrPlatinumID, CtrDateStart, CtrDateEffect, CtrDateRenew, CtrDateEnd, CtrYrQty, CtrSysCtrYN, CtrAutoRenewYN, CtrEndNoCseYN, CtrNoCseDayQty, CtrEndCseYN, CtrCseDayQty, CtrRemDayQty, CtrPriorAdjCollWIPAmtDefault, CtrPriorCollectARDefault, CtrPriorLoanBalDefault, CtrStipAmt, CtrStipDesc, CtrOtherPayAmt, CtrOtherPayDesc, CtrEmpPhysPaid, CtrWrkCompPaidYN, CtrCompeteClauseYN, CtrBillRecDayQty, CtrBillAgtDateStart, CtrMlpDateEffect, CtrTrmCtrYN, CtrPrmBseYN, 
	CtrElecLogYN, CtrNrsInitProtoYN, CtrTriageProtoYN, CtrClnPthwyYN, CtrPrcGdeYN, CtrComputeAfcYN, CtrElecMedRcdYN, CtrObsvUnitYN, CtrChstPnYN, CtrFastTrkYn, CtrOccMedYN, CtrHspYN, CtrMedTracYN, CtrStatPITpct, CtrStatRDpct, CtrStatMDpct, CtrStatContribpct, CtrBseHour, CtrBillRate, CtrIncExpComment, CtrSiteOvrHdpct, CtrIntRate, CtrDateFeeInc, CtrPctInc, CtrNightPct, CtrDiffRate, CtrDiffAmt, CtrDayRate, CtrNightRate, CtrBedQty, CtrEmail, CtrDateCreate, CtrDateEdit, CtrInactiveYn, CtrFlagYn, CtrComment, CtrRequireMailYN )
	SELECT tblCtr1.CtrID, tblCtr1.CtrSite_CmpID, tblCtr1.CtrSys_CmpID, tblCtr1.CtrTranscript_CmpID, tblCtr1.CtrBillAgt_CmpID, tblCtr1.CtrPhyGrp_CmpID, tblCtr1.CtrMlp_CmpID, tblCtr1.CtrBillCmpID, tblCtr1.CtrMedDir_CntID, tblCtr1.CtrCamAssigned_CntID, tblCtr1.Ctr_CtrTypID, tblCtr1.Ctr_RgnID, tblCtr1.Ctr_MlpRgnID, tblCtr1.CtrKey, tblCtr1.CtrHPID, tblCtr1.CtrPlatinumID, tblCtr1.CtrDateStart, tblCtr1.CtrDateEffect, tblCtr1.CtrDateRenew, tblCtr1.CtrDateEnd, tblCtr1.CtrYrQty, tblCtr1.CtrSysCtrYN, tblCtr1.CtrAutoRenewYN, tblCtr1.CtrEndNoCseYN, tblCtr1.CtrNoCseDayQty, tblCtr1.CtrEndCseYN, tblCtr1.CtrCseDayQty, tblCtr1.CtrRemDayQty, tblCtr1.CtrPriorAdjCollWIPAmtDefault, tblCtr1.CtrPriorCollectARDefault, tblCtr1.CtrPriorLoanBalDefault, tblCtr1.CtrStipAmt, tblCtr1.CtrStipDesc, tblCtr1.CtrOtherPayAmt, tblCtr1.CtrOtherPayDesc, tblCtr1.CtrEmpPhysPaid, tblCtr1.CtrWrkCompPaidYN, tblCtr1.CtrCompeteClauseYN, tblCtr1.CtrBillRecDayQty, tblCtr1.CtrBillAgtDateStart, tblCtr1.CtrMlpDateEffect, tblCtr1.CtrTrmCtrYN, tblCtr1.CtrPrmBseYN, 
	tblCtr1.CtrElecLogYN, tblCtr1.CtrNrsInitProtoYN, tblCtr1.CtrTriageProtoYN, tblCtr1.CtrClnPthwyYN, tblCtr1.CtrPrcGdeYN, tblCtr1.CtrComputeAfcYN, tblCtr1.CtrElecMedRcdYN, tblCtr1.CtrObsvUnitYN, tblCtr1.CtrChstPnYN, tblCtr1.CtrFastTrkYn, tblCtr1.CtrOccMedYN, tblCtr1.CtrHspYN, tblCtr1.CtrMedTracYN, tblCtr1.CtrStatPITpct, tblCtr1.CtrStatRDpct, tblCtr1.CtrStatMDpct, tblCtr1.CtrStatContribpct, tblCtr1.CtrBseHour, tblCtr1.CtrBillRate, tblCtr1.CtrIncExpComment, tblCtr1.CtrSiteOvrHdpct, tblCtr1.CtrIntRate, tblCtr1.CtrDateFeeInc, tblCtr1.CtrPctInc, tblCtr1.CtrNightPct, tblCtr1.CtrDiffRate, tblCtr1.CtrDiffAmt, tblCtr1.CtrDayRate, tblCtr1.CtrNightRate, tblCtr1.CtrBedQty, tblCtr1.CtrEmail, tblCtr1.CtrDateCreate, tblCtr1.CtrDateEdit, tblCtr1.CtrInactiveYn, tblCtr1.CtrFlagYn, tblCtr1.CtrComment, tblCtr1.CtrRequireMailYN
	FROM tblCtr1


--tblActJrn
	INSERT INTO tblActJrn ( ActJrnID, ActJrn_CtrID, ActJrnCtrCnt, ActJrnNotify1, ActJrnKey, ActJrnDate, ActJrnRequest, ActJrnCompleteYN, ActJrnDateComplete, ActJrnComment )
	SELECT tblActJrn1.ActJrnID, tblActJrn1.ActJrn_CtrID, tblActJrn1.ActJrnCtrCnt, tblActJrn1.ActJrnNotify1, tblActJrn1.ActJrnKey, tblActJrn1.ActJrnDate, tblActJrn1.ActJrnRequest, tblActJrn1.ActJrnCompleteYN, tblActJrn1.ActJrnDateComplete, tblActJrn1.ActJrnComment
	FROM tblActJrn1
--tblAct
	INSERT INTO tblAct ( ActID, Act_ActJrnID, Act_SlsJrnID, ActDate, ActTime, ActAction, ActFlagYN )
	SELECT tblAct1.ActID, tblAct1.Act_ActJrnID, tblAct1.Act_SlsJrnID, tblAct1.ActDate, tblAct1.ActTime, tblAct1.ActAction, tblAct1.ActFlagYN			
	FROM tblAct1

--tblGlbStt
	INSERT INTO tblGlbStt ( GlbSttID, GlbSttNote )
	SELECT tblGlbStt1.GlbSttID, tblGlbStt1.GlbSttNote
	FROM tblGlbStt1

--tblHlp
	INSERT INTO tblHlp ( Hlp_CtrID, Hlp_FldID, HlpID, HlpRequiredYN, HlpText, HlpHyperlink )
	SELECT tblHlp1.Hlp_CtrID, tblHlp1.Hlp_FldID, tblHlp1.HlpID, tblHlp1.HlpRequiredYN, tblHlp1.HlpText, tblHlp1.HlpHyperlink
	FROM tblHlp1

--tblMth
	INSERT INTO tblMth ( MthDate, MthID, MthDays, MthFirstDay, MthLastDay, MthYearDays, MthMonth, MthYear, MthLastDayPlus, MthDaysToDate, MthDateRatio )
	SELECT tblMth1.MthDate, tblMth1.MthID, tblMth1.MthDays, tblMth1.MthFirstDay, tblMth1.MthLastDay, tblMth1.MthYearDays, tblMth1.MthMonth, tblMth1.MthYear, tblMth1.MthLastDayPlus, tblMth1.MthDaysToDate, tblMth1.MthDateRatio
	FROM tblMth1

--tblRpt
	INSERT INTO tblRpt ( RptID, RptTitle, RptCmpYN, RptCntYN, RptCtrYN, RptBdgYN, RptSttYN, RptRptYN, RptActJrnYN, RptDistYN, RptDetailYN, RptListYN, RptSampleCriteria, RptDateCreate, RptDateEdit, RptComment )
	SELECT tblRpt1.RptID, tblRpt1.RptTitle, tblRpt1.RptCmpYN, tblRpt1.RptCntYN, tblRpt1.RptCtrYN, tblRpt1.RptBdgYN, tblRpt1.RptSttYN, tblRpt1.RptRptYN, tblRpt1.RptActJrnYN, tblRpt1.RptDistYN, tblRpt1.RptDetailYN, tblRpt1.RptListYN, tblRpt1.RptSampleCriteria, tblRpt1.RptDateCreate, tblRpt1.RptDateEdit, tblRpt1.RptComment
	FROM tblRpt1

--tblRptCtr
	INSERT INTO tblRptCtr ( RptCtrID, RptCtr_RptID, RptCtr_CtrID, RptDstComment )
	SELECT tblRptCtr1.RptCtrID, tblRptCtr1.RptCtr_RptID, tblRptCtr1.RptCtr_CtrID, tblRptCtr1.RptDstComment
	FROM tblRptCtr1

--tblRptCtrCnt
	INSERT INTO tblRptCtrCnt ( RptCtrCntID, RptCtrCnt_RptCtrID, RptCtrCnt_CntID, RptDstComment, RptCtrCntSuppressYN )
	SELECT tblRptCtrCnt1.RptCtrCntID, tblRptCtrCnt1.RptCtrCnt_RptCtrID, tblRptCtrCnt1.RptCtrCnt_CntID, tblRptCtrCnt1.RptDstComment, tblRptCtrCnt1.RptCtrCntSuppressYN
	FROM tblRptCtrCnt1

--tblSlsJrn
	INSERT INTO tblSlsJrn ( SlsJrnID, SlsJrn_CtrID, SlsJrn_CmpID, SlsJrn_CntID, SlsJrnContact, SlsJrnContactNumber, SlsJrnKey, SlsJrnDate, SlsJrnTopic, SlsJrnCompleteYN, SlsJrnDateComplete, SlsJrnComment )
	SELECT tblSlsJrn1.SlsJrnID, tblSlsJrn1.SlsJrn_CtrID, tblSlsJrn1.SlsJrn_CmpID, tblSlsJrn1.SlsJrn_CntID, tblSlsJrn1.SlsJrnContact, tblSlsJrn1.SlsJrnContactNumber, tblSlsJrn1.SlsJrnKey, tblSlsJrn1.SlsJrnDate, tblSlsJrn1.SlsJrnTopic, tblSlsJrn1.SlsJrnCompleteYN, tblSlsJrn1.SlsJrnDateComplete, tblSlsJrn1.SlsJrnComment
	FROM tblSlsJrn1

--tblBdg
	INSERT INTO tblBdg ( Bdg_CtrID, BdgYear, BdgID, BdgKey, BdgPatients, BdgPstChgs, BdgTargetRate, BdgOffTop, BdgLclExp, BdgPACost, BdgPTCost, BdgBillFee, BdgBillRate, BdgBillSpec, BdgPITpct, BdgPITEarnedPct, BdgMDpct, BdgRDpct, BdgContribPct, BdgInterestRate, BdgMPRate, BdgStipendsRcvd, BdgOthRcpts, BdgDocHours, BdgPAHours, BdgAvgChgPt, BdgMalpractice, BdgInterest, BdgNOR, BdgContribCEP, BdgPITearned, BdgMDearned, BdgRDearned, BdgDocEarnedHrly, BdgSiteNetInc, BdgPACostPct, BdgPTCostPct, BdgSiteOvrHdPct, BdgLclExpPct, BdgNetPctofNOR, BdgNetRevPerPt, BdgCollPerPt, BdgPtsPerHr, BdgGrossColl, BdgTotalColl, BdgSiteOverhead, BdgPACostHr, BdgBlendedHrs, BdgBlendedPtsHr, BdgDateCreate, BdgDateEdit, BdgFlagYN, BdgInactiveYN )
	SELECT tblBdg1.Bdg_CtrID, tblBdg1.BdgYear, tblBdg1.BdgID, tblBdg1.BdgKey, tblBdg1.BdgPatients, tblBdg1.BdgPstChgs, tblBdg1.BdgTargetRate, tblBdg1.BdgOffTop, tblBdg1.BdgLclExp, tblBdg1.BdgPACost, tblBdg1.BdgPTCost, tblBdg1.BdgBillFee, tblBdg1.BdgBillRate, tblBdg1.BdgBillSpec, tblBdg1.BdgPITpct, tblBdg1.BdgPITEarnedPct, tblBdg1.BdgMDpct, tblBdg1.BdgRDpct, tblBdg1.BdgContribPct, tblBdg1.BdgInterestRate, tblBdg1.BdgMPRate, tblBdg1.BdgStipendsRcvd, tblBdg1.BdgOthRcpts, tblBdg1.BdgDocHours, tblBdg1.BdgPAHours, tblBdg1.BdgAvgChgPt, tblBdg1.BdgMalpractice, tblBdg1.BdgInterest, tblBdg1.BdgNOR, tblBdg1.BdgContribCEP, tblBdg1.BdgPITearned, tblBdg1.BdgMDearned, tblBdg1.BdgRDearned, tblBdg1.BdgDocEarnedHrly, tblBdg1.BdgSiteNetInc, tblBdg1.BdgPACostPct, tblBdg1.BdgPTCostPct, tblBdg1.BdgSiteOvrHdPct, tblBdg1.BdgLclExpPct, tblBdg1.BdgNetPctofNOR, tblBdg1.BdgNetRevPerPt, tblBdg1.BdgCollPerPt, tblBdg1.BdgPtsPerHr, tblBdg1.BdgGrossColl, tblBdg1.BdgTotalColl, tblBdg1.BdgSiteOverhead, tblBdg1.BdgPACostHr, tblBdg1.BdgBlendedHrs, tblBdg1.BdgBlendedPtsHr, tblBdg1.BdgDateCreate, tblBdg1.BdgDateEdit, tblBdg1.BdgFlagYN, tblBdg1.BdgInactiveYN
	FROM tblBdg1

--tblStt
	INSERT INTO tblStt ( SttDate, Stt_CtrID, Stt_BdgID, Stt_BdgYear, SttID, SttKey, SttLink, SttAdmitQty, SttBillFee, SttBillRate, SttBillSpec, SttBseHour, SttChartQty, SttChartPostQty, SttChartMissQty, SttChartMiss30Qty, SttCashARAmt, SttCollectibleARAmt, SttCollectWIP, SttContribPct, SttCurrLoanBal, SttDiffAmt, SttDiffRate, SttDocHourQty, SttDocPaidAdjAmt, SttDocPaidAmt, SttIntRate, SttLclExp, SttMDPaidAmt, SttMDpct, SttMPRate, SttNightPct, SttNonCurrAdjAmt, SttNorAmt, SttOffTop, SttOtherRcpts, SttPACost, SttPAhoursQty, SttPatVisitQty, SttPhysTherVisitQty, SttPstChgs, SttPTCost, SttPtsKeyed, SttRDPaidAmt, SttRDpct, SttRefAR, SttSiteOvrHdPct, SttSrpAdjAmt, SttSrpAdjAmtComment, SttSrpAdjAmtPct, SttStatPITpct, SttStipRcvd, SttTargetRate, SttUnspecifiedComment, SttValuationGainLossComment, SttWIPGainLossComment, SttDateCreate, SttDateEdit, SttInactiveYN, SttFlagYN, SttAdjCollWIPAmt, SttAvgChgPt, SttBlendedHrs, SttBlendedPtsPerHr, SttCashExpAmt, SttCashRcptAmt, SttCollFeeAmt, SttCollPerPtAmt, SttCompPITpct, SttCompMDpct, SttCompRDpct, SttContribCEPAmt, SttDayRate, SttDocEarnedHourAmt, SttDocPaidHourAmt, SttDocPITearnedAmt, SttEndCollectAR, SttGrossCollAmt, SttIntAmt, SttLclExpPct, SttMlpAmt, SttNetAmt, SttNetChangeinARAmt, SttNetPctofNOR, SttNetRevPerPtAmt, SttNightRate, SttNonCurrAdjPct, SttPACostPct, SttPAPaidHourAmt, SttPriorAdjCollWIPAmt, SttPriorCollectAR, SttPriorLoanBal, SttPTCostPct, SttPtsPerHr, SttSiteNetIncAmt, SttSiteOverheadAmt, SttSurplusDeficitAmt, SttTotalCollAmt, SttTotalCollPerPt, SttValuationGainLossAmt, SttWIPGainLossAmt, YtdSttPstChgs, YtdBdgPstChgs, YtdGrossColl, YtdBdgGrossColl, YtdSttTargetRate, YtdBdgTargetRate, YtdStipendsRcvd, YtdBdgStipendsRcvd, YtdOtherRcpts, YtdBdgOthRcpts, YtdValuationGainLoss, YtdTotalColl, YtdBdgTotalColl, YtdMalpractice, YtdBdgMalpractice, YtdInterest, YtdBdgInterest, YtdSttBillFee, YtdBdgBillFee, YtdBillSpec, YtdBdgBillSpec, YtdSttOffTop, YtdBdgOffTop, YtdSiteOverhead, YtdBdgSiteOverhead, YtdNOR, YtdBdgNOR, YtdNetPctofNOR, YtdBdgNetPctofNOR, YtdSttDocPaidAmt, YtdSttDocPaidAmtAdj, YtdBdgPITEarned, YtdPITearned, YtdBdgPITearned2, YtdPITpct, YtdBdgPITPct, YtdSttPACost, YtdBdgPACost, YtdSttPACostPct, YtdBdgPACostPct, YtdSttPTCost, YtdBdgPTCost, YtdSttPTCostPct, YtdBdgPTCostPct, YtdSttLclExp, YtdBdgLclExp, YtdSttLclExpPct, YtdBdgLclExpPct, YtdSttRDPaidAmt, YtdBdgRDearned, YtdRDpct, YtdBdgRDpct, YtdSttMDPaidAmt, YtdBdgMDearned, YtdMDpct, YtdBdgMDpct, YtdSttNonCurrAdjAmt, YtdNonCurrAdjPct, YtdSttSrpAdjAmt, YtdSttSrpAdjAmtPct, YtdContribCEP, YtdBdgContribCEP, YtdStatContribPct, YtdBdgContribPct, YtdSiteNetInc, YtdBdgSiteNetInc, YtdSttPatVisitQty, YtdBdgPatients, YtdSttAdmitQty, YtdSttPhysTherVisitQty, YtdSttPtsKeyed, YtdSttDocPaidAmtHrly, YtdDocEarnedHrly, YtdBdgDocEarnedHrly, YtdDocHours, YtdBdgDocHours, YtdPAHours, YtdBdgPAHours, YtdPAPaidHrly, YtdBdgPAPaidHrly, YtdPtsPerHr, YtdBdgPtsPerHr, YtdBlendedPtsPerHr, YtdbdgBlendedPtsPerHr, YtdNetRevPerPt, YtdBdgNetRevPerPt, YtdAvgChgPt, YtdBdgAvgChgPt, YtdCollPerPt, YtdBdgCollPerPt, YtdTotalCollPerPt, YtdWIPGainLoss )
	SELECT tblStt1.SttDate, tblStt1.Stt_CtrID, tblStt1.Stt_BdgID, tblStt1.Stt_BdgYear, tblStt1.SttID, tblStt1.SttKey, tblStt1.SttLink, tblStt1.SttAdmitQty, tblStt1.SttBillFee, tblStt1.SttBillRate, tblStt1.SttBillSpec, tblStt1.SttBseHour, tblStt1.SttChartQty, tblStt1.SttChartPostQty, tblStt1.SttChartMissQty, tblStt1.SttChartMiss30Qty, tblStt1.SttCashARAmt, tblStt1.SttCollectibleARAmt, tblStt1.SttCollectWIP, tblStt1.SttContribPct, tblStt1.SttCurrLoanBal, tblStt1.SttDiffAmt, tblStt1.SttDiffRate, tblStt1.SttDocHourQty, tblStt1.SttDocPaidAdjAmt, tblStt1.SttDocPaidAmt, tblStt1.SttIntRate, tblStt1.SttLclExp, tblStt1.SttMDPaidAmt, tblStt1.SttMDpct, tblStt1.SttMPRate, tblStt1.SttNightPct, tblStt1.SttNonCurrAdjAmt, tblStt1.SttNorAmt, tblStt1.SttOffTop, tblStt1.SttOtherRcpts, tblStt1.SttPACost, tblStt1.SttPAhoursQty, tblStt1.SttPatVisitQty, tblStt1.SttPhysTherVisitQty, tblStt1.SttPstChgs, tblStt1.SttPTCost, tblStt1.SttPtsKeyed, tblStt1.SttRDPaidAmt, tblStt1.SttRDpct, tblStt1.SttRefAR, tblStt1.SttSiteOvrHdPct, tblStt1.SttSrpAdjAmt, tblStt1.SttSrpAdjAmtComment, tblStt1.SttSrpAdjAmtPct, tblStt1.SttStatPITpct, tblStt1.SttStipRcvd, tblStt1.SttTargetRate, tblStt1.SttUnspecifiedComment, tblStt1.SttValuationGainLossComment, tblStt1.SttWIPGainLossComment, tblStt1.SttDateCreate, tblStt1.SttDateEdit, tblStt1.SttInactiveYN, tblStt1.SttFlagYN, tblStt1.SttAdjCollWIPAmt, tblStt1.SttAvgChgPt, tblStt1.SttBlendedHrs, tblStt1.SttBlendedPtsPerHr, tblStt1.SttCashExpAmt, tblStt1.SttCashRcptAmt, tblStt1.SttCollFeeAmt, tblStt1.SttCollPerPtAmt, tblStt1.SttCompPITpct, tblStt1.SttCompMDpct, tblStt1.SttCompRDpct, tblStt1.SttContribCEPAmt, tblStt1.SttDayRate, tblStt1.SttDocEarnedHourAmt, tblStt1.SttDocPaidHourAmt, tblStt1.SttDocPITearnedAmt, tblStt1.SttEndCollectAR, tblStt1.SttGrossCollAmt, tblStt1.SttIntAmt, tblStt1.SttLclExpPct, tblStt1.SttMlpAmt, tblStt1.SttNetAmt, tblStt1.SttNetChangeinARAmt, tblStt1.SttNetPctofNOR, tblStt1.SttNetRevPerPtAmt, tblStt1.SttNightRate, tblStt1.SttNonCurrAdjPct, tblStt1.SttPACostPct, tblStt1.SttPAPaidHourAmt, tblStt1.SttPriorAdjCollWIPAmt, tblStt1.SttPriorCollectAR, tblStt1.SttPriorLoanBal, tblStt1.SttPTCostPct, tblStt1.SttPtsPerHr, tblStt1.SttSiteNetIncAmt, tblStt1.SttSiteOverheadAmt, tblStt1.SttSurplusDeficitAmt, tblStt1.SttTotalCollAmt, tblStt1.SttTotalCollPerPt, tblStt1.SttValuationGainLossAmt, tblStt1.SttWIPGainLossAmt, tblStt1.YtdSttPstChgs, tblStt1.YtdBdgPstChgs, tblStt1.YtdGrossColl, tblStt1.YtdBdgGrossColl, tblStt1.YtdSttTargetRate, tblStt1.YtdBdgTargetRate, tblStt1.YtdStipendsRcvd, tblStt1.YtdBdgStipendsRcvd, tblStt1.YtdOtherRcpts, tblStt1.YtdBdgOthRcpts, tblStt1.YtdValuationGainLoss, tblStt1.YtdTotalColl, tblStt1.YtdBdgTotalColl, tblStt1.YtdMalpractice, tblStt1.YtdBdgMalpractice, tblStt1.YtdInterest, tblStt1.YtdBdgInterest, tblStt1.YtdSttBillFee, tblStt1.YtdBdgBillFee, tblStt1.YtdBillSpec, tblStt1.YtdBdgBillSpec, tblStt1.YtdSttOffTop, tblStt1.YtdBdgOffTop, tblStt1.YtdSiteOverhead, tblStt1.YtdBdgSiteOverhead, tblStt1.YtdNOR, tblStt1.YtdBdgNOR, tblStt1.YtdNetPctofNOR, tblStt1.YtdBdgNetPctofNOR, tblStt1.YtdSttDocPaidAmt, tblStt1.YtdSttDocPaidAmtAdj, tblStt1.YtdBdgPITEarned, tblStt1.YtdPITearned, tblStt1.YtdBdgPITearned2, tblStt1.YtdPITpct, tblStt1.YtdBdgPITPct, tblStt1.YtdSttPACost, tblStt1.YtdBdgPACost, tblStt1.YtdSttPACostPct, tblStt1.YtdBdgPACostPct, tblStt1.YtdSttPTCost, tblStt1.YtdBdgPTCost, tblStt1.YtdSttPTCostPct, tblStt1.YtdBdgPTCostPct, tblStt1.YtdSttLclExp, tblStt1.YtdBdgLclExp, tblStt1.YtdSttLclExpPct, tblStt1.YtdBdgLclExpPct, tblStt1.YtdSttRDPaidAmt, tblStt1.YtdBdgRDearned, tblStt1.YtdRDpct, tblStt1.YtdBdgRDpct, tblStt1.YtdSttMDPaidAmt, tblStt1.YtdBdgMDearned, tblStt1.YtdMDpct, tblStt1.YtdBdgMDpct, tblStt1.YtdSttNonCurrAdjAmt, tblStt1.YtdNonCurrAdjPct, tblStt1.YtdSttSrpAdjAmt, tblStt1.YtdSttSrpAdjAmtPct, tblStt1.YtdContribCEP, tblStt1.YtdBdgContribCEP, tblStt1.YtdStatContribPct, tblStt1.YtdBdgContribPct, tblStt1.YtdSiteNetInc, tblStt1.YtdBdgSiteNetInc, tblStt1.YtdSttPatVisitQty, tblStt1.YtdBdgPatients, tblStt1.YtdSttAdmitQty, tblStt1.YtdSttPhysTherVisitQty, tblStt1.YtdSttPtsKeyed, tblStt1.YtdSttDocPaidAmtHrly, tblStt1.YtdDocEarnedHrly, tblStt1.YtdBdgDocEarnedHrly, tblStt1.YtdDocHours, tblStt1.YtdBdgDocHours, tblStt1.YtdPAHours, tblStt1.YtdBdgPAHours, tblStt1.YtdPAPaidHrly, tblStt1.YtdBdgPAPaidHrly, tblStt1.YtdPtsPerHr, tblStt1.YtdBdgPtsPerHr, 	tblStt1.YtdBlendedPtsPerHr, tblStt1.YtdbdgBlendedPtsPerHr, tblStt1.YtdNetRevPerPt, tblStt1.YtdBdgNetRevPerPt, tblStt1.YtdAvgChgPt, tblStt1.YtdBdgAvgChgPt, tblStt1.YtdCollPerPt, tblStt1.YtdBdgCollPerPt, tblStt1.YtdTotalCollPerPt, tblStt1.YtdWIPGainLoss
	FROM tblStt1

	return 

