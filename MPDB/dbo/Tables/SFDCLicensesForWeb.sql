CREATE TABLE [dbo].[SFDCLicensesForWeb] (
    [ProviderMasterID] INT           NULL,
    [WebID]            INT           NULL,
    [LicenseType]      VARCHAR (50)  NULL,
    [LicenseNumber]    VARCHAR (50)  NULL,
    [Institution]      VARCHAR (100) NULL,
    [IssueDate]        DATETIME      NULL,
    [RenewDate]        DATETIME      NULL,
    [ExpirationDate]   DATETIME      NULL,
    [CreDate]          DATETIME      NULL,
    [UpdDate]          DATETIME      NULL
);

