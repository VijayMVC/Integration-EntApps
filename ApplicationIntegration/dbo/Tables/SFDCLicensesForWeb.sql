CREATE TABLE [dbo].[SFDCLicensesForWeb] (
    [ProviderMasterID] INT           NULL,
    [WebID]            INT           NULL,
    [LicenseType]      VARCHAR (100) NULL,
    [LicenseNumber]    VARCHAR (100) NULL,
    [Institution]      VARCHAR (255) NULL,
    [IssueDate]        DATETIME      NULL,
    [RenewDate]        DATETIME      NULL,
    [ExpirationDate]   DATETIME      NULL,
    [CreDate]          DATETIME      NULL,
    [UpdDate]          DATETIME      NULL
);

