CREATE TABLE [dbo].[WebMedicalDirectorEvalProvider] (
    [ProviderMasterID] INT         NULL,
    [Site1WebCode]     VARCHAR (4) NULL,
    [Site2WebCode]     VARCHAR (4) NULL,
    [Site3WebCode]     VARCHAR (4) NULL,
    [Credate]          DATETIME    CONSTRAINT [DF_WebMedicalDirectorEvalProvider_Credate] DEFAULT (getdate()) NULL
);

