CREATE TABLE [dbo].[SiteLocationStaffGroupMatches] (
    [SLSGM_ID]         INT           NOT NULL,
    [SiteLocationID]   INT           NULL,
    [StaffGroup]       VARCHAR (50)  NULL,
    [SiteLocationName] VARCHAR (100) NULL,
    [WebID]            INT           NULL,
    [ActiveFlag]       CHAR (1)      CONSTRAINT [DF_SiteLocationStaffGroupMatches_ActiveFlag] DEFAULT ('Y') NULL,
    [CreDate]          DATETIME      CONSTRAINT [DF_SiteLocationStaffGroupMatches_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]          DATETIME      CONSTRAINT [DF_SiteLocationStaffGroupMatches_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_SiteLocationStaffGroupMatches] PRIMARY KEY CLUSTERED ([SLSGM_ID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [SLSGM_StfFrpSLID_idx]
    ON [dbo].[SiteLocationStaffGroupMatches]([StaffGroup] ASC, [SiteLocationID] ASC) WITH (FILLFACTOR = 90);

