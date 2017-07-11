CREATE TABLE [dbo].[Refresh_ProviderReferences] (
    [SFDCName]         VARCHAR (80)  NULL,
    [ProviderMasterID] INT           NOT NULL,
    [WebID]            INT           NOT NULL,
    [SFID]             VARCHAR (50)  NOT NULL,
    [LastName]         VARCHAR (50)  NULL,
    [FirstName]        VARCHAR (50)  NULL,
    [ProviderType]     VARCHAR (10)  NULL,
    [Address]          VARCHAR (100) NULL,
    [Suite]            VARCHAR (20)  NULL,
    [City]             VARCHAR (50)  NULL,
    [State]            VARCHAR (50)  NULL,
    [ZipCode]          VARCHAR (50)  NULL,
    [PhoneNbr]         VARCHAR (50)  NULL,
    [Fax]              VARCHAR (50)  NULL,
    [Email]            VARCHAR (100) NULL,
    [AreaOfInterest]   VARCHAR (500) NULL,
    [CreDate]          DATETIME      NULL
);

