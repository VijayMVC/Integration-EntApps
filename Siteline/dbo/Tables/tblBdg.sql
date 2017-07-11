CREATE TABLE [dbo].[tblBdg] (
    [Bdg_CtrID]           INT           NOT NULL,
    [BdgYear]             INT           NOT NULL,
    [BdgID]               INT           IDENTITY (1, 1) NOT NULL,
    [BdgKey]              VARCHAR (100) NOT NULL,
    [BdgAvgChgPt]         MONEY         CONSTRAINT [DF_tblBdg_BdgAvgChgPt] DEFAULT (0) NOT NULL,
    [BdgBillFee]          MONEY         CONSTRAINT [DF_tblBdg_BdgBillFee] DEFAULT (0) NOT NULL,
    [BdgBillRate]         FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgBillRate] DEFAULT (0) NOT NULL,
    [BdgBillSpec]         MONEY         CONSTRAINT [DF_tblBdg_BdgBillSpec] DEFAULT (0) NOT NULL,
    [BdgBlendedHrs]       FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgBlendedHrs] DEFAULT (0) NOT NULL,
    [BdgBlendedPtsHr]     FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgBlendedPtsHr] DEFAULT (0) NOT NULL,
    [BdgCEPRetentionAmt]  MONEY         CONSTRAINT [DF_tblBdg_BdgCEPRetentionAmt] DEFAULT (0) NOT NULL,
    [BdgCEPRetentionPct]  FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgCEPRetentionPct] DEFAULT (0) NOT NULL,
    [BdgCollPerPt]        MONEY         CONSTRAINT [DF_tblBdg_BdgCollPerPt] DEFAULT (0) NOT NULL,
    [BdgContribCEP]       MONEY         CONSTRAINT [DF_tblBdg_BdgContribCEP] DEFAULT (0) NOT NULL,
    [BdgContribPct]       FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgContribPct] DEFAULT (0) NOT NULL,
    [BdgDocEarnedHrly]    MONEY         CONSTRAINT [DF_tblBdg_BdgDocEarnedHrly] DEFAULT (0) NOT NULL,
    [BdgDocHours]         FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgDocHours] DEFAULT (0) NOT NULL,
    [BdgDonations]        MONEY         CONSTRAINT [DF_tblBdg_BdgDonations] DEFAULT (0) NOT NULL,
    [BdgEncounters]       INT           CONSTRAINT [DF_tblBdg_BdgEncounters] DEFAULT (0) NOT NULL,
    [BdgFixedLocalAmt]    MONEY         CONSTRAINT [DF_tblBdg_BdgFixedLocalAmt] DEFAULT (0) NOT NULL,
    [BdgGrossColl]        MONEY         CONSTRAINT [DF_tblBdg_BdgGrossColl] DEFAULT (0) NOT NULL,
    [BdgInterest]         MONEY         CONSTRAINT [DF_tblBdg_BdgInterest] DEFAULT (0) NOT NULL,
    [BdgInterestRate]     FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgInterestRate] DEFAULT (0) NOT NULL,
    [BdgLclExp]           MONEY         CONSTRAINT [DF_tblBdg_BdgLclExp] DEFAULT (0) NOT NULL,
    [BdgLclExpPct]        FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgLclExpPct] DEFAULT (0) NOT NULL,
    [BdgLclPct]           FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgLclPct] DEFAULT (0) NOT NULL,
    [BdgLclVarAmt]        MONEY         CONSTRAINT [DF_tblBdg_BdgLclVarAmt] DEFAULT (0) NOT NULL,
    [BdgMalpractice]      MONEY         CONSTRAINT [DF_tblBdg_BdgMalpractice] DEFAULT (0) NOT NULL,
    [BdgMDearned]         MONEY         CONSTRAINT [DF_tblBdg_BdgMDearned] DEFAULT (0) NOT NULL,
    [BdgMDpct]            FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgMDpct] DEFAULT (0) NOT NULL,
    [BdgMPFlatFeeAmt]     MONEY         CONSTRAINT [DF_tblBdg_BdgMPFlatFeeAmt] DEFAULT (0) NOT NULL,
    [BdgMPRate]           FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgMPRate] DEFAULT (0) NOT NULL,
    [BdgNetPctofNOR]      FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgNetPctofNOR] DEFAULT (0) NOT NULL,
    [BdgNetRevPerPt]      MONEY         CONSTRAINT [DF_tblBdg_BdgNetRevPerPt] DEFAULT (0) NOT NULL,
    [BdgNOR]              MONEY         CONSTRAINT [DF_tblBdg_BdgNOR] DEFAULT (0) NOT NULL,
    [BdgOffTop]           MONEY         CONSTRAINT [DF_tblBdg_BdgOffTop] DEFAULT (0) NOT NULL,
    [BdgOthRcpts]         MONEY         CONSTRAINT [DF_tblBdg_BdgOthRcpts] DEFAULT (0) NOT NULL,
    [BdgPACost]           MONEY         CONSTRAINT [DF_tblBdg_BdgPACost] DEFAULT (0) NOT NULL,
    [BdgPACostHr]         MONEY         CONSTRAINT [DF_tblBdg_BdgPACostHr] DEFAULT (0) NOT NULL,
    [BdgPACostPct]        FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgPACostPct] DEFAULT (0) NOT NULL,
    [BdgPAHours]          FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgPAHours] DEFAULT (0) NOT NULL,
    [BdgPASupportCostAmt] MONEY         CONSTRAINT [DF_tblBdg_BdgPASupportCostAmt] DEFAULT (0) NOT NULL,
    [BdgPASupportCostPct] FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgPASupportCostPct] DEFAULT (0) NOT NULL,
    [BdgPatients]         INT           CONSTRAINT [DF_tblBdg_BdgPatients] DEFAULT (0) NOT NULL,
    [BdgPstChgs]          MONEY         CONSTRAINT [DF_tblBdg_BdgPstChgs] DEFAULT (0) NOT NULL,
    [BdgPTCost]           MONEY         CONSTRAINT [DF_tblBdg_BdgPTCost] DEFAULT (0) NOT NULL,
    [BdgPITpct]           FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgPITpct] DEFAULT (0) NOT NULL,
    [BdgPITearned]        MONEY         CONSTRAINT [DF_tblBdg_BdgPITearned] DEFAULT (0) NOT NULL,
    [BdgPITEarnedPct]     FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgPITEarnedPct] DEFAULT (0) NOT NULL,
    [BdgPTCostPct]        FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgPTCostPct] DEFAULT (0) NOT NULL,
    [BdgPtsPerHr]         FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgPtsPerHr] DEFAULT (0) NOT NULL,
    [BdgRDearned]         MONEY         CONSTRAINT [DF_tblBdg_BdgRDearned] DEFAULT (0) NOT NULL,
    [BdgRDpct]            FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgRDpct] DEFAULT (0) NOT NULL,
    [BdgStipendsRcvd]     MONEY         CONSTRAINT [DF_tblBdg_BdgStipendsRcvd] DEFAULT (0) NOT NULL,
    [BdgTargetRate]       FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgTargetRate] DEFAULT (0) NOT NULL,
    [BdgSiteNetInc]       MONEY         CONSTRAINT [DF_tblBdg_BdgSiteNetInc] DEFAULT (0) NOT NULL,
    [BdgSiteOverhead]     MONEY         CONSTRAINT [DF_tblBdg_BdgSiteOverhead] DEFAULT (0) NOT NULL,
    [BdgSiteOvrHdAmt]     MONEY         CONSTRAINT [DF_tblBdg_BdgSiteOvrHdAmt] DEFAULT (0) NOT NULL,
    [BdgSiteOvrHdPct]     FLOAT (53)    CONSTRAINT [DF_tblBdg_BdgSiteOvrHdPct] DEFAULT (0) NOT NULL,
    [BdgTotalColl]        MONEY         CONSTRAINT [DF_tblBdg_BdgTotalColl] DEFAULT (0) NOT NULL,
    [BdgDateCreate]       SMALLDATETIME NULL,
    [BdgDateEdit]         SMALLDATETIME NULL,
    [BdgFlagYN]           BIT           CONSTRAINT [DF_tblBdg_BdgFlagYN] DEFAULT (0) NULL,
    [BdgInactiveYN]       BIT           CONSTRAINT [DF_tblBdg_BdgInactiveYN] DEFAULT (0) NULL,
    CONSTRAINT [PK_tblBdg] PRIMARY KEY CLUSTERED ([Bdg_CtrID] ASC, [BdgYear] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblBdg_tblCtr] FOREIGN KEY ([Bdg_CtrID]) REFERENCES [dbo].[tblCtr] ([CtrID]),
    CONSTRAINT [BdgID] UNIQUE NONCLUSTERED ([BdgID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [BdgKey]
    ON [dbo].[tblBdg]([BdgKey] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [Bdg_CtrID]
    ON [dbo].[tblBdg]([Bdg_CtrID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [BdgYear]
    ON [dbo].[tblBdg]([BdgYear] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_AlternateBackThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DatasheetForeThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DatasheetGridlinesThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = N'(BdgYear=2016)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_FilterOnLoad', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_HideNewField', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'[tblBdg].[BdgYear] DESC', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOnLoad', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ThemeFontIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TotalsRow', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'Bdg_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'Bdg_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'Bdg_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'Bdg_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'Bdg_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'Bdg_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 3, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 4, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 4140, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 5, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgAvgChgPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 6, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillFee';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 7, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 8, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBillSpec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBlendedHrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBlendedHrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 9, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBlendedHrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBlendedHrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBlendedHrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBlendedHrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBlendedPtsHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBlendedPtsHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 10, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBlendedPtsHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBlendedPtsHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBlendedPtsHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgBlendedPtsHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 11, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 12/31/2003', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 12, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 12/31/2003', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCEPRetentionPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 13, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgCollPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 14, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgContribCEP';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 15, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgContribPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 16, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDocEarnedHrly';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 17, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDocHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 18, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 12/31/2003', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDonations';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 19, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 4/28/2009', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgEncounters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 20, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgFixedLocalAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 21, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgGrossColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 22, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInterest';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInterestRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInterestRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 23, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInterestRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInterestRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInterestRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInterestRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 24, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclExp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 25, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclExpPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 26, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 27, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgLclVarAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 28, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMalpractice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 29, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 30, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 31, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMPFlatFeeAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 32, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgMPRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 33, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNetPctofNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 34, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNetRevPerPt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 35, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgNOR';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 36, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgOffTop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgOthRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgOthRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 37, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgOthRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgOthRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgOthRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgOthRcpts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 38, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACostHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACostHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 39, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACostHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACostHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACostHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACostHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 40, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPACostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 41, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPAHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 42, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 12/31/2003', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 43, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 12/31/2003', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPASupportCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPatients';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPatients';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 44, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPatients';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPatients';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPatients';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPatients';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 45, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPstChgs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 46, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPTCost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 47, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 48, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITEarnedPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITEarnedPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 49, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITEarnedPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITEarnedPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITEarnedPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPITEarnedPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 50, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPTCostPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 51, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgPtsPerHr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgRDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgRDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 52, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgRDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgRDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgRDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgRDearned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 53, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgRDpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 54, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgStipendsRcvd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 55, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgTargetRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 56, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteNetInc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 57, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOverhead';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOvrHdAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOvrHdAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 58, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOvrHdAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOvrHdAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOvrHdAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOvrHdAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOvrHdPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOvrHdPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 59, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOvrHdPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOvrHdPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOvrHdPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgSiteOvrHdPct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 60, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgTotalColl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 61, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 62, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 63, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 64, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblBdg', @level2type = N'COLUMN', @level2name = N'BdgInactiveYN';

