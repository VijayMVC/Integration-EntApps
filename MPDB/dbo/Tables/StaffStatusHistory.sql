CREATE TABLE [dbo].[StaffStatusHistory] (
    [StaffStatusHistoryID] INT          NOT NULL,
    [StaffGroup]           VARCHAR (50) NULL,
    [ProviderMasterID]     INT          NULL,
    [StaffStatus]          VARCHAR (50) NULL,
    [StartDate]            DATETIME     NULL,
    [EndDate]              DATETIME     NULL,
    [ActiveFlag]           CHAR (1)     CONSTRAINT [DF_StaffHistory_ActiveFlag] DEFAULT ('Y') NULL,
    [SentFlag]             CHAR (1)     NULL,
    [SentDate]             DATETIME     NULL,
    [CreDate]              DATETIME     CONSTRAINT [DF_StaffHistory_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]              DATETIME     CONSTRAINT [DF_StaffHistory_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_StaffStatusHistory] PRIMARY KEY CLUSTERED ([StaffStatusHistoryID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [StaffHistory_ProviderMasterID_idx]
    ON [dbo].[StaffStatusHistory]([ProviderMasterID] ASC) WITH (FILLFACTOR = 90);

