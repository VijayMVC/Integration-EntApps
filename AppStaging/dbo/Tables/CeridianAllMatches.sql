CREATE TABLE [dbo].[CeridianAllMatches] (
    [CAM_ID]            INT         NOT NULL,
    [ProviderMasterID]  INT         NULL,
    [CeridianFlxID]     INT         NULL,
    [CeridianClockNbr]  INT         NULL,
    [CeridianEbPSID]    VARCHAR (8) NULL,
    [PrimaryRecordFlag] CHAR (1)    NULL,
    [CreDate]           DATETIME    NULL,
    [UpdDate]           DATETIME    NULL
);

