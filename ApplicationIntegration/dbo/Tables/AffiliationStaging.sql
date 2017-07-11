CREATE TABLE [dbo].[AffiliationStaging] (
    [SFID]                 CHAR (18)      NOT NULL,
    [ProviderMasterID]     VARCHAR (255)  NULL,
    [StaffGroup]           VARCHAR (20)   NULL,
    [Active]               VARCHAR (1)    NOT NULL,
    [WithinStaffGroupFlag] INT            NULL,
    [SiteLocationID]       INT            NULL,
    [From]                 DATETIME2 (7)  NULL,
    [To]                   DATETIME2 (7)  NULL,
    [WebCode]              CHAR (20)      NULL,
    [SiteSFID]             CHAR (18)      NULL,
    [SiteName]             VARCHAR (1300) NULL,
    [CEPSite]              VARCHAR (5)    NULL,
    [GalenSite]            VARCHAR (5)    NULL,
    [ContractID]           CHAR (18)      NULL,
    [PracticeLocation]     NCHAR (255)    NULL,
    [Contract_Holder__c]   CHAR (18)      NULL
);

