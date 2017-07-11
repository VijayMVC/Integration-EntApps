CREATE TABLE [dbo].[tblCtr] (
    [CtrID]                        INT           IDENTITY (1, 1) NOT NULL,
    [CtrSite_CmpID]                INT           NULL,
    [CtrSys_CmpID]                 INT           NULL,
    [CtrTranscript_CmpID]          INT           NULL,
    [CtrBillAgt_CmpID]             INT           NULL,
    [CtrPhyGrp_CmpID]              INT           NULL,
    [CtrMlp_CmpID]                 INT           NULL,
    [CtrBillCmpIDNum]              VARCHAR (20)  NULL,
    [CtrMedDir_CntID]              INT           NULL,
    [CtrCamAssigned_CntID]         INT           NULL,
    [Ctr_CtrTypID]                 VARCHAR (10)  NULL,
    [Ctr_RgnID]                    INT           NULL,
    [Ctr_MlpRgnID]                 VARCHAR (30)  NULL,
    [CtrKey]                       VARCHAR (100) NULL,
    [CtrHPID]                      VARCHAR (4)   NULL,
    [CtrPlatinumID]                INT           NULL,
    [CtrDateStart]                 DATETIME      NULL,
    [CtrDateEffect]                DATETIME      NULL,
    [CtrDateRenew]                 DATETIME      NULL,
    [CtrDateEnd]                   DATETIME      NULL,
    [CtrYrQty]                     INT           CONSTRAINT [DF_tblCtr_CtrYrQty] DEFAULT (0) NULL,
    [CtrSysCtrYN]                  BIT           CONSTRAINT [DF_tblCtr_CtrSysCtrYN] DEFAULT (0) NULL,
    [CtrAutoRenewYN]               BIT           CONSTRAINT [DF_tblCtr_CtrAutoRenewYN] DEFAULT (0) NULL,
    [CtrEndNoCseYN]                BIT           CONSTRAINT [DF_tblCtr_CtrEndNoCseYN] DEFAULT (0) NULL,
    [CtrNoCseDayQty]               INT           CONSTRAINT [DF_tblCtr_CtrNoCseDayQty] DEFAULT (0) NULL,
    [CtrEndCseYN]                  BIT           CONSTRAINT [DF_tblCtr_CtrEndCseYN] DEFAULT (0) NULL,
    [CtrCseDayQty]                 INT           NULL,
    [CtrRemDayQty]                 INT           CONSTRAINT [DF_tblCtr_CtrRemDayQty] DEFAULT (0) NULL,
    [CtrPriorAdjCollWIPAmtDefault] MONEY         CONSTRAINT [DF_tblCtr_CtrPriorAdjCollWIPAmtDefault] DEFAULT (0) NOT NULL,
    [CtrPriorCollectARDefault]     MONEY         CONSTRAINT [DF_tblCtr_CtrPriorCollectARDefault] DEFAULT (0) NOT NULL,
    [CtrPriorCollFeeAmtDefault]    MONEY         CONSTRAINT [DF_tblCtr_CtrPriorCollFeeAmt] DEFAULT (0) NOT NULL,
    [CtrPriorLoanBalDefault]       MONEY         CONSTRAINT [DF_tblCtr_CtrPriorLoanBalDefault] DEFAULT (0) NOT NULL,
    [CtrStipAmt]                   MONEY         CONSTRAINT [DF_tblCtr_CtrStipAmt] DEFAULT (0) NOT NULL,
    [CtrStipDesc]                  VARCHAR (50)  NULL,
    [CtrOtherPayAmt]               MONEY         CONSTRAINT [DF_tblCtr_CtrOtherPayAmt] DEFAULT (0) NOT NULL,
    [CtrOtherPayDesc]              VARCHAR (50)  NULL,
    [CtrEmpPhysPaid]               INT           NULL,
    [CtrWrkCompPaidYN]             BIT           CONSTRAINT [DF_tblCtr_CtrWrkCompPaidYN] DEFAULT (0) NULL,
    [CtrCompeteClauseYN]           BIT           CONSTRAINT [DF_tblCtr_CtrCompeteClauseYN] DEFAULT (0) NULL,
    [CtrBillRecDayQty]             INT           CONSTRAINT [DF_tblCtr_CtrBillRecDayQty] DEFAULT (0) NULL,
    [CtrBillAgtDateStart]          DATETIME      NULL,
    [CtrMlpDateEffect]             DATETIME      NULL,
    [CtrTrmCtrYN]                  BIT           CONSTRAINT [DF_tblCtr_CtrTrmCtrYN] DEFAULT (0) NULL,
    [CtrPrmBseYN]                  BIT           CONSTRAINT [DF_tblCtr_CtrPrmBseYN] DEFAULT (0) NULL,
    [CtrRsdAff]                    VARCHAR (50)  NULL,
    [CtrElecLogYN]                 BIT           CONSTRAINT [DF_tblCtr_CtrElecLogYN] DEFAULT (0) NULL,
    [CtrNrsInitProtoYN]            BIT           CONSTRAINT [DF_tblCtr_CtrNrsInitProtoYN] DEFAULT (0) NULL,
    [CtrTriageProtoYN]             BIT           CONSTRAINT [DF_tblCtr_CtrTriageProtoYN] DEFAULT (0) NULL,
    [CtrClnPthwyYN]                BIT           CONSTRAINT [DF_tblCtr_CtrClnPthwyYN] DEFAULT (0) NULL,
    [CtrPrcGdeYN]                  BIT           CONSTRAINT [DF_tblCtr_CtrPrcGdeYN] DEFAULT (0) NULL,
    [CtrComputeAfcYN]              BIT           CONSTRAINT [DF_tblCtr_CtrComputeAfcYN] DEFAULT (0) NULL,
    [CtrElecMedRcdYN]              BIT           CONSTRAINT [DF_tblCtr_CtrElecMedRcdYN] DEFAULT (0) NULL,
    [CtrObsvUnitYN]                BIT           CONSTRAINT [DF_tblCtr_CtrObsvUnitYN] DEFAULT (0) NULL,
    [CtrChstPnYN]                  BIT           CONSTRAINT [DF_tblCtr_CtrChstPnYN] DEFAULT (0) NULL,
    [CtrFastTrkYn]                 BIT           CONSTRAINT [DF_tblCtr_CtrFastTrkYn] DEFAULT (0) NULL,
    [CtrOccMedYN]                  BIT           CONSTRAINT [DF_tblCtr_CtrOccMedYN] DEFAULT (0) NULL,
    [CtrHspYN]                     BIT           CONSTRAINT [DF_tblCtr_CtrHspYN] DEFAULT (0) NULL,
    [CtrSameStoreYN]               BIT           CONSTRAINT [DF_tblCtr_CtrMedTracYN] DEFAULT (0) NULL,
    [CtrGoodMethodYN]              BIT           CONSTRAINT [DF_tblCtr_CtrGoodMethodYN] DEFAULT (0) NULL,
    [CtrChestPainYN]               BIT           CONSTRAINT [DF_tblCtr_CtrChestPainYN] DEFAULT (0) NULL,
    [CtrElectronicTrackYN]         BIT           CONSTRAINT [DF_tblCtr_CtrElectronicTrackYN] DEFAULT (0) NULL,
    [CtrPainMgmt]                  VARCHAR (50)  NULL,
    [CtrAllowNursesYN]             BIT           CONSTRAINT [DF_tblCtr_CtrAllowNursesYN] DEFAULT (0) NULL,
    [CtrPhySpecificDataYN]         BIT           CONSTRAINT [DF_tblCtr_CtrPhySpecificDataYN] DEFAULT (0) NULL,
    [CtrComplaintMgtPrgYN]         BIT           CONSTRAINT [DF_tblCtr_CtrComplaintMgtPrgYN] DEFAULT (0) NULL,
    [CtrSatisfactionTool]          VARCHAR (50)  NULL,
    [CtrSatisfactionTeamYN]        BIT           CONSTRAINT [DF_tblCtr_CtrSatisfactionTeamYN] DEFAULT (0) NULL,
    [CtrEDVolume]                  INT           CONSTRAINT [DF_tblCtr_CtrEDVolume] DEFAULT (0) NOT NULL,
    [CtrAdmissionPct]              FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrAdmissionPct] DEFAULT (0) NOT NULL,
    [CtrTransferPct]               FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrTransferPct] DEFAULT (0) NOT NULL,
    [CtrStatPITpct]                FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrStatPITpct] DEFAULT (0) NOT NULL,
    [CtrStatRDpct]                 FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrStatRDpct] DEFAULT (0) NOT NULL,
    [CtrStatMDpct]                 FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrStatMDpct] DEFAULT (0) NOT NULL,
    [CtrStatContribpct]            FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrStatContribpct] DEFAULT (0) NOT NULL,
    [CtrBseHour]                   FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrBseHour] DEFAULT (0) NOT NULL,
    [CtrBillRate]                  FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrBillRate] DEFAULT (0) NOT NULL,
    [CtrIncExpComment]             TEXT          NULL,
    [CtrSiteOvrHdpct]              FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrSiteOvrHdpct] DEFAULT (0) NOT NULL,
    [CtrIntRate]                   FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrIntRate] DEFAULT (0) NOT NULL,
    [CtrMlpFlatFee]                MONEY         CONSTRAINT [DF_tblCtr_CtrMlpFlatFee] DEFAULT (0) NOT NULL,
    [CtrMplSecondRate]             FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrMplSecondRate] DEFAULT (0) NOT NULL,
    [CtrLclPct]                    FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrLclPct] DEFAULT (0) NOT NULL,
    [CtrLclFixedAmt]               MONEY         CONSTRAINT [DF_tblCtr_CtrLclVarAmt] DEFAULT (0) NOT NULL,
    [CtrMDIncentivePct]            FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrMDIncentivePct] DEFAULT (0) NOT NULL,
    [CtrRDIncentivePct]            FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrRDIncentivePct] DEFAULT (0) NOT NULL,
    [CtrSurplusReservePct]         FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrSurplusReservePct] DEFAULT (0) NOT NULL,
    [zCtrMPRate]                   FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrMPRate] DEFAULT (0) NULL,
    [CtrDateFeeInc]                DATETIME      NULL,
    [CtrPctInc]                    FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrPctInc] DEFAULT (0) NOT NULL,
    [CtrNightPct]                  FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrNightPct] DEFAULT (0) NOT NULL,
    [CtrDiffRate]                  FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrDiffRate] DEFAULT (0) NOT NULL,
    [CtrDiffAmt]                   MONEY         CONSTRAINT [DF_tblCtr_CtrDiffAmt] DEFAULT (0) NOT NULL,
    [CtrDayRate]                   MONEY         CONSTRAINT [DF_tblCtr_CtrDayRate] DEFAULT (0) NOT NULL,
    [CtrNightRate]                 MONEY         CONSTRAINT [DF_tblCtr_CtrNightRate] DEFAULT (0) NOT NULL,
    [CtrBedQty]                    INT           CONSTRAINT [DF_tblCtr_CtrBedQty] DEFAULT (0) NOT NULL,
    [CtrFastTrackBedQty]           INT           NULL,
    [CtrOtherBedQty]               INT           NULL,
    [CtrCriticalCareBedQty]        INT           NULL,
    [CtrObservationBedQty]         INT           NULL,
    [CtrEmail]                     VARCHAR (50)  NULL,
    [CtrDateCreate]                DATETIME      NULL,
    [CtrDateEdit]                  DATETIME      NULL,
    [CtrInactiveYn]                BIT           CONSTRAINT [DF_tblCtr_CtrInactiveYn] DEFAULT (0) NULL,
    [CtrTraumaDesignation]         VARCHAR (50)  NULL,
    [CtrFlagYn]                    BIT           CONSTRAINT [DF_tblCtr_CtrFlagYn] DEFAULT (0) NULL,
    [CtrComment]                   TEXT          NULL,
    [CtrRequireMailYN]             BIT           CONSTRAINT [DF_tblCtr_CtrRequireMailYN] DEFAULT (0) NULL,
    [CtrCEPSurchargePct]           FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrCEPSurchargePct] DEFAULT (0) NOT NULL,
    [CtrMngCarBatchYN]             BIT           CONSTRAINT [DF_tblCtr_CtrMngCarBatchYN] DEFAULT (0) NOT NULL,
    [CtrMisc1YN]                   BIT           NULL,
    [CtrMisc2YN]                   BIT           NULL,
    [CtrMisc3YN]                   BIT           NULL,
    [CtrMisc4YN]                   BIT           NULL,
    [CtrMisc5YN]                   BIT           NULL,
    [CtrPASupportCostPct]          FLOAT (53)    CONSTRAINT [DF_tblCtr_CtrPASupportCostPct] DEFAULT (0) NOT NULL,
    [CtrTIN]                       NVARCHAR (15) NULL,
    [CtrDivision]                  VARCHAR (15)  NULL,
    CONSTRAINT [PK_tblCtr] PRIMARY KEY NONCLUSTERED ([CtrID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblCtr_tblCmp] FOREIGN KEY ([CtrSite_CmpID]) REFERENCES [dbo].[tblCmp] ([CmpID]),
    CONSTRAINT [FK_tblCtr_tblCmp1] FOREIGN KEY ([CtrSys_CmpID]) REFERENCES [dbo].[tblCmp] ([CmpID]),
    CONSTRAINT [FK_tblCtr_tblCmp2] FOREIGN KEY ([CtrTranscript_CmpID]) REFERENCES [dbo].[tblCmp] ([CmpID]),
    CONSTRAINT [FK_tblCtr_tblCmp3] FOREIGN KEY ([CtrBillAgt_CmpID]) REFERENCES [dbo].[tblCmp] ([CmpID]),
    CONSTRAINT [FK_tblCtr_tblCmp4] FOREIGN KEY ([CtrPhyGrp_CmpID]) REFERENCES [dbo].[tblCmp] ([CmpID]),
    CONSTRAINT [FK_tblCtr_tblCmp5] FOREIGN KEY ([CtrMlp_CmpID]) REFERENCES [dbo].[tblCmp] ([CmpID]),
    CONSTRAINT [FK_tblCtr_tblCnt] FOREIGN KEY ([CtrMedDir_CntID]) REFERENCES [dbo].[tblCnt] ([CntID]),
    CONSTRAINT [FK_tblCtr_tblCnt1] FOREIGN KEY ([CtrCamAssigned_CntID]) REFERENCES [dbo].[tblCnt] ([CntID]),
    CONSTRAINT [FK_tblCtr_tblRgn] FOREIGN KEY ([Ctr_RgnID]) REFERENCES [dbo].[tblRgn] ([RgnID]),
    CONSTRAINT [FK_tblCtr_tlkpMlpRgn] FOREIGN KEY ([Ctr_MlpRgnID]) REFERENCES [dbo].[tlkpMlpRgn] ([MlpRgnID]) NOT FOR REPLICATION,
    CONSTRAINT [CtrKey] UNIQUE NONCLUSTERED ([CtrKey] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE CLUSTERED INDEX [CtrSite_CmpID]
    ON [dbo].[tblCtr]([CtrSite_CmpID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CtrSys_CmpID]
    ON [dbo].[tblCtr]([CtrSys_CmpID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CtrTranscript_CmpID]
    ON [dbo].[tblCtr]([CtrTranscript_CmpID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CtrBillAgt_CmpID]
    ON [dbo].[tblCtr]([CtrBillAgt_CmpID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CtrPhyGrp_CmpID]
    ON [dbo].[tblCtr]([CtrPhyGrp_CmpID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CtrMlp_CmpID]
    ON [dbo].[tblCtr]([CtrMlp_CmpID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CtrMedDir_CntID]
    ON [dbo].[tblCtr]([CtrMedDir_CntID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CtrCamAssigned_CntID]
    ON [dbo].[tblCtr]([CtrCamAssigned_CntID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [Ctr_CtrTypID]
    ON [dbo].[tblCtr]([Ctr_CtrTypID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [Ctr_RgnID]
    ON [dbo].[tblCtr]([Ctr_RgnID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [Ctr_MlpRgnID]
    ON [dbo].[tblCtr]([Ctr_MlpRgnID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CtrPlatinumID]
    ON [dbo].[tblCtr]([CtrPlatinumID] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_AlternateBackThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DatasheetForeThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DatasheetGridlinesThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = N'(Ctr_CtrTypID="PSYCH")', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_FilterOnLoad', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_HideNewField', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'[tblCtr].[CtrID] DESC, [tblCtr].[CtrSite_CmpID], [tblCtr].[CtrInactiveYn], [tblCtr].[Ctr_CtrTypID], [tblCtr].[CtrKey], [tblCtr].[CtrTIN], tblCtr.CtrDivision', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOnLoad', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ThemeFontIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TotalsRow', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSite_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSite_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSite_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSite_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSite_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSite_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSys_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSys_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSys_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSys_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSys_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSys_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTranscript_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTranscript_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTranscript_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTranscript_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTranscript_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTranscript_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillAgt_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillAgt_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillAgt_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillAgt_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillAgt_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillAgt_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPhyGrp_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPhyGrp_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPhyGrp_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPhyGrp_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPhyGrp_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPhyGrp_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlp_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlp_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlp_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlp_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlp_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlp_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillCmpIDNum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillCmpIDNum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillCmpIDNum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillCmpIDNum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillCmpIDNum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillCmpIDNum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMedDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMedDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMedDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMedDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMedDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMedDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCamAssigned_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCamAssigned_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCamAssigned_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCamAssigned_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCamAssigned_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCamAssigned_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_CtrTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_CtrTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_CtrTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_CtrTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_CtrTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_CtrTypID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_RgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_RgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_RgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_RgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_RgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_RgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_MlpRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_MlpRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_MlpRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_MlpRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_MlpRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'Ctr_MlpRgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 5910, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHPID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHPID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHPID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHPID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHPID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHPID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHPID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHPID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHPID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPlatinumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPlatinumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPlatinumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPlatinumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPlatinumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPlatinumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEffect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEffect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEffect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEffect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEffect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEffect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateRenew';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateRenew';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateRenew';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateRenew';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateRenew';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateRenew';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrYrQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrYrQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrYrQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrYrQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrYrQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrYrQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSysCtrYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSysCtrYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSysCtrYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSysCtrYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSysCtrYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSysCtrYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAutoRenewYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAutoRenewYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAutoRenewYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAutoRenewYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAutoRenewYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAutoRenewYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEndNoCseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEndNoCseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEndNoCseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEndNoCseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEndNoCseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEndNoCseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNoCseDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNoCseDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNoCseDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNoCseDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNoCseDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNoCseDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEndCseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEndCseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEndCseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEndCseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEndCseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEndCseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCseDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCseDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCseDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCseDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCseDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCseDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRemDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRemDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRemDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRemDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRemDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRemDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorAdjCollWIPAmtDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorAdjCollWIPAmtDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorAdjCollWIPAmtDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorAdjCollWIPAmtDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorAdjCollWIPAmtDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorAdjCollWIPAmtDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorCollectARDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorCollectARDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorCollectARDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorCollectARDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorCollectARDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorCollectARDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorCollFeeAmtDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorCollFeeAmtDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorCollFeeAmtDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorCollFeeAmtDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorCollFeeAmtDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorCollFeeAmtDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorLoanBalDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorLoanBalDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorLoanBalDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorLoanBalDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorLoanBalDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPriorLoanBalDefault';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStipAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStipAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStipAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStipAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStipAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStipAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStipDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStipDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStipDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStipDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStipDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStipDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherPayAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherPayAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherPayAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherPayAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherPayAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherPayAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherPayDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherPayDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherPayDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherPayDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherPayDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherPayDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEmpPhysPaid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEmpPhysPaid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEmpPhysPaid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEmpPhysPaid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEmpPhysPaid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEmpPhysPaid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrWrkCompPaidYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrWrkCompPaidYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrWrkCompPaidYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrWrkCompPaidYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrWrkCompPaidYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrWrkCompPaidYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCompeteClauseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCompeteClauseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCompeteClauseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCompeteClauseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCompeteClauseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCompeteClauseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRecDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRecDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRecDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRecDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRecDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRecDayQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillAgtDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillAgtDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillAgtDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillAgtDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillAgtDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillAgtDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlpDateEffect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlpDateEffect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlpDateEffect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlpDateEffect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlpDateEffect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlpDateEffect';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTrmCtrYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTrmCtrYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTrmCtrYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTrmCtrYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTrmCtrYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTrmCtrYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPrmBseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPrmBseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPrmBseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPrmBseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPrmBseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPrmBseYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRsdAff';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRsdAff';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRsdAff';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRsdAff';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRsdAff';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRsdAff';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElecLogYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElecLogYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElecLogYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElecLogYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElecLogYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElecLogYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNrsInitProtoYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNrsInitProtoYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNrsInitProtoYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNrsInitProtoYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNrsInitProtoYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNrsInitProtoYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTriageProtoYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTriageProtoYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTriageProtoYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTriageProtoYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTriageProtoYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTriageProtoYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrClnPthwyYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrClnPthwyYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrClnPthwyYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrClnPthwyYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrClnPthwyYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrClnPthwyYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPrcGdeYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPrcGdeYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPrcGdeYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPrcGdeYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPrcGdeYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPrcGdeYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComputeAfcYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComputeAfcYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComputeAfcYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComputeAfcYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComputeAfcYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComputeAfcYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElecMedRcdYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElecMedRcdYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElecMedRcdYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElecMedRcdYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElecMedRcdYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElecMedRcdYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrObsvUnitYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrObsvUnitYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrObsvUnitYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrObsvUnitYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrObsvUnitYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrObsvUnitYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrChstPnYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrChstPnYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrChstPnYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrChstPnYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrChstPnYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrChstPnYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFastTrkYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFastTrkYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFastTrkYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFastTrkYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFastTrkYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFastTrkYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOccMedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOccMedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOccMedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOccMedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOccMedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOccMedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHspYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHspYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHspYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHspYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHspYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrHspYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSameStoreYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSameStoreYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSameStoreYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSameStoreYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSameStoreYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSameStoreYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrGoodMethodYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrGoodMethodYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrGoodMethodYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrGoodMethodYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrGoodMethodYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrGoodMethodYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrChestPainYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrChestPainYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrChestPainYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrChestPainYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrChestPainYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrChestPainYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElectronicTrackYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElectronicTrackYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElectronicTrackYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElectronicTrackYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElectronicTrackYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrElectronicTrackYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPainMgmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPainMgmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPainMgmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPainMgmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPainMgmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPainMgmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAllowNursesYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAllowNursesYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAllowNursesYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAllowNursesYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAllowNursesYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAllowNursesYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPhySpecificDataYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPhySpecificDataYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPhySpecificDataYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPhySpecificDataYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPhySpecificDataYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPhySpecificDataYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComplaintMgtPrgYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComplaintMgtPrgYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComplaintMgtPrgYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComplaintMgtPrgYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComplaintMgtPrgYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComplaintMgtPrgYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSatisfactionTool';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSatisfactionTool';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSatisfactionTool';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSatisfactionTool';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSatisfactionTool';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSatisfactionTool';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSatisfactionTeamYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSatisfactionTeamYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSatisfactionTeamYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSatisfactionTeamYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSatisfactionTeamYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSatisfactionTeamYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEDVolume';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEDVolume';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEDVolume';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEDVolume';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEDVolume';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEDVolume';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAdmissionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAdmissionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAdmissionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAdmissionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAdmissionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrAdmissionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTransferPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTransferPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTransferPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1440, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTransferPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTransferPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTransferPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatContribpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatContribpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatContribpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatContribpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatContribpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrStatContribpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBseHour';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBseHour';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBseHour';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBseHour';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBseHour';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBseHour';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'changed float 12/6/10', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrIncExpComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrIncExpComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrIncExpComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrIncExpComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrIncExpComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrIncExpComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSiteOvrHdpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSiteOvrHdpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSiteOvrHdpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSiteOvrHdpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSiteOvrHdpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSiteOvrHdpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrIntRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrIntRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrIntRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrIntRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrIntRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrIntRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlpFlatFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlpFlatFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlpFlatFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlpFlatFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlpFlatFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMlpFlatFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMplSecondRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMplSecondRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMplSecondRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMplSecondRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMplSecondRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMplSecondRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMplSecondRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMplSecondRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMplSecondRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrLclFixedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrLclFixedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrLclFixedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrLclFixedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrLclFixedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrLclFixedAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRDIncentivePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSurplusReservePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSurplusReservePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSurplusReservePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSurplusReservePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSurplusReservePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrSurplusReservePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'zCtrMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'zCtrMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'zCtrMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'zCtrMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'zCtrMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'zCtrMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateFeeInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateFeeInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateFeeInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateFeeInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateFeeInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateFeeInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPctInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPctInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPctInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPctInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPctInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPctInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNightPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNightPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNightPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNightPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNightPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNightPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDiffRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDiffRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDiffRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDiffRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDiffRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDiffRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDiffAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDiffAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDiffAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDiffAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDiffAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDiffAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDayRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDayRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDayRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDayRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDayRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDayRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNightRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNightRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNightRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNightRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNightRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrNightRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFastTrackBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFastTrackBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFastTrackBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1755, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFastTrackBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFastTrackBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFastTrackBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrOtherBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCriticalCareBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCriticalCareBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCriticalCareBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCriticalCareBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCriticalCareBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCriticalCareBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrObservationBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrObservationBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrObservationBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrObservationBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrObservationBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrObservationBedQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrInactiveYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrInactiveYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrInactiveYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrInactiveYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrInactiveYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrInactiveYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTraumaDesignation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTraumaDesignation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTraumaDesignation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTraumaDesignation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTraumaDesignation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTraumaDesignation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFlagYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFlagYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFlagYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFlagYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFlagYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrFlagYn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRequireMailYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRequireMailYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRequireMailYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRequireMailYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRequireMailYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrRequireMailYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCEPSurchargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCEPSurchargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCEPSurchargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCEPSurchargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCEPSurchargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrCEPSurchargePct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMngCarBatchYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMngCarBatchYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMngCarBatchYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMngCarBatchYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMngCarBatchYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMngCarBatchYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc1YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc2YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc3YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc4YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc4YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc4YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc4YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc4YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc4YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc4YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc4YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc4YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc5YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc5YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc5YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc5YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc5YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc5YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc5YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc5YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrMisc5YN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 3/3/2004', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 3/6/2006/***9/17/2008 Now Lawson ID NO', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrTIN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDivision';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDivision';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDivision';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDivision';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDivision';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 3/27/2008***Changed to 15 char 1/5/10', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDivision';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDivision';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDivision';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDivision';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCtr', @level2type = N'COLUMN', @level2name = N'CtrDivision';

