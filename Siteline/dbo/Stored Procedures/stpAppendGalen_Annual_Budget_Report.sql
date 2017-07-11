CREATE PROCEDURE [dbo].[stpAppendGalen_Annual_Budget_Report]

AS 
Begin
Set NoCount on

INSERT INTO tblGalen_Annual_Budget_Report
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
BdgPACost, 
calcBdgPACost, 
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
BdgEncounters, 
BdgDocHours, 
BdgDocEarnedHrly, 
BdgPAHours, 
BdgPACostHr, 
calcBdgPatients, 
calcBdgEncounters, 
calcBdgEncounters2, 
calcBdgEncounters3, 
BdgAvgChgPt, 
BdgCollPerPt, 
calcBdgTotalColl, 
BdgNetRevPerPt,
MedicalDirector,
SiteLineSiteID,
ProcessLevel,
BdgPITpct)
Select Site, 
BdgYear,
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPstChgs,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,1),round(BdgTargetRate*100,2)))) + '%', 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgGrossColl,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgStipendsRcvd,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgOthRcpts,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgTotalColl,0))), 
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgMPRate))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgMalpractice,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgBillFee,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgInterest,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgDonations,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgOffTop,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgBillSpec,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgCEPRetentionAmt,0))), 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgNOR))),
case when [BdgNOR] = 0 then '0%' else convert (varchar(50),convert(decimal(9,2),round([BdgNOR]/[BdgNOR]*100,2)))+'%' end, 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPITearned,0))),
case when [BdgNOR] = 0 then '0%' else convert (varchar(50),convert(decimal(9,2),convert(float,[BdgPITearned])/convert(float,[BdgNOR])*100))+'%' end, 
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPACost,0))),
case when [BdgNOR] = 0 then '0%' else convert (varchar(50),convert(decimal(9,2),round([BdgPTCost]/[BdgNOR]*100,2),0))+'%' end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgLclExp,0))),
case when [BdgNOR] = 0 then '0%' else convert (varchar(50),convert(decimal(9,2),convert(float,[BdgLclExp])/convert(float,[BdgNOR])*100))+'%' end,
convert (varchar(50),convert(decimal(9,2),round(BdgMDpct*100,2),0))+'%',
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgMDearned,0))),
case when [BdgNOR] = 0 then '0%' else convert (varchar(50),convert(decimal(9,2),convert(float,[BdgMDEarned])/convert(float,[BdgNOR])*100,0))+'%' end,
convert (varchar(50),convert(decimal(9,2),round(BdgRDpct*100,2),0))+'%',
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgRDearned,0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(decimal(9,2),convert(float,[BdgRDearned])/convert(float,[BdgNOR])*100,2),0)+'%' end,
convert (varchar(50),convert(decimal(9,2),round(BdgContribPct*100,2),0))+'%',
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgContribCEP,0))),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(decimal(9,2),round([BdgContribCEP]/[BdgNOR]*100,0),0))+'%' end,
'$'+convert (varchar(50),convert(int,BdgSiteNetInc,0)),
case when [BdgNOR] = 0 then '0' else convert (varchar(50),convert(decimal(9,2),round([BdgSiteNetInc]/[BdgNOR]*100,2),0))+'%' end,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPatients,0))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgEncounters,0))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgDocHours,0))),
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgDocEarnedHrly))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(int,BdgPAHours,0))),
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgPACostHr))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,1),convert(float,[BdgPatients])/12))),
dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,1),convert(float,[BdgEncounters])/365))),
case when [BdgDocHours] = 0 then '0' else convert (varchar(50),convert(decimal(9,2),round([BdgEncounters]/[BdgDocHours],2),0)) end,
case when ([BdgDocHours]+[BdgPAHours]) = 0 then '0' else convert (varchar(50),convert(decimal(9,2),round([BdgEncounters]/([BdgDocHours]+[BdgPAHours]),2),0)) end,
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgAvgChgPt,0))),
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgCollPerPt,0))),
case when [BdgPatients] = 0 then '0' else '$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),[BdgTotalColl]/[BdgPatients],0))) end, 
'$'+dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),BdgNetRevPerPt,0))),
MedicalDirector,
CtrID,
CtrTIN,
dbo.fn_FormatWithCommas(convert (varchar(50),convert(decimal(9,2),round(BdgPITpct*100,2),0))) + '%'
/**/
from vwBdg
where BdgYear >= 2011	
	and Ctr_CtrTypID IN ('ICU',
					'HOSP',
					'SNF',
					'POST') 

Set NoCount off

End













