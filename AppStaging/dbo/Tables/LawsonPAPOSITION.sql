﻿CREATE TABLE [dbo].[LawsonPAPOSITION] (
    [COMPANY]        SMALLINT        NOT NULL,
    [R_POSITION]     CHAR (12)       NOT NULL,
    [DESCRIPTION]    CHAR (30)       NOT NULL,
    [POSIT_STATUS]   TINYINT         NOT NULL,
    [EFFECT_DATE]    DATETIME        NOT NULL,
    [END_DATE]       DATETIME        NOT NULL,
    [JOB_CODE]       CHAR (9)        NOT NULL,
    [PROCESS_LEVEL]  CHAR (5)        NOT NULL,
    [DEPARTMENT]     CHAR (5)        NOT NULL,
    [USER_LEVEL]     CHAR (10)       NOT NULL,
    [EXP_COMPANY]    SMALLINT        NOT NULL,
    [EXP_ACCT_UNIT]  CHAR (15)       NOT NULL,
    [EXP_ACCOUNT]    INT             NOT NULL,
    [EXP_SUB_ACCT]   SMALLINT        NOT NULL,
    [PAY_RATE]       DECIMAL (13, 4) NOT NULL,
    [SALARY_CLASS]   CHAR (1)        NOT NULL,
    [PAY_FREQUENCY]  TINYINT         NOT NULL,
    [SCHEDULE]       CHAR (9)        NOT NULL,
    [PAY_GRADE]      CHAR (3)        NOT NULL,
    [PAY_STEP]       SMALLINT        NOT NULL,
    [SUPERVISOR]     CHAR (10)       NOT NULL,
    [SHIFT]          TINYINT         NOT NULL,
    [UPDATE_FLAG]    CHAR (1)        NOT NULL,
    [LOCAT_CODE]     CHAR (10)       NOT NULL,
    [UNION_CODE]     CHAR (10)       NOT NULL,
    [BARGAIN_UNIT]   CHAR (10)       NOT NULL,
    [CHG_REASON]     CHAR (10)       NOT NULL,
    [ACTIVITY]       CHAR (15)       NOT NULL,
    [ACCT_CATEGORY]  CHAR (5)        NOT NULL,
    [OT_PLAN_CODE]   CHAR (4)        NOT NULL,
    [SUPERVISOR_IND] CHAR (10)       NOT NULL,
    [SUPERVISOR_LNK] CHAR (10)       NOT NULL,
    [WORK_SCHED]     CHAR (10)       NOT NULL,
    [EXEMPT_EMP]     CHAR (1)        NOT NULL,
    [SEC_LVL]        TINYINT         NOT NULL,
    [SEC_LOCATION]   CHAR (10)       NOT NULL,
    [DATE_STAMP]     DATETIME        NOT NULL,
    [TIME_STAMP]     DECIMAL (6)     NOT NULL,
    [USER_ID]        CHAR (10)       NOT NULL,
    [OBJ_ID]         DECIMAL (12)    NOT NULL,
    [ANNUAL_HOURS]   SMALLINT        NOT NULL,
    [CURRENCY_CODE]  CHAR (5)        NOT NULL,
    [CURR_ND]        TINYINT         NOT NULL,
    [BASE_CURRENCY]  CHAR (5)        NOT NULL,
    [BASE_ND]        TINYINT         NOT NULL,
    [BASE_PAY_RATE]  DECIMAL (13, 4) NOT NULL,
    [ENCUMBER_FLAG]  CHAR (1)        NOT NULL,
    [L_INDEX]        CHAR (4)        NOT NULL,
    [POSSET4_SS_SW]  CHAR (1)        NOT NULL,
    [L_ATPOS_SS_SW]  CHAR (1)        NOT NULL
);
