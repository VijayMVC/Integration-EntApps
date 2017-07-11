CREATE TABLE [dbo].[LP198] (
    [LP198ID]            INT            IDENTITY (1, 1) NOT NULL,
    [COMPANY]            INT            NULL,
    [NAME]               NVARCHAR (255) NULL,
    [TRANS-DATE]         DATETIME       NULL,
    [REFERENCE-NBR]      NVARCHAR (255) NULL,
    [PROC-LEV]           INT            NULL,
    [PL-DESCRIPTION]     NVARCHAR (255) NULL,
    [DEPT-PHRASE]        NVARCHAR (255) NULL,
    [DEPT]               NVARCHAR (255) NULL,
    [DEPT-DESCRIPTION]   NVARCHAR (255) NULL,
    [ACCR-CO]            INT            NULL,
    [ACCR-UNIT]          INT            NULL,
    [ACCR-ACCT]          INT            NULL,
    [ACCR-SUB]           NVARCHAR (255) NULL,
    [ACCT-DESC]          NVARCHAR (255) NULL,
    [PLAN]               NVARCHAR (255) NULL,
    [EMP-GROUP]          NVARCHAR (255) NULL,
    [POSITION]           NVARCHAR (255) NULL,
    [EMPLOYEE]           INT            NULL,
    [EMP-FULL-NAME]      NVARCHAR (255) NULL,
    [HOURS]              NVARCHAR (255) NULL,
    [RATE]               FLOAT (53)     NULL,
    [LIABILITY]          FLOAT (53)     NULL,
    [CURR-CODE]          FLOAT (53)     NULL,
    [ACCR-CO-3]          NVARCHAR (255) NULL,
    [ACCR-UNIT-3]        NVARCHAR (255) NULL,
    [ACCR-ACCT-3]        NVARCHAR (255) NULL,
    [ACCR-SUB-3]         NVARCHAR (255) NULL,
    [ACCR-LIABILITY]     NVARCHAR (255) NULL,
    [ACCR-CURR-CODE]     NVARCHAR (255) NULL,
    [EXP-CO]             NVARCHAR (255) NULL,
    [EXP-UNIT]           NVARCHAR (255) NULL,
    [EXP-ACCT]           NVARCHAR (255) NULL,
    [EXP-SUB]            NVARCHAR (255) NULL,
    [EXP-HOURS]          NVARCHAR (255) NULL,
    [EXP-LIABILITY]      NVARCHAR (255) NULL,
    [EXP-CURR-CODE]      NVARCHAR (255) NULL,
    [ACCR-LIABILITY-2]   NVARCHAR (255) NULL,
    [ACCR-CURR-CODE-2]   NVARCHAR (255) NULL,
    [EXP-HOURS-2]        NVARCHAR (255) NULL,
    [EXP-LIABILITY-2]    NVARCHAR (255) NULL,
    [EXP-CURR-CODE-2]    NVARCHAR (255) NULL,
    [DataSetDescription] VARCHAR (50)   NULL,
    [DataSetDate]        DATETIME       NULL,
    CONSTRAINT [PK_LP198] PRIMARY KEY CLUSTERED ([LP198ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'LP198';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'LP198', @level2type = N'COLUMN', @level2name = N'LP198ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'LP198', @level2type = N'COLUMN', @level2name = N'LP198ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'LP198', @level2type = N'COLUMN', @level2name = N'LP198ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'LP198', @level2type = N'COLUMN', @level2name = N'DataSetDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'LP198', @level2type = N'COLUMN', @level2name = N'DataSetDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'LP198', @level2type = N'COLUMN', @level2name = N'DataSetDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'LP198', @level2type = N'COLUMN', @level2name = N'DataSetDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'LP198', @level2type = N'COLUMN', @level2name = N'DataSetDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'LP198', @level2type = N'COLUMN', @level2name = N'DataSetDate';

