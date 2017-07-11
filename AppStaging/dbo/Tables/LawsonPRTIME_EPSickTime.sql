﻿CREATE TABLE [dbo].[LawsonPRTIME_EPSickTime] (
    [COMPANY]        SMALLINT        NOT NULL,
    [EMPLOYEE]       INT             NOT NULL,
    [CHECK_ID]       DECIMAL (12)    NOT NULL,
    [PAY_SUM_GRP]    CHAR (3)        NOT NULL,
    [TIME_SEQ]       DECIMAL (12)    NOT NULL,
    [JOB_CODE]       CHAR (9)        NOT NULL,
    [PROCESS_LEVEL]  CHAR (5)        NOT NULL,
    [WORK_STATE]     CHAR (2)        NOT NULL,
    [HOURS]          DECIMAL (7, 2)  NOT NULL,
    [RATE]           DECIMAL (13, 4) NOT NULL,
    [WAGE_AMOUNT]    DECIMAL (13, 2) NOT NULL,
    [DEPARTMENT]     CHAR (5)        NOT NULL,
    [PCT_DIST_FLAG]  CHAR (1)        NOT NULL,
    [SHIFT]          TINYINT         NOT NULL,
    [DST_ACCT_UNIT]  CHAR (15)       NOT NULL,
    [DST_ACCOUNT]    INT             NOT NULL,
    [DST_SUB_ACCT]   SMALLINT        NOT NULL,
    [DIST_COMPANY]   SMALLINT        NOT NULL,
    [TR_DATE]        DATETIME        NOT NULL,
    [UNION_CODE]     CHAR (10)       NOT NULL,
    [OT_PREM_AMT]    DECIMAL (13, 2) NOT NULL,
    [SHIFT_DIFF]     DECIMAL (13, 2) NOT NULL,
    [PAYROLL_YEAR]   SMALLINT        NOT NULL,
    [QUARTER]        TINYINT         NOT NULL,
    [PCD_SEQ_NBR]    SMALLINT        NOT NULL,
    [PER_END_DATE]   DATETIME        NOT NULL,
    [CHECK_TYPE]     CHAR (1)        NOT NULL,
    [LOCAT_CODE]     CHAR (10)       NOT NULL,
    [WC_STATE]       CHAR (2)        NOT NULL,
    [OT_RECORD]      CHAR (1)        NOT NULL,
    [R_POSITION]     CHAR (12)       NOT NULL,
    [ACTIVITY]       CHAR (15)       NOT NULL,
    [ACCT_CATEGORY]  CHAR (5)        NOT NULL,
    [TIME_ACC_FLAG]  CHAR (1)        NOT NULL,
    [SHFT_DIFF_RATE] DECIMAL (13, 4) NOT NULL,
    [OT_RATE]        DECIMAL (13, 4) NOT NULL,
    [ATN_OBJ_ID]     DECIMAL (12)    NOT NULL,
    [GLT_OBJ_ID]     DECIMAL (12)    NOT NULL,
    [RECONCILED]     CHAR (1)        NOT NULL,
    [TAX_FREQ_OVER]  TINYINT         NOT NULL,
    [REMUN_CODE]     CHAR (4)        NOT NULL,
    [BUS_NBR_GRP]    CHAR (4)        NOT NULL,
    [REPORT_ENTITY]  CHAR (5)        NOT NULL,
    [QC_ENT_NBR_GRP] CHAR (4)        NOT NULL,
    [WC_CLASS]       CHAR (4)        NOT NULL,
    [CURRENCY_CODE]  CHAR (5)        NOT NULL,
    [CURR_ND]        TINYINT         NOT NULL,
    [HM_PROCESS_LEV] CHAR (5)        NOT NULL,
    [CA_WC_CLASS]    CHAR (10)       NOT NULL,
    [COUNTRY_CODE]   CHAR (2)        NOT NULL,
    [PENS_SEQ_NBR]   SMALLINT        NOT NULL,
    [ABN_OBJ_ID]     DECIMAL (12)    NOT NULL,
    [PAY_UNITS]      DECIMAL (7, 2)  NOT NULL,
    [UNIT_MEASURE]   CHAR (12)       NOT NULL,
    [USER_ID]        CHAR (10)       NOT NULL,
    [DATE_STAMP]     DATETIME        NOT NULL,
    [NON_EARNINGS]   TINYINT         NOT NULL,
    [ORIG_OBJ_ID]    DECIMAL (12)    NOT NULL,
    [RECORD_TYPE]    CHAR (1)        NOT NULL,
    [ATTEND_CODE]    CHAR (2)        NOT NULL,
    [REASON_CODE]    CHAR (4)        NOT NULL,
    [TES_OBJ_ID]     DECIMAL (12)    NOT NULL,
    [RETRO_PENSION]  CHAR (1)        NOT NULL,
    [SERVICE_CODE]   CHAR (4)        NOT NULL,
    [TIME_STAMP]     DECIMAL (6)     NOT NULL,
    [CREATE_DATE]    DATETIME        NOT NULL,
    [CREATE_TIME]    DECIMAL (6)     NOT NULL,
    [CREATE_USER_ID] CHAR (10)       NOT NULL,
    [PRTSET8_SS_SW]  CHAR (1)        NOT NULL,
    [PRTSET9_SS_SW]  CHAR (1)        NOT NULL
);
