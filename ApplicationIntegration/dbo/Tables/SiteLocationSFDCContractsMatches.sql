CREATE TABLE [dbo].[SiteLocationSFDCContractsMatches] (
    [SLEC_PrimeKey]         INT           IDENTITY (1, 1) NOT NULL,
    [SiteLocationID]        INT           NULL,
    [SFDCInsurancePlanCode] VARCHAR (50)  NULL,
    [SFDCCode]              CHAR (6)      NULL,
    [SFDCInsurancePlanName] VARCHAR (50)  NULL,
    [SiteLocationName]      VARCHAR (100) NULL,
    [ContractGroup]         VARCHAR (10)  NULL,
    [GroupNumber]           VARCHAR (30)  NULL,
    [MatchedFlag]           CHAR (1)      NULL,
    [ActiveInactiveFlag]    CHAR (1)      NULL,
    [CreDate]               DATETIME      NULL,
    [UpdDate]               DATETIME      NULL
);

