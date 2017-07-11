CREATE TABLE [dbo].[ProviderSiteLocationStaffGroup] (
    [ProviderMasterID] INT           NOT NULL,
    [SiteLocationID]   INT           NULL,
    [StaffGroup]       VARCHAR (50)  NULL,
    [Echo_Org_Name]    VARCHAR (100) NULL,
    [PracticeOrder]    INT           NULL,
    [StartDate]        DATETIME      NULL,
    [EndDate]          DATETIME      NULL,
    [FirstWorkedDate]  DATETIME      NULL,
    [LastWorkedDate]   DATETIME      NULL,
    [ActiveFlag]       CHAR (1)      NULL,
    [CreDate]          DATETIME      NULL,
    [UpdDate]          DATETIME      NULL
);

