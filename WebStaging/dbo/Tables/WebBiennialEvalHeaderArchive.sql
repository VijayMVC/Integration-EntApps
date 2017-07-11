CREATE TABLE [dbo].[WebBiennialEvalHeaderArchive] (
    [DateOfEmployment]    DATETIME      NULL,
    [BoardStatus]         VARCHAR (100) NULL,
    [BoardStatusExpDate]  DATETIME      NULL,
    [CurrentLevel]        VARCHAR (100) NULL,
    [CurrentLevelDate]    DATETIME      NULL,
    [LastReviewDate]      DATETIME      NULL,
    [WebCodeSite]         VARCHAR (10)  NULL,
    [RegionCode]          VARCHAR (10)  NULL,
    [ProviderMasterID]    INT           NULL,
    [ProviderMasterIDMD]  INT           NULL,
    [ProviderMasterIDRD]  INT           NULL,
    [EvalAtMoreThan1Site] CHAR (1)      NULL,
    [Credate]             DATETIME      NULL
);

