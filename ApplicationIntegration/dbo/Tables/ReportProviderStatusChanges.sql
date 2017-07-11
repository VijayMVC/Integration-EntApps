CREATE TABLE [dbo].[ReportProviderStatusChanges] (
    [PracticeLocation]                VARCHAR (100) NULL,
    [StatusType]                      VARCHAR (20)  NULL,
    [FirstName]                       VARCHAR (50)  NULL,
    [LastName]                        VARCHAR (50)  NULL,
    [FirstWorkDateTime]               DATETIME      NULL,
    [Title]                           VARCHAR (50)  NULL,
    [MaritalStatus]                   VARCHAR (50)  NULL,
    [FirstWorkDate]                   VARCHAR (50)  NULL,
    [LastWorkDate]                    VARCHAR (50)  NULL,
    [Address1]                        VARCHAR (100) NULL,
    [CityStateZip]                    VARCHAR (100) NULL,
    [PhoneNbr1]                       VARCHAR (20)  NULL,
    [CellPhoneNbr]                    VARCHAR (20)  NULL,
    [PagerNbr]                        VARCHAR (20)  NULL,
    [EmailAddress]                    VARCHAR (50)  NULL,
    [CEP/AEP/DEP/WEP-Email]           VARCHAR (100) NULL,
    [SiteLocationName]                VARCHAR (100) NULL,
    [WebCode]                         VARCHAR (10)  NULL,
    [DateOfHireInCredentialingSystem] VARCHAR (50)  NULL,
    [PartnershipLevel]                VARCHAR (30)  NULL,
    [ProviderMasterID]                INT           NULL
);

