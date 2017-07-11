CREATE PROCEDURE [dbo].[stpAppendSiteLine_YTD_Combined_Summary]
(@sttDate datetime)

AS 

Declare @firstDyYear varchar(4)
set @firstDyYear = year(@sttdate)

Begin
Set NoCount on

truncate table tblSiteLine_YTD_Combined_Summary

INSERT INTO tblSiteLine_YTD_Combined_Summary
                      (SttDate, PostActPrcBud, SumytdSttPstChgs, PostActPerPt, SumytdBdgPstChg, EstColRtActTot, EstColRtActPerPt, 
                      EstColRtBudTot, EstGrsColActPrcBud, SumytdGrossColl, EstGrsColActPerPt, SumytdBdgGrossColl, StpdRecActPrtBud, SumytdStipendsRcvd, 
                      StpdRecActPerPt, SumytdBdgStipendsRcvd, OthRecActPrtBud, SumytdOtherRcpts, OthRecActPerPt, SumytdBdgOthRcpts, SumytdWIPGainLoss,  
                      WIPActPerPt, SumytdValuationGainLoss, ValGainActPerPt, EstTotRevActPrtBud, SumytdTotalColl, EstTotRevActPrtRev, EstTotRevActPerPt, 
                      SumytdBdgTotalColl, MalActPrtBud, SumytdMalpractice, MalActPrtRev, MalActPerPt, SumytdBdgMalpractice, BilActPrtBud, SumytdSttBillFee, 
                      BilActPrtRev, BilActPerPt, SumytdBdgBillFee, SumYtdSttCollFeeChgAmt, FutColActPerPt, IntActPrtBud, SumytdInterest, IntActPrtRev, IntActPerPt, 
                      SumytdbdgInterest, StOverActPrtBud, StOverActTot, StOverActPrtRev, StOverActPerPt, SumytdBdgSiteOverhead, OtpExpActPrtBud, OtpExpActTot, 
                      OtpExpActPrtRev, OtpExpActPerPt, OtpExpBudTot, StPerActPrtBud, StPerActTot, StPerActPrtRev, StPerActPerPt, SumytdBdgBillSpec, NORActPrtBud, 
                      SumytdNOR, NORActPrtNOR, NORActPrtRev, NORActPerPt, SumytdBdgNOR,
		      NORBudPrtNOR ,
		      PhPayActPrtBud, PhPayActTot, PhPayActPrtNOR, 
                      PhPayActPrtRev, PhPayActPerPt, SumytdBdgPITEarned, PhPayBudPRtNOR, MLPayActPrtBud, MLPayActTot, MLPayAcPrtNOR, MLPayActPrtRev, 
                      MLPayActPerPt, SumytdBdgPACost, MLPayBudPrtNor, PhThPayActPrtBud, PhThPayActPrtTot, PhThPayActPrtNOR, PhThPayActPrtRev, 
                      PhThPayActPerPt, SumytdBdgPTCost, PhThPayBudPrtNOR, LExpBud, LExpActPrtBud, LExpActTot, LExpActPrtNOR, LExpActPrtRev, LExpActPerPt, 
                      SumytdBdgLclExp, LExpBudPrtNOR, OthPayActTot, OthPayActPrtNOR, OthPayActPrtRev, OthPayActPerPt, MedDPayActPRtBud, SumytdSttMDPaidAmt, 
                      MedDPayActPrtNOR, MedDPayActPrtRev, MedDPayActPerPt, SumytdBdgMDearned, MedDPayBudPrtNOR, RgDPayActPrtBud, RgDPayActTot, 
                      RgDPayActPrtNOR, RgDPayActPrtRev, RgDPayActPerPt, SumytdBdgRDearned, RgDPayBudPrtNOR, DCntActPrtBud, SumytdContribCEP, 
                      DCntActPrtNOR, DCntActPrtRev, DCntActPerPt, SumytdBdgContribCEP, DCntBudPrtNOR, SumytdSiteNetInc, SNIncActPrtNor, SNIncActPrtRev, 
                      SNIncActPerPt, SumytdBdgSiteNetInc, SNIncBudPrtNOR, PatVisBud1, PatVisBud2, SumytdBdgPatients, PatKyd, PhHr1, SumytdDocHours, PhHr3, 
                      SumytdBdgDocHours, PhEHr1, PhEHr2, PhEHr3, PhPayHr1, PhPayHr2, MLHr1, SumytdPAHours, MLHr3, SumytdBdgPAHours, MLCostHr1, MLCostHr2, 
                      MLCostHr3, PtsPerMDHrOnly1, PtsPerMDHrOnly2, PtsPerMDHrOnly3, PtsPerMDandMLHr1, PtsPerMDandMLHr2, PtsPerMDandMLHr3, AvChPerPat1, 
                      AvChPerPAt2, AvChPerPAt3, EstColPerPat1, EstColPerPat2, EstColPerPat3, EstTotRevPerPat1, EstTotRevPerPat2, EstTotRevPerPat3, EstNORPerPat1, EstNORPerPat2, 
                      EstNORPerPat3, SumYtdSttACCExpenseAmt, OpExpPrtRev, OpExpPerPt, SumYtdSiteOverhead, StOvhdPrtRev, StOvhdPerPt, ACCStOvdTotYTD, 
                      ACCStOvdTotPrtRev, ACCStOvdTotPerPt, DonatYTD, DonatPrtRev, DonatPerPt, AlOthExpYTD, AlOthExpPrtRev, AlOthExpPerPt, CEPretYtd, 
                      CEPretPrtRec, CEPretPerPt, OTpExpTotYtd, OTpExpPrtRev, OTpExpPerPt, MaAdminYtd, MaAdminPrtRev, MaAdminPerPt, DCodPerYtd, DCodPerPrtRev, 
                      DCodPerPerPt, CEPScbYtd, CEPScbPrtRev, CEPScbPerPt, CEPScbPTOYtd, CEPScbPTOPrtRev, CEPScbPTOPerPt, CEPStPerYtd, CEPStPerPrtRev, 
                      CEPStPerPerPr, CEPStPerPTOYtd, CEPStPerPTOPrtRev, CEPStPerPTOPerPt, NClStfTotYtd, NClStfTotPRtRev, NClStfTotPerPt, MLvExpYtd, 
                      MLvExpPrtNOR, MLvExpPrtRev, MLvExpPerPt, MlvPTOExpYtd, MlvPTOExpPrtNOR, MlvPTOExpPrtRev, MlvPTOExpPerPt, LMLvCstSupYtd, 
                      LMLvCstSupPrtNor, LMLvCstPrtRev, LMLvCstSupPerPt, MlvCstTotYtd, MlvCstTotPrtNOR, MlvCstTotPrtRev, MlvCstTotPerPt, PTExpYtd, PTExpPrtNOR, 
                      PTExpPrtRev, PTExpPerPt, PTPTOExpYtd, PTPTOExpPrtNOR, PTPTOExpPrtRev, PTPTOExpPerPt, PTCstTotYtd, PTCstTotPrtNOR, PTCstTotPrtRev, 
                      PTCstTotPerPt, LcExpYtd, LcExpPrtNOR, LcExpPrtRev, LcExpPerPt, OthLcExpYtd, OthLcExpPrtNOR, OthLcExpPerPt, OthLcExpPerPt1, TotLcExpCstYtd, 
                      TotLcExpCstPrtNor, TotLcExpCstPrtRev, TotLcExpCstPerPt, NCrtPITAdjYtd, NCrtPITAdjPrtNOR, NCrtPITAdjPrtRev, NCrtPITAdjPerPt, SrpPayoutYtd, 
                      SrpPayoutPrtNOR, SrpPayoutPrtRev, SrpPayoutPerPt, NcrtMDPayYtd, NcrtMDPayPrtNOR, NcrtMDPayPrtRev, NcrtMDPayPrtPerPt, NCrtRDPayYtd, 
                      NCrtRDPayPrtNOR, NCrtRDPayPrtRev, NCrtRDPayPerPt, SrpAdjYtd, SrpAdjPrtNOR, SrpAdjPrtRev, SrpAdjPerPt, OthPayTotYtd, OthPayTotPrtNOR, 
                      OthPayTotPrtRev, OthPayTotPrtPerPt, SiteLineSiteID, ProcessLevel/**/)
