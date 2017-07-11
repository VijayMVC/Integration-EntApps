CREATE TABLE [dbo].[LS_StatusLookup] (
    [ProviderMasterID]          INT             NULL,
    [ProcessLevel]              VARCHAR (5)     NULL,
    [EmpStatus]                 CHAR (2)        NULL,
    [IsPrimaryProcessLevel]     CHAR (1)        NULL,
    [IsLeadPANP]                CHAR (1)        NULL,
    [DateHired]                 DATETIME        NULL,
    [PayRate]                   DECIMAL (13, 4) NULL,
    [PayEffectDate]             DATETIME        NULL,
    [SickLeavePastTwelveMonths] DECIMAL (7, 2)  NULL,
    [EndDate]                   DATETIME        NULL,
    [Employee]                  INT             NULL,
    [Position]                  VARCHAR (12)    NULL,
    [EffectDate]                DATETIME        NULL,
    [PosLevel]                  SMALLINT        NULL,
    [CreDate]                   DATETIME        DEFAULT (getdate()) NULL
);

