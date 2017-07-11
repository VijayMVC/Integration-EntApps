CREATE  PROCEDURE [dbo].[stpAppendAnnual_Budget_Report_Summary]
(@sttDate datetime)

AS 
Begin
Set NoCount on

truncate table tblAnnual_Budget_Report_Summary

INSERT INTO tblAnnual_Budget_Report_Summary
(SumBdgPstChgs, BdgPstChgsPt, CalcEstColRate, SumBdgGrossColl, BdgGrossCollPt, SumBdgStipendsRcvd, SumBdgStipendsRcvdPt, 
                      SumBdgOthRcpt, SumBdgOthRcptsPt, SumBdgTotalColl, SumBdgTotalCollRev, SumBdgTotalCollPt, SumBdgMalpractice, SumBdgMalpracticeRev, 
                      SumBdgMalpracticePt, SumBdgBillFee, SumBdgBillFeeRev, SumBdgBillFeePt, SumBdgInterest, SumBdgInterestRev, SumBdgInterestPt, 
                      SumBdgSiteOverhead, SumBdgSiteOverheadRev, SumBdgSiteOverheadPt, SumBdgDonations, SumBdgDonationsRev, SumBdgDonationsPt, 
                      SumBdgOffTop, SumBdgOffTopRev, SumBdgOffTopPt, SumBdgBillSpec, SumBdgBillSpecRev, SumBdgBillSpecPt, SumBdgCEPRetentionAmt, 
                      SumBdgCEPRetentionAmtRev, SumBdgCEPRetentionAmtPt, SumBdgNOR, calcBdgNOR, SumBdgNORRev, SumBdgNORPt, SumBdgPITearned, 
                      SumBdgPITearnedNor, SumBdgPITearnedRev, SumBdgPITearnedPt, SumBdgPACost, SumBdgPACostNor, SumBdgPACostRev, SumBdgPACostPt, 
                      SumBdgPASupportCostAmt, SumBdgPASupportCostAmtNor, SumBdgPASupportCostAmtRev, SumBdgPASupportCostAmtPt, SumBdgPTCost, 
                      SumBdgPTCostNor, SumBdgPTCostRev, SumBdgPTCostPt, SumBdgLclExp, SumBdgLclExpNor, SumBdgLclExpRev, SumBdgLclExpPt, 
                      SumBdgMDearned, SumBdgMDearnedNor, SumBdgMDearnedRev, SumBdgMDearnedPt, SumBdgRDearned, SumBdgRDearnedNor, 
                      SumBdgRDearnedRev, SumBdgRDearnedPt, SumBdgContribCEP, SumBdgContribCEPNor, SumBdgContribCEPRev, SumBdgContribCEPPt, 
                      SumBdgSiteNetInc, SumBdgSiteNetIncNor, SumBdgSiteNetIncRev, SumBdgSiteNetIncPt, SumBdgPatients, SumBdgDocHours, calcEarnedHrly, 
                      SumBdgPAHours, PhysAsstCost, PatHrMd, PatHrMdPa, AvgChgPat, EstColPat, EstRevPat, EstNorPat, 
		      SiteLineSiteID, ProcessLevel/**/)

Select 
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgPstChgs]),0))),
case when [BdgPatients] = 0 then '0' else '$'+convert (varchar(50),convert(float,round(Sum([BdgPstChgs])/Sum([BdgPatients]),2),0)) end,
case when [BdgPstChgs] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgGrossColl])/Sum([BdgPstChgs]),2),0))+'%' end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgGrossColl]),0))),
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgGrossColl])/Sum([BdgPatients]),2),0)) end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgStipendsRcvd]),0))),
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgStipendsRcvd])/Sum([BdgPatients]),2),0)) end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgOthRcpts]),0))),
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgOthRcpts])/Sum([BdgPatients]),2),0)) end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgTotalColl]),0))),
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgTotalColl])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgTotalColl])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgMalpractice]),0))),
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgMalpractice])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgMalpractice])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgBillFee]),0))),
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgBillFee])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgBillFee])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgInterest]),0))),
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgInterest])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgInterest])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgSiteOverhead]),0))),
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgSiteOverhead])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgSiteOverhead])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgDonations]),0))),
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgDonations])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgDonations])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgOffTop]),0))),
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgOffTop])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgOffTop])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgBillSpec]),0))),
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgBillSpec])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgBillSpec])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgCEPRetentionAmt]),0))),
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgCEPRetentionAmt])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgCEPRetentionAmt])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgNOR]),0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round([BdgNOR]/[BdgNOR]*100,2),0))+'%' end,
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgNOR])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgNOR])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgPITearned]),0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPITearned])/Sum([BdgNOR])*100,2),0))+'%' end,
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPITearned])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPITearned])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgPACost]),0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPACost])/Sum([BdgNOR])*100,2),0))+'%' end,
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPACost])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPACost])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgPASupportCostAmt]),0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPASupportCostAmt])/Sum([BdgNOR])*100,2),0))+'%' end,
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPASupportCostAmt])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPASupportCostAmt])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgPTCost]),0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPTCost])/Sum([BdgNOR])*100,2),0))+'%' end,
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPTCost])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPTCost])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgLclExp]),0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgLclExp])/Sum([BdgNOR])*100,2),0)) +'%' end,
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgLclExp])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgLclExp])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgMDearned]),0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgMDearned])/Sum([BdgNOR])*100,2),0)) +'%'end,
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgMDearned])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgMDearned])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgRDearned]),0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgRDearned])/Sum([BdgNOR])*100,2),0)) +'%'end,
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgRDearned])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPAHours])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgContribCEP]),0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgContribCEP])/Sum([BdgNOR])*100,2),0))+'%' end,
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgContribCEP])/Sum([BdgTotalColl])*100,2),0))+'%' end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgContribCEP])/Sum([BdgPatients]),2),0)) end,

'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgSiteNetInc]),0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgSiteNetInc])/Sum([BdgNOR])*100,2),0)) +'%'end,
case when [BdgTotalColl] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgSiteNetInc])/Sum([BdgTotalColl])*100,2),0)) +'%' end,
case when [BdgPatients] = 0 then '0' else '$'+convert (varchar(50),convert(float,round(Sum([BdgSiteNetInc])/Sum([BdgPatients]),2),0)) end,

dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgPatients]),0))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgDocHours]),0))),
case when [BdgDocHours] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPITearned])/Sum([BdgDocHours]),2),0)) end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,Sum([BdgPAHours]),0))),
case when [BdgPAHours] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPACost])/Sum([BdgPAHours]),2),0)) end,
case when [BdgDocHours] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPatients])/Sum([BdgDocHours]),2),0)) end,
case when (Sum([BdgDocHours])+Sum([BdgPAHours])) = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPatients])/(Sum([BdgDocHours])+Sum([BdgPAHours])),2),0)) end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgPstChgs])/Sum([BdgPatients]),2),0)) end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgGrossColl])/Sum([BdgPatients]),2),0)) end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgTotalColl])/Sum([BdgPatients]),2),0)) end,
case when [BdgPatients] = 0 then '0' else convert (varchar(50),convert(float,round(Sum([BdgNOR])/Sum([BdgPatients]),2),0)) end,
CtrID,
CtrTIN
/**/

from dbo.vwSttBdg 
where sttdate = @sttDate
	--and CtrID not in (253, 254, 249, 281, 248)  --Exclude Galen IDs
Group by BdgPatients, BdgPstChgs, BdgTotalColl, BdgNOR, BdgDocHours, BdgPAHours, CtrID, CtrTIN

Set NoCount off

End




