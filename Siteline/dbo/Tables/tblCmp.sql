CREATE TABLE [dbo].[tblCmp] (
    [CmpKey]                    VARCHAR (100) NULL,
    [CmpID]                     INT           IDENTITY (1, 1) NOT NULL,
    [CmpSys_CmpID]              INT           NULL,
    [CmpName]                   VARCHAR (75)  NULL,
    [CmpCode]                   VARCHAR (10)  NULL,
    [CmpAddress1]               VARCHAR (50)  NULL,
    [CmpAddress2]               VARCHAR (50)  NULL,
    [CmpCity]                   VARCHAR (30)  NULL,
    [CmpState]                  CHAR (2)      NULL,
    [CmpZip]                    VARCHAR (10)  NULL,
    [CmpCountry]                VARCHAR (20)  NULL,
    [CmpPhone]                  VARCHAR (15)  NULL,
    [CmpFax]                    VARCHAR (15)  NULL,
    [CmpWeb]                    VARCHAR (255) NULL,
    [CmpSiteBedNo]              INT           CONSTRAINT [DF_tblCmp_CmpSiteBedNo] DEFAULT (0) NOT NULL,
    [CmpPhyGrpYN]               BIT           CONSTRAINT [DF_tblCmp_CmpPhyGrpYN] DEFAULT (0) NULL,
    [CmpSysYN]                  BIT           CONSTRAINT [DF_tblCmp_CmpSysYN] DEFAULT (0) NULL,
    [CmpSiteYN]                 BIT           CONSTRAINT [DF_tblCmp_CmpSiteYN] DEFAULT (0) NULL,
    [CmpBillAgentYN]            BIT           CONSTRAINT [DF_tblCmp_CmpBillAgentYN] DEFAULT (0) NULL,
    [CmpMalCarYN]               BIT           CONSTRAINT [DF_tblCmp_CmpMalCarYN] DEFAULT (0) NULL,
    [CmpOtherYN]                BIT           CONSTRAINT [DF_tblCmp_CmpOtherYN] DEFAULT (0) NULL,
    [CmpTranscriptYN]           BIT           CONSTRAINT [DF_tblCmp_CmpTranscriptYN] DEFAULT (0) NULL,
    [CmpIPAYN]                  BIT           CONSTRAINT [DF_tblCmp_CmpIPAYN] DEFAULT (0) NOT NULL,
    [CmpContractingYN]          BIT           CONSTRAINT [DF_tblCmp_CmpContractingYN] DEFAULT (0) NOT NULL,
    [CmpComment]                TEXT          NULL,
    [CmpDateCreate]             SMALLDATETIME NULL,
    [CmpDateEdit]               SMALLDATETIME NULL,
    [CmpDateInactive]           SMALLDATETIME NULL,
    [CmpInactiveYN]             BIT           CONSTRAINT [DF_tblCmp_CmpInactiveYN] DEFAULT (0) NULL,
    [CmpFlagYN]                 BIT           CONSTRAINT [DF_tblCmp_CmpFlagYN] DEFAULT (0) NULL,
    [CmpIPAContact]             VARCHAR (100) NULL,
    [CmpIPA_CntID]              INT           NULL,
    [CmpIPAEmail]               VARCHAR (150) NULL,
    [CmpIPAComment]             VARCHAR (200) NULL,
    [CmpCompanyNameBilling]     VARCHAR (100) NULL,
    [CmpAddressBilling]         VARCHAR (100) NULL,
    [CmpCityBilling]            VARCHAR (50)  NULL,
    [CmpStateBilling]           CHAR (2)      NULL,
    [CmpZipBilling]             CHAR (10)     NULL,
    [CmpPhoneBilling]           CHAR (10)     NULL,
    [CmpFaxBilling]             CHAR (10)     NULL,
    [CmpContactBilling]         VARCHAR (100) NULL,
    [CmpEmailBilling]           VARCHAR (150) NULL,
    [CmpCommentBilling]         VARCHAR (200) NULL,
    [CmpCompanyNameRefund]      VARCHAR (100) NULL,
    [CmpAddressRefund]          VARCHAR (100) NULL,
    [CmpCityRefund]             VARCHAR (50)  NULL,
    [CmpStateRefund]            CHAR (2)      NULL,
    [CmpZipRefund]              CHAR (10)     NULL,
    [CmpPhoneRefund]            CHAR (10)     NULL,
    [CmpFaxRefund]              CHAR (10)     NULL,
    [CmpContactRefund]          VARCHAR (100) NULL,
    [CmpEmailRefund]            VARCHAR (150) NULL,
    [CmpCommentRefund]          VARCHAR (200) NULL,
    [CmpCompanyNameAppeal]      VARCHAR (100) NULL,
    [CmpAddressAppeal]          VARCHAR (100) NULL,
    [CmpCityAppeal]             VARCHAR (50)  NULL,
    [CmpStateAppeal]            CHAR (2)      NULL,
    [CmpZipAppeal]              CHAR (10)     NULL,
    [CmpPhoneAppeal]            CHAR (10)     NULL,
    [CmpFaxAppeal]              CHAR (10)     NULL,
    [CmpContactAppeal]          VARCHAR (100) NULL,
    [CmpEmailAppeal]            VARCHAR (150) NULL,
    [CmpCommentAppeal]          VARCHAR (200) NULL,
    [CmpCompanyNameContracting] VARCHAR (100) NULL,
    [CmpContracting_CmpID]      INT           NULL,
    [CmpContracting_CntID]      INT           NULL,
    [CmpAddressContracting]     VARCHAR (100) NULL,
    [CmpCityContracting]        VARCHAR (50)  NULL,
    [CmpStateContracting]       CHAR (2)      NULL,
    [CmpZipContracting]         CHAR (10)     NULL,
    [CmpPhoneContracting]       CHAR (10)     NULL,
    [CmpFaxContracting]         CHAR (10)     NULL,
    [CmpContactContracting]     VARCHAR (100) NULL,
    [CmpEmailContracting]       VARCHAR (150) NULL,
    [CmpCommentContracting]     VARCHAR (200) NULL,
    CONSTRAINT [PK_tblCmp] PRIMARY KEY NONCLUSTERED ([CmpID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblCmp_tblCmp] FOREIGN KEY ([CmpContracting_CmpID]) REFERENCES [dbo].[tblCmp] ([CmpID]),
    CONSTRAINT [FK_tblCmp_tblCnt] FOREIGN KEY ([CmpIPA_CntID]) REFERENCES [dbo].[tblCnt] ([CntID]),
    CONSTRAINT [FK_tblCmp_tblCnt1] FOREIGN KEY ([CmpContracting_CntID]) REFERENCES [dbo].[tblCnt] ([CntID]),
    CONSTRAINT [CmpKey] UNIQUE CLUSTERED ([CmpKey] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [IX_CmpName]
    ON [dbo].[tblCmp]([CmpName] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CmpCity]
    ON [dbo].[tblCmp]([CmpCity] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CmpState]
    ON [dbo].[tblCmp]([CmpState] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CmpZip]
    ON [dbo].[tblCmp]([CmpZip] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CmpPhone]
    ON [dbo].[tblCmp]([CmpPhone] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_tblCmp]
    ON [dbo].[tblCmp]([CmpKey] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_AlternateBackThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DatasheetForeThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DatasheetGridlinesThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_FilterOnLoad', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_HideNewField', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'[tblCmp].[CmpName]', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOnLoad', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ThemeFontIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TotalsRow', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 5805, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpKey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSys_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSys_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSys_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2220, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSys_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSys_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSys_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 5025, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddress1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddress1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddress1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddress1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddress1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddress1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddress2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddress2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddress2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddress2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddress2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddress2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpState';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpState';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpState';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpState';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpState';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpState';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZip';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZip';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZip';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZip';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZip';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZip';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCountry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCountry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCountry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCountry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCountry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCountry';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhone';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhone';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhone';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhone';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhone';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhone';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFax';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFax';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFax';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFax';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFax';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFax';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpWeb';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpWeb';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpWeb';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpWeb';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpWeb';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpWeb';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSiteBedNo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSiteBedNo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSiteBedNo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSiteBedNo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSiteBedNo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSiteBedNo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhyGrpYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhyGrpYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhyGrpYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhyGrpYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhyGrpYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhyGrpYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSysYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSysYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSysYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSysYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSysYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSysYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSiteYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSiteYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSiteYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSiteYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSiteYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpSiteYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpBillAgentYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpBillAgentYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpBillAgentYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpBillAgentYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpBillAgentYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpBillAgentYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpMalCarYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpMalCarYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpMalCarYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpMalCarYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpMalCarYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpMalCarYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpOtherYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpTranscriptYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpTranscriptYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpTranscriptYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpTranscriptYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpTranscriptYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpTranscriptYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContractingYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContractingYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContractingYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContractingYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContractingYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContractingYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContractingYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContractingYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContractingYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateCreate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateEdit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateInactive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateInactive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateInactive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateInactive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateInactive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpDateInactive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpInactiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFlagYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAContact';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAContact';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAContact';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAContact';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAContact';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAContact';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAContact';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPA_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPA_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPA_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPA_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPA_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 3/6/06', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPA_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPA_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPA_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPA_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPA_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAEmail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpIPAComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentBilling';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentRefund';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentAppeal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCompanyNameContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 3/6/2006', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 3/6/2006', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContracting_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpAddressContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCityContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpStateContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpZipContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpPhoneContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpFaxContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpContactContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpEmailContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new 7/2005', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentContracting';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmp', @level2type = N'COLUMN', @level2name = N'CmpCommentContracting';