select SttDate,
case when Sum([ytdBdgPstChgs]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,(Sum([ytdSttPstChgs])-Sum([ytdBdgPstChgs]))/Sum([ytdBdgPstChgs])*100,2))+'%') end as PostActPrcBud,
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdSttPstChgs]),0))),
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([ytdSttPstChgs])/Sum([ytdSttPatVisitQty])),2),0))) end as PostActPerPt,
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgPstChgs]),0))),

case when Sum([ytdSttPstChgs]) = 0 then '0' else convert (varchar(50),convert(float,(Sum([ytdTotalColl])-Sum([ytdStipendsRcvd])-Sum([ytdOtherRcpts]))/Sum([ytdSttPstChgs])*100,0))+'%' end as EstColRtActTot,
case when Sum([ytdSttPatVisitQty]) = 0 or Sum([ytdSttPstChgs]) = 0 then '0' 
	else convert (varchar(50),convert(float,((Sum([ytdTotalColl])/Sum([ytdSttPatVisitQty]))-(Sum([ytdStipendsRcvd])/Sum([ytdSttPatVisitQty]))-(Sum([ytdOtherRcpts])/Sum([ytdSttPatVisitQty])))/(Sum([ytdSttPstChgs])/Sum([ytdSttPatVisitQty]))*100,2))+'%' end as EstColRtActPerPt,
case when Sum([ytdBdgPstChgs]) = 0 then '0' else convert (varchar(50),convert(float,Sum([ytdBdgGrossColl])/Sum([ytdBdgPstChgs])*100,2))+'%' end as EstColRtBudTot,

case when Sum([ytdBdgGrossColl]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdGrossColl])-Sum([ytdBdgGrossColl]))/Sum([ytdBdgGrossColl])*100,0),2))+'%') end as EstGrsColActPrcBud,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdGrossColl]),2))),
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdGrossColl])/Sum([ytdSttPatVisitQty]),2),2)) end as EstGrsColActPerPt,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgGrossColl]),0))),

case when Sum([ytdBdgStipendsRcvd]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdStipendsRcvd])-Sum([ytdBdgStipendsRcvd]))/Sum([ytdBdgStipendsRcvd])*100,1),0))+'%') end as StpdRecActPrtBud,
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdStipendsRcvd]),0)))),
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([ytdStipendsRcvd])/Sum([ytdSttPatVisitQty]),2),2))) end as StpdRecActPerPt,
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgStipendsRcvd]),0)))),

case when Sum([ytdBdgOthRcpts]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdOtherRcpts])-Sum([ytdBdgStipendsRcvd]))/Sum([ytdBdgOthRcpts]),2),2))+'%') end as OthRecActPrtBud,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdOtherRcpts]),0))) as SumytdOtherRcpts,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdOtherRcpts])/Sum([ytdSttPatVisitQty]),2),2)) end as OthRecActPerPt,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgOthRcpts]),0)))   as SumytdBdgOthRcpts,

dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdWIPGainLoss]),0)))), 
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([ytdWIPGainLoss])/Sum([ytdSttPatVisitQty]),2),2))) end as WIPActPerPt,

dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdValuationGainLoss]),0)))),
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([ytdValuationGainLoss])/Sum([ytdSttPatVisitQty]),2),2))) end as ValGainActPerPt,

