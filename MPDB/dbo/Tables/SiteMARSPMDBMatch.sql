CREATE TABLE [dbo].[SiteMARSPMDBMatch] (
    [MPSM_ID]        INT          NOT NULL,
    [StaffGroup]     VARCHAR (50) NULL,
    [Practice]       CHAR (3)     NULL,
    [Location]       CHAR (3)     NULL,
    [SiteLocationID] INT          NULL,
    [MatchedFlag]    CHAR (1)     NULL,
    [CreDate]        DATETIME     CONSTRAINT [DF_MARSPMDBSiteMatch_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]        DATETIME     CONSTRAINT [DF_MARSPMDBSiteMatch_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_MARSPMDBSiteMatch] PRIMARY KEY CLUSTERED ([MPSM_ID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [MPSM_PracLoc_idx]
    ON [dbo].[SiteMARSPMDBMatch]([Practice] ASC, [Location] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [MPSM_SiteLocationID_idx]
    ON [dbo].[SiteMARSPMDBMatch]([SiteLocationID] ASC) WITH (FILLFACTOR = 90);

