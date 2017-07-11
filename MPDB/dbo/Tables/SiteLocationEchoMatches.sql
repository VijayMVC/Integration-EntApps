CREATE TABLE [dbo].[SiteLocationEchoMatches] (
    [SLEM_PrimeKey]        INT           IDENTITY (1, 1) NOT NULL,
    [StaffGroup]           VARCHAR (50)  NULL,
    [SiteLocationID]       INT           NULL,
    [EchoCode]             CHAR (6)      NULL,
    [EchoSiteLocationName] VARCHAR (100) NULL,
    [SiteLocationName]     VARCHAR (100) NULL,
    [CreDate]              DATETIME      CONSTRAINT [DF_SiteLocationEchoMatches_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]              DATETIME      CONSTRAINT [DF_SiteLocationEchoMatches_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_SiteLocationEchoMatches] PRIMARY KEY CLUSTERED ([SLEM_PrimeKey] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [SLEM_SLID_idx]
    ON [dbo].[SiteLocationEchoMatches]([StaffGroup] ASC, [SiteLocationID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [SLEM_EchoCode_idx]
    ON [dbo].[SiteLocationEchoMatches]([StaffGroup] ASC, [EchoCode] ASC) WITH (FILLFACTOR = 90);

