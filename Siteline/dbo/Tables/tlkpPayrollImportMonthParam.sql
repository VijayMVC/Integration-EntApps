CREATE TABLE [dbo].[tlkpPayrollImportMonthParam] (
    [Id]           INT      IDENTITY (1, 1) NOT NULL,
    [ImportMonth]  DATETIME NULL,
    [RunPackageYN] BIT      NULL,
    CONSTRAINT [PK_tlkpPayrollImportMonthParam] PRIMARY KEY CLUSTERED ([Id] ASC)
);

