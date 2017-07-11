CREATE TABLE [dbo].[tblPR197] (
    [PR197ID]        INT            IDENTITY (1, 1) NOT NULL,
    [COMPANY-4]      VARCHAR (255)  NULL,
    [NAME-3]         VARCHAR (255)  NULL,
    [DIST-COMPANY-4] VARCHAR (255)  NULL,
    [PAYMENT-DATE-3] DATETIME       NULL,
    [DIST-COMPANY-5] VARCHAR (255)  NULL,
    [ACCT-UNIT-3]    VARCHAR (255)  NULL,
    [ACCOUNT-3]      VARCHAR (255)  NULL,
    [SUB-ACCT-3]     VARCHAR (255)  NULL,
    [POSTING-DATE-2] DATETIME       NULL,
    [DESCRIPTION-3]  VARCHAR (255)  NULL,
    [CONTINUED-2]    VARCHAR (255)  NULL,
    [EMPLOYEE-2]     VARCHAR (255)  NULL,
    [FULL-NAME-2]    VARCHAR (255)  NULL,
    [DIST-UNITS]     FLOAT (53)     NULL,
    [DIST-HOURS]     FLOAT (53)     NULL,
    [DIST-AMT]       MONEY          NULL,
    [CHECK-NBR]      VARCHAR (255)  NULL,
    [TEMP-STAR]      VARCHAR (255)  NULL,
    [GL-DATE-2]      DATETIME       NULL,
    [CHECK-TYPE]     VARCHAR (255)  NULL,
    [PAY-CODE]       VARCHAR (255)  NULL,
    [DED-CODE]       VARCHAR (255)  NULL,
    [JOB-CODE]       VARCHAR (255)  NULL,
    [DIST-PROC-LEV]  VARCHAR (255)  NULL,
    [DEPARTMENT-3]   VARCHAR (255)  NULL,
    [DIST-UNITS-2]   FLOAT (53)     NULL,
    [DIST-HOURS-2]   FLOAT (53)     NULL,
    [DIST-AMT-2]     MONEY          NULL,
    [ACTIVITY]       VARCHAR (255)  NULL,
    [ACCT-CATEGORY]  VARCHAR (255)  NULL,
    [POSITION]       VARCHAR (255)  NULL,
    [DataSetDate]    DATETIME       NULL,
    [PR197FileName]  NVARCHAR (200) NULL,
    [PR197Month]     DATETIME       NULL,
    CONSTRAINT [PK_tblPR197MD] PRIMARY KEY CLUSTERED ([PR197ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPR197', @level2type = N'COLUMN', @level2name = N'PR197ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPR197', @level2type = N'COLUMN', @level2name = N'PR197ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPR197', @level2type = N'COLUMN', @level2name = N'PR197ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPR197', @level2type = N'COLUMN', @level2name = N'PR197FileName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPR197', @level2type = N'COLUMN', @level2name = N'PR197FileName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPR197', @level2type = N'COLUMN', @level2name = N'PR197FileName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPR197', @level2type = N'COLUMN', @level2name = N'PR197Month';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPR197', @level2type = N'COLUMN', @level2name = N'PR197Month';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPR197', @level2type = N'COLUMN', @level2name = N'PR197Month';