case when Sum([ytdBdgTotalColl]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdTotalColl])-Sum([ytdBdgTotalColl]))/Sum([ytdBdgTotalColl])*100,1),2))+'%') end as EstTotRevActPrtBud,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdTotalColl]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,Sum([ytdTotalColl])/Sum([ytdTotalColl])*100,2))+'%' end as EstTotRevActPrtRev,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(Sum([ytdTotalColl])/Sum([ytdSttPatVisitQty]),2),0))) end as EstTotRevActPerPt,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgTotalColl]),0))),

case when Sum([ytdBdgMalpractice]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdMalpractice])-Sum([ytdBdgMalpractice]))/Sum([ytdBdgMalpractice])*100,1),2))+'%') end as EstTotRevActPrtBud,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdMalpractice]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdMalpractice])/Sum([ytdTotalColl])*100,2),0))+'%' end as EstTotRevActPrtRev,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(Sum([ytdMalpractice])/Sum([ytdSttPatVisitQty]),2),0))) end as EstTotRevActPerPt,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgMalpractice]),0))),

case when Sum([ytdBdgBillFee]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdSttBillFee])-Sum([ytdBdgBillFee]))/Sum([ytdBdgBillFee])*100,1),2))+'%') end as BilActPrtBud,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdSttBillFee]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdSttBillFee])/Sum([ytdTotalColl])*100,2),2))+'%' end as BilActPrtRev,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdSttBillFee])/Sum([ytdSttPatVisitQty]),2),2))end as BilActPerPt ,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgBillFee]),0))),

dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,-Sum([YtdSttCollFeeChgAmt]),0)))),
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(-Sum([YtdSttCollFeeChgAmt])/Sum([ytdSttPatVisitQty]),2),2))) end,

case when Sum([ytdbdgInterest]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdInterest])-Sum([ytdbdgInterest]))/Sum([ytdbdgInterest]),1),2))+'%') end as IntActPrtBud,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdInterest]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,Sum([ytdInterest])/Sum([ytdTotalColl])*100,2))+'%' end as IntActPrtRev,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdInterest])/Sum([ytdSttPatVisitQty]),2),2)) end as IntActPerPt,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdbdgInterest]),0))),

case when Sum([ytdBdgSiteOverhead]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(((Sum([ytdSiteOverhead])+Sum([YtdSttAccExpenseAmt]))-Sum([ytdBdgSiteOverhead]))/Sum([ytdBdgSiteOverhead]),1),2))+'%') end as StOverActPrtBud,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdSiteOverhead])+Sum([YtdSttAccExpenseAmt]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSiteOverhead])+Sum([YtdSttAccExpenseAmt]))/Sum([ytdTotalColl]),2),2))+'%' end as StOverActPrtRev,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSiteOverhead])+Sum([YtdSttAccExpenseAmt]))/Sum([ytdSttPatVisitQty]),2),2)) end as StOverActPerPt,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgSiteOverhead]),0))),

case when (Sum([ytdSttOffTop])+Sum([YtdSttDonationAmt])+Sum([YtdSttCEPSurchargeAmt])) = 0 then '0' 
	else convert (varchar(50),convert(float,round(((Sum([ytdSttOffTop])+Sum([YtdSttDonationAmt])+Sum([YtdSttCEPSurchargeAmt]))-(Sum([ytdSttOffTop])+Sum([YtdSttDonationAmt])+Sum([YtdSttCEPSurchargeAmt])))/(Sum([ytdSttOffTop])+Sum([YtdSttDonationAmt])+Sum([YtdSttCEPSurchargeAmt]))*100,2),2))+'%' end as OtpExpActPrtBud,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([ytdSttOffTop])+Sum([YtdSttDonationAmt])+Sum([YtdSttCEPSurchargeAmt])),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttOffTop])+Sum([YtdSttDonationAmt])+Sum([YtdSttCEPSurchargeAmt]))/Sum([ytdTotalColl])*100,2),2))+'%' end as OtpExpActPrtRev,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttOffTop])+Sum([YtdSttDonationAmt])+Sum([YtdSttCEPSurchargeAmt]))/Sum([ytdSttPatVisitQty]),2),2)) end as OtpExpActPerPt,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([YtdBdgOffTop])+Sum([YtdBdgDonations])+Sum([YtdBdgCEPRetentionAmt])),0))),

case when Sum([ytdBdgBillSpec]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(((Sum([ytdBillSpec])+Sum([YtdSttBillSpecMBSIAmt])+Sum([YtdSttBillSpecSitePersonnelAmt])+Sum([YtdSttBillSpecScribesAmt])+Sum([YtdSttBillSpecSitePersonnelAdjAmt])+Sum([YtdSttBillSpecScribesAdjAmt]))-Sum([ytdBdgBillSpec]))/Sum([ytdBdgBillSpec])*100,0),2))+'%') end as StPerActPrtBud,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([ytdBillSpec])+Sum([YtdSttBillSpecMBSIAmt])+Sum([YtdSttBillSpecSitePersonnelAmt])+Sum([YtdSttBillSpecScribesAmt])+Sum([YtdSttBillSpecSitePersonnelAdjAmt])+Sum([YtdSttBillSpecScribesAdjAmt])),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdBillSpec])+Sum([YtdSttBillSpecMBSIAmt])+Sum([YtdSttBillSpecSitePersonnelAmt])+Sum([YtdSttBillSpecScribesAmt])+Sum([YtdSttBillSpecSitePersonnelAdjAmt])+Sum([YtdSttBillSpecScribesAdjAmt]))/Sum([ytdTotalColl])*100,2),2))+'%' end as StPerActPrtRev,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdBillSpec])+Sum([YtdSttBillSpecMBSIAmt])+Sum([YtdSttBillSpecSitePersonnelAmt])+Sum([YtdSttBillSpecScribesAmt])+Sum([YtdSttBillSpecSitePersonnelAdjAmt])+Sum([YtdSttBillSpecScribesAdjAmt]))/Sum([ytdSttPatVisitQty]),2),2)) end as StPerActPerPt,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgBillSpec]),0))),

