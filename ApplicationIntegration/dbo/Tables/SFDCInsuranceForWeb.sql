CREATE TABLE [dbo].[SFDCInsuranceForWeb] (
    [ProviderMasterID] INT           NULL,
    [WebID]            INT           NULL,
    [InsuranceType]    VARCHAR (50)  NULL,
    [InsuranceCarrier] VARCHAR (100) NULL,
    [PolicyNbr]        VARCHAR (100) NULL,
    [Coverage]         VARCHAR (100) NULL,
    [FromDate]         DATETIME      NULL,
    [ToDate]           DATETIME      NULL,
    [CreDate]          DATETIME      NULL,
    [UpdDate]          DATETIME      NULL
);

