CREATE TABLE [dbo].[ProviderEchoLicense] (
    [ProvLicense_ID]                INT          NOT NULL,
    [ProviderMasterID]              INT          NULL,
    [StaffGroup]                    VARCHAR (50) NULL,
    [Institution]                   VARCHAR (50) NULL,
    [ComplianceIssueDate]           DATETIME     NULL,
    [DocumentationIssueDate]        DATETIME     NULL,
    [ComplianceRenewedDate]         DATETIME     NULL,
    [ComplianceExpiresDate]         DATETIME     NULL,
    [ComplianceMedia]               VARCHAR (30) NULL,
    [HIPAAIssueDate]                DATETIME     NULL,
    [HIPAARenewedDate]              DATETIME     NULL,
    [HIPAAExpiresDate]              DATETIME     NULL,
    [HIPAAMedia]                    VARCHAR (30) NULL,
    [COBRA_EMTALAIssueDate]         DATETIME     NULL,
    [StandardsOfConductDate]        DATETIME     NULL,
    [L5CCDocTrngDate]               DATETIME     NULL,
    [ActiveFlag]                    CHAR (1)     CONSTRAINT [DF_ProviderEchoLicense_ActiveFlag] DEFAULT ('Y') NULL,
    [ComplianceCurrentFlag]         CHAR (1)     CONSTRAINT [DF_ProviderEchoLicense_ComplianceCurrentFlag] DEFAULT ('N') NULL,
    [HIPAACurrentFlag]              CHAR (1)     CONSTRAINT [DF_ProviderEchoLicense_HIPAACurrentFlag] DEFAULT ('N') NULL,
    [COBRA_EMTALACurrentFlag]       CHAR (1)     CONSTRAINT [DF_ProviderEchoLicense_COBRA_EMTALACurrentFlag] DEFAULT ('N') NULL,
    [StandardsOfConductCurrentFlag] CHAR (1)     NULL,
    [L5CCDocTrngFlag]               CHAR (1)     NULL,
    [CreDate]                       DATETIME     CONSTRAINT [DF_ProviderEchoLicense_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]                       DATETIME     CONSTRAINT [DF_ProviderEchoLicense_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ProviderEchoLicense] PRIMARY KEY CLUSTERED ([ProvLicense_ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_ProviderEchoLicense_ProviderMaster] FOREIGN KEY ([ProviderMasterID]) REFERENCES [dbo].[ProviderMaster] ([ProviderMasterID])
);


GO
CREATE NONCLUSTERED INDEX [PEL_ProviderMasterID_idx]
    ON [dbo].[ProviderEchoLicense]([ProviderMasterID] ASC) WITH (FILLFACTOR = 90);

