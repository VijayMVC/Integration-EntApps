﻿CREATE TABLE [dbo].[LawsonPRSYSTEM] (
    [COMPANY]          SMALLINT        NOT NULL,
    [PROCESS_LEVEL]    CHAR (5)        NOT NULL,
    [NAME]             CHAR (30)       NOT NULL,
    [ADDR1]            CHAR (30)       NOT NULL,
    [ADDR2]            CHAR (30)       NOT NULL,
    [ADDR3]            CHAR (30)       NOT NULL,
    [ADDR4]            CHAR (30)       NOT NULL,
    [CITY]             CHAR (18)       NOT NULL,
    [STATE]            CHAR (2)        NOT NULL,
    [ZIP]              CHAR (10)       NOT NULL,
    [PAYROLL_YEAR]     SMALLINT        NOT NULL,
    [BSI_COMPANY]      CHAR (11)       NOT NULL,
    [GL_UNITS]         CHAR (1)        NOT NULL,
    [DC_DED_CLASS]     CHAR (3)        NOT NULL,
    [OVERTIME]         CHAR (3)        NOT NULL,
    [PAY_IN_KIND]      CHAR (3)        NOT NULL,
    [TIPS]             CHAR (3)        NOT NULL,
    [AUTO_EMPLOYEE]    CHAR (1)        NOT NULL,
    [LAST_EMPLOYEE]    INT             NOT NULL,
    [BATCH_OPTION]     CHAR (1)        NOT NULL,
    [AUTO_BTCH_NBR]    INT             NOT NULL,
    [BATCH_CONTROL]    CHAR (1)        NOT NULL,
    [ES_DIST_CO]       SMALLINT        NOT NULL,
    [ES_ACCT_UNIT]     CHAR (15)       NOT NULL,
    [ES_ACCOUNT]       INT             NOT NULL,
    [ES_SUB_ACCT]      SMALLINT        NOT NULL,
    [EXP_DIST_CO]      SMALLINT        NOT NULL,
    [EXP_ACCT_UNIT]    CHAR (15)       NOT NULL,
    [EXP_ACCOUNT]      INT             NOT NULL,
    [EXP_SUB_ACCT]     SMALLINT        NOT NULL,
    [ACH_COMP_ID]      CHAR (10)       NOT NULL,
    [EMPLOYEE_SEQ]     CHAR (1)        NOT NULL,
    [BANK_CODE]        CHAR (4)        NOT NULL,
    [CL_DIST_CO]       SMALLINT        NOT NULL,
    [CL_ACCT_UNIT]     CHAR (15)       NOT NULL,
    [CL_ACCOUNT]       INT             NOT NULL,
    [CL_SUB_ACCT]      SMALLINT        NOT NULL,
    [PIK_DIST_CO]      SMALLINT        NOT NULL,
    [PIK_ACCT_UNIT]    CHAR (15)       NOT NULL,
    [PIK_ACCOUNT]      INT             NOT NULL,
    [PIK_SUB_ACCT]     SMALLINT        NOT NULL,
    [PR132_RUN_FLG]    CHAR (1)        NOT NULL,
    [PR140_RUN_FLG]    CHAR (1)        NOT NULL,
    [PR160_RUN_FLG]    CHAR (1)        NOT NULL,
    [PR199_RUN_FLG]    CHAR (1)        NOT NULL,
    [TA170_RUN_FLG]    CHAR (1)        NOT NULL,
    [TA199_RUN_FLG]    CHAR (1)        NOT NULL,
    [TP135_RUN_FLG]    CHAR (1)        NOT NULL,
    [COMPLETE_FLAG]    CHAR (1)        NOT NULL,
    [SERIAL_NBR]       INT             NOT NULL,
    [AUTO_APP]         CHAR (1)        NOT NULL,
    [LAST_APP]         INT             NOT NULL,
    [ANNUAL_HOURS]     SMALLINT        NOT NULL,
    [EEO4_OPTION]      CHAR (1)        NOT NULL,
    [FNCTN_DESC]       CHAR (20)       NOT NULL,
    [BEG_SAL_RANGE_01] DECIMAL (13, 4) NOT NULL,
    [BEG_SAL_RANGE_02] DECIMAL (13, 4) NOT NULL,
    [BEG_SAL_RANGE_03] DECIMAL (13, 4) NOT NULL,
    [BEG_SAL_RANGE_04] DECIMAL (13, 4) NOT NULL,
    [BEG_SAL_RANGE_05] DECIMAL (13, 4) NOT NULL,
    [BEG_SAL_RANGE_06] DECIMAL (13, 4) NOT NULL,
    [BEG_SAL_RANGE_07] DECIMAL (13, 4) NOT NULL,
    [END_SAL_RANGE_01] DECIMAL (13, 4) NOT NULL,
    [END_SAL_RANGE_02] DECIMAL (13, 4) NOT NULL,
    [END_SAL_RANGE_03] DECIMAL (13, 4) NOT NULL,
    [END_SAL_RANGE_04] DECIMAL (13, 4) NOT NULL,
    [END_SAL_RANGE_05] DECIMAL (13, 4) NOT NULL,
    [END_SAL_RANGE_06] DECIMAL (13, 4) NOT NULL,
    [END_SAL_RANGE_07] DECIMAL (13, 4) NOT NULL,
    [LIMIT_FLAG]       CHAR (1)        NOT NULL,
    [PRD_OPTION]       CHAR (1)        NOT NULL,
    [GLI_OPTION]       CHAR (1)        NOT NULL,
    [PS_OPTION]        CHAR (1)        NOT NULL,
    [SEC_SEARCH]       SMALLINT        NOT NULL,
    [PL_OPTION]        CHAR (1)        NOT NULL,
    [ACR_DIST_CO]      SMALLINT        NOT NULL,
    [ACR_ACCT_UNIT]    CHAR (15)       NOT NULL,
    [LAST_CHECK_ID]    DECIMAL (12)    NOT NULL,
    [INCLUDE_PR132]    CHAR (1)        NOT NULL,
    [INCLUDE_TP135]    CHAR (1)        NOT NULL,
    [LAST_TIME_SEQ]    DECIMAL (12)    NOT NULL,
    [OT_PLAN_CODE_01]  CHAR (4)        NOT NULL,
    [OT_PLAN_CODE_02]  CHAR (4)        NOT NULL,
    [OT_PLAN_CODE_03]  CHAR (4)        NOT NULL,
    [OT_PLAN_CODE_04]  CHAR (4)        NOT NULL,
    [OT_PLAN_CODE_05]  CHAR (4)        NOT NULL,
    [RECIP_CALC]       CHAR (1)        NOT NULL,
    [LOCAL_MAX]        CHAR (1)        NOT NULL,
    [LAST_JOB_REQ]     INT             NOT NULL,
    [IMM_DEST]         INT             NOT NULL,
    [IMM_DEST_NAME]    CHAR (30)       NOT NULL,
    [IMM_ORIG]         DECIMAL (10)    NOT NULL,
    [IMM_ORIG_NAME]    CHAR (30)       NOT NULL,
    [AT_LIMIT_DEDS]    CHAR (1)        NOT NULL,
    [SEC_LVL]          TINYINT         NOT NULL,
    [SEC_LOCATION]     CHAR (10)       NOT NULL,
    [CHK_DIGIT_EDIT]   CHAR (1)        NOT NULL,
    [AUTO_POSITION]    CHAR (1)        NOT NULL,
    [LAST_POSITION]    DECIMAL (12)    NOT NULL,
    [REQ_CLOSE_STAT]   CHAR (10)       NOT NULL,
    [ACTION_CODE]      CHAR (10)       NOT NULL,
    [REASON]           CHAR (10)       NOT NULL,
    [AUTO_JOB_REQ]     CHAR (1)        NOT NULL,
    [AP_COMPANY]       SMALLINT        NOT NULL,
    [BSI_CONT_ALLOC]   CHAR (1)        NOT NULL,
    [CURRENCY_CODE]    CHAR (5)        NOT NULL,
    [CURR_ND]          TINYINT         NOT NULL,
    [CURRENCY_FLAG]    CHAR (1)        NOT NULL,
    [COUNTRY_CODE]     CHAR (2)        NOT NULL,
    [WORK_COUNTRY]     CHAR (2)        NOT NULL,
    [CA_REL_CORP]      CHAR (1)        NOT NULL,
    [US_REL_CORP]      CHAR (1)        NOT NULL,
    [BUS_NBR_GRP]      CHAR (4)        NOT NULL,
    [QC_ENT_NBR_GRP]   CHAR (4)        NOT NULL,
    [COUNTRY_FLAG]     CHAR (1)        NOT NULL,
    [MAX_DED_IND]      CHAR (1)        NOT NULL,
    [HIST_CORR_FLAG]   CHAR (2)        NOT NULL,
    [TAX_FORMS]        TINYINT         NOT NULL,
    [EMP_TAX_ADDR]     TINYINT         NOT NULL,
    [DUP_SOC_NBR]      CHAR (1)        NOT NULL,
    [ACTIVE_FLAG]      CHAR (1)        NOT NULL,
    [USER_ID]          CHAR (10)       NOT NULL,
    [DATE_STAMP]       DATETIME        NOT NULL,
    [TIME_STAMP]       DECIMAL (6)     NOT NULL,
    [RECRUIT_FLAG]     CHAR (2)        NOT NULL,
    [TA146_RUN_FLG]    CHAR (1)        NOT NULL,
    [TA198_RUN_FLG]    CHAR (1)        NOT NULL,
    [INCLUDE_UK121]    CHAR (1)        NOT NULL,
    [UK121_RUN_FLG]    CHAR (1)        NOT NULL,
    [EMPLOYER_DED]     CHAR (1)        NOT NULL,
    [TAX_LOC_MSGLVL]   TINYINT         NOT NULL,
    [TAX_FILTER]       TINYINT         NOT NULL,
    [UPGRADE_FLD1]     CHAR (1)        NOT NULL
);

