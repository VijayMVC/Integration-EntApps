CREATE TABLE [dbo].[LawsonPayHistory] (
    [ProviderMasterID] INT             NULL,
    [ProcessLevel]     CHAR (5)        NULL,
    [Employee]         INT             NULL,
    [Site]             VARCHAR (30)    NULL,
    [FullName]         CHAR (50)       NULL,
    [PayRate]          DECIMAL (13, 4) NULL,
    [EffectDate]       DATETIME        NULL,
    [EndDate]          DATETIME        NULL,
    [HireDate]         DATETIME        NULL,
    [JobStatus]        VARCHAR (9)     NULL,
    [Status]           VARCHAR (10)    NULL,
    [PLStatus]         VARCHAR (50)    NULL
);

