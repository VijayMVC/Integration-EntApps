CREATE TABLE [dbo].[SFDCSiteBase] (
    [ProviderMasterID] INT           NULL,
    [LastName]         VARCHAR (50)  NULL,
    [FirstName]        VARCHAR (50)  NULL,
    [Code]             CHAR (20)     NULL,
    [SiteSFID]         NCHAR (18)    NULL,
    [SFDCName]         VARCHAR (255) NULL,
    [Status]           CHAR (1)      NULL,
    [CEPFlag]          CHAR (10)     NULL,
    [GALENFlag]        CHAR (10)     NULL
);

