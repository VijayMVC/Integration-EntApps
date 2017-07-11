﻿CREATE TABLE [dbo].[Test_EMPLOYEE] (
    [COMPANY]        SMALLINT        NOT NULL,
    [EMPLOYEE]       INT             NOT NULL,
    [LAST_NAME]      CHAR (30)       NOT NULL,
    [FIRST_NAME]     CHAR (15)       NOT NULL,
    [MIDDLE_INIT]    CHAR (1)        NOT NULL,
    [MIDDLE_NAME]    CHAR (15)       NOT NULL,
    [NICK_NAME]      CHAR (30)       NOT NULL,
    [ADDR1]          CHAR (30)       NOT NULL,
    [ADDR2]          CHAR (30)       NOT NULL,
    [ADDR3]          CHAR (30)       NOT NULL,
    [ADDR4]          CHAR (30)       NOT NULL,
    [CITY]           CHAR (18)       NOT NULL,
    [STATE]          CHAR (2)        NOT NULL,
    [ZIP]            CHAR (10)       NOT NULL,
    [EMP_STATUS]     CHAR (2)        NOT NULL,
    [FICA_NBR]       CHAR (20)       NOT NULL,
    [EIC_STATUS]     TINYINT         NOT NULL,
    [PROCESS_LEVEL]  CHAR (5)        NOT NULL,
    [DEPARTMENT]     CHAR (5)        NOT NULL,
    [USER_LEVEL]     CHAR (10)       NOT NULL,
    [HM_DIST_CO]     SMALLINT        NOT NULL,
    [HM_ACCT_UNIT]   CHAR (15)       NOT NULL,
    [HM_ACCOUNT]     INT             NOT NULL,
    [HM_SUB_ACCT]    SMALLINT        NOT NULL,
    [JOB_CODE]       CHAR (9)        NOT NULL,
    [UNION_CODE]     CHAR (10)       NOT NULL,
    [SUPERVISOR]     CHAR (10)       NOT NULL,
    [DATE_HIRED]     DATETIME        NOT NULL,
    [PAY_FREQUENCY]  TINYINT         NOT NULL,
    [SHIFT]          TINYINT         NOT NULL,
    [SALARY_CLASS]   CHAR (1)        NOT NULL,
    [EXEMPT_EMP]     CHAR (1)        NOT NULL,
    [PAY_RATE]       DECIMAL (13, 4) NOT NULL,
    [STAND_HOURS]    DECIMAL (7, 2)  NOT NULL,
    [STAND_AMT]      DECIMAL (11, 3) NOT NULL,
    [WARN_FLAG]      CHAR (1)        NOT NULL,
    [ADD_ALLOW_PER]  DECIMAL (7, 3)  NOT NULL,
    [ADD_ALLOW_HRS]  DECIMAL (7, 2)  NOT NULL,
    [ADD_ALLOW_AMT]  INT             NOT NULL,
    [RPT_INS_COST]   DECIMAL (11, 2) NOT NULL,
    [AUTO_TIME_REC]  CHAR (1)        NOT NULL,
    [LAST_DED_SEQ]   SMALLINT        NOT NULL,
    [AUTO_DEPOSIT]   CHAR (1)        NOT NULL,
    [ADJ_HIRE_DATE]  DATETIME        NOT NULL,
    [ANNIVERS_DATE]  DATETIME        NOT NULL,
    [TERM_DATE]      DATETIME        NOT NULL,
    [LAST_CMT_SEQ]   SMALLINT        NOT NULL,
    [CREATION_DATE]  DATETIME        NOT NULL,
    [NBR_FTE]        DECIMAL (7, 6)  NOT NULL,
    [PENSION_PLAN]   CHAR (1)        NOT NULL,
    [PAY_STEP]       SMALLINT        NOT NULL,
    [PAY_GRADE]      CHAR (3)        NOT NULL,
    [SCHEDULE]       CHAR (9)        NOT NULL,
    [EBE_AMOUNT]     DECIMAL (9, 2)  NOT NULL,
    [SICK_PAY]       DECIMAL (11, 2) NOT NULL,
    [OT_PLAN_CODE]   CHAR (4)        NOT NULL,
    [DECEASED]       CHAR (1)        NOT NULL,
    [BSI_GROUP]      CHAR (11)       NOT NULL,
    [WORK_STATE]     CHAR (2)        NOT NULL,
    [TAX_STATE]      CHAR (2)        NOT NULL,
    [TAX_PROVINCE]   CHAR (2)        NOT NULL,
    [WC_STATE]       CHAR (2)        NOT NULL,
    [TAX_COUNTY]     CHAR (10)       NOT NULL,
    [TAX_CITY]       CHAR (10)       NOT NULL,
    [MOVING_EXP]     DECIMAL (11, 2) NOT NULL,
    [ALT_RATE_EXIST] CHAR (1)        NOT NULL,
    [PEND_ACT_DATE]  DATETIME        NOT NULL,
    [PIN]            CHAR (10)       NOT NULL,
    [TIPPED]         CHAR (1)        NOT NULL,
    [EMAIL_ADDRESS]  CHAR (60)       NOT NULL,
    [ACTIVITY]       CHAR (15)       NOT NULL,
    [ACCT_CATEGORY]  CHAR (5)        NOT NULL,
    [MAX_LIMIT_OVRD] CHAR (1)        NOT NULL,
    [SEC_LVL]        TINYINT         NOT NULL,
    [SEC_LOCATION]   CHAR (10)       NOT NULL,
    [R_POSITION]     CHAR (12)       NOT NULL,
    [WORK_SCHED]     CHAR (10)       NOT NULL,
    [SUPERVISOR_IND] CHAR (10)       NOT NULL,
    [ANNUAL_HOURS]   SMALLINT        NOT NULL,
    [WORK_COUNTY]    CHAR (10)       NOT NULL,
    [WORK_CITY]      CHAR (10)       NOT NULL,
    [WORK_SCHOOL]    CHAR (10)       NOT NULL,
    [WORK_TRANSPORT] CHAR (10)       NOT NULL,
    [TAX_SCHOOL]     CHAR (10)       NOT NULL,
    [TAX_TRANSPORT]  CHAR (10)       NOT NULL,
    [FTE_TOTAL]      DECIMAL (11, 6) NOT NULL,
    [PRO_RATE_TOTAL] DECIMAL (13, 4) NOT NULL,
    [PRO_RATE_A_SAL] DECIMAL (13, 4) NOT NULL,
    [NEW_HIRE_DATE]  DATETIME        NOT NULL,
    [CURRENCY_CODE]  CHAR (5)        NOT NULL,
    [CURR_ND]        TINYINT         NOT NULL,
    [COUNTRY_CODE]   CHAR (2)        NOT NULL,
    [NAME_PREFIX]    CHAR (4)        NOT NULL,
    [NAME_SUFFIX]    CHAR (4)        NOT NULL,
    [WORK_COUNTRY]   CHAR (2)        NOT NULL,
    [LAST_NAME_PRE]  CHAR (30)       NOT NULL,
    [EST_REMUN]      DECIMAL (11, 2) NOT NULL,
    [EST_EXPENSE]    DECIMAL (11, 2) NOT NULL,
    [BUS_NBR_GRP]    CHAR (4)        NOT NULL,
    [QC_ENT_NBR_GRP] CHAR (4)        NOT NULL,
    [WC_PROVINCE]    CHAR (2)        NOT NULL,
    [COUNTY]         CHAR (25)       NOT NULL,
    [RAILROAD_CODE]  TINYINT         NOT NULL,
    [FST_DAY_WORKED] DATETIME        NOT NULL,
    [LAST_DAY_PAID]  DATETIME        NOT NULL,
    [LAB_DIST_FLAG]  CHAR (1)        NOT NULL,
    [ENCUMBER_FLAG]  CHAR (1)        NOT NULL,
    [EFFORT_FLAG]    CHAR (1)        NOT NULL,
    [RPT_CURR]       CHAR (5)        NOT NULL,
    [PRMCERT_ID]     INT             NOT NULL,
    [SNDCERT_ID]     INT             NOT NULL,
    [FRNG_RATE]      DECIMAL (12, 6) NOT NULL,
    [FRNG_ACCT_CAT]  CHAR (5)        NOT NULL,
    [FRNG_ACCOUNT]   INT             NOT NULL,
    [FRNG_SUB_ACCT]  SMALLINT        NOT NULL,
    [DEATH_DATE]     DATETIME        NOT NULL,
    [TAX_FILTER]     TINYINT         NOT NULL,
    [REMOTE]         TINYINT         NOT NULL,
    [PUB_SEC_RETIRE] TINYINT         NOT NULL,
    [PRMCERT_COMP]   SMALLINT        NOT NULL,
    [SNDCERT_COMP]   SMALLINT        NOT NULL,
    [ST_STATUS]      TINYINT         NOT NULL,
    [LAST_NAME_UC]   CHAR (30)       NOT NULL,
    [FIRST_NAME_UC]  CHAR (15)       NOT NULL,
    [L_INDEX]        CHAR (4)        NOT NULL,
    [L_ATEMP_SS_SW]  CHAR (1)        NOT NULL,
    [FICA_NBR_LAST4] CHAR (4)        NOT NULL
);

