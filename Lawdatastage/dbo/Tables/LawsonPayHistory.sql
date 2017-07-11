CREATE TABLE [dbo].[LawsonPayHistory] (
    [ProviderMasterID] INT             NULL,
    [ProcessLevel]     CHAR (5)        COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [Employee]         INT             NULL,
    [Site]             VARCHAR (30)    COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [FullName]         CHAR (50)       COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [PayRate]          DECIMAL (13, 4) NULL,
    [EffectDate]       DATETIME        NULL,
    [HireDate]         DATETIME        NULL,
    [JobStatus]        VARCHAR (9)     COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [Status]           VARCHAR (10)    COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [PLStatus]         VARCHAR (50)    COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [RateIncrease]     VARCHAR (50)    NULL,
    [PerIncrease]      VARCHAR (50)    COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);

