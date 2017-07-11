CREATE TABLE [dbo].[Refresh_ProviderCertification] (
    [SFDCName]           VARCHAR (80)  NULL,
    [ProviderMasterID]   INT           NOT NULL,
    [WebID]              INT           NOT NULL,
    [SFID]               VARCHAR (50)  NOT NULL,
    [CertificationType]  VARCHAR (100) NULL,
    [StartDate]          DATETIME      NULL,
    [EndDate]            DATETIME      NULL,
    [OtherCertification] TEXT          NULL,
    [CreDate]            DATETIME      NULL
);

