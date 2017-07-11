﻿CREATE TABLE [dbo].[tblStandard_Galen_SiteLine_Report] (
    [tblID]                             INT           IDENTITY (1, 1) NOT NULL,
    [Site]                              VARCHAR (75)  NULL,
    [ReportDate]                        VARCHAR (24)  NULL,
    [SttPstChgs]                        VARCHAR (50)  NULL,
    [calcBdgPstChgs]                    VARCHAR (50)  NULL,
    [ytdSttPstChgs]                     VARCHAR (50)  NULL,
    [ytdBdgPstChgs]                     VARCHAR (50)  NULL,
    [SttTargetRate]                     VARCHAR (50)  NULL,
    [BdgTargetRate]                     VARCHAR (50)  NULL,
    [ytdSttTargetRate]                  VARCHAR (50)  NULL,
    [ytdBdgTargetRate]                  VARCHAR (50)  NULL,
    [SttGrossCollAmt]                   VARCHAR (50)  NULL,
    [calcBdgGrossColl]                  VARCHAR (50)  NULL,
    [ytdGrossColl]                      VARCHAR (50)  NULL,
    [ytdBdgGrossColl]                   VARCHAR (50)  NULL,
    [SttStipRcvd]                       VARCHAR (50)  NULL,
    [calcBdgStipendsRcvd]               VARCHAR (50)  NULL,
    [ytdStipendsRcvd]                   VARCHAR (50)  NULL,
    [ytdBdgStipendsRcvd]                VARCHAR (50)  NULL,
    [SttOtherRcpts]                     VARCHAR (50)  NULL,
    [calcBdgOthRcpts]                   VARCHAR (50)  NULL,
    [ytdOtherRcpts]                     VARCHAR (50)  NULL,
    [ytdBdgOthRcpts]                    VARCHAR (50)  NULL,
    [SttWIPGainLossAmt]                 VARCHAR (50)  NULL,
    [ytdWIPGainLoss]                    VARCHAR (50)  NULL,
    [SttValuationGainLossAmt]           VARCHAR (50)  NULL,
    [ytdValuationGainLoss]              VARCHAR (50)  NULL,
    [SttTotalCollAmt]                   VARCHAR (50)  NULL,
    [calcBdgTotalColl]                  VARCHAR (50)  NULL,
    [ytdTotalColl]                      VARCHAR (50)  NULL,
    [ytdBdgTotalColl]                   VARCHAR (50)  NULL,
    [SttMPRate]                         VARCHAR (50)  NULL,
    [SttMlpAmt]                         VARCHAR (50)  NULL,
    [calcBdgMalpractice]                VARCHAR (50)  NULL,
    [ytdMalpractice]                    VARCHAR (50)  NULL,
    [ytdBdgMalpractice]                 VARCHAR (50)  NULL,
    [SttBillFee]                        VARCHAR (50)  NULL,
    [calcBdgBillFee]                    VARCHAR (50)  NULL,
    [ytdSttBillFee]                     VARCHAR (50)  NULL,
    [ytdBdgBillFee]                     VARCHAR (50)  NULL,
    [calcSttCollFeeChgAmt]              VARCHAR (50)  NULL,
    [calcYtdSttCollFeeChgAmt]           VARCHAR (50)  NULL,
    [SttIntAmt]                         VARCHAR (50)  NULL,
    [calcBdgInterest]                   VARCHAR (50)  NULL,
    [ytdInterest]                       VARCHAR (50)  NULL,
    [ytdbdgInterest]                    VARCHAR (50)  NULL,
    [calcSttOffTop]                     VARCHAR (50)  NULL,
    [calcBdgOffTop]                     VARCHAR (50)  NULL,
    [calcytdSttOffTop]                  VARCHAR (50)  NULL,
    [calcytdBdgOffTop]                  VARCHAR (50)  NULL,
    [calcSttBillSpec]                   VARCHAR (50)  NULL,
    [calcBdgBillSpec]                   VARCHAR (50)  NULL,
    [calcYtdBillSpec]                   VARCHAR (50)  NULL,
    [ytdBdgBillSpec]                    VARCHAR (50)  NULL,
    [SttNorAmt]                         VARCHAR (50)  NULL,
    [calcSttNorAmt]                     VARCHAR (50)  NULL,
    [calcBdgNOR]                        VARCHAR (50)  NULL,
    [calcNOR]                           VARCHAR (50)  NULL,
    [ytdNOR]                            VARCHAR (50)  NULL,
    [ytdBdgNOR]                         VARCHAR (50)  NULL,
    [SttDocPaidAmt]                     VARCHAR (50)  NULL,
    [SttCompPITpct]                     VARCHAR (53)  NULL,
    [BdgPITearned]                      VARCHAR (50)  NULL,
    [BdgPITEarnedPct]                   VARCHAR (53)  NULL,
    [caclytdSttDocPaidAmt]              VARCHAR (50)  NULL,
    [ytdPITpct]                         VARCHAR (53)  NULL,
    [ytdBdgPITEarned]                   VARCHAR (50)  NULL,
    [ytdBdgPITPct]                      VARCHAR (53)  NULL,
    [SttStatPITpct]                     VARCHAR (53)  NULL,
    [calcSttPTOTotalCost]               VARCHAR (50)  NULL,
    [SttPACostPct]                      VARCHAR (53)  NULL,
    [calcBdgPACostPct]                  VARCHAR (53)  NULL,
    [BdgPACostPct]                      VARCHAR (53)  NULL,
    [calcytdSttPTOTotalCost]            VARCHAR (50)  NULL,
    [ytdSttPACostPct]                   VARCHAR (53)  NULL,
    [calcytdBdgPACost]                  VARCHAR (50)  NULL,
    [ytdBdgPACostPct]                   VARCHAR (53)  NULL,
    [SttPTCost]                         VARCHAR (50)  NULL,
    [SttPTCostPct]                      VARCHAR (53)  NULL,
    [calcBdgPTCost]                     VARCHAR (50)  NULL,
    [BdgPTCostPct]                      VARCHAR (53)  NULL,
    [ytdSttPTCost]                      VARCHAR (50)  NULL,
    [ytdSttPTCostPct]                   VARCHAR (53)  NULL,
    [ytdBdgPTCost]                      VARCHAR (50)  NULL,
    [ytdBdgPTCostPct]                   VARCHAR (53)  NULL,
    [calcSttLclExp]                     VARCHAR (50)  NULL,
    [SttLclExpPct]                      VARCHAR (53)  NULL,
    [calcBdgLclExp]                     VARCHAR (50)  NULL,
    [BdgLclExpPct]                      VARCHAR (53)  NULL,
    [calcytdSttLclExp]                  VARCHAR (50)  NULL,
    [ytdSttLclExpPct]                   VARCHAR (53)  NULL,
    [ytdBdgLclExp]                      VARCHAR (50)  NULL,
    [ytdBdgLclExpPct]                   VARCHAR (53)  NULL,
    [calcSttNonCurrAdjAmt]              VARCHAR (50)  NULL,
    [calcSttNonCurrAdjAmtNor]           VARCHAR (50)  NULL,
    [calcytdSttNonCurrAdjAmt]           VARCHAR (50)  NULL,
    [calcytdSttNonCurrAdjAmtNor]        VARCHAR (50)  NULL,
    [SttMDpct]                          VARCHAR (53)  NULL,
    [SttMDPaidAmt]                      VARCHAR (50)  NULL,
    [SttCompMDpct]                      VARCHAR (53)  NULL,
    [calcBdgMDearned]                   VARCHAR (50)  NULL,
    [BdgMDpct]                          VARCHAR (53)  NULL,
    [ytdSttMDPaidAmt]                   VARCHAR (50)  NULL,
    [ytdMDpct]                          VARCHAR (53)  NULL,
    [ytdBdgMDearned]                    VARCHAR (50)  NULL,
    [ytdBdgMDpct]                       VARCHAR (53)  NULL,
    [SttRDpct]                          VARCHAR (53)  NULL,
    [calcSttRDEarnedAmt]                VARCHAR (50)  NULL,
    [SttCompRDpct]                      VARCHAR (53)  NULL,
    [calcBdgRDearned]                   VARCHAR (50)  NULL,
    [BdgRDpct]                          VARCHAR (53)  NULL,
    [calcYtdSttRDEarnedAmt]             VARCHAR (50)  NULL,
    [ytdRDpct]                          VARCHAR (53)  NULL,
    [ytdBdgRDearned]                    VARCHAR (50)  NULL,
    [ytdBdgRDpct]                       VARCHAR (53)  NULL,
    [SttContribPct]                     VARCHAR (53)  NULL,
    [SttContribCEPAmt]                  VARCHAR (50)  NULL,
    [calcSttNorAmtIf]                   VARCHAR (50)  NULL,
    [calcBdgContribCEP]                 VARCHAR (50)  NULL,
    [BdgContribPct]                     VARCHAR (53)  NULL,
    [ytdContribCEP]                     VARCHAR (50)  NULL,
    [ytdStatContribPct]                 VARCHAR (53)  NULL,
    [ytdBdgContribCEP]                  VARCHAR (50)  NULL,
    [ytdBdgContribPct]                  VARCHAR (53)  NULL,
    [SttSiteNetIncAmt]                  VARCHAR (50)  NULL,
    [SttNetPctofNOR]                    VARCHAR (50)  NULL,
    [calcBdgSiteNetInc]                 VARCHAR (50)  NULL,
    [BdgNetPctofNOR]                    VARCHAR (50)  NULL,
    [ytdSiteNetInc]                     VARCHAR (50)  NULL,
    [ytdNetPctofNOR]                    VARCHAR (50)  NULL,
    [ytdBdgSiteNetInc]                  VARCHAR (50)  NULL,
    [ytdBdgNetPctofNOR]                 VARCHAR (50)  NULL,
    [SttPatVisitQty]                    VARCHAR (50)  NULL,
    [calcBdgPatients]                   VARCHAR (50)  NULL,
    [ytdSttPatVisitQty]                 VARCHAR (50)  NULL,
    [ytdBdgPatients]                    VARCHAR (50)  NULL,
    [SttPtsKeyed]                       VARCHAR (50)  NULL,
    [ytdSttPtsKeyed]                    VARCHAR (50)  NULL,
    [SttAdmitQty]                       VARCHAR (50)  NULL,
    [calcBdgEncounters]                 VARCHAR (50)  NULL,
    [YtdSttAdmitQty]                    VARCHAR (50)  NULL,
    [YTDBdgEncounters]                  VARCHAR (53)  NULL,
    [calcDailySttAdmitQty]              VARCHAR (53)  NULL,
    [calcDailyBdgEncounters]            VARCHAR (53)  NULL,
    [calcDailyYtdSttAdmitQty]           VARCHAR (53)  NULL,
    [calcDailyYTDBdgEncounters]         VARCHAR (50)  NULL,
    [SttDocHourQty]                     VARCHAR (50)  NULL,
    [calcSttDocPdHrAmt]                 VARCHAR (50)  NULL,
    [ytdDocHours]                       VARCHAR (50)  NULL,
    [ytdBdgDocHours]                    VARCHAR (50)  NULL,
    [SttDocEarnedHourAmt]               VARCHAR (50)  NULL,
    [BdgDocEarnedHrly]                  VARCHAR (50)  NULL,
    [ytdDocEarnedHrly]                  VARCHAR (50)  NULL,
    [ytdBdgDocEarnedHrly]               VARCHAR (50)  NULL,
    [SttDocPaidHourAmt]                 VARCHAR (50)  NULL,
    [ytdSttDocPaidAmtHrly]              VARCHAR (50)  NULL,
    [SttPAhoursQty]                     VARCHAR (50)  NULL,
    [calcBdgPAHours]                    VARCHAR (50)  NULL,
    [ytdPAHours]                        VARCHAR (50)  NULL,
    [ytdBdgPAHours]                     VARCHAR (50)  NULL,
    [BdgPACostHr]                       VARCHAR (50)  NULL,
    [ytdBdgPAPaidHrly]                  VARCHAR (50)  NULL,
    [calcEnctSttAdmitQty]               VARCHAR (50)  NULL,
    [calcEnctBdgAdmitQty]               VARCHAR (50)  NULL,
    [calcEnctYtdSttAdmitQty]            VARCHAR (50)  NULL,
    [calcytdBdgEnctAmtQty]              VARCHAR (50)  NULL,
    [calcPAEnctSttAdmitQty]             VARCHAR (50)  NULL,
    [calcPAEnctBdgAdmitQty]             VARCHAR (50)  NULL,
    [calcPAEnctYtdSttAdmitQty]          VARCHAR (50)  NULL,
    [calcPAytdBdgEnctAmtQty]            VARCHAR (50)  NULL,
    [SttAvgChgPt]                       VARCHAR (50)  NULL,
    [BdgAvgChgPt]                       VARCHAR (50)  NULL,
    [ytdAvgChgPt]                       VARCHAR (50)  NULL,
    [ytdbdgAvgChgPt]                    VARCHAR (50)  NULL,
    [SttCollPerPtAmt]                   VARCHAR (50)  NULL,
    [ytdCollPerPt]                      VARCHAR (50)  NULL,
    [ytdBdgCollPerPt]                   VARCHAR (50)  NULL,
    [SttTotalCollPerPt]                 VARCHAR (50)  NULL,
    [calcbdgtotalColl2]                 VARCHAR (53)  NULL,
    [ytdTotalCollPerPt]                 VARCHAR (50)  NULL,
    [calcYtdBdgTotalColl]               VARCHAR (50)  NULL,
    [SttNetRevPerPtAmt]                 VARCHAR (50)  NULL,
    [BdgNetRevPerPt]                    VARCHAR (50)  NULL,
    [ytdNetRevPerPt]                    VARCHAR (50)  NULL,
    [ytdBdgNetRevPerPt]                 VARCHAR (50)  NULL,
    [SttPriorCollectAR]                 VARCHAR (50)  NULL,
    [SttCollFeeChgAmt]                  VARCHAR (50)  NULL,
    [calcSttCashARAmt]                  VARCHAR (50)  NULL,
    [SttRefAR]                          VARCHAR (50)  NULL,
    [SttNetChangeinARAmt]               VARCHAR (50)  NULL,
    [SttEndCollectAR]                   VARCHAR (50)  NULL,
    [SttPriorLoanBal]                   VARCHAR (50)  NULL,
    [SttCashExpAmt]                     VARCHAR (50)  NULL,
    [SttCashARAmt]                      VARCHAR (50)  NULL,
    [calcSttRefAR]                      VARCHAR (50)  NULL,
    [SttCashRcptAmt]                    VARCHAR (50)  NULL,
    [SttCurrLoanBal]                    VARCHAR (50)  NULL,
    [calcSttPriorLoanBal]               VARCHAR (50)  NULL,
    [calcSttNetChangeinARAmt]           VARCHAR (50)  NULL,
    [calcSttEndCollectAR]               VARCHAR (50)  NULL,
    [MandatoryReserve]                  VARCHAR (50)  NULL,
    [SttSurplusReserveNote]             VARCHAR (50)  NULL,
    [calcSttSurplusReservePctIf]        VARCHAR (50)  NULL,
    [calcAdditionalSurplusReservebyPct] VARCHAR (53)  NULL,
    [calcEndMonthSurplus]               VARCHAR (50)  NULL,
    [calcSttChartMissQty]               VARCHAR (50)  NULL,
    [SttChartPostQty]                   VARCHAR (50)  NULL,
    [SttChartQty]                       VARCHAR (50)  NULL,
    [SttChartMissQty]                   VARCHAR (50)  NULL,
    [SttChartMiss30Qty]                 VARCHAR (50)  NULL,
    [calcTotalWIPCount]                 VARCHAR (50)  NULL,
    [calcSttChartPostQty]               VARCHAR (50)  NULL,
    [MedicalDirector]                   VARCHAR (255) NULL,
    [SttAccExpenseAmt]                  VARCHAR (50)  NULL,
    [YtdSttACCExpenseAmt]               VARCHAR (50)  NULL,
    [SttSiteOverheadAmt]                VARCHAR (50)  NULL,
    [YtdSiteOverhead]                   VARCHAR (50)  NULL,
    [calcSttSiteOverheadAmt]            VARCHAR (50)  NULL,
    [calcYtdSttACCExpenseAmt2]          VARCHAR (50)  NULL,
    [SttDonationAmt]                    VARCHAR (50)  NULL,
    [YtdSttDonationAmt]                 VARCHAR (50)  NULL,
    [SttOffTop]                         VARCHAR (50)  NULL,
    [YtdSttOffTop]                      VARCHAR (50)  NULL,
    [SttCEPSurchargeAmt]                VARCHAR (50)  NULL,
    [YtdSttCEPSurchargeAmt]             VARCHAR (50)  NULL,
    [SttBillSpec]                       VARCHAR (50)  NULL,
    [YtdBillSpec]                       VARCHAR (50)  NULL,
    [SttBillSpecMBSIAmt]                VARCHAR (50)  NULL,
    [YtdSttBillSpecMBSIAmt]             VARCHAR (50)  NULL,
    [SttBillSpecScribesAmt]             VARCHAR (50)  NULL,
    [YTDSttBillSpecScribesAmt]          VARCHAR (50)  NULL,
    [SttBillSpecScribesAdjAmt]          VARCHAR (50)  NULL,
    [YTDSttBillSpecScribesAdjAmt]       VARCHAR (50)  NULL,
    [SttBillSpecSitePersonnelAmt]       VARCHAR (50)  NULL,
    [YTDSttBillSpecSitePersonnelAmt]    VARCHAR (50)  NULL,
    [SttBillSpecSitePersonnelAdjAmt]    VARCHAR (50)  NULL,
    [YTDSttBillSpecSitePersonnelAdjAmt] VARCHAR (50)  NULL,
    [SttPACost]                         VARCHAR (50)  NULL,
    [YtdSttPACost]                      VARCHAR (50)  NULL,
    [SttPTOTotalCost]                   VARCHAR (50)  NULL,
    [YTDSttPTOTotalCost]                VARCHAR (50)  NULL,
    [calcSttPASupportCostAmt]           VARCHAR (50)  NULL,
    [calcYtdSttPASupportCostAmt]        VARCHAR (50)  NULL,
    [SttPTAdjAmt]                       VARCHAR (50)  NULL,
    [YtdSttPTAdjAmt]                    VARCHAR (50)  NULL,
    [calcSttPTAdjAmt]                   VARCHAR (50)  NULL,
    [calcYtdSttPTAdjAmt]                VARCHAR (50)  NULL,
    [SttLclExp]                         VARCHAR (50)  NULL,
    [YtdSttLclExp]                      VARCHAR (50)  NULL,
    [SttFixedLocalAmt]                  VARCHAR (50)  NULL,
    [YtdSttFixedLocalAmt]               VARCHAR (50)  NULL,
    [calcSttLclExp2]                    VARCHAR (50)  NULL,
    [calcYTDSttLclExp2]                 VARCHAR (50)  NULL,
    [SttNonCurrAdjAmt]                  VARCHAR (50)  NULL,
    [YtdSttNonCurrAdjAmt]               VARCHAR (50)  NULL,
    [SttSurplusPayout]                  VARCHAR (50)  NULL,
    [YtdSttSurplusPayout]               VARCHAR (50)  NULL,
    [SttNonCurrMDAmt]                   VARCHAR (50)  NULL,
    [YtdSttNonCurrMDAmt]                VARCHAR (50)  NULL,
    [SttNonCurrRDAmt]                   VARCHAR (50)  NULL,
    [YtdSttNonCurrRDAmt]                VARCHAR (50)  NULL,
    [SttSrpAdjAmt]                      VARCHAR (50)  NULL,
    [YtdSttSrpAdjAmt]                   VARCHAR (50)  NULL,
    [calcSttSrpAdjAmt]                  VARCHAR (50)  NULL,
    [calcYtdSttSrpAdjAmt]               VARCHAR (50)  NULL,
    [calcValuationGainLossComment]      TEXT          NULL,
    [calcSrpAdjAmtComment]              TEXT          NULL,
    [calcWIPGainLossComment]            TEXT          NULL,
    [calcUnspecifiedComment]            TEXT          NULL,
    [calcCommentOther]                  TEXT          NULL,
    [calcExpComment]                    TEXT          NULL,
    [SiteLineSiteID]                    INT           NULL,
    [ProcessLevel]                      VARCHAR (15)  NULL,
    [SttGrossCollAmt2]                  VARCHAR (50)  NULL,
    [SttWIPGainLossAmt2]                VARCHAR (50)  NULL,
    [SttValuationGainLossAmt2]          VARCHAR (50)  NULL,
    [SttStipRcvd2]                      VARCHAR (50)  NULL,
    [SttOtherRcpts2]                    VARCHAR (50)  NULL,
    [calcSttSiteOverheadAmt2]           VARCHAR (50)  NULL,
    [calcSttOffTop2]                    VARCHAR (50)  NULL,
    [calcytdSttOffTop2]                 VARCHAR (50)  NULL,
    [calcSttBillSpec2]                  VARCHAR (50)  NULL,
    [calcYtdBillSpec2]                  VARCHAR (50)  NULL,
    [calcSttPTOTotalCost3]              VARCHAR (50)  NULL,
    [calcytdSttPTOTotalCost2]           VARCHAR (50)  NULL,
    [SttPTCost2]                        VARCHAR (50)  NULL,
    [YtdSttPTCost2]                     VARCHAR (50)  NULL,
    [calcSttPTOTotalCost4]              VARCHAR (50)  NULL,
    [calcytdSttPTOTotalCost3]           VARCHAR (50)  NULL,
    [BdgCollPerPt]                      VARCHAR (50)  NULL,
    [calcDailySttEncounterQty]          VARCHAR (50)  NULL,
    [calcDailyYTDSttEncounterQty]       VARCHAR (50)  NULL,
    [calcEncountersPerDocHrs]           VARCHAR (50)  NULL,
    [calcEncountersYTDPerDocHrs]        VARCHAR (50)  NULL,
    [calcEncountersPerDocPAHrs]         VARCHAR (50)  NULL,
    [calcEncountersYTDPerDocPAHrs]      VARCHAR (50)  NULL,
    [calcSttDocHourQty]                 VARCHAR (50)  NULL,
    [calcSttPAhoursQty]                 VARCHAR (50)  NULL,
    CONSTRAINT [PK_tblStandard_Galen_SiteLine_Report] PRIMARY KEY CLUSTERED ([tblID] ASC)
);

