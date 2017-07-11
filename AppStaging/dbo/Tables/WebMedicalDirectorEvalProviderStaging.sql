CREATE TABLE [dbo].[WebMedicalDirectorEvalProviderStaging] (
    [ProviderMasterID] INT           NULL,
    [LastName]         VARCHAR (50)  NULL,
    [FirstName]        VARCHAR (50)  NULL,
    [Title]            VARCHAR (20)  NULL,
    [PartnershipLevel] VARCHAR (10)  NULL,
    [Site1WebCode]     VARCHAR (4)   NULL,
    [Site2WebCode]     VARCHAR (4)   NULL,
    [Site3WebCode]     VARCHAR (4)   NULL,
    [Site1Name]        VARCHAR (50)  NULL,
    [Site2Name]        VARCHAR (50)  NULL,
    [Site3Name]        VARCHAR (50)  NULL,
    [MedDirSite1]      INT           NULL,
    [MedDirSite2]      INT           NULL,
    [MedDirSite3]      INT           NULL,
    [MedDirNameSite1]  VARCHAR (100) NULL,
    [MedDirNameSite2]  VARCHAR (100) NULL,
    [MedDirNameSite3]  VARCHAR (100) NULL
);

