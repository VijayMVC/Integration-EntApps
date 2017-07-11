CREATE TABLE [dbo].[OnboardProviderLicensesForSFDC] (
    [SFDCName]             VARCHAR (80) NULL,
    [ProviderMasterID]     INT          NOT NULL,
    [WebID]                INT          NOT NULL,
    [SFID]                 VARCHAR (50) NOT NULL,
    [LicenseType]          VARCHAR (25) NULL,
    [LicenseNum]           VARCHAR (20) NULL,
    [IssuingState]         VARCHAR (50) NULL,
    [IssueDate]            DATETIME     NULL,
    [ExpirationDate]       DATETIME     NULL,
    [PracticingInLicState] CHAR (1)     NULL,
    [LicenseStatus]        VARCHAR (50) NULL,
    [ProviderType]         VARCHAR (50) NULL
);

