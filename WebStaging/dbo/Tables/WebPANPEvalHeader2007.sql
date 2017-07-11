CREATE TABLE [dbo].[WebPANPEvalHeader2007] (
    [DateOfEmployment]         DATETIME        NULL,
    [BoardStatus]              VARCHAR (100)   NULL,
    [BoardStatusExpDate]       DATETIME        NULL,
    [CurrentLevel]             VARCHAR (100)   NULL,
    [CurrentLevelDate]         DATETIME        NULL,
    [AdvanceLevel]             VARCHAR (10)    NULL,
    [TotalHours]               DECIMAL (10, 2) NULL,
    [AcceleratedAdvance]       VARCHAR (10)    NULL,
    [WebCodeSite]              VARCHAR (10)    NULL,
    [RegionCode]               VARCHAR (10)    NULL,
    [ProviderMasterID]         INT             NULL,
    [ProviderMasterIDMD]       INT             NULL,
    [ProviderMasterIDActualMD] INT             NULL,
    [ProviderMasterIDRD]       INT             NULL,
    [EvalAtMoreThan1Site]      CHAR (1)        NULL,
    [Category]                 CHAR (1)        NULL,
    [Credate]                  DATETIME        NULL
);

