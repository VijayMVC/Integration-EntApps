CREATE TABLE [dbo].[SiteLocationEchoContractsMatches] (
    [SLEC_PrimeKey]         INT           IDENTITY (1, 1) NOT NULL,
    [SiteLocationID]        INT           NULL,
    [EchoInsurancePlanCode] VARCHAR (50)  NULL,
    [EchoCode]              CHAR (6)      NULL,
    [EchoInsurancePlanName] VARCHAR (50)  NULL,
    [SiteLocationName]      VARCHAR (100) NULL,
    [ContractGroup]         VARCHAR (10)  NULL,
    [GroupNumber]           VARCHAR (30)  NULL,
    [MatchedFlag]           CHAR (1)      NULL,
    [ActiveInactiveFlag]    CHAR (1)      NULL,
    [CreDate]               DATETIME      CONSTRAINT [DF_SiteLocationEchoContractsMatches_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]               DATETIME      CONSTRAINT [DF_SiteLocationEchoContractsMatches_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_SiteLocationEchoContractsMatches] PRIMARY KEY CLUSTERED ([SLEC_PrimeKey] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [SLCM_SLID_idx]
    ON [dbo].[SiteLocationEchoContractsMatches]([SiteLocationID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [SLCM_EchoIPCode_idx]
    ON [dbo].[SiteLocationEchoContractsMatches]([EchoInsurancePlanCode] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [SLCM_EchoCode_idx]
    ON [dbo].[SiteLocationEchoContractsMatches]([EchoCode] ASC) WITH (FILLFACTOR = 90);

