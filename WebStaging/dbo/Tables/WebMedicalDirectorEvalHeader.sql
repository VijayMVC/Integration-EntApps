CREATE TABLE [dbo].[WebMedicalDirectorEvalHeader] (
    [ProviderMasterIDEvaluee] INT      NULL,
    [SiteWebCode]             CHAR (4) NULL,
    [ProviderMasterIDRD]      INT      NULL,
    [Credate]                 DATETIME CONSTRAINT [DF_WebMedicalDirectorEvalHeader_Credate] DEFAULT (getdate()) NULL
);

