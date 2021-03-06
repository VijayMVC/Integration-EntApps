﻿
CREATE PROCEDURE [dbo].[stpAppendAnes_Annual_Budget_Report]
--  select * from  tblAnes_Annual_Budget_Report

AS 
Begin
Set NoCount on


INSERT INTO tblAnes_Annual_Budget_Report
	(Site, 
	BdgYear, 
	BdgPstChgs, 
	BdgTargetRate, 
	BdgGrossColl, 
	BdgStipendsRcvd, 
	BdgOthRcpts, 
	BdgTotalColl, 
	BdgMPRate, 
	BdgMalpractice, 
    BdgBillFee, 
    BdgInterest, 
    BdgDonations, 
    BdgOffTop, 
    BdgBillSpec, 
    BdgCEPRetentionAmt, 
	BdgNOR, 
	calcBdgNOR, 
    BdgPITearned, 
    calcBdgPITearned, 
    BdgPTCost, 
    calcBdgPTCost, 
    BdgPACost, 
    calcBdgPACost, 
    BdgPITpct, 
    BdgLclExp, 
    calcBdgLclExp, 
    BdgMDpct, 
    BdgMDearned, 
    calcBdgMDEarned, 
    BdgRDpct, 
    BdgRDearned, 
    calcBdgRDearned, 
    BdgContribPct, 
    BdgContribCEP, 
    calcBdgContribCEP, 
    BdgSiteNetInc, 
    calcBdgSiteNetInc,    
    BdgPatients,
    BdgEncounters ,
    BdgDocHours, 
    BdgDocEarnedHrly, 
    BdgPAHours, 
    BdgPACostHr, 
    BdgEncountersPerMonth, 
    BdgBlendedEncountersPerMonth,    
   	BdgAvgChgPtPerCase ,
	BdgAvgChgPtPerBilledUnit ,
	BdgCollPerPtPerCase ,
	BdgCollPerPtPerBilledUnit ,
	BdgTotalColl2PerCase,
	BdgTotalColl2PerBilledUnit ,
	BdgNetRevPerPtPerCase ,
	BdgNetRevPerPtPerBilledUnit,	 
    MedicalDirector, 
    SiteLineSiteID, 
    ProcessLevel
    /**/)
Select 
Site, 
BdgYear,
dbo.fn_removeMinusSign('$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPstChgs,0)))), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,1),BdgTargetRate*100))) + '%'), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgGrossColl,0)))), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgStipendsRcvd,0)))), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgOthRcpts,0)))), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgTotalColl,0)))), 
dbo.fn_removeMinusSign('$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgMPRate)))), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgMalpractice,0)))), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgBillFee,0)))), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgInterest,0)))), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgDonations,0)))), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgOffTop,0)))), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgBillSpec,0)))), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgCEPRetentionAmt,0)))), 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgNOR,0)))), 
case when [BdgNOR] = 0 then '0.00%' else convert (varchar(50),convert(decimal(9,2),round([BdgNOR]/[BdgNOR]*100,2)))+'%' end, 
dbo.fn_removeMinusSign(dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPITearned,0)))),
case when [BdgNOR] = 0 then '0.00%' else dbo.fn_removeMinusSign(convert (varchar(50),convert(decimal(9,2),round(convert(float,[BdgPITearned],4)/convert(float,[BdgNOR],4),5)*100))+'%') end, 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPTCost,0))),
case when [BdgNOR] = 0 then '0.00%' else convert (varchar(50),convert(decimal(9,2),round(convert(float,[BdgPTCost],4)/convert(float,[BdgNOR],4),5)*100))+'%' end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPACost,0))),
case when [BdgNOR] = 0 then '0.00%' else convert (varchar(50),convert(decimal(9,2),round(convert(float,[BdgPACost],4)/convert(float,[BdgNOR],4),5)*100))+'%' end,
convert (varchar(50),convert(decimal(9,2),round(BdgPITpct*100,2)))+'%',dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgLclExp,0))),
case when [BdgNOR] = 0 then '0.00%' else convert (varchar(50),convert(decimal(9,2),round(convert(float,[BdgLclExp],4)/convert(float,[BdgNOR],4),5)*100))+'%' end,
convert (varchar(50),convert(decimal(9,2),BdgMDpct*100))+'%',
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgMDearned,0))),
case when [BdgNOR] = 0 then '0.00%' else convert (varchar(50),convert(decimal(9,2),round(convert(float,[BdgMDEarned],4)/convert(float,[BdgNOR],4),5)*100))+'%' end, 
convert (varchar(50),convert(decimal(9,2),BdgRDpct*100))+'%',
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgRDearned,0))),
case when [BdgNOR] = 0 then '0.00%' else convert (varchar(50),convert(decimal(9,2),round(convert(float,[BdgRDearned],4)/convert(float,[BdgNOR],4),5)*100))+'%' end, 
convert (varchar(50),convert(decimal(9,2),BdgContribPct*100))+'%',
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgContribCEP,0))),
case when [BdgNOR] = 0 then '0.00%' else convert (varchar(50),convert(decimal(9,2),round(convert(float,[BdgContribCEP],4)/convert(float,[BdgNOR],4),5)*100))+'%' end, 
'$'+convert (varchar(50),convert(int,BdgSiteNetInc,0)),
case when [BdgNOR] = 0 then '0.00%' else convert (varchar(50),convert(decimal(9,2),round([BdgSiteNetInc]/[BdgNOR]*100,2)))+'%' end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPatients,0))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgEncounters,0))) ,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgDocHours,0))),
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgDocEarnedHrly))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPAHours,0))),
'$'+convert (varchar(50),convert(decimal(9,2),BdgPACostHr)),
convert (varchar(50),convert(decimal(9,1),round(BdgPatients/12,1))),
convert (varchar(50),convert(decimal(9,1),round(BdgEncounters/365,1))), 
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgAvgChgPt))),
case when BdgEncounters   = 0 then '$0.00' else  '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),[BdgPstChgs]/[BdgEncounters]))) end ,
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgCollPerPt))),
case when BdgEncounters   = 0 then '$0.00' else  '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),[BdgGrossColl]/[BdgEncounters]))) end ,
case when [BdgPatients] = 0 then '$0.00' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),[BdgTotalColl]/[BdgPatients]))) end, 
case when BdgEncounters   = 0 then '$0.00' else  '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgTotalColl/BdgEncounters))) end ,
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgNetRevPerPt))),
case when BdgEncounters   = 0 then '$0.00' else  '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgNOR/BdgEncounters))) end ,
MedicalDirector,
CtrID,
CtrTIN
from vwBdg
where BdgYear >= 2011
 and Ctr_CtrTypID= 'ANES' 

Set NoCount off

End









