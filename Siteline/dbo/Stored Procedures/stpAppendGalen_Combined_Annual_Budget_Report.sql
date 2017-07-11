CREATE PROCEDURE [dbo].[stpAppendGalen_Combined_Annual_Budget_Report]
(@sttDate datetime)

AS 
Begin
Set NoCount on

truncate table tblGalen_Combined_Annual_Budget_Report

INSERT INTO tblGalen_Combined_Annual_Budget_Report
(Site, BdgYear, BdgPstChgs, BdgTargetRate, BdgGrossColl, BdgStipendsRcvd, BdgOthRcpts, BdgTotalColl, BdgMPRate, BdgMalpractice, BdgBillFee, 
                      BdgInterest, BdgDonations, BdgOffTop, BdgBillSpec, BdgCEPRetentionAmt, BdgNOR, calcBdgNOR, BdgPITearned, calcBdgPITearned, BdgPACost, 
                      calcBdgPACost, BdgLclExp, calcBdgLclExp, BdgMDpct, BdgMDearned, calcBdgMDEarned, BdgRDpct, BdgRDearned, calcBdgRDearned, 
                      BdgContribPct, BdgContribCEP, calcBdgContribCEP, BdgSiteNetInc, calcBdgSiteNetInc, BdgPatients, BdgEncounters, BdgDocHours, 
                      BdgDocEarnedHrly, BdgPAHours, BdgPACostHr, calcBdgPatients, calcBdgEncounters, calcBdgEncounters2, calcBdgEncounters3, BdgAvgChgPt, 
                      BdgCollPerPt, calcBdgTotalColl, BdgNetRevPerPt,MedicalDirector,SiteLineSiteID,ProcessLevel/**/)
Select Site, BdgYear,

'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPstChgs,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(BdgTargetRate*100,2),0))) + '%', 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgGrossColl,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgStipendsRcvd,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgOthRcpts,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgTotalColl,0))), 
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgMPRate,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgMalpractice,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgBillFee,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgInterest,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgDonations,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgOffTop,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgBillSpec,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgCEPRetentionAmt,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgNOR,0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round([BdgNOR]/[BdgNOR]*100,2),0))+'%' end, 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPITearned,0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,[BdgPITearned]/[BdgNOR]*100,0))+'%' end, 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPACost,0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round([BdgPTCost]/[BdgNOR]*100,2),0))+'%' end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgLclExp,0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round([BdgLclExp]/[BdgNOR]*100,2),0)) end,
convert (varchar(50),convert(float,round(BdgMDpct*100,2),0))+'%',
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgMDearned,0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round([BdgMDEarned]/[BdgNOR]*100,2),0))+'%' end,
convert (varchar(50),convert(float,round(BdgRDpct*100,2),0))+'%',
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgRDearned,0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round([BdgRDearned]/[BdgNOR]*100,2),0))+'%' end,
convert (varchar(50),convert(float,round(BdgContribPct*100,2),0))+'%',
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgContribCEP,0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round([BdgContribCEP]/[BdgNOR]*100,2),0))+'%' end,
'$'+convert (varchar(50),convert(int,BdgSiteNetInc,0)),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(float,round([BdgSiteNetInc]/[BdgNOR]*100,2),0))+'%' end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPatients,0))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgEncounters,0))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgDocHours,0))),
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(BdgDocEarnedHrly,2),0))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPAHours,0))),
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(BdgPACostHr,2),0))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(([BdgPatients]/12),1),0))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(float,round(([BdgEncounters]/365),1),0))),
case when [BdgDocHours] = 0 then '0' else convert (varchar(50),convert(float,round([BdgEncounters]/[BdgDocHours],2),0)) end,
case when ([BdgDocHours]+[BdgPAHours]) = 0 then '0' else convert (varchar(50),convert(float,round([BdgEncounters]/([BdgDocHours]+[BdgPAHours]),2),0)) end,
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgAvgChgPt,0))),
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgCollPerPt,0))),
case when [BdgPatients] = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,[BdgTotalColl]/[BdgPatients],0))) end, 
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgNetRevPerPt,0))),
MedicalDirector,
CtrID,
CtrTIN
/**/
from dbo.vwSttBdg 
where sttdate = @sttDate
	and CtrID in (253, 254, 249, 281, 248)  --Include only Galen IDs

Set NoCount off

End





