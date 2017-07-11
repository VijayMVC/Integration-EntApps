CREATE TABLE [dbo].[CeridianAllMatches] (
    [CAM_ID]            INT         NOT NULL,
    [ProviderMasterID]  INT         NULL,
    [CeridianFlxID]     INT         NULL,
    [CeridianClockNbr]  INT         NULL,
    [CeridianEbPSID]    VARCHAR (8) NULL,
    [PrimaryRecordFlag] CHAR (1)    CONSTRAINT [DF_CeridianAllMatches_PrimaryRecordFlag] DEFAULT ('Y') NULL,
    [CreDate]           DATETIME    CONSTRAINT [DF_CeridianAllMatches_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]           DATETIME    CONSTRAINT [DF_CeridianAllMatches_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_CeridianAllMatches] PRIMARY KEY CLUSTERED ([CAM_ID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [CAM_ProviderMasterID_idx]
    ON [dbo].[CeridianAllMatches]([ProviderMasterID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CAM_CeridianIDs_idx]
    ON [dbo].[CeridianAllMatches]([CeridianFlxID] ASC, [CeridianClockNbr] ASC, [CeridianEbPSID] ASC) WITH (FILLFACTOR = 90);

