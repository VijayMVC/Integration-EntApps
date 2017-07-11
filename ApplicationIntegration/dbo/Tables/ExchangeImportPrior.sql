CREATE TABLE [dbo].[ExchangeImportPrior] (
    [ObjClass]                VARCHAR (255)  NULL,
    [FirstName]               VARCHAR (255)  NULL,
    [LastName]                VARCHAR (255)  NULL,
    [DisplayName]             VARCHAR (30)   NULL,
    [AliasName]               VARCHAR (255)  NULL,
    [DirectoryName]           VARCHAR (255)  NULL,
    [PrimaryWindowsNTAccount] VARCHAR (255)  NULL,
    [HomeServer]              VARCHAR (255)  NULL,
    [EMailAddress]            VARCHAR (2000) NULL,
    [SecondaryProxyAddresses] VARCHAR (2000) NULL,
    [EmailAddressComparison]  VARCHAR (255)  NULL,
    [EMailAddresses]          VARCHAR (2000) NULL,
    [Members]                 VARCHAR (5000) NULL,
    [ObjContainer]            VARCHAR (255)  NULL,
    [HideFromAB]              VARCHAR (255)  NULL
);