case when Sum([ytdBdgNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdNOR])-Sum([ytdBdgNOR]))/Sum([ytdBdgNOR])*100,1),2)) +'%') end as NORActPrtBud,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdNOR]),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdNOR])/Sum([ytdNOR])*100,2),2)) +'%' end as NORActPrtNOR,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdNOR])/Sum([ytdTotalColl]),2),2))+'%' end as NORActPrtRev,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdNOR])/Sum([ytdSttPatVisitQty]),2),2)) end as NORActPerPt,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgNOR]),0))),
case when (Sum([ytdBdgNOR])*Sum([ytdTotalColl])) = 0  then '0' 
	else convert (varchar(50),convert(int,(Sum([ytdBdgPITEarned])/Sum([ytdBdgNOR]))+(Sum([ytdSttDocPaidAmt])+Sum([ytdSttDocPaidAmtAdj]))/Sum([ytdTotalColl])+(Sum([ytdBdgLclExp])/Sum([ytdBdgNOR]))+(Sum([ytdBdgMDearned])/Sum([ytdBdgNOR]))+(Sum([ytdBdgRDearned])/Sum([ytdBdgNOR]))+(Sum([ytdBdgContribCEP])/Sum([ytdBdgNOR]))+(Sum([ytdBdgSiteNetInc])/Sum([ytdBdgNOR]))*100,0)) + '%'
end  as NORBudPrtNOR,

case when Sum([ytdBdgPITEarned]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(((Sum([ytdSttDocPaidAmt])+Sum([ytdSttDocPaidAmtAdj]))-Sum([ytdBdgPITEarned]))/Sum([ytdBdgPITEarned])*100,0),2))+'%') end ,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([ytdSttDocPaidAmt])+Sum([ytdSttDocPaidAmtAdj])),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(((Sum([ytdSttDocPaidAmt])+Sum([ytdSttDocPaidAmtAdj]))/Sum([ytdNOR]))*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttDocPaidAmt])+Sum([ytdSttDocPaidAmtAdj]))/Sum([ytdTotalColl])*100,2) ,2))+'%' end ,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttDocPaidAmt])+Sum([ytdSttDocPaidAmtAdj]))/Sum([ytdSttPatVisitQty]),2) ,2)) end as PhPayActPerPt,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgPITEarned]),0))),
case when Sum([ytdBdgNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdBdgPITEarned])/Sum([ytdBdgNOR]))*100,2),2))+'%') end as PhPayBudPRtNOR,

case when Sum([ytdBdgPACost]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(((Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt]))-Sum([ytdBdgPACost]))/Sum([ytdBdgPACost])*100,0),2))+'%') end as MLPayActPrtBud,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt])),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(((Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt]))/Sum([ytdNOR]))*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt]))/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt]))/Sum([ytdSttPatVisitQty]),2),2)) end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgPACost]),0))),
case when Sum([ytdBdgNOR]) = 0 then '0' else +convert (varchar(50),convert(float,round(Sum([ytdBdgPACost])/Sum([ytdBdgNOR])*100,2),2))+'%' end as MLPayBudPrtNor,

case when Sum([ytdBdgPTCost]) = 0 then '0' else convert (varchar(50),convert(float,round(((Sum([ytdSttPTCost])+Sum([YtdSttPTAdjAmt]))-Sum([ytdBdgPTCost]))/Sum([ytdBdgPTCost])*100,0),2))+'%' end  ,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([ytdSttPTCost])+Sum([YtdSttPTAdjAmt])),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttPTCost])+Sum([YtdSttPTAdjAmt]))/Sum([ytdNOR])*100,2),2))+'%'end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttPTCost])+Sum([YtdSttPTAdjAmt]))/Sum([ytdTotalColl])*100,2),2))+'%' end, 
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttPTCost])+Sum([YtdSttPTAdjAmt]))/Sum([ytdSttPatVisitQty]),2),2)) end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgPTCost]),0))),
case when Sum([ytdBdgNOR]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttPTCost])+Sum([YtdSttPTAdjAmt]))/Sum([ytdBdgNOR]),2),2))+'%' end,

case when Sum([ytdNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((((Sum([ytdSttDocPaidAmt])+Sum([ytdSttDocPaidAmtAdj]))/Sum([ytdNOR]))+((Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt]))/Sum([ytdNOR]))+((Sum([ytdSttLclExp])+Sum([YtdSttLclVarAmt])+Sum([YtdSttFixedLocalAmt]))/Sum([ytdNOR]))+((Sum([ytdSttLclExp])+Sum([YtdSttLclVarAmt])+Sum([YtdSttFixedLocalAmt])))+(Sum([ytdSiteNetInc])/Sum([ytdNOR])))*.01,2),2))+'%') end ,
case when Sum([ytdBdgLclExp]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(((Sum([ytdSttLclExp])+Sum([YtdSttLclVarAmt])+Sum([YtdSttFixedLocalAmt]))-Sum([ytdBdgLclExp]))/Sum([ytdBdgLclExp])*100,0),2)) +'%') end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([ytdSttLclExp])+Sum([YtdSttLclVarAmt])+Sum([YtdSttFixedLocalAmt])),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(((Sum([ytdSttLclExp])+Sum([YtdSttLclVarAmt])+Sum([YtdSttFixedLocalAmt]))/Sum([ytdNOR]))*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttLclExp])+Sum([YtdSttLclVarAmt])+Sum([YtdSttFixedLocalAmt]))/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttLclExp])+Sum([YtdSttLclVarAmt])+Sum([YtdSttFixedLocalAmt]))/Sum([ytdSttPatVisitQty]),2),2)) end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgLclExp]),0))),
case when Sum([ytdBdgNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdBdgLclExp])/Sum([ytdBdgNOR]))*100,2),2))+'%') end,

dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdSttNonCurrAdjAmt])+Sum([YtdSttSrpAdjAmt])+Sum([YtdSttSurplusPayout])+Sum([YtdSttNonCurrMDAmt])+Sum([YtdSttNonCurrRDAmt])+Sum([YtdSttMDIncentiveAmt])+Sum([YtdSttRDIncentiveAmt]),0)))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round((((Sum([ytdSttLclExp])+Sum([YtdSttLclVarAmt])+Sum([YtdSttFixedLocalAmt])))/Sum([ytdNOR]))*100,2),2)) +'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(((Sum([ytdSttLclExp])+Sum([YtdSttLclVarAmt])+Sum([YtdSttFixedLocalAmt])))/Sum([ytdTotalColl])*100,2),2)) +'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(((Sum([ytdSttLclExp])+Sum([YtdSttLclVarAmt])+Sum([YtdSttFixedLocalAmt])))/Sum([ytdSttPatVisitQty]),2),2)) end,

case when Sum([ytdBdgMDearned]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdSttMDPaidAmt])-Sum([ytdBdgMDearned]))/Sum([ytdBdgMDearned])*100,0),2)) +'%') end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdSttMDPaidAmt]),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdSttMDPaidAmt])/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdSttMDPaidAmt])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdSttMDPaidAmt])/Sum([ytdSttPatVisitQty]),2),2)) end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgMDearned]),0))),
case when Sum([ytdBdgNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdBdgMDearned])/Sum([ytdBdgNOR]))*100,2),2))+'%') end,

case when Sum([ytdBdgRDearned]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(((Sum([YtdSttRDEarnedAmt])-Sum([YtdSttRDLclAmt]))-Sum([ytdBdgRDearned]))/Sum([ytdBdgRDearned])*100,0),2)) +'%')end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([YtdSttRDEarnedAmt])-Sum([YtdSttRDLclAmt])),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([YtdSttRDEarnedAmt])-Sum([YtdSttRDLclAmt]))/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([YtdSttRDEarnedAmt])-Sum([YtdSttRDLclAmt]))/Sum([ytdTotalColl])*100,2),2)) +'%'end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([YtdSttRDEarnedAmt])-Sum([YtdSttRDLclAmt]))/Sum([ytdSttPatVisitQty]),2),2)) end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgRDearned]),0))),
case when Sum([ytdBdgNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdBdgRDearned])/Sum([ytdBdgNOR]))*100,2),2))+'%') end,

case when Sum([ytdBdgContribCEP]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdContribCEP])-Sum([ytdBdgContribCEP]))/Sum([ytdBdgContribCEP])*100,0),2))+'%') end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdContribCEP]),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdContribCEP])/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdContribCEP])/Sum([ytdTotalColl])*100,2),2)) +'%'end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdContribCEP])/Sum([ytdSttPatVisitQty]),2),2)) end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgContribCEP]),0))),
case when Sum([ytdBdgNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdBdgContribCEP])/Sum([ytdBdgNOR]))*100,2),2))+'%') end,

dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,round(Sum([ytdSiteNetInc])*100,2),0)))),
case when Sum([ytdNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdSiteNetInc])/Sum([ytdNOR]))*100,2),2))+'%') end,
case when Sum([ytdTotalColl]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([ytdSiteNetInc])/Sum([ytdTotalColl]),2),2))+'%') end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,Sum([ytdSiteNetInc])/Sum([ytdSttPatVisitQty]),2))) end,
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgSiteNetInc]),0)))),
case when Sum([ytdBdgNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdBdgSiteNetInc])/Sum([ytdBdgNOR]))*100,2),2))+'%') end,

case when Sum([ytdBdgPatients]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdSttPatVisitQty])-Sum([ytdBdgPatients]))/Sum([ytdBdgPatients])*100,0),2))+'%') end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdSttPatVisitQty]),0))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgPatients]),0))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdSttPtsKeyed]),0))),

case when Sum([ytdBdgDocHours]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdDocHours])-Sum([ytdBdgDocHours]))/Sum([ytdBdgDocHours])*100,0),2))+'%') end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdDocHours]),0))),
case when (Sum([ytdDocHours])+Sum([ytdPAHours])) = 0 then '0' else convert (varchar(50),round(convert(float,Sum([ytdDocHours])/(Sum([ytdDocHours])+Sum([ytdPAHours]))*100,0),0))+'%' end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgDocHours]),0))),

case when Sum([ytdBdgDocHours]) = 0 or Sum([ytdDocHours]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(((Sum([YtdPITearned])/Sum([ytdDocHours]))-(Sum([ytdBdgPITEarned])/Sum([ytdBdgDocHours])))/(Sum([ytdBdgPITEarned])/Sum([ytdBdgDocHours]))*100,0),0)) +'%') end,
case when Sum([ytdDocHours]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([YtdPITearned])/Sum([ytdDocHours])),0))) end,
case when Sum([ytdBdgDocHours]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([ytdBdgPITEarned])/Sum([ytdBdgDocHours])),0))) end,
case when Sum([ytdDocHours]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([ytdSttDocPaidAmt])+Sum([ytdSttDocPaidAmtAdj]))/Sum([ytdDocHours]),0))) end,
case when Sum([ytdDocHours]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,((Sum([ytdSttDocPaidAmt])+Sum([ytdSttDocPaidAmtAdj]))+Sum([YtdSttSurplusPayout]))/Sum([ytdDocHours]),0))) end,

case when Sum([ytdBdgPAHours]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([ytdPAHours])-Sum([ytdBdgPAHours]))/Sum([ytdBdgPAHours])*100,0),2))+'%') end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdPAHours]),0))),
case when (Sum([ytdDocHours])+Sum([ytdPAHours])) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdPAHours])/(Sum([ytdDocHours])+Sum([ytdPAHours]))*100,0),2))+'%' end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdBdgPAHours]),0))),

