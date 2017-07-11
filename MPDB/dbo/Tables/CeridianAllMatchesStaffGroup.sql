CREATE TABLE [dbo].[CeridianAllMatchesStaffGroup] (
    [CAM_ID]            INT          NOT NULL,
    [StaffGroup]        VARCHAR (50) NULL,
    [ProviderMasterID]  INT          NULL,
    [CeridianFlxID]     INT          NULL,
    [CeridianClockNbr]  INT          NULL,
    [CeridianEbPSID]    VARCHAR (8)  NULL,
    [PrimaryRecordFlag] CHAR (1)     CONSTRAINT [DF_CeridianAllMatchesSG_PrimaryRecordFlag] DEFAULT ('Y') NULL,
    [CreDate]           DATETIME     CONSTRAINT [DF_CeridianAllMatchesSG_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]           DATETIME     CONSTRAINT [DF_CeridianAllMatchesSG_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_CeridianAllMatchesSG] PRIMARY KEY CLUSTERED ([CAM_ID] ASC) WITH (FILLFACTOR = 90)
);

