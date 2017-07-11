CREATE TABLE [dbo].[tblStt] (
    [SttDate]                           SMALLDATETIME NOT NULL,
    [Stt_CtrID]                         INT           NOT NULL,
    [Stt_BdgID]                         INT           NOT NULL,
    [Stt_BdgYear]                       INT           NULL,
    [SttID]                             INT           IDENTITY (1, 1) NOT NULL,
    [SttKey]                            VARCHAR (100) NULL,
    [SttLink]                           INT           NULL,
    [SttAccExpenseAmt]                  MONEY         CONSTRAINT [DF_tblStt_SttAccExpenseAmt] DEFAULT ((0)) NOT NULL,
    [SttAdmitQty]                       INT           CONSTRAINT [DF_tblStt_SttAdmitQty] DEFAULT ((0)) NOT NULL,
    [SttBillFee]                        MONEY         CONSTRAINT [DF_tblStt_SttBillFee] DEFAULT ((0)) NOT NULL,
    [SttBillRate]                       FLOAT (53)    CONSTRAINT [DF_tblStt_SttBillRate] DEFAULT ((0)) NOT NULL,
    [SttBillSpec]                       MONEY         CONSTRAINT [DF_tblStt_SttBillSpec] DEFAULT ((0)) NOT NULL,
    [SttBillSpecMBSIAmt]                MONEY         CONSTRAINT [DF_tblStt_SttBillSpecMBSIAmt] DEFAULT ((0)) NOT NULL,
    [SttBillSpecScribesAmt]             MONEY         CONSTRAINT [DF_tblStt_SttBillSpecScribes] DEFAULT ((0)) NOT NULL,
    [SttBillSpecScribesAdjAmt]          MONEY         CONSTRAINT [DF_tblStt_SttBillSpecScribesAdjAmt] DEFAULT ((0)) NOT NULL,
    [SttBillSpecSitePersonnelAmt]       MONEY         CONSTRAINT [DF_tblStt_SttBillSpecSitePersonnelAmt] DEFAULT ((0)) NOT NULL,
    [SttBillSpecSitePersonnelAdjAmt]    MONEY         CONSTRAINT [DF_tblStt_SttBillSpecSitePersonnelAdjAmt] DEFAULT ((0)) NOT NULL,
    [SttBseHour]                        FLOAT (53)    CONSTRAINT [DF_tblStt_SttBseHour] DEFAULT ((0)) NOT NULL,
    [SttChartQty]                       INT           CONSTRAINT [DF_tblStt_SttChartQty] DEFAULT ((0)) NOT NULL,
    [SttChartPostQty]                   INT           CONSTRAINT [DF_tblStt_SttChartPostQty] DEFAULT ((0)) NOT NULL,
    [SttChartMissQty]                   INT           CONSTRAINT [DF_tblStt_SttChartMissQty] DEFAULT ((0)) NOT NULL,
    [SttChartMiss30Qty]                 INT           CONSTRAINT [DF_tblStt_SttChartMiss30Qty] DEFAULT ((0)) NOT NULL,
    [SttCashARAmt]                      MONEY         CONSTRAINT [DF_tblStt_SttCashARAmt] DEFAULT ((0)) NOT NULL,
    [SttCEPSurchargePct]                FLOAT (53)    CONSTRAINT [DF_tblStt_SttCEPSurchargePct] DEFAULT ((0)) NOT NULL,
    [SttCollectibleARAmt]               MONEY         CONSTRAINT [DF_tblStt_SttCollectibleARAmt] DEFAULT ((0)) NOT NULL,
    [SttCollectWIP]                     MONEY         CONSTRAINT [DF_tblStt_SttCollectWIP] DEFAULT ((0)) NOT NULL,
    [SttContribPct]                     FLOAT (53)    CONSTRAINT [DF_tblStt_SttContribPct] DEFAULT ((0)) NOT NULL,
    [SttCurrLoanBal]                    MONEY         CONSTRAINT [DF_tblStt_SttCurrLoanBal] DEFAULT ((0)) NOT NULL,
    [SttDiffAmt]                        FLOAT (53)    CONSTRAINT [DF_tblStt_SttDiffAmt] DEFAULT ((0)) NOT NULL,
    [SttDiffRate]                       FLOAT (53)    CONSTRAINT [DF_tblStt_SttDiffRate] DEFAULT ((0)) NOT NULL,
    [SttDocHourQty]                     FLOAT (53)    CONSTRAINT [DF_tblStt_SttDocHourQty] DEFAULT ((0)) NOT NULL,
    [SttDocPaidAdjAmt]                  MONEY         CONSTRAINT [DF_tblStt_SttDocPaidAdjAmt] DEFAULT ((0)) NOT NULL,
    [SttDocPaidAmt]                     MONEY         CONSTRAINT [DF_tblStt_SttDocPaidAmt] DEFAULT ((0)) NOT NULL,
    [SttDonationAmt]                    MONEY         CONSTRAINT [DF_tblStt_SttDonations] DEFAULT ((0)) NOT NULL,
    [SttFixedLocalAmt]                  MONEY         CONSTRAINT [DF_tblStt_SttFixedLocalAmt] DEFAULT ((0)) NOT NULL,
    [SttIntRate]                        FLOAT (53)    CONSTRAINT [DF_tblStt_SttIntRate] DEFAULT ((0)) NOT NULL,
    [SttLclExp]                         MONEY         CONSTRAINT [DF_tblStt_SttLclExp] DEFAULT ((0)) NOT NULL,
    [SttLclPct]                         FLOAT (53)    CONSTRAINT [DF_tblStt_SttLclPct] DEFAULT ((0)) NOT NULL,
    [SttLclVarAmt]                      MONEY         CONSTRAINT [DF_tblStt_SttLclVarAmt] DEFAULT ((0)) NOT NULL,
    [SttMDIncentiveAmt]                 MONEY         CONSTRAINT [DF_tblStt_SttMDIncentiveAmt] DEFAULT ((0)) NOT NULL,
    [SttMDIncentivePct]                 FLOAT (53)    CONSTRAINT [DF_tblStt_SttMDIncentivePct] DEFAULT ((0)) NOT NULL,
    [SttMDPaidAmt]                      MONEY         CONSTRAINT [DF_tblStt_SttMDPaidAmt] DEFAULT ((0)) NOT NULL,
    [SttMDpct]                          FLOAT (53)    CONSTRAINT [DF_tblStt_SttMDpct] DEFAULT ((0)) NOT NULL,
    [SttMPFlatFeeAmt]                   MONEY         CONSTRAINT [DF_tblStt_SttMPFlatFeeAmt] DEFAULT ((0)) NOT NULL,
    [SttMPRate]                         FLOAT (53)    CONSTRAINT [DF_tblStt_SttMPRate] DEFAULT ((0)) NOT NULL,
    [SttMPUCRate]                       FLOAT (53)    CONSTRAINT [DF_tblStt_SttMPUCRate] DEFAULT ((0)) NOT NULL,
    [SttNightPct]                       FLOAT (53)    CONSTRAINT [DF_tblStt_SttNightPct] DEFAULT ((0)) NOT NULL,
    [SttNonCurrAdjAmt]                  MONEY         CONSTRAINT [DF_tblStt_SttNonCurrAdjAmt] DEFAULT ((0)) NOT NULL,
    [SttNonCurrMDAmt]                   MONEY         CONSTRAINT [DF_tblStt_SttNonCurrMD] DEFAULT ((0)) NOT NULL,
    [SttNonCurrRDAmt]                   MONEY         CONSTRAINT [DF_tblStt_SttNonCurrRDAmt] DEFAULT ((0)) NOT NULL,
    [SttNorAmt]                         MONEY         CONSTRAINT [DF_tblStt_SttNorAmt] DEFAULT ((0)) NOT NULL,
    [SttOffTop]                         MONEY         CONSTRAINT [DF_tblStt_SttOffTop] DEFAULT ((0)) NOT NULL,
    [SttOtherRcpts]                     MONEY         CONSTRAINT [DF_tblStt_SttOtherRcpts] DEFAULT ((0)) NOT NULL,
    [SttPAAdjAmt]                       MONEY         CONSTRAINT [DF_tblStt_SttPAAdjAmt] DEFAULT ((0)) NOT NULL,
    [SttPACost]                         MONEY         CONSTRAINT [DF_tblStt_SttPACost] DEFAULT ((0)) NOT NULL,
    [SttPAhoursQty]                     FLOAT (53)    CONSTRAINT [DF_tblStt_SttPAhoursQty] DEFAULT ((0)) NOT NULL,
    [SttPASupportCostPct]               FLOAT (53)    CONSTRAINT [DF_tblStt_SttPASupportCostPct] DEFAULT ((0)) NOT NULL,
    [SttPatVisitQty]                    INT           CONSTRAINT [DF_tblStt_SttPatVisitQty] DEFAULT ((0)) NOT NULL,
    [SttPatVisitUCQty]                  INT           CONSTRAINT [DF_tblStt_SttPatVisitUCQty] DEFAULT ((0)) NOT NULL,
    [SttPatVisitReturnQty]              INT           CONSTRAINT [DF_tblStt_SttPatVisitReturnQty] DEFAULT ((0)) NOT NULL,
    [SttPhysTherVisitQty]               FLOAT (53)    CONSTRAINT [DF_tblStt_SttPhysTherVisitQty] DEFAULT ((0)) NOT NULL,
    [SttPstChgs]                        MONEY         CONSTRAINT [DF_tblStt_SttPstChgs] DEFAULT ((0)) NOT NULL,
    [SttPTCost]                         MONEY         CONSTRAINT [DF_tblStt_SttPTCost] DEFAULT ((0)) NOT NULL,
    [SttPTAdjAmt]                       MONEY         CONSTRAINT [DF_tblStt_SttPTAdjAmt] DEFAULT ((0)) NOT NULL,
    [SttPTOAccrualRate]                 FLOAT (53)    CONSTRAINT [DF_tblStt_SttPTOAccrualRate] DEFAULT ((0)) NOT NULL,
    [SttPtsKeyed]                       INT           CONSTRAINT [DF_tblStt_SttPtsKeyed] DEFAULT ((0)) NOT NULL,
    [SttRDIncentiveAmt]                 MONEY         CONSTRAINT [DF_tblStt_SttRDIncentiveAmt] DEFAULT ((0)) NOT NULL,
    [SttRDIncentivePct]                 FLOAT (53)    CONSTRAINT [DF_tblStt_SttRDIncentivePct] DEFAULT ((0)) NOT NULL,
    [SttRDPaidAmt]                      MONEY         CONSTRAINT [DF_tblStt_SttRDPaidAmt] DEFAULT ((0)) NOT NULL,
    [SttRDpct]                          FLOAT (53)    CONSTRAINT [DF_tblStt_SttRDpct] DEFAULT ((0)) NOT NULL,
    [SttRefAR]                          MONEY         CONSTRAINT [DF_tblStt_SttRefAR] DEFAULT ((0)) NOT NULL,
    [SttSiteOvrHdPct]                   FLOAT (53)    CONSTRAINT [DF_tblStt_SttSiteOvrHdPct] DEFAULT ((0)) NOT NULL,
    [SttSrpAdjAmt]                      MONEY         CONSTRAINT [DF_tblStt_SttSrpAdjAmt] DEFAULT ((0)) NOT NULL,
    [SttSrpAdjAmtComment]               TEXT          NULL,
    [SttSrpAdjAmtPct]                   FLOAT (53)    CONSTRAINT [DF_tblStt_SttSrpAdjAmtPct] DEFAULT ((0)) NOT NULL,
    [SttStatPITpct]                     FLOAT (53)    CONSTRAINT [DF_tblStt_SttStatPITpct] DEFAULT ((0)) NOT NULL,
    [SttStipRcvd]                       MONEY         CONSTRAINT [DF_tblStt_SttStipRcvd] DEFAULT ((0)) NOT NULL,
    [SttSurplusPayout]                  MONEY         CONSTRAINT [DF_tblStt_SttSurplusPayout] DEFAULT ((0)) NOT NULL,
    [SttSurplusReserveNote]             VARCHAR (50)  NULL,
    [SttSurplusReservePct]              FLOAT (53)    CONSTRAINT [DF_tblStt_SttSurplusReservePct] DEFAULT ((0)) NOT NULL,
    [SttSurplusReserveAmt]              MONEY         CONSTRAINT [DF_tblStt_SttSurplusReserveAmt] DEFAULT ((0)) NULL,
    [SttTargetRate]                     FLOAT (53)    CONSTRAINT [DF_tblStt_SttTargetRate] DEFAULT ((0)) NOT NULL,
    [SttPTOTrueUpAdj]                   MONEY         CONSTRAINT [DF_tblStt_SttPTOTrueUpAdj] DEFAULT ((0)) NOT NULL,
    [SttCommentOther]                   TEXT          NULL,
    [SttUnspecifiedComment]             TEXT          NULL,
    [SttValuationGainLossComment]       TEXT          NULL,
    [SttWIPGainLossComment]             TEXT          NULL,
    [SttCommentInternal]                TEXT          NULL,
    [SttDateCreate]                     SMALLDATETIME NULL,
    [SttDateEdit]                       SMALLDATETIME NULL,
    [SttInactiveYN]                     BIT           CONSTRAINT [DF_tblStt_SttInactiveYN] DEFAULT ((0)) NOT NULL,
    [SttFlagYN]                         BIT           CONSTRAINT [DF_tblStt_SttFlagYN] DEFAULT ((0)) NOT NULL,
    [SttAdjCollWIPAmt]                  MONEY         CONSTRAINT [DF_tblStt_SttAdjCollWIPAmt] DEFAULT ((0)) NOT NULL,
    [SttAvgChgPt]                       MONEY         CONSTRAINT [DF_tblStt_SttAvgChgPt] DEFAULT ((0)) NOT NULL,
    [SttBlendedHrs]                     FLOAT (53)    CONSTRAINT [DF_tblStt_SttBlendedHrs] DEFAULT ((0)) NOT NULL,
    [SttBlendedPtsPerHr]                FLOAT (53)    CONSTRAINT [DF_tblStt_SttBlendedPtsPerHr] DEFAULT ((0)) NOT NULL,
    [SttCashExpAmt]                     MONEY         CONSTRAINT [DF_tblStt_SttCashExpAmt] DEFAULT ((0)) NOT NULL,
    [SttCashRcptAmt]                    MONEY         CONSTRAINT [DF_tblStt_SttCashRcptAmt] DEFAULT ((0)) NOT NULL,
    [SttCEPSurchargeAmt]                MONEY         CONSTRAINT [DF_tblStt_SttCEPSurchargeAmt] DEFAULT ((0)) NOT NULL,
    [SttCollFeeAmt]                     MONEY         CONSTRAINT [DF_tblStt_SttCollFeeAmt] DEFAULT ((0)) NOT NULL,
    [SttCollFeeChgAmt]                  MONEY         CONSTRAINT [DF_tblStt_SttCollFeeChgAmt] DEFAULT ((0)) NOT NULL,
    [SttCollPerPtAmt]                   MONEY         CONSTRAINT [DF_tblStt_SttCollPerPtAmt] DEFAULT ((0)) NOT NULL,
    [SttCompPITpct]                     FLOAT (53)    CONSTRAINT [DF_tblStt_SttCompPITpct] DEFAULT ((0)) NOT NULL,
    [SttCompMDpct]                      FLOAT (53)    CONSTRAINT [DF_tblStt_SttCompMDpct] DEFAULT ((0)) NOT NULL,
    [SttCompRDpct]                      FLOAT (53)    CONSTRAINT [DF_tblStt_SttCompRDpct] DEFAULT ((0)) NOT NULL,
    [SttContribCEPAmt]                  MONEY         CONSTRAINT [DF_tblStt_SttContribCEPAmt] DEFAULT ((0)) NOT NULL,
    [SttDayRate]                        MONEY         CONSTRAINT [DF_tblStt_SttDayRate] DEFAULT ((0)) NOT NULL,
    [SttDocEarnedHourAmt]               MONEY         CONSTRAINT [DF_tblStt_SttDocEarnedHourAmt] DEFAULT ((0)) NOT NULL,
    [SttDocPaidHourAmt]                 MONEY         CONSTRAINT [DF_tblStt_SttDocPaidHourAmt] DEFAULT ((0)) NOT NULL,
    [SttDocPITearnedAmt]                MONEY         CONSTRAINT [DF_tblStt_SttDocPITearnedAmt] DEFAULT ((0)) NOT NULL,
    [SttEndCollectAR]                   MONEY         CONSTRAINT [DF_tblStt_SttEndCollectAR] DEFAULT ((0)) NOT NULL,
    [SttGrossCollAmt]                   MONEY         CONSTRAINT [DF_tblStt_SttGrossCollAmt] DEFAULT ((0)) NOT NULL,
    [SttIntAmt]                         MONEY         CONSTRAINT [DF_tblStt_SttIntAmt] DEFAULT ((0)) NOT NULL,
    [SttLclExpPct]                      FLOAT (53)    CONSTRAINT [DF_tblStt_SttLclExpPct] DEFAULT ((0)) NOT NULL,
    [SttMDEarnedAmt]                    MONEY         CONSTRAINT [DF_tblStt_SttMDEarnedAmt] DEFAULT ((0)) NOT NULL,
    [SttMDLclAmt]                       MONEY         CONSTRAINT [DF_tblStt_SttMDLclAmt] DEFAULT ((0)) NOT NULL,
    [SttMlpAmt]                         MONEY         CONSTRAINT [DF_tblStt_SttMlpAmt] DEFAULT ((0)) NOT NULL,
    [SttNetAmt]                         MONEY         CONSTRAINT [DF_tblStt_SttNetAmt] DEFAULT ((0)) NOT NULL,
    [SttNetChangeinARAmt]               MONEY         CONSTRAINT [DF_tblStt_SttNetChangeinARAmt] DEFAULT ((0)) NOT NULL,
    [SttNetPctofNOR]                    FLOAT (53)    CONSTRAINT [DF_tblStt_SttNetPctofNOR] DEFAULT ((0)) NOT NULL,
    [SttNetRevPerPtAmt]                 MONEY         CONSTRAINT [DF_tblStt_SttNetRevPerPtAmt] DEFAULT ((0)) NOT NULL,
    [SttNightRate]                      MONEY         CONSTRAINT [DF_tblStt_SttNightRate] DEFAULT ((0)) NOT NULL,
    [SttNonCurrAdjPct]                  FLOAT (53)    CONSTRAINT [DF_tblStt_SttNonCurrAdjPct] DEFAULT ((0)) NOT NULL,
    [SttPACostPct]                      FLOAT (53)    CONSTRAINT [DF_tblStt_SttPACostPct] DEFAULT ((0)) NOT NULL,
    [SttPAPaidHourAmt]                  MONEY         CONSTRAINT [DF_tblStt_SttPAPaidHourAmt] DEFAULT ((0)) NOT NULL,
    [SttPASupportCostAmt]               MONEY         CONSTRAINT [DF_tblStt_SttPASupportCostAmt] DEFAULT ((0)) NOT NULL,
    [SttPriorAdjCollWIPAmt]             MONEY         CONSTRAINT [DF_tblStt_SttPriorAdjCollWIPAmt] DEFAULT ((0)) NOT NULL,
    [SttPriorCollectAR]                 MONEY         CONSTRAINT [DF_tblStt_SttPriorCollectAR] DEFAULT ((0)) NOT NULL,
    [SttPriorCollFeeAmt]                MONEY         CONSTRAINT [DF_tblStt_SttPriorCollFeeAmt] DEFAULT ((0)) NOT NULL,
    [SttPriorLoanBal]                   MONEY         CONSTRAINT [DF_tblStt_SttPriorLoanBal] DEFAULT ((0)) NOT NULL,
    [SttPTCostPct]                      FLOAT (53)    CONSTRAINT [DF_tblStt_SttPTCostPct] DEFAULT ((0)) NOT NULL,
    [SttPTOAccrual]                     MONEY         CONSTRAINT [DF_tblStt_SttPTOAccrual] DEFAULT ((0)) NOT NULL,
    [SttPTOTotalCost]                   MONEY         CONSTRAINT [DF_tblStt_SttPTOTotalCost] DEFAULT ((0)) NOT NULL,
    [SttPtsPerHr]                       FLOAT (53)    CONSTRAINT [DF_tblStt_SttPtsPerHr] DEFAULT ((0)) NOT NULL,
    [SttRDEarnedAmt]                    MONEY         CONSTRAINT [DF_tblStt_SttRDEarnedAmt] DEFAULT ((0)) NOT NULL,
    [SttRDLclAmt]                       MONEY         CONSTRAINT [DF_tblStt_SttRDLclAmt] DEFAULT ((0)) NOT NULL,
    [SttSiteNetIncAmt]                  MONEY         CONSTRAINT [DF_tblStt_SttSiteNetIncAmt] DEFAULT ((0)) NOT NULL,
    [SttSiteOverheadAmt]                MONEY         CONSTRAINT [DF_tblStt_SttSiteOverheadAmt] DEFAULT ((0)) NOT NULL,
    [SttSurplusDeficitAmt]              MONEY         CONSTRAINT [DF_tblStt_SttSurplusDeficitAmt] DEFAULT ((0)) NOT NULL,
    [SttTotalCollAmt]                   MONEY         CONSTRAINT [DF_tblStt_SttTotalCollAmt] DEFAULT ((0)) NOT NULL,
    [SttTotalCollPerPt]                 MONEY         CONSTRAINT [DF_tblStt_SttTotalCollPerPt] DEFAULT ((0)) NOT NULL,
    [SttValuationGainLossAmt]           MONEY         CONSTRAINT [DF_tblStt_SttValuationGainLossAmt] DEFAULT ((0)) NOT NULL,
    [SttWIPGainLossAmt]                 MONEY         CONSTRAINT [DF_tblStt_SttWIPGainLossAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttPstChgs]                     MONEY         CONSTRAINT [DF_tblStt_YtdSttPstChgs] DEFAULT ((0)) NOT NULL,
    [YtdBdgPstChgs]                     MONEY         CONSTRAINT [DF_tblStt_YtdBdgPstChgs] DEFAULT ((0)) NOT NULL,
    [YtdGrossColl]                      MONEY         CONSTRAINT [DF_tblStt_YtdGrossColl] DEFAULT ((0)) NOT NULL,
    [YtdBdgGrossColl]                   MONEY         CONSTRAINT [DF_tblStt_YtdBdgGrossColl] DEFAULT ((0)) NOT NULL,
    [YtdSttTargetRate]                  FLOAT (53)    CONSTRAINT [DF_tblStt_YtdSttTargetRate] DEFAULT ((0)) NOT NULL,
    [YtdBdgTargetRate]                  FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgTargetRate] DEFAULT ((0)) NOT NULL,
    [YtdStipendsRcvd]                   MONEY         CONSTRAINT [DF_tblStt_YtdStipendsRcvd] DEFAULT ((0)) NOT NULL,
    [YtdBdgStipendsRcvd]                MONEY         CONSTRAINT [DF_tblStt_YtdBdgStipendsRcvd] DEFAULT ((0)) NOT NULL,
    [YtdOtherRcpts]                     MONEY         CONSTRAINT [DF_tblStt_YtdOtherRcpts] DEFAULT ((0)) NOT NULL,
    [YtdBdgOthRcpts]                    MONEY         CONSTRAINT [DF_tblStt_YtdBdgOthRcpts] DEFAULT ((0)) NOT NULL,
    [YtdValuationGainLoss]              MONEY         CONSTRAINT [DF_tblStt_YtdValuationGainLoss] DEFAULT ((0)) NOT NULL,
    [YtdTotalColl]                      MONEY         CONSTRAINT [DF_tblStt_YtdTotalColl] DEFAULT ((0)) NOT NULL,
    [YtdBdgTotalColl]                   MONEY         CONSTRAINT [DF_tblStt_YtdBdgTotalColl] DEFAULT ((0)) NOT NULL,
    [YtdMalpractice]                    MONEY         CONSTRAINT [DF_tblStt_YtdMalpractice] DEFAULT ((0)) NOT NULL,
    [YtdBdgMalpractice]                 MONEY         CONSTRAINT [DF_tblStt_YtdBdgMalpractice] DEFAULT ((0)) NOT NULL,
    [YtdInterest]                       MONEY         CONSTRAINT [DF_tblStt_YtdInterest] DEFAULT ((0)) NOT NULL,
    [YtdBdgInterest]                    MONEY         CONSTRAINT [DF_tblStt_YtdBdgInterest] DEFAULT ((0)) NOT NULL,
    [YtdSttBillFee]                     MONEY         CONSTRAINT [DF_tblStt_YtdSttBillFee] DEFAULT ((0)) NOT NULL,
    [YtdBdgBillFee]                     MONEY         CONSTRAINT [DF_tblStt_YtdBdgBillFee] DEFAULT ((0)) NOT NULL,
    [YtdBillSpec]                       MONEY         CONSTRAINT [DF_tblStt_YtdBillSpec] DEFAULT ((0)) NOT NULL,
    [YtdBdgBillSpec]                    MONEY         CONSTRAINT [DF_tblStt_YtdBdgBillSpec] DEFAULT ((0)) NOT NULL,
    [YtdSttOffTop]                      MONEY         CONSTRAINT [DF_tblStt_YtdSttOffTop] DEFAULT ((0)) NOT NULL,
    [YtdBdgOffTop]                      MONEY         CONSTRAINT [DF_tblStt_YtdBdgOffTop] DEFAULT ((0)) NOT NULL,
    [YtdSiteOverhead]                   MONEY         CONSTRAINT [DF_tblStt_YtdSiteOverhead] DEFAULT ((0)) NOT NULL,
    [YtdBdgSiteOverhead]                MONEY         CONSTRAINT [DF_tblStt_YtdBdgSiteOverhead] DEFAULT ((0)) NOT NULL,
    [YtdNOR]                            MONEY         CONSTRAINT [DF_tblStt_YtdNOR] DEFAULT ((0)) NOT NULL,
    [YtdBdgNOR]                         MONEY         CONSTRAINT [DF_tblStt_YtdBdgNOR] DEFAULT ((0)) NOT NULL,
    [YtdNetPctofNOR]                    FLOAT (53)    CONSTRAINT [DF_tblStt_YtdNetPctofNOR] DEFAULT ((0)) NOT NULL,
    [YtdBdgNetPctofNOR]                 FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgNetPctofNOR] DEFAULT ((0)) NOT NULL,
    [YtdSttDocPaidAmt]                  MONEY         CONSTRAINT [DF_tblStt_YtdSttDocPaidAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttDocPaidAmtAdj]               MONEY         CONSTRAINT [DF_tblStt_YtdSttDocPaidAmtAdj] DEFAULT ((0)) NOT NULL,
    [YtdBdgPITEarned]                   MONEY         CONSTRAINT [DF_tblStt_YtdBdgPITEarned] DEFAULT ((0)) NOT NULL,
    [YtdPITearned]                      MONEY         CONSTRAINT [DF_tblStt_YtdPITearned] DEFAULT ((0)) NOT NULL,
    [YtdBdgPITearned2]                  MONEY         CONSTRAINT [DF_tblStt_YtdBdgPITearned2] DEFAULT ((0)) NOT NULL,
    [YtdPITpct]                         FLOAT (53)    CONSTRAINT [DF_tblStt_YtdPITpct] DEFAULT ((0)) NOT NULL,
    [YtdBdgPITPct]                      FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgPITPct] DEFAULT ((0)) NOT NULL,
    [YtdSttPACost]                      MONEY         CONSTRAINT [DF_tblStt_YtdSttPACost] DEFAULT ((0)) NOT NULL,
    [YtdBdgPACost]                      MONEY         CONSTRAINT [DF_tblStt_YtdBdgPACost] DEFAULT ((0)) NOT NULL,
    [YtdSttPACostPct]                   FLOAT (53)    CONSTRAINT [DF_tblStt_YtdSttPACostPct] DEFAULT ((0)) NOT NULL,
    [YtdBdgPACostPct]                   FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgPACostPct] DEFAULT ((0)) NOT NULL,
    [YtdSttPTCost]                      MONEY         CONSTRAINT [DF_tblStt_YtdSttPTCost] DEFAULT ((0)) NOT NULL,
    [YtdBdgPTCost]                      MONEY         CONSTRAINT [DF_tblStt_YtdBdgPTCost] DEFAULT ((0)) NOT NULL,
    [YtdSttPTCostPct]                   FLOAT (53)    CONSTRAINT [DF_tblStt_YtdSttPTCostPct] DEFAULT ((0)) NOT NULL,
    [YtdBdgPTCostPct]                   FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgPTCostPct] DEFAULT ((0)) NOT NULL,
    [YtdSttLclExp]                      MONEY         CONSTRAINT [DF_tblStt_YtdSttLclExp] DEFAULT ((0)) NOT NULL,
    [YtdBdgLclExp]                      MONEY         CONSTRAINT [DF_tblStt_YtdBdgLclExp] DEFAULT ((0)) NOT NULL,
    [YtdSttLclExpPct]                   FLOAT (53)    CONSTRAINT [DF_tblStt_YtdSttLclExpPct] DEFAULT ((0)) NOT NULL,
    [YtdBdgLclExpPct]                   FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgLclExpPct] DEFAULT ((0)) NOT NULL,
    [YtdSttRDPaidAmt]                   MONEY         CONSTRAINT [DF_tblStt_YtdSttRDPaidAmt] DEFAULT ((0)) NOT NULL,
    [YtdBdgRDearned]                    MONEY         CONSTRAINT [DF_tblStt_YtdBdgRDearned] DEFAULT ((0)) NOT NULL,
    [YtdRDpct]                          FLOAT (53)    CONSTRAINT [DF_tblStt_YtdRDpct] DEFAULT ((0)) NOT NULL,
    [YtdBdgRDpct]                       FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgRDpct] DEFAULT ((0)) NOT NULL,
    [YtdSttMDPaidAmt]                   MONEY         CONSTRAINT [DF_tblStt_YtdSttMDPaidAmt] DEFAULT ((0)) NOT NULL,
    [YtdBdgMDearned]                    MONEY         CONSTRAINT [DF_tblStt_YtdBdgMDearned] DEFAULT ((0)) NOT NULL,
    [YtdMDpct]                          FLOAT (53)    CONSTRAINT [DF_tblStt_YtdMDpct] DEFAULT ((0)) NOT NULL,
    [YtdBdgMDpct]                       FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgMDpct] DEFAULT ((0)) NOT NULL,
    [YtdSttNonCurrAdjAmt]               MONEY         CONSTRAINT [DF_tblStt_YtdSttNonCurrAdjAmt] DEFAULT ((0)) NOT NULL,
    [YtdNonCurrAdjPct]                  FLOAT (53)    CONSTRAINT [DF_tblStt_YtdNonCurrAdjPct] DEFAULT ((0)) NOT NULL,
    [YtdSttSrpAdjAmt]                   MONEY         CONSTRAINT [DF_tblStt_YtdSttSrpAdjAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttSrpAdjAmtPct]                FLOAT (53)    CONSTRAINT [DF_tblStt_YtdSttSrpAdjAmtPct] DEFAULT ((0)) NOT NULL,
    [YtdContribCEP]                     MONEY         CONSTRAINT [DF_tblStt_YtdContribCEP] DEFAULT ((0)) NOT NULL,
    [YtdBdgContribCEP]                  MONEY         CONSTRAINT [DF_tblStt_YtdBdgContribCEP] DEFAULT ((0)) NOT NULL,
    [YtdStatContribPct]                 FLOAT (53)    CONSTRAINT [DF_tblStt_YtdStatContribPct] DEFAULT ((0)) NOT NULL,
    [YtdBdgContribPct]                  FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgContribPct] DEFAULT ((0)) NOT NULL,
    [YtdSiteNetInc]                     MONEY         CONSTRAINT [DF_tblStt_YtdSiteNetInc] DEFAULT ((0)) NOT NULL,
    [YtdBdgSiteNetInc]                  MONEY         CONSTRAINT [DF_tblStt_YtdBdgSiteNetInc] DEFAULT ((0)) NOT NULL,
    [YtdSttPatVisitQty]                 FLOAT (53)    CONSTRAINT [DF_tblStt_YtdSttPatVisitQty] DEFAULT ((0)) NOT NULL,
    [YTDSttPatVisitUCQty]               FLOAT (53)    CONSTRAINT [DF_tblStt_YTDSttPatVisitUCQty] DEFAULT ((0)) NOT NULL,
    [YtdBdgPatients]                    FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgPatients] DEFAULT ((0)) NOT NULL,
    [YtdSttAdmitQty]                    FLOAT (53)    CONSTRAINT [DF_tblStt_YtdSttAdmitQty] DEFAULT ((0)) NOT NULL,
    [YtdSttPhysTherVisitQty]            FLOAT (53)    CONSTRAINT [DF_tblStt_YtdSttPhysTherVisitQty] DEFAULT ((0)) NOT NULL,
    [YtdSttPtsKeyed]                    FLOAT (53)    CONSTRAINT [DF_tblStt_YtdSttPtsKeyed] DEFAULT ((0)) NOT NULL,
    [YtdSttDocPaidAmtHrly]              MONEY         CONSTRAINT [DF_tblStt_YtdSttDocPaidAmtHrly] DEFAULT ((0)) NOT NULL,
    [YtdDocEarnedHrly]                  MONEY         CONSTRAINT [DF_tblStt_YtdDocEarnedHrly] DEFAULT ((0)) NOT NULL,
    [YtdBdgDocEarnedHrly]               MONEY         CONSTRAINT [DF_tblStt_YtdBdgDocEarnedHrly] DEFAULT ((0)) NOT NULL,
    [YtdDocHours]                       FLOAT (53)    CONSTRAINT [DF_tblStt_YtdDocHours] DEFAULT ((0)) NOT NULL,
    [YtdBdgDocHours]                    FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgDocHours] DEFAULT ((0)) NOT NULL,
    [YtdPAHours]                        FLOAT (53)    CONSTRAINT [DF_tblStt_YtdPAHours] DEFAULT ((0)) NOT NULL,
    [YtdBdgPAHours]                     FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgPAHours] DEFAULT ((0)) NOT NULL,
    [YtdPAPaidHrly]                     MONEY         CONSTRAINT [DF_tblStt_YtdPAPaidHrly] DEFAULT ((0)) NOT NULL,
    [YtdBdgPAPaidHrly]                  MONEY         CONSTRAINT [DF_tblStt_YtdBdgPAPaidHrly] DEFAULT ((0)) NOT NULL,
    [YtdPtsPerHr]                       FLOAT (53)    CONSTRAINT [DF_tblStt_YtdPtsPerHr] DEFAULT ((0)) NOT NULL,
    [YtdBdgPtsPerHr]                    FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBdgPtsPerHr] DEFAULT ((0)) NOT NULL,
    [YtdBlendedPtsPerHr]                FLOAT (53)    CONSTRAINT [DF_tblStt_YtdBlendedPtsPerHr] DEFAULT ((0)) NOT NULL,
    [YtdbdgBlendedPtsPerHr]             FLOAT (53)    CONSTRAINT [DF_tblStt_YtdbdgBlendedPtsPerHr] DEFAULT ((0)) NOT NULL,
    [YtdNetRevPerPt]                    MONEY         CONSTRAINT [DF_tblStt_YtdNetRevPerPt] DEFAULT ((0)) NOT NULL,
    [YtdBdgNetRevPerPt]                 MONEY         CONSTRAINT [DF_tblStt_YtdBdgNetRevPerPt] DEFAULT ((0)) NOT NULL,
    [YtdAvgChgPt]                       MONEY         CONSTRAINT [DF_tblStt_YtdAvgChgPt] DEFAULT ((0)) NOT NULL,
    [YtdBdgAvgChgPt]                    MONEY         CONSTRAINT [DF_tblStt_YtdBdgAvgChgPt] DEFAULT ((0)) NOT NULL,
    [YtdCollPerPt]                      MONEY         CONSTRAINT [DF_tblStt_YtdCollPerPt] DEFAULT ((0)) NOT NULL,
    [YtdBdgCollPerPt]                   MONEY         CONSTRAINT [DF_tblStt_YtdBdgCollPerPt] DEFAULT ((0)) NOT NULL,
    [YtdTotalCollPerPt]                 MONEY         CONSTRAINT [DF_tblStt_YtdTotalCollPerPt] DEFAULT ((0)) NOT NULL,
    [YtdWIPGainLoss]                    MONEY         CONSTRAINT [DF_tblStt_YtdWIPGainLoss] DEFAULT ((0)) NOT NULL,
    [YtdSttDonationAmt]                 MONEY         CONSTRAINT [DF_tblStt_YtdSttDonationAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttAccExpenseAmt]               MONEY         CONSTRAINT [DF_tblStt_YtdSttAccExpenseAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttFixedLocalAmt]               MONEY         CONSTRAINT [DF_tblStt_YtdSttFixedLocalAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttLclVarAmt]                   MONEY         CONSTRAINT [DF_tblStt_YtdSttLclVarAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttSurplusPayout]               MONEY         CONSTRAINT [DF_tblStt_YtdSttSurplusPayout] DEFAULT ((0)) NOT NULL,
    [YtdSttNonCurrMDAmt]                MONEY         CONSTRAINT [DF_tblStt_YtdSttNonCurrMD] DEFAULT ((0)) NOT NULL,
    [YtdSttNonCurrRDAmt]                MONEY         CONSTRAINT [DF_tblStt_YtdSttNonCurrRDAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttMDIncentiveAmt]              MONEY         CONSTRAINT [DF_tblStt_YtdSttMDIncentiveAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttRDIncentiveAmt]              MONEY         CONSTRAINT [DF_tblStt_YtdSttRDIncentiveAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttPAAdjAmt]                    MONEY         CONSTRAINT [DF_tblStt_YtdSttPAAdjAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttCashARAmt]                   MONEY         CONSTRAINT [DF_tblStt_YtdSttCashARAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttRefArAmt]                    MONEY         CONSTRAINT [DF_tblStt_YtdSttRefArAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttMDEarnedAmt]                 MONEY         CONSTRAINT [DF_tblStt_YtdSttMDEarnedAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttRDEarnedAmt]                 MONEY         CONSTRAINT [DF_tblStt_YtdSttRDEarnedAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttCollFeeChgAmt]               MONEY         CONSTRAINT [DF_tblStt_YtdSttCollFeeChgAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttMPFlatFeeAmt]                MONEY         CONSTRAINT [DF_tblStt_YtdSttMPFlatFeeAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttCEPSurchargeAmt]             MONEY         CONSTRAINT [DF_tblStt_YtdSttCEPSurchargeAmt] DEFAULT ((0)) NOT NULL,
    [YtdBdgCEPRetentionAmt]             MONEY         CONSTRAINT [DF_tblStt_YtdBdgCEPRetentionAmt] DEFAULT ((0)) NOT NULL,
    [YtdBdgSiteOvrHdAmt]                MONEY         CONSTRAINT [DF_tblStt_YtdBdgSiteOvrHdAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttBillSpecMBSIAmt]             MONEY         CONSTRAINT [DF_tblStt_YtdSttBillSpecMBSIAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttPTAdjAmt]                    MONEY         CONSTRAINT [DF_tblStt_YtdSttPTAdjAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttPASupportCostAmt]            MONEY         CONSTRAINT [DF_tblStt_YtdSttPASupportCostAmt] DEFAULT ((0)) NOT NULL,
    [YtdBdgPASupportCostAmt]            MONEY         CONSTRAINT [DF_tblStt_YtdBdgPASupportCostAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttMDLclAmt]                    MONEY         CONSTRAINT [DF_tblStt_YtdSttMDLclAmt] DEFAULT ((0)) NOT NULL,
    [YtdSttRDLclAmt]                    MONEY         CONSTRAINT [DF_tblStt_YtdSttRDLclAmt] DEFAULT ((0)) NOT NULL,
    [YtdBdgDonations]                   MONEY         CONSTRAINT [DF_tblStt_YtdBdgDonations] DEFAULT ((0)) NOT NULL,
    [YtdSttPatVisitReturnQty]           FLOAT (53)    CONSTRAINT [DF_tblStt_YtdSttPatVisitReturnQty] DEFAULT ((0)) NOT NULL,
    [YTDSttBillSpecScribesAmt]          MONEY         CONSTRAINT [DF_tblStt_SttBillSpecScribesAmt1] DEFAULT ((0)) NOT NULL,
    [YTDSttBillSpecSitePersonnelAmt]    MONEY         CONSTRAINT [DF_tblStt_SttBillSpecSitePersonnelAmt1] DEFAULT ((0)) NOT NULL,
    [YTDSttBillSpecScribesAdjAmt]       MONEY         CONSTRAINT [DF_tblStt_SttBillSpecScribesAdjAmt1] DEFAULT ((0)) NOT NULL,
    [YTDSttBillSpecSitePersonnelAdjAmt] MONEY         CONSTRAINT [DF_tblStt_SttBillSpecSitePersonnelAdjAmt1] DEFAULT ((0)) NOT NULL,
    [YTDBdgEncounters]                  INT           CONSTRAINT [DF_tblStt_YTDBdgEncounters] DEFAULT ((0)) NOT NULL,
    [YTDSttPTOAccrual]                  MONEY         CONSTRAINT [DF_tblStt_SttPTOAccrual1] DEFAULT ((0)) NOT NULL,
    [YTDSttPTOTotalCost]                MONEY         CONSTRAINT [DF_tblStt_SttPTOTotalCost1] DEFAULT ((0)) NOT NULL,
    [YTDSttPTOTrueUpAdj]                MONEY         CONSTRAINT [DF_tblStt_SttPTOTrueUpAdj1] DEFAULT ((0)) NOT NULL,
    [SttPublishYN]                      BIT           CONSTRAINT [DF_tblStt_SttPublishYN] DEFAULT ((1)) NOT NULL,
    [SttEncounterQty]                   INT           CONSTRAINT [DF_tblStt_SttEncounterQty] DEFAULT ((0)) NOT NULL,
    [SttBilledUnitQty]                  INT           CONSTRAINT [DF_tblStt_SttBilledUnitQty] DEFAULT ((0)) NOT NULL,
    [SttNetRevPerEncounter]             MONEY         CONSTRAINT [DF_tblStt_SttNetRevPerEncounter] DEFAULT ((0)) NOT NULL,
    [SttNetRevPerBilledUnit]            MONEY         CONSTRAINT [DF_tblStt_SttNetRevPerBilledUnit] DEFAULT ((0)) NOT NULL,
    [SttAvgChgEncounter]                MONEY         CONSTRAINT [DF_tblStt_SttAvgChgEncounter] DEFAULT ((0)) NOT NULL,
    [SttAvgChgBilledUnit]               MONEY         CONSTRAINT [DF_tblStt_SttAvgChgBilledUnit] DEFAULT ((0)) NOT NULL,
    [SttCollPerEncounter]               MONEY         CONSTRAINT [DF_tblStt_SttCollPerEncounter] DEFAULT ((0)) NOT NULL,
    [SttCollPerBilledUnit]              MONEY         CONSTRAINT [DF_tblStt_SttCollPerBilledUnit] DEFAULT ((0)) NOT NULL,
    [SttTotalCollAmtPerEncounter]       MONEY         CONSTRAINT [DF_tblStt_SttTotalCollAmtPerEncounter] DEFAULT ((0)) NOT NULL,
    [SttTotalCollAmtperBilledUnit]      MONEY         CONSTRAINT [DF_tblStt_SttTotalCollAmtperBilledUnit] DEFAULT ((0)) NOT NULL,
    [YTDSttEncounterQty]                INT           CONSTRAINT [DF_tblStt_YTDSttEncounterQty] DEFAULT ((0)) NOT NULL,
    [YTDSttBilledUnitQty]               INT           CONSTRAINT [DF_tblStt_YTDSttBilledUnitQty] DEFAULT ((0)) NOT NULL,
    [YTDSttNetRevPerEncounter]          MONEY         CONSTRAINT [DF_tblStt_YTDSttNetRevPerEncounter] DEFAULT ((0)) NOT NULL,
    [YTDSttNetRevPerBilledUnit]         MONEY         CONSTRAINT [DF_tblStt_YTDSttNetRevPerBilledUnit] DEFAULT ((0)) NOT NULL,
    [YTDSttAvgChgEncounter]             MONEY         CONSTRAINT [DF_tblStt_YTDSttAvgChgEncounter] DEFAULT ((0)) NOT NULL,
    [YTDSttAvgChgBilledUnit]            MONEY         CONSTRAINT [DF_tblStt_YTDSttAvgChgBilledUnit] DEFAULT ((0)) NOT NULL,
    [YTDSttCollPerEncounter]            MONEY         CONSTRAINT [DF_tblStt_YTDSttCollPerEncounter] DEFAULT ((0)) NOT NULL,
    [YTDSttCollPerBilledUnit]           MONEY         CONSTRAINT [DF_tblStt_YTDSttCollPerBilledUnit] DEFAULT ((0)) NOT NULL,
    [YTDSttTotalCollAmtPerEncounter]    MONEY         CONSTRAINT [DF_tblStt_YTDSttTotalCollAmtPerEncounter] DEFAULT ((0)) NOT NULL,
    [YTDSttTotalCollAmtperBilledUnit]   MONEY         CONSTRAINT [DF_tblStt_YTDSttTotalCollAmtperBilledUnit] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_tblStt] PRIMARY KEY CLUSTERED ([SttDate] ASC, [Stt_CtrID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblStt_tblBdg] FOREIGN KEY ([Stt_BdgID]) REFERENCES [dbo].[tblBdg] ([BdgID]),
    CONSTRAINT [FK_tblStt_tblCtr] FOREIGN KEY ([Stt_CtrID]) REFERENCES [dbo].[tblCtr] ([CtrID]),
    CONSTRAINT [SttID] UNIQUE NONCLUSTERED ([SttID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [SttKey]
    ON [dbo].[tblStt]([SttKey] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [Stt_BdgID]
    ON [dbo].[tblStt]([Stt_BdgID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [Stt_CtrID]
    ON [dbo].[tblStt]([Stt_CtrID] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_AlternateBackThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DatasheetForeThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DatasheetGridlinesThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = N'(SttDate=#1/1/2016#)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_FilterOnLoad', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_HideNewField', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'[tblStt].[SttCEPSurchargePct], tblStt.SttDate DESC', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOnLoad', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ThemeFontIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TotalsRow', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 990, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_BdgID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_BdgID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_BdgID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 630, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_BdgID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_BdgID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_BdgID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_BdgYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_BdgYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_BdgYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 900, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_BdgYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_BdgYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'Stt_BdgYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 720, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 3960, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLink';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLink';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLink';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 360, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLink';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLink';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLink';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAccExpenseAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAccExpenseAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAccExpenseAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 765, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAccExpenseAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAccExpenseAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAccExpenseAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAdmitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAdmitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAdmitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 540, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAdmitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAdmitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAdmitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1035, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1275, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1245, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecMBSIAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecMBSIAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecMBSIAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1170, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecMBSIAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecMBSIAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecMBSIAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 6/15/2007 = Scribe  PTO Accrual', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 6/15/2007 = Admin  PTO Accrual', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBseHour';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBseHour';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBseHour';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1455, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBseHour';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBseHour';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBseHour';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1065, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartPostQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartPostQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartPostQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1095, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartPostQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartPostQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartPostQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartMissQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartMissQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartMissQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1260, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartMissQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartMissQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartMissQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartMiss30Qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartMiss30Qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartMiss30Qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1005, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartMiss30Qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartMiss30Qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttChartMiss30Qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1170, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCEPSurchargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCEPSurchargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCEPSurchargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1620, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCEPSurchargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCEPSurchargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCEPSurchargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollectibleARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollectibleARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollectibleARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollectibleARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollectibleARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollectibleARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollectWIP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollectWIP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollectWIP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollectWIP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollectWIP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollectWIP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCurrLoanBal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCurrLoanBal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCurrLoanBal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCurrLoanBal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCurrLoanBal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCurrLoanBal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDiffAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDiffAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDiffAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDiffAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDiffAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDiffAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDiffRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDiffRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDiffRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDiffRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDiffRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDiffRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocHourQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocHourQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocHourQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocHourQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocHourQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocHourQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1815, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDonationAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDonationAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDonationAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDonationAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDonationAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDonationAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttIntRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttIntRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttIntRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttIntRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttIntRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttIntRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPUCRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPUCRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPUCRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPUCRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPUCRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPUCRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPUCRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPUCRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMPUCRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNightPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNightPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNightPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNightPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNightPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNightPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrMDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrMDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrMDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrMDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrMDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrMDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrRDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrRDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrRDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrRDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrRDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrRDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNorAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNorAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNorAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNorAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNorAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNorAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttOtherRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttOtherRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttOtherRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttOtherRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttOtherRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttOtherRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAhoursQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAhoursQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAhoursQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAhoursQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAhoursQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAhoursQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPhysTherVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPhysTherVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPhysTherVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPhysTherVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPhysTherVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPhysTherVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrualRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrualRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrualRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrualRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrualRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 5/19/2009', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrualRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrualRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrualRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrualRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrualRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsKeyed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsKeyed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsKeyed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsKeyed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsKeyed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsKeyed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRefAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRefAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRefAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRefAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRefAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRefAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteOvrHdPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteOvrHdPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteOvrHdPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteOvrHdPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteOvrHdPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteOvrHdPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmtComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmtComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmtComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmtComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmtComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmtComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmtPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmtPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmtPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmtPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmtPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSrpAdjAmtPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttStatPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttStatPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttStatPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttStatPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttStatPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttStatPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttStipRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttStipRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttStipRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttStipRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttStipRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttStipRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusPayout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusPayout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusPayout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusPayout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusPayout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusPayout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReserveNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReserveNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReserveNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReserveNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReserveNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReserveNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReservePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReservePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReservePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReservePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReservePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReservePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReserveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReserveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReserveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReserveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReserveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusReserveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2265, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCommentOther';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCommentOther';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCommentOther';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCommentOther';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCommentOther';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCommentOther';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttUnspecifiedComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttUnspecifiedComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttUnspecifiedComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttUnspecifiedComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttUnspecifiedComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttUnspecifiedComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttValuationGainLossComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttValuationGainLossComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttValuationGainLossComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttValuationGainLossComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttValuationGainLossComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttValuationGainLossComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttWIPGainLossComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttWIPGainLossComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttWIPGainLossComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttWIPGainLossComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttWIPGainLossComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttWIPGainLossComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCommentInternal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCommentInternal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCommentInternal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCommentInternal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCommentInternal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCommentInternal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAdjCollWIPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAdjCollWIPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAdjCollWIPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAdjCollWIPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAdjCollWIPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAdjCollWIPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBlendedHrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBlendedHrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBlendedHrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBlendedHrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBlendedHrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBlendedHrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashExpAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashExpAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashExpAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashExpAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashExpAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashExpAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashRcptAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashRcptAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashRcptAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashRcptAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashRcptAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCashRcptAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCEPSurchargeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCEPSurchargeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCEPSurchargeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCEPSurchargeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCEPSurchargeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCEPSurchargeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollFeeChgAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollFeeChgAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollFeeChgAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollFeeChgAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollFeeChgAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollFeeChgAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerPtAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerPtAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerPtAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerPtAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerPtAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerPtAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCompRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttContribCEPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttContribCEPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttContribCEPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttContribCEPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttContribCEPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttContribCEPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDayRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDayRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDayRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDayRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDayRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDayRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocEarnedHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocEarnedHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocEarnedHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocEarnedHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocEarnedHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocEarnedHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPaidHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPITearnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPITearnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPITearnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPITearnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPITearnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttDocPITearnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttEndCollectAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttEndCollectAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttEndCollectAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttEndCollectAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttEndCollectAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttEndCollectAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttGrossCollAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttGrossCollAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttGrossCollAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttGrossCollAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttGrossCollAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttGrossCollAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttIntAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttIntAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttIntAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttIntAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttIntAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttIntAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMlpAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMlpAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMlpAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMlpAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMlpAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttMlpAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetChangeinARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetChangeinARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetChangeinARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetChangeinARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetChangeinARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetChangeinARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerPtAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerPtAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerPtAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerPtAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerPtAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerPtAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNightRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNightRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNightRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNightRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNightRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNightRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrAdjPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrAdjPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrAdjPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrAdjPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrAdjPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNonCurrAdjPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAPaidHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAPaidHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAPaidHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAPaidHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAPaidHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPAPaidHourAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorAdjCollWIPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorAdjCollWIPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorAdjCollWIPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorAdjCollWIPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorAdjCollWIPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorAdjCollWIPAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorCollectAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorCollectAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorCollectAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorCollectAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorCollectAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorCollectAR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorCollFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorCollFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorCollFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorCollFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorCollFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorCollFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorLoanBal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorLoanBal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorLoanBal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorLoanBal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorLoanBal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPriorLoanBal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 5/19/2009', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2130, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 5/19/2009', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttRDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteNetIncAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteNetIncAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteNetIncAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteNetIncAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteNetIncAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteNetIncAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteOverheadAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteOverheadAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteOverheadAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteOverheadAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteOverheadAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSiteOverheadAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusDeficitAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusDeficitAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusDeficitAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusDeficitAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusDeficitAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttSurplusDeficitAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttValuationGainLossAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttValuationGainLossAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttValuationGainLossAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttValuationGainLossAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttValuationGainLossAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttValuationGainLossAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttWIPGainLossAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttWIPGainLossAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttWIPGainLossAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttWIPGainLossAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttWIPGainLossAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttWIPGainLossAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdOtherRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdOtherRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdOtherRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdOtherRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdOtherRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdOtherRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgOthRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgOthRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgOthRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgOthRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgOthRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgOthRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdValuationGainLoss';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdValuationGainLoss';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdValuationGainLoss';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdValuationGainLoss';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdValuationGainLoss';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdValuationGainLoss';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmtAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmtAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmtAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmtAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmtAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmtAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPITearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPITearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPITearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPITearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPITearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPITearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITearned2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITearned2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITearned2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITearned2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITearned2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITearned2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPITPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgRDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgRDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgRDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgRDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgRDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgRDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNonCurrAdjPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNonCurrAdjPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNonCurrAdjPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNonCurrAdjPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNonCurrAdjPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNonCurrAdjPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSrpAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSrpAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSrpAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSrpAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSrpAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSrpAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSrpAdjAmtPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSrpAdjAmtPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSrpAdjAmtPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSrpAdjAmtPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSrpAdjAmtPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSrpAdjAmtPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdStatContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdStatContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdStatContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdStatContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdStatContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdStatContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPatVisitUCQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPatients';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPatients';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPatients';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPatients';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPatients';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPatients';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttAdmitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttAdmitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttAdmitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttAdmitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttAdmitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttAdmitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPhysTherVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPhysTherVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPhysTherVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPhysTherVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPhysTherVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPhysTherVisitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPtsKeyed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPtsKeyed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPtsKeyed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPtsKeyed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPtsKeyed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPtsKeyed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmtHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmtHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmtHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmtHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmtHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDocPaidAmtHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPAPaidHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPAPaidHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPAPaidHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPAPaidHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPAPaidHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPAPaidHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPAPaidHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPAPaidHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPAPaidHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPAPaidHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPAPaidHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPAPaidHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdbdgBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdbdgBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdbdgBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdbdgBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdbdgBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdbdgBlendedPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdTotalCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdTotalCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdTotalCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdTotalCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdTotalCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdTotalCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdWIPGainLoss';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdWIPGainLoss';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdWIPGainLoss';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdWIPGainLoss';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdWIPGainLoss';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdWIPGainLoss';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDonationAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDonationAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDonationAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDonationAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDonationAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttDonationAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttAccExpenseAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttAccExpenseAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttAccExpenseAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttAccExpenseAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttAccExpenseAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttAccExpenseAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSurplusPayout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSurplusPayout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSurplusPayout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSurplusPayout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSurplusPayout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttSurplusPayout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrMDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrMDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrMDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrMDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrMDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrMDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrRDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrRDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrRDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrRDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrRDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttNonCurrRDAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDIncentiveAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPAAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPAAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPAAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPAAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPAAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPAAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCashARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCashARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCashARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCashARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCashARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCashARAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRefArAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRefArAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRefArAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRefArAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRefArAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRefArAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDEarnedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCollFeeChgAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCollFeeChgAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCollFeeChgAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCollFeeChgAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCollFeeChgAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCollFeeChgAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCEPSurchargeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCEPSurchargeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCEPSurchargeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCEPSurchargeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCEPSurchargeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttCEPSurchargeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteOvrHdAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteOvrHdAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteOvrHdAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteOvrHdAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteOvrHdAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgSiteOvrHdAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttBillSpecMBSIAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttBillSpecMBSIAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttBillSpecMBSIAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttBillSpecMBSIAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttBillSpecMBSIAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttBillSpecMBSIAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPTAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 6/8/2004', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttMDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttRDLclAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdBdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YtdSttPatVisitReturnQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 6/15/2007 = Scribe  PTO Accrual', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecScribesAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 6/15/2007 = Admin  PTO Accrual', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBillSpecSitePersonnelAdjAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDBdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDBdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDBdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDBdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDBdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 5/7/2009', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDBdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDBdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDBdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDBdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDBdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 5/19/2009', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOAccrual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 5/19/2009', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTotalCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New 5/21/2009', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttPTOTrueUpAdj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPublishYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPublishYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPublishYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPublishYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPublishYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttPublishYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttEncounterQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttEncounterQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttEncounterQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttEncounterQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttEncounterQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttEncounterQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBilledUnitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBilledUnitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBilledUnitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBilledUnitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBilledUnitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttBilledUnitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttNetRevPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttAvgChgBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttCollPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmtPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmtPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmtPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmtPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmtPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmtPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmtperBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmtperBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmtperBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmtperBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmtperBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'SttTotalCollAmtperBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttEncounterQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttEncounterQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttEncounterQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttEncounterQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttEncounterQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttEncounterQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBilledUnitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBilledUnitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBilledUnitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBilledUnitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBilledUnitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttBilledUnitQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttNetRevPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttNetRevPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttNetRevPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttNetRevPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttNetRevPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttNetRevPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttNetRevPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttNetRevPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttNetRevPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttNetRevPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttNetRevPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttNetRevPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttAvgChgEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttAvgChgEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttAvgChgEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttAvgChgEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttAvgChgEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttAvgChgEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttAvgChgBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttAvgChgBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttAvgChgBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttAvgChgBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttAvgChgBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttAvgChgBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttCollPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttCollPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttCollPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttCollPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttCollPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttCollPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttCollPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttCollPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttCollPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttCollPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttCollPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttCollPerBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttTotalCollAmtPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttTotalCollAmtPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttTotalCollAmtPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttTotalCollAmtPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttTotalCollAmtPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttTotalCollAmtPerEncounter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttTotalCollAmtperBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttTotalCollAmtperBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttTotalCollAmtperBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttTotalCollAmtperBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttTotalCollAmtperBilledUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblStt', @level2type = N'COLUMN', @level2name = N'YTDSttTotalCollAmtperBilledUnit';