case when Sum([ytdPAHours]) = 0  or Sum([ytdBdgPAHours]) =0 or (Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt])) = 0 then '0' 
	else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((((Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt]))/Sum([ytdPAHours]))-(Sum([ytdBdgPACost])/Sum([ytdBdgPAHours])))/((Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt]))/Sum([ytdPAHours]))*100,0),2))+'%') end,
case when Sum([ytdPAHours]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt]))/Sum([ytdPAHours]),2),0))) end,
case when Sum([ytdBdgPAHours]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([ytdBdgPACost])/Sum([ytdBdgPAHours])),2),0))) end,

case when Sum([ytdBdgDocHours]) = 0 or Sum([ytdDocHours]) = 0  or Sum([ytdBdgPatients]) = 0  then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(((Sum([ytdSttPatVisitQty])/Sum([ytdDocHours]))-(Sum([ytdBdgPatients])/Sum([ytdBdgDocHours])))/(Sum([ytdBdgPatients])/Sum([ytdBdgDocHours]))*100,0),2))+'%') end,
case when Sum([ytdDocHours]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([ytdSttPatVisitQty])/Sum([ytdDocHours])),1),2))) end,
case when Sum([ytdBdgDocHours]) = 0 or Sum([ytdBdgDocHours]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([ytdBdgPatients])/Sum([ytdBdgDocHours])),1),2))) end,

case when (Sum([ytdDocHours])+Sum([ytdPAHours])) = 0 or (Sum([ytdBdgDocHours])+Sum([ytdBdgPAHours])) = 0 or Sum([ytdBdgPatients]) = 0 or (Sum([ytdBdgDocHours])+Sum([ytdBdgPAHours])) = 0 then '0' 
	else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(((Sum([ytdSttPatVisitQty])/(Sum([ytdDocHours])+Sum([ytdPAHours])))-(Sum([ytdBdgPatients])/(Sum([ytdBdgDocHours])+Sum([ytdBdgPAHours]))))/(Sum([ytdBdgPatients])/(Sum([ytdBdgDocHours])+Sum([ytdBdgPAHours])))*100,0),2))+'%') end,
case when (Sum([ytdDocHours])+Sum([ytdPAHours])) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttPatVisitQty])/(Sum([ytdDocHours])+Sum([ytdPAHours]))),1),1)) end,
case when (Sum([ytdBdgDocHours])+Sum([ytdBdgPAHours])) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdBdgPatients])/(Sum([ytdBdgDocHours])+Sum([ytdBdgPAHours]))),1),1)) end,

case when Sum([ytdSttPtsKeyed]) = 0 or Sum([ytdBdgPatients]) = 0  or Sum([ytdBdgPstChgs]) = 0 or Sum([ytdBdgPatients]) = 0 then '0' 
	else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(((Sum([ytdSttPstChgs])/Sum([ytdSttPtsKeyed]))-(Sum([ytdBdgPstChgs])/Sum([ytdBdgPatients])))/(Sum([ytdBdgPstChgs])/Sum([ytdBdgPatients]))*100,0),2))+'%') end,
case when Sum([ytdSttPtsKeyed]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([ytdSttPstChgs])/Sum([ytdSttPtsKeyed])),2),2))) end,
case when Sum([ytdBdgPatients]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([ytdBdgPstChgs])/Sum([ytdBdgPatients])),2),2))) end,

case when Sum([ytdSttPatVisitQty]) = 0 or Sum([ytdSttPatVisitQty]) = 0 or Sum([ytdBdgPatients]) = 0 or Sum([ytdBdgGrossColl]) = 0 then '0' 
	else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((((Sum([ytdTotalColl])-Sum([ytdOtherRcpts])-Sum([ytdStipendsRcvd]))/Sum([ytdSttPatVisitQty]))-(Sum([ytdBdgGrossColl])/Sum([ytdBdgPatients])))/(Sum([ytdBdgGrossColl])/Sum([ytdBdgPatients]))*100,0),2))+'%') end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(((Sum([ytdTotalColl])-Sum([ytdOtherRcpts])-Sum([ytdStipendsRcvd]))/Sum([ytdSttPatVisitQty])),2),2))) end,
case when Sum([ytdBdgPatients]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([ytdBdgGrossColl])/Sum([ytdBdgPatients])),2),2))) end,

case when Sum([ytdSttPatVisitQty]) = 0 or Sum([ytdBdgPatients]) = 0  or Sum([ytdBdgTotalColl]) = 0   then '0' 
	else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(((Sum([ytdTotalColl])/Sum([ytdSttPatVisitQty]))-(Sum([ytdBdgTotalColl])/Sum([ytdBdgPatients])))/(Sum([ytdBdgTotalColl])/Sum([ytdBdgPatients]))*100,0),2))+'%') end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([ytdTotalColl])/Sum([ytdSttPatVisitQty])),2),2))) end,
case when Sum([ytdBdgPatients]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([ytdBdgTotalColl])/Sum([ytdBdgPatients])),2),2))) end,

case when Sum([ytdSttPatVisitQty]) = 0 or Sum([ytdBdgPatients]) = 0 or Sum([ytdNOR]) = 0 or Sum([ytdSttPatVisitQty]) = 0 then '0' 
	else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(((Sum([ytdNOR])/Sum([ytdSttPatVisitQty]))-(Sum([ytdBdgNOR])/Sum([ytdBdgPatients])))/(Sum([ytdNOR])/Sum([ytdSttPatVisitQty]))*100,0),2))+'%') end, 
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([ytdNOR])/Sum([ytdSttPatVisitQty])),2),2))) end,
case when Sum([ytdBdgPatients]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([ytdBdgNOR])/Sum([ytdBdgPatients])),2),2))) end,


