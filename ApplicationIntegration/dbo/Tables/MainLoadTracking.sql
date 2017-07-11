CREATE TABLE [dbo].[MainLoadTracking] (
    [ContactID]        NVARCHAR (18)  NULL,
    [SFDCObject]       NVARCHAR (100) NULL,
    [SFDCName]         NVARCHAR (100) NULL,
    [LoadedToOnboard]  DATETIME       NULL,
    [LoadedToSF]       DATETIME       NULL,
    [ProviderTypeFlag] NVARCHAR (5)   NULL
);

