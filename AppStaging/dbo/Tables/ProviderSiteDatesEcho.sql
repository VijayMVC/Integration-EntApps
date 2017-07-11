CREATE TABLE [dbo].[ProviderSiteDatesEcho] (
    [ProviderSiteDatesEchoID] INT          IDENTITY (1, 1) NOT NULL,
    [ProviderMasterID]        INT          NULL,
    [StaffGroup]              VARCHAR (50) NULL,
    [SiteLocationID]          INT          NULL,
    [EchoListOrder]           INT          NULL,
    [EchoStartDate]           DATETIME     NULL,
    [EchoEndDate]             DATETIME     NULL,
    [EchoActiveFlag]          CHAR (1)     NULL,
    [CurrentProviderFlag]     CHAR (1)     NULL,
    [CreDate]                 DATETIME     CONSTRAINT [DF_ProviderSiteDatesEcho_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]                 DATETIME     CONSTRAINT [DF_ProviderSiteDatesEcho_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ProviderSiteDatesEcho] PRIMARY KEY CLUSTERED ([ProviderSiteDatesEchoID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [PSDE_PMasterID_SiteLocationID_idx]
    ON [dbo].[ProviderSiteDatesEcho]([ProviderMasterID] ASC, [SiteLocationID] ASC, [EchoListOrder] ASC) WITH (FILLFACTOR = 90);