/*Start of Subquery rptYTDIncExpStmtSummary_Sub1*/
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttACCExpenseAmt]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,Sum([YtdSttACCExpenseAmt])/Sum([ytdTotalColl])*100,2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),Sum([YtdSttACCExpenseAmt])/Sum([ytdSttPatVisitQty])))) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSiteOverhead]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,Sum([YtdSiteOverhead])/Sum([ytdTotalColl])*100,2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,Sum([YtdSiteOverhead])/Sum([ytdSttPatVisitQty]),2))) end,

'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([YtdSttACCExpenseAmt])+Sum([YtdSiteOverhead])),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(int,(Sum([YtdSttACCExpenseAmt])+Sum([YtdSiteOverhead]))/Sum([ytdTotalColl])*100,2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,(Sum([YtdSttACCExpenseAmt])+Sum([YtdSiteOverhead]))/Sum([ytdSttPatVisitQty]),2))) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttDonationAmt]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttDonationAmt])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(Sum([YtdSttDonationAmt])/Sum([ytdSttPatVisitQty]),2),2))) end,

dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttOffTop]),0)))),
case when Sum([ytdTotalColl]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([YtdSttOffTop])/Sum([ytdTotalColl])*100,2),2))+'%') end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(Sum([YtdSttOffTop])/Sum([ytdSttPatVisitQty]),2),2)))) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttCEPSurchargeAmt]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttCEPSurchargeAmt])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(Sum([YtdSttCEPSurchargeAmt])/Sum([ytdSttPatVisitQty]),2),2))) end,

'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([YtdSttOffTop])+Sum([YtdSttDonationAmt])+Sum([YtdSttCEPSurchargeAmt])),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,(Sum([YtdSttOffTop])+Sum([YtdSttDonationAmt])+Sum([YtdSttCEPSurchargeAmt]))/Sum([ytdTotalColl]))*100,0)+'%' end ,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),round(convert(money,(Sum([YtdSttOffTop])+Sum([YtdSttDonationAmt])+Sum([YtdSttCEPSurchargeAmt]))/Sum([ytdSttPatVisitQty])),2,2))) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdBillSpec]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdBillSpec])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(Sum([YtdBillSpec])/Sum([ytdSttPatVisitQty]),2),2))) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttBillSpecMBSIAmt]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttBillSpecMBSIAmt])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(Sum([YtdSttBillSpecMBSIAmt])/Sum([ytdSttPatVisitQty]),2),2))) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YTDSttBillSpecScribesAmt]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdBillSpec])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(Sum([YtdBillSpec])/Sum([ytdSttPatVisitQty]),2),2))) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YTDSttBillSpecScribesAdjAmt]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttBillSpecMBSIAmt])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(Sum([YtdSttBillSpecMBSIAmt])/Sum([ytdSttPatVisitQty]),2),2))) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YTDSttBillSpecSitePersonnelAmt]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdBillSpec])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(Sum([YtdBillSpec])/Sum([ytdSttPatVisitQty]),2),2))) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YTDSttBillSpecSitePersonnelAdjAmt]),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttBillSpecMBSIAmt])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(Sum([YtdSttBillSpecMBSIAmt])/Sum([ytdSttPatVisitQty]),2),2))) end,

'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([YtdBillSpec])+Sum([YtdSttBillSpecMBSIAmt])+Sum([YTDSttBillSpecScribesAmt])+Sum([YTDSttBillSpecSitePersonnelAmt])+Sum([YTDSttBillSpecScribesAdjAmt])+Sum([YTDSttBillSpecSitePersonnelAdjAmt])),0))),
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([YtdBillSpec])+Sum([YtdSttBillSpecMBSIAmt])+Sum([YTDSttBillSpecScribesAmt])+Sum([YTDSttBillSpecSitePersonnelAmt])+Sum([YTDSttBillSpecScribesAdjAmt])+Sum([YTDSttBillSpecSitePersonnelAdjAmt]))/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round((Sum([YtdBillSpec])+Sum([YtdSttBillSpecMBSIAmt])+Sum([YTDSttBillSpecScribesAmt])+Sum([YTDSttBillSpecSitePersonnelAmt])+Sum([YTDSttBillSpecScribesAdjAmt])+Sum([YTDSttBillSpecSitePersonnelAdjAmt]))/Sum([ytdSttPatVisitQty]),2),2))) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttPACost]),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPACost])/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPACost])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPACost])/Sum([ytdSttPatVisitQty]),2),2)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([ytdSttPTOTotalCost]),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdSttPTOTotalCost])/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdSttPTOTotalCost])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([ytdSttPTOTotalCost])/Sum([ytdSttPatVisitQty]),2),2)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttPASupportCostAmt]),0))),
case when Sum([ytdNOR]) = 0 then '0' else +convert (varchar(50),convert(float,round(Sum([YtdSttPASupportCostAmt])/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPASupportCostAmt])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPASupportCostAmt])/Sum([ytdSttPatVisitQty]),2),2)) end,

'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt])),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt]))/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round((Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt]))/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else '$'+convert (varchar(50),convert(float,round((Sum([ytdSttPTOTotalCost])+Sum([YtdSttPACost])-Sum([YtdSttPASupportCostAmt]))/Sum([ytdSttPatVisitQty]),2),2)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttPTCost]),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPTCost])/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPTCost])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPTCost])/Sum([ytdSttPatVisitQty]),2),2)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttPTAdjAmt]),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPTAdjAmt])/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPTAdjAmt])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPTAdjAmt])/Sum([ytdSttPatVisitQty]),2),2)) end,

