﻿CREATE TABLE [dbo].[GLInterface_test] (
    [COMPANY]       SMALLINT        NOT NULL,
    [CHECK_ID]      DECIMAL (12)    NOT NULL,
    [CHECK_TYPE]    CHAR (1)        NOT NULL,
    [DED_CODE]      CHAR (4)        NOT NULL,
    [PAY_CODE]      VARCHAR (4)     NULL,
    [DIST_AMT]      DECIMAL (13, 2) NOT NULL,
    [DIST_COMPANY]  SMALLINT        NOT NULL,
    [DST_ACCOUNT]   INT             NOT NULL,
    [DST_SUB_ACCT]  SMALLINT        NOT NULL,
    [DST_ACCT_UNIT] CHAR (15)       NOT NULL,
    [EMPLOYEE]      INT             NOT NULL,
    [GL_DATE]       DATETIME        NOT NULL,
    [HOURS]         DECIMAL (7, 2)  NOT NULL,
    [JOB_CODE]      VARCHAR (9)     NULL,
    [R_POSITION]    CHAR (12)       NOT NULL,
    [PER_END_DATE]  DATETIME        NOT NULL,
    [TR_DATE]       DATETIME        NOT NULL,
    [RUN_DATE]      DATETIME        NOT NULL,
    [PAY_UNITS]     DECIMAL (7, 2)  NOT NULL,
    [PROCESS_LEVEL] CHAR (5)        NOT NULL,
    [DATA_MONTH]    VARCHAR (6)     NULL,
    [Name]          VARCHAR (255)   NULL
);

