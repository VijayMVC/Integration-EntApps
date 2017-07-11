﻿CREATE TABLE [dbo].[Test123] (
    [COMPANY]        SMALLINT        NOT NULL,
    [EMPLOYEE]       INT             NOT NULL,
    [CHECK_ID]       DECIMAL (12)    NOT NULL,
    [STATUS]         TINYINT         NOT NULL,
    [PROCESS_LEVEL]  CHAR (5)        NOT NULL,
    [DEPARTMENT]     CHAR (5)        NOT NULL,
    [BANK_CODE]      CHAR (4)        NOT NULL,
    [GROSS_PAY]      DECIMAL (13, 2) NOT NULL,
    [NET_PAY_AMT]    DECIMAL (13, 2) NOT NULL,
    [DED_CYCLE_NBR]  TINYINT         NOT NULL,
    [CHECK_DATE]     DATETIME        NOT NULL,
    [PER_END_DATE]   DATETIME        NOT NULL,
    [CHECK_TYPE]     CHAR (1)        NOT NULL,
    [CHECK_NET]      DECIMAL (13, 2) NOT NULL,
    [CHECK_NBR]      INT             NOT NULL,
    [DATE_STAMP]     DATETIME        NOT NULL,
    [TIME_STAMP]     DECIMAL (6)     NOT NULL,
    [COUNTRY_CODE]   CHAR (2)        NOT NULL,
    [CURRENCY_CODE]  CHAR (5)        NOT NULL,
    [CURR_ND]        TINYINT         NOT NULL,
    [PENS_SEQ_NBR]   SMALLINT        NOT NULL,
    [NON_TXBL_REMUN] DECIMAL (13, 2) NOT NULL,
    [OT_PLAN_CODE]   CHAR (4)        NOT NULL,
    [PERIOD_NBR]     SMALLINT        NOT NULL,
    [PAYROLL_YEAR]   SMALLINT        NOT NULL,
    [GM_ADJ_FLAG]    TINYINT         NOT NULL,
    [L_INDEX]        CHAR (4)        NOT NULL,
    [PYMSET11_SS_SW] CHAR (1)        NOT NULL,
    [PYMSET2_SS_SW]  CHAR (1)        NOT NULL,
    [PYMSET5_SS_SW]  CHAR (1)        NOT NULL,
    [PYMSET8_SS_SW]  CHAR (1)        NOT NULL,
    [PYMSET9_SS_SW]  CHAR (1)        NOT NULL,
    [L_ATPYM_SS_SW]  CHAR (1)        NOT NULL,
    [PRINT_RCPT]     CHAR (1)        NOT NULL
);