'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttPTAdjAmt])+Sum([YtdSttPTCost]),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPTAdjAmt])+Sum([YtdSttPTCost])/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPTAdjAmt])+Sum([YtdSttPTCost])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else '$'+convert (varchar(50),convert(float,round(Sum([YtdSttPTAdjAmt])+Sum([YtdSttPTCost])/Sum([ytdSttPatVisitQty]),2),2)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttLclExp]),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPTCost])/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else  convert (varchar(50),convert(float,round(Sum([YtdSttPTCost])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPTCost])/Sum([ytdSttPatVisitQty]),2),2)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttFixedLocalAmt]),0))),
case when Sum([ytdNOR]) = 0 then '0' else  convert (varchar(50),convert(float,round(Sum([YtdSttPTAdjAmt])/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else  convert (varchar(50),convert(float,round(Sum([YtdSttPTAdjAmt])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttPTAdjAmt])/Sum([ytdSttPatVisitQty]),2),2)) end,

'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttLclExp])+Sum([YtdSttFixedLocalAmt]),0))),
case when Sum([ytdNOR]) = 0 then '0' else  convert (varchar(50),convert(float,round(Sum([YtdSttPTAdjAmt])+Sum([YtdSttPTCost])/Sum([ytdNOR])*100,2),2))+'%' end,
case when Sum([ytdTotalColl]) = 0 then '0' else  convert (varchar(50),convert(float,round(Sum([YtdSttPTAdjAmt])+Sum([YtdSttPTCost])/Sum([ytdTotalColl])*100,2),2))+'%' end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else '$'+convert (varchar(50),convert(float,round(Sum([YtdSttPTAdjAmt])+Sum([YtdSttPTCost])/Sum([ytdSttPatVisitQty]),2),2)) end,
--
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttNonCurrAdjAmt]),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttNonCurrAdjAmt])/Sum([ytdNOR])*100,2),2)) end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttNonCurrAdjAmt])/Sum([ytdTotalColl])*100,2),2)) end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttNonCurrAdjAmt])/Sum([ytdSttPatVisitQty]),2),2)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttSurplusPayout]),0))),
case when Sum([ytdNOR]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttSurplusPayout])/Sum([ytdNOR])*100,2),2)) end,
case when Sum([ytdTotalColl]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttSurplusPayout])/Sum([ytdTotalColl])*100,2),2)) end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([YtdSttSurplusPayout])/Sum([ytdSttPatVisitQty]),2),2)) end,

dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttNonCurrMDAmt]),0)))),
case when Sum([ytdNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([YtdSttNonCurrMDAmt])/Sum([ytdNOR])*100,2),2))) end,
case when Sum([ytdTotalColl]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([YtdSttNonCurrMDAmt])/Sum([ytdTotalColl])*100,2),2))) end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([YtdSttNonCurrMDAmt])/Sum([ytdSttPatVisitQty]),2),2))) end,

dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttNonCurrRDAmt]),0)))),
case when Sum([ytdNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([YtdSttNonCurrRDAmt])/Sum([ytdNOR])*100,2),2))) end,
case when Sum([ytdTotalColl]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([YtdSttNonCurrRDAmt])/Sum([ytdTotalColl])*100,2),2))) end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([YtdSttNonCurrRDAmt])/Sum([ytdSttPatVisitQty]),2),2))) end,

dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([YtdSttSrpAdjAmt]),0)))),
case when Sum([ytdNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([YtdSttSrpAdjAmt])/Sum([ytdNOR])*100,2),2))) end,
case when Sum([ytdTotalColl]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([YtdSttSrpAdjAmt])/Sum([ytdTotalColl])*100,2),2))) end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round(Sum([YtdSttSrpAdjAmt])/Sum([ytdSttPatVisitQty]),2),2))) end,

dbo.fn_removeMinusSign('$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,(Sum([YtdSttSrpAdjAmt])+Sum([YtdSttNonCurrAdjAmt])+Sum([YtdSttSurplusPayout])+Sum([YtdSttMDIncentiveAmt])+Sum([YtdSttRDIncentiveAmt])+Sum([YtdSttNonCurrMDAmt])+Sum([YtdSttNonCurrRDAmt])),0)))),
case when Sum([ytdNOR]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([YtdSttSrpAdjAmt])+Sum([YtdSttNonCurrAdjAmt])+Sum([YtdSttSurplusPayout])+Sum([YtdSttMDIncentiveAmt])+Sum([YtdSttRDIncentiveAmt])+Sum([YtdSttNonCurrMDAmt])+Sum([YtdSttNonCurrRDAmt]))/Sum([ytdNOR])*100,2),2))) end,
case when Sum([ytdTotalColl]) = 0 then '0' else dbo.fn_removeMinusSign(convert (varchar(50),convert(float,round((Sum([YtdSttSrpAdjAmt])+Sum([YtdSttNonCurrAdjAmt])+Sum([YtdSttSurplusPayout])+Sum([YtdSttMDIncentiveAmt])+Sum([YtdSttRDIncentiveAmt])+Sum([YtdSttNonCurrMDAmt])+Sum([YtdSttNonCurrRDAmt]))/Sum([ytdTotalColl])*100,2),2))) end,
case when Sum([ytdSttPatVisitQty]) = 0 then '0' else dbo.fn_removeMinusSign('$'+convert (varchar(50),convert(float,round((Sum([YtdSttSrpAdjAmt])+Sum([YtdSttNonCurrAdjAmt])+Sum([YtdSttSurplusPayout])+Sum([YtdSttMDIncentiveAmt])+Sum([YtdSttRDIncentiveAmt])+Sum([YtdSttNonCurrMDAmt])+Sum([YtdSttNonCurrRDAmt]))/Sum([ytdSttPatVisitQty]),2),2))) end,

CtrID,
CtrTIN
/**/
from  dbo.vwSttBdg 
where sttdate  >= '01/01/'+@firstDyYear and sttdate <= @sttDate
	--and CtrID not in (253, 254, 249, 281, 248) --Exclude Galen IDs
--WHERE SttID >1 AND GalenYN = 0 AND CtrSite_CmpID = 456 AND SttDate >=  @sttDate   --changed to this 'where' based on actual SiteLine dataset
Group by SttDate, CtrID, CtrTIN


End







