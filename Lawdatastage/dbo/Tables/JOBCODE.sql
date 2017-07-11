﻿CREATE TABLE [dbo].[JOBCODE] (
    [COMPANY]        SMALLINT        NOT NULL,
    [JOB_CODE]       CHAR (9)        NOT NULL,
    [DESCRIPTION]    CHAR (30)       NOT NULL,
    [RATE_OVERRIDE]  CHAR (1)        NOT NULL,
    [BEG_SAL_RANGE]  DECIMAL (13, 4) NOT NULL,
    [MID_SAL_RANGE]  DECIMAL (13, 4) NOT NULL,
    [END_SAL_RANGE]  DECIMAL (13, 4) NOT NULL,
    [POINTS]         DECIMAL (7, 2)  NOT NULL,
    [EEO_CAT]        CHAR (2)        NOT NULL,
    [LAST_CMT_SEQ]   SMALLINT        NOT NULL,
    [ACTIVE_FLAG]    CHAR (1)        NOT NULL,
    [ANNUAL_HOURS]   SMALLINT        NOT NULL,
    [JOB_CLASS]      CHAR (3)        NOT NULL,
    [SCHEDULE]       CHAR (9)        NOT NULL,
    [PAY_GRADE]      CHAR (3)        NOT NULL,
    [EEO_SUB_CODE]   SMALLINT        NOT NULL,
    [EVAL_DATE]      DATETIME        NOT NULL,
    [EXEMPT]         CHAR (1)        NOT NULL,
    [EFFECT_DATE]    DATETIME        NOT NULL,
    [DESC_DATE]      DATETIME        NOT NULL,
    [WC_CLASS]       CHAR (4)        NOT NULL,
    [CA_WC_CLASS]    CHAR (10)       NOT NULL,
    [PAY_RATE]       DECIMAL (13, 4) NOT NULL,
    [EXP_DIST_CO]    SMALLINT        NOT NULL,
    [EXP_ACCT_UNIT]  CHAR (15)       NOT NULL,
    [EXP_ACCOUNT]    INT             NOT NULL,
    [EXP_SUB_ACCT]   SMALLINT        NOT NULL,
    [PROCESS_LEVEL]  CHAR (5)        NOT NULL,
    [DEPARTMENT]     CHAR (5)        NOT NULL,
    [REPORTS_TO]     INT             NOT NULL,
    [APPROVED_BY]    INT             NOT NULL,
    [TIPPED]         CHAR (1)        NOT NULL,
    [OBJ_ID]         DECIMAL (12)    NOT NULL,
    [MARKET_SALARY]  DECIMAL (13, 4) NOT NULL,
    [MARKET_DATE]    DATETIME        NOT NULL,
    [CURRENCY_CODE]  CHAR (5)        NOT NULL,
    [CURR_ND]        TINYINT         NOT NULL,
    [BASE_PAY_RATE]  DECIMAL (13, 4) NOT NULL,
    [BASE_CURRENCY]  CHAR (5)        NOT NULL,
    [BASE_ND]        TINYINT         NOT NULL,
    [BASE_BEG_SAL]   DECIMAL (13, 4) NOT NULL,
    [BASE_MID_SAL]   DECIMAL (13, 4) NOT NULL,
    [BASE_END_SAL]   DECIMAL (13, 4) NOT NULL,
    [BASE_MARKET]    DECIMAL (13, 4) NOT NULL,
    [EFFECTIVE_DATE] DATETIME        NOT NULL,
    [SALARY_CLASS]   CHAR (1)        NOT NULL,
    [WEB_TYPE]       CHAR (3)        NOT NULL,
    [GENDER_CLASS]   CHAR (1)        NOT NULL,
    [DIR_IND_JOB]    TINYINT         NOT NULL,
    [OCCUP_GROUP]    CHAR (2)        NOT NULL,
    [TENURE_ELIG]    CHAR (1)        NOT NULL,
    [HIGH_ED_CAT]    SMALLINT        NOT NULL,
    [HIGH_ED_SUBCAT] CHAR (3)        NOT NULL,
    [ACADEMIC_RANK]  CHAR (1)        NOT NULL,
    [L_INDEX]        CHAR (4)        NOT NULL,
    [L_ATJBC_SS_SW]  CHAR (1)        NOT NULL
);

