﻿CREATE TABLE [dbo].[tblfrmSttLst] (
    [SiteName]                    NVARCHAR (100) NULL,
    [SttDate]                     DATETIME       NULL,
    [Stt_CtrID]                   INT            NULL,
    [Stt_BdgYear]                 INT            NULL,
    [SttID]                       INT            IDENTITY (1, 1) NOT NULL,
    [SttKey]                      NVARCHAR (100) NULL,
    [SttLink]                     INT            NULL,
    [SttAdmitQty]                 INT            NULL,
    [SttBillFee]                  MONEY          NULL,
    [SttBillRate]                 FLOAT (53)     NULL,
    [SttBillSpec]                 MONEY          NULL,
    [SttBseHour]                  FLOAT (53)     NULL,
    [SttChartQty]                 INT            NULL,
    [SttChartPostQty]             INT            NULL,
    [SttChartMissQty]             INT            NULL,
    [SttChartMiss30Qty]           INT            NULL,
    [SttCashARAmt]                MONEY          NULL,
    [SttCollectibleARAmt]         MONEY          NULL,
    [SttCollectWIP]               MONEY          NULL,
    [SttContribPct]               FLOAT (53)     NULL,
    [SttCurrLoanBal]              MONEY          NULL,
    [SttDiffAmt]                  FLOAT (53)     NULL,
    [SttDiffRate]                 FLOAT (53)     NULL,
    [SttDocHourQty]               FLOAT (53)     NULL,
    [SttDocPaidAdjAmt]            MONEY          NULL,
    [SttDocPaidAmt]               MONEY          NULL,
    [SttIntRate]                  FLOAT (53)     NULL,
    [SttLclExp]                   MONEY          NULL,
    [SttMDPaidAmt]                MONEY          NULL,
    [SttMDpct]                    FLOAT (53)     NULL,
    [SttMPRate]                   FLOAT (53)     NULL,
    [SttNightPct]                 FLOAT (53)     NULL,
    [SttNonCurrAdjAmt]            MONEY          NULL,
    [SttNorAmt]                   MONEY          NULL,
    [SttOffTop]                   MONEY          NULL,
    [SttOtherRcpts]               MONEY          NULL,
    [SttPACost]                   MONEY          NULL,
    [SttPAhoursQty]               FLOAT (53)     NULL,
    [SttPatVisitQty]              FLOAT (53)     NULL,
    [SttPhysTherVisitQty]         FLOAT (53)     NULL,
    [SttPstChgs]                  MONEY          NULL,
    [SttPTCost]                   MONEY          NULL,
    [SttPtsKeyed]                 FLOAT (53)     NULL,
    [SttRDPaidAmt]                MONEY          NULL,
    [SttRDpct]                    FLOAT (53)     NULL,
    [SttRefAR]                    MONEY          NULL,
    [SttSiteOvrHdPct]             FLOAT (53)     NULL,
    [SttSrpAdjAmt]                MONEY          NULL,
    [SttSrpAdjAmtComment]         NTEXT          NULL,
    [SttSrpAdjAmtPct]             FLOAT (53)     NULL,
    [SttStatPITpct]               FLOAT (53)     NULL,
    [SttStipRcvd]                 MONEY          NULL,
    [SttTargetRate]               FLOAT (53)     NULL,
    [SttUnspecifiedComment]       NTEXT          NULL,
    [SttValuationGainLossComment] NTEXT          NULL,
    [SttWIPGainLossComment]       NTEXT          NULL,
    [SttDateCreate]               DATETIME       NULL,
    [SttDateEdit]                 DATETIME       NULL,
    [SttInactiveYN]               BIT            NULL,
    [SttFlagYN]                   BIT            NULL,
    [zzzzzzzzzzzzzzzzzzzzzzz]     NVARCHAR (50)  NULL,
    [SttAdjCollWIPAmt]            MONEY          NULL,
    [SttAvgChgPt]                 MONEY          NULL,
    [SttBlendedHrs]               FLOAT (53)     NULL,
    [SttBlendedPtsPerHr]          REAL           NULL,
    [SttCashExpAmt]               MONEY          NULL,
    [SttCashRcptAmt]              MONEY          NULL,
    [SttCollFeeAmt]               MONEY          NULL,
    [SttCollPerPtAmt]             MONEY          NULL,
    [SttCompPITpct]               FLOAT (53)     NULL,
    [SttCompMDpct]                FLOAT (53)     NULL,
    [SttCompRDpct]                FLOAT (53)     NULL,
    [SttContribCEPAmt]            MONEY          NULL,
    [SttDayRate]                  MONEY          NULL,
    [SttDocEarnedHourAmt]         MONEY          NULL,
    [SttDocPaidHourAmt]           MONEY          NULL,
    [SttDocPITearnedAmt]          MONEY          NULL,
    [SttEndCollectAR]             MONEY          NULL,
    [SttGrossCollAmt]             MONEY          NULL,
    [SttIntAmt]                   MONEY          NULL,
    [SttLclExpPct]                FLOAT (53)     NULL,
    [SttMlpAmt]                   MONEY          NULL,
    [SttNetAmt]                   MONEY          NULL,
    [SttNetChangeinARAmt]         MONEY          NULL,
    [SttNetPctofNOR]              FLOAT (53)     NULL,
    [SttNetRevPerPtAmt]           MONEY          NULL,
    [SttNightRate]                MONEY          NULL,
    [SttNonCurrAdjPct]            FLOAT (53)     NULL,
    [SttPACostPct]                FLOAT (53)     NULL,
    [SttPAPaidHourAmt]            MONEY          NULL,
    [SttPriorAdjCollWIPAmt]       MONEY          NULL,
    [SttPriorCollectAR]           MONEY          NULL,
    [SttPriorLoanBal]             MONEY          NULL,
    [SttPTCostPct]                FLOAT (53)     NULL,
    [SttPtsPerHr]                 FLOAT (53)     NULL,
    [SttSiteNetIncAmt]            MONEY          NULL,
    [SttSiteOverheadAmt]          MONEY          NULL,
    [SttSurplusDeficitAmt]        MONEY          NULL,
    [SttTotalCollAmt]             MONEY          NULL,
    [SttTotalCollPerPt]           MONEY          NULL,
    [SttValuationGainLossAmt]     MONEY          NULL,
    [SttWIPGainLossAmt]           MONEY          NULL,
    [zSttNorAmt]                  MONEY          NULL,
    [CtrSiteOvrHdpct]             REAL           NULL,
    [CtrSite_CmpID]               INT            NULL,
    [CtrSys_CmpID]                INT            NULL,
    [Expr1005]                    INT            NULL,
    [CtrCamAssigned_CntID]        INT            NULL,
    [CtrMedDir_CntID]             INT            NULL,
    [Ctr_RgnID]                   INT            NULL,
    [Ctr_CtrTypID]                NVARCHAR (50)  NULL,
    [CtrPlatinumID]               INT            NULL,
    [CtrDateEffect]               DATETIME       NULL
);

