CREATE TABLE [dbo].[MedicareReEval] (
    [LastName]             VARCHAR (50)   NULL,
    [FirstName]            VARCHAR (50)   NULL,
    [Title]                VARCHAR (100)  NULL,
    [ContractType]         VARCHAR (50)   NULL,
    [AppToProv]            DATETIME       NULL,
    [AppDueByProv]         DATETIME       NULL,
    [AppRecvdByProv]       DATETIME       NULL,
    [AppToPayer]           DATETIME       NULL,
    [FollowUpWithPayer]    DATETIME       NULL,
    [InsEffDate]           DATETIME       NULL,
    [DueByMedicare]        DATETIME       NULL,
    [InsuranceNotes]       VARCHAR (5000) NULL,
    [InsurancePlanComment] VARCHAR (30)   NULL
);

