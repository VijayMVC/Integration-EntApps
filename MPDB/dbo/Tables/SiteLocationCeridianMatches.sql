CREATE TABLE [dbo].[SiteLocationCeridianMatches] (
    [SLCM_PrimeKey]  INT          IDENTITY (1, 1) NOT NULL,
    [SiteLocationID] INT          NULL,
    [PayrollCIFlxID] INT          NULL,
    [CIValue]        VARCHAR (30) NULL,
    [CIDescrip]      VARCHAR (30) NULL,
    [CreDate]        DATETIME     CONSTRAINT [DF_SiteLocationCeridianMatches_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]        DATETIME     CONSTRAINT [DF_SiteLocationCeridianMatches_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_SiteLocationCeridianMatches] PRIMARY KEY CLUSTERED ([SLCM_PrimeKey] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [SiteLocationCeridianMatches_SiteLocationID_idx]
    ON [dbo].[SiteLocationCeridianMatches]([SiteLocationID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [SiteLocationCeridianMatches_Payroll_idx]
    ON [dbo].[SiteLocationCeridianMatches]([PayrollCIFlxID] ASC) WITH (FILLFACTOR = 90);

