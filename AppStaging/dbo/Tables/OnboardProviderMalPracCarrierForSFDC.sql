CREATE TABLE [dbo].[OnboardProviderMalPracCarrierForSFDC] (
    [SFDCName]         VARCHAR (80)  NULL,
    [ProviderMasterID] INT           NOT NULL,
    [WebID]            INT           NOT NULL,
    [SFID]             VARCHAR (50)  NOT NULL,
    [CarrierSFID]      VARCHAR (18)  NULL,
    [InsuranceCarrier] VARCHAR (255) NULL,
    [PolicyNum]        VARCHAR (50)  NULL,
    [Address]          VARCHAR (255) NULL,
    [PhoneNbr]         VARCHAR (50)  NULL,
    [Fax]              VARCHAR (50)  NULL,
    [IndividualAmount] VARCHAR (50)  NULL,
    [AggregateAmount]  VARCHAR (50)  NULL,
    [EffectiveDate]    DATETIME      NULL,
    [ExpirationDate]   DATETIME      NULL,
    [RemoveTail]       CHAR (1)      NULL,
    [Remove]           CHAR (1)      NULL
);

