CREATE TABLE [dbo].[ProviderTraining] (
    [SFDCName]         VARCHAR (80)  NULL,
    [ProviderMasterID] INT           NOT NULL,
    [WebID]            INT           NOT NULL,
    [SFID]             VARCHAR (50)  NOT NULL,
    [PostGradTraining] VARCHAR (100) NULL,
    [TrainingType]     VARCHAR (50)  NULL,
    [InstitutionSFID]  VARCHAR (18)  NULL,
    [Institution]      VARCHAR (100) NULL,
    [StartDate]        DATETIME      NULL,
    [EndDate]          DATETIME      NULL,
    [DeptOrSpecialty]  VARCHAR (100) NULL,
    [Director]         VARCHAR (100) NULL
);

