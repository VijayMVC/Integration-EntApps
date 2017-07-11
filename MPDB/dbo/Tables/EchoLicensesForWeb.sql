CREATE TABLE [dbo].[EchoLicensesForWeb] (
    [ProviderMasterID] INT          NULL,
    [WebID]            INT          NULL,
    [LicenseType]      VARCHAR (25) NULL,
    [LicenseNumber]    VARCHAR (20) NULL,
    [Institution]      VARCHAR (50) NULL,
    [IssueDate]        DATETIME     NULL,
    [RenewDate]        DATETIME     NULL,
    [ExpirationDate]   DATETIME     NULL,
    [CreDate]          DATETIME     CONSTRAINT [DF_EchoLicensesForWeb_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]          DATETIME     CONSTRAINT [DF_EchoLicensesForWeb_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [FK_EchoLicensesForWeb_ProviderMaster] FOREIGN KEY ([ProviderMasterID]) REFERENCES [dbo].[ProviderMaster] ([ProviderMasterID])
);


GO
CREATE CLUSTERED INDEX [IX_EchoLicensesForWeb]
    ON [dbo].[EchoLicensesForWeb]([ProviderMasterID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_EchoLicensesForWeb_WebID]
    ON [dbo].[EchoLicensesForWeb]([WebID] ASC) WITH (FILLFACTOR = 90);

