CREATE TABLE [dbo].[TempEchoAffiliations] (
    [StaffGroup]                   VARCHAR (50)  NULL,
    [ActiveFlag]                   CHAR (1)      NULL,
    [WithinStaffGroupFlag]         CHAR (1)      NULL,
    [Echo_Dr_ID]                   CHAR (12)     NULL,
    [SiteLocationID]               INT           NULL,
    [FromDate]                     DATETIME      NULL,
    [ToDate]                       DATETIME      NULL,
    [EchoSiteLocationName]         VARCHAR (100) NULL,
    [EchoProviderSiteIndicator]    CHAR (5)      NULL,
    [EchoProviderSiteIndicatorTxt] VARCHAR (100) NULL,
    [EchoListOrder]                INT           NULL,
    [ProviderMasterID]             INT           NULL,
    [CreDate]                      DATETIME      CONSTRAINT [DF_TempEchoAffiliations_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]                      DATETIME      CONSTRAINT [DF_TempEchoAffiliations_UpdDate] DEFAULT (getdate()) NULL
);


GO
CREATE CLUSTERED INDEX [TEA_DrID_idx]
    ON [dbo].[TempEchoAffiliations]([Echo_Dr_ID] ASC) WITH (FILLFACTOR = 90);

