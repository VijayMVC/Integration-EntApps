CREATE TABLE [dbo].[LawsonPayHistory_PreFinal] (
    [ProviderMasterID] INT             NULL,
    [ProcessLevel]     CHAR (5)        NULL,
    [Employee]         INT             NULL,
    [Site]             VARCHAR (30)    NULL,
    [FullName]         CHAR (50)       NULL,
    [PayRate]          DECIMAL (13, 4) NULL,
    [EffectDate]       DATETIME        NULL,
    [HireDate]         DATETIME        NULL,
    [JobStatus]        VARCHAR (9)     NULL,
    [Status]           VARCHAR (10)    NULL,
    [PLStatus]         VARCHAR (50)    NULL,
    [RateIncrease]     DECIMAL (13, 2) NULL,
    [PayRate1]         DECIMAL (13, 4) NULL,
    [PerIncrease]      VARCHAR (50)    NULL
);

