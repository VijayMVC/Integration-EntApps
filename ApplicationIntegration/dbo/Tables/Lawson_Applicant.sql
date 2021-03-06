﻿CREATE TABLE [dbo].[Lawson_Applicant] (
    [COMPANY]          SMALLINT        NOT NULL,
    [APPLICANT]        INT             NOT NULL,
    [LAST_NAME]        CHAR (30)       NOT NULL,
    [FIRST_NAME]       CHAR (15)       NOT NULL,
    [MIDDLE_NAME]      CHAR (15)       NOT NULL,
    [MIDDLE_INIT]      CHAR (1)        NOT NULL,
    [NICK_NAME]        CHAR (30)       NOT NULL,
    [ADDR1]            CHAR (30)       NOT NULL,
    [ADDR2]            CHAR (30)       NOT NULL,
    [ADDR3]            CHAR (30)       NOT NULL,
    [ADDR4]            CHAR (30)       NOT NULL,
    [CITY]             CHAR (18)       NOT NULL,
    [STATE]            CHAR (2)        NOT NULL,
    [ZIP]              CHAR (10)       NOT NULL,
    [HM_PHONE_CNTRY]   CHAR (6)        NOT NULL,
    [HM_PHONE_NBR]     CHAR (15)       NOT NULL,
    [WK_PHONE_CNTRY]   CHAR (6)        NOT NULL,
    [WK_PHONE_NBR]     CHAR (15)       NOT NULL,
    [WK_PHONE_EXT]     CHAR (5)        NOT NULL,
    [FAX_COUNTRY]      CHAR (6)        NOT NULL,
    [FAX_NBR]          CHAR (15)       NOT NULL,
    [FAX_EXT]          CHAR (5)        NOT NULL,
    [DATE_HIRED]       DATETIME        NOT NULL,
    [APP_STATUS]       CHAR (2)        NOT NULL,
    [FICA_NBR]         CHAR (20)       NOT NULL,
    [DATE_APPLIED]     DATETIME        NOT NULL,
    [HIRE_SOURCE]      CHAR (10)       NOT NULL,
    [REF_LST_NAME]     CHAR (30)       NOT NULL,
    [REF_FST_NAME]     CHAR (15)       NOT NULL,
    [REF_MID_INIT]     CHAR (1)        NOT NULL,
    [FINDERS_FEE]      DECIMAL (10)    NOT NULL,
    [PREV_APPLY]       CHAR (1)        NOT NULL,
    [PREV_LOCATION]    CHAR (30)       NOT NULL,
    [PREV_DATE]        DATETIME        NOT NULL,
    [PREV_EMPLOY]      CHAR (1)        NOT NULL,
    [PREV_EMP_NBR]     INT             NOT NULL,
    [PREV_LOC_WORK]    CHAR (30)       NOT NULL,
    [PREV_BEG_DATE]    DATETIME        NOT NULL,
    [PREV_END_DATE]    DATETIME        NOT NULL,
    [RATING]           CHAR (10)       NOT NULL,
    [FORMER_LST_NM]    CHAR (30)       NOT NULL,
    [FORMER_FST_NM]    CHAR (15)       NOT NULL,
    [FORMER_MI]        CHAR (1)        NOT NULL,
    [PREV_ADDR1]       CHAR (30)       NOT NULL,
    [PREV_ADDR2]       CHAR (30)       NOT NULL,
    [PREV_ADDR3]       CHAR (30)       NOT NULL,
    [PREV_ADDR4]       CHAR (30)       NOT NULL,
    [PREV_CITY]        CHAR (18)       NOT NULL,
    [PREV_STATE]       CHAR (2)        NOT NULL,
    [PREV_ZIP]         CHAR (10)       NOT NULL,
    [PREV_CNTRY_CD]    CHAR (2)        NOT NULL,
    [EEO_CLASS]        CHAR (4)        NOT NULL,
    [SEX]              CHAR (1)        NOT NULL,
    [AGE_FLAG]         CHAR (1)        NOT NULL,
    [HANDICAP_ID]      CHAR (1)        NOT NULL,
    [JOB1]             CHAR (9)        NOT NULL,
    [JOB2]             CHAR (9)        NOT NULL,
    [JOB3]             CHAR (9)        NOT NULL,
    [BEG_PAY]          DECIMAL (11, 2) NOT NULL,
    [END_PAY]          DECIMAL (11, 2) NOT NULL,
    [DATE_AVAIL]       DATETIME        NOT NULL,
    [VETERAN]          CHAR (4)        NOT NULL,
    [DRAFT_STATUS]     CHAR (3)        NOT NULL,
    [FINAL_RANK]       CHAR (3)        NOT NULL,
    [CUR_STATUS]       CHAR (2)        NOT NULL,
    [LAST_PHYSICAL]    DATETIME        NOT NULL,
    [WK_RST_CODE1]     CHAR (10)       NOT NULL,
    [WK_RST_CODE2]     CHAR (10)       NOT NULL,
    [WK_RST_CODE3]     CHAR (10)       NOT NULL,
    [WK_RST_CODE4]     CHAR (10)       NOT NULL,
    [RESUME]           CHAR (1)        NOT NULL,
    [LAST_COM_SEQ]     SMALLINT        NOT NULL,
    [LAST_REF_SEQ]     SMALLINT        NOT NULL,
    [LAST_INT_SEQ]     SMALLINT        NOT NULL,
    [LAST_MIL_SEQ]     SMALLINT        NOT NULL,
    [LAST_EPC_SEQ]     SMALLINT        NOT NULL,
    [POSITION1]        CHAR (12)       NOT NULL,
    [POSITION2]        CHAR (12)       NOT NULL,
    [POSITION3]        CHAR (12)       NOT NULL,
    [PROCESS_LEVEL]    CHAR (5)        NOT NULL,
    [EMP_STATUS]       CHAR (2)        NOT NULL,
    [WORK_SCHED]       CHAR (10)       NOT NULL,
    [SEC_LVL]          TINYINT         NOT NULL,
    [SEC_LOCATION]     CHAR (10)       NOT NULL,
    [NBR_FTE]          DECIMAL (7, 6)  NOT NULL,
    [PIN]              CHAR (10)       NOT NULL,
    [ELIG_WORK]        CHAR (1)        NOT NULL,
    [TRAV_AVAIL]       CHAR (1)        NOT NULL,
    [TRAV_PCT]         SMALLINT        NOT NULL,
    [RELOC_AVAIL]      CHAR (1)        NOT NULL,
    [OT_AVAIL]         CHAR (1)        NOT NULL,
    [EMAIL_ADDRESS]    CHAR (60)       NOT NULL,
    [DATE_STAMP]       DATETIME        NOT NULL,
    [TIME_STAMP]       DECIMAL (6)     NOT NULL,
    [USER_ID]          CHAR (10)       NOT NULL,
    [EMPLOYEE]         INT             NOT NULL,
    [CURRENCY_CODE]    CHAR (5)        NOT NULL,
    [CURR_ND]          TINYINT         NOT NULL,
    [COUNTRY_CODE]     CHAR (2)        NOT NULL,
    [BIRTHDATE]        DATETIME        NOT NULL,
    [LANGUAGE_CODE]    CHAR (10)       NOT NULL,
    [NAME_PREFIX]      CHAR (4)        NOT NULL,
    [NAME_SUFFIX]      CHAR (4)        NOT NULL,
    [DISABILITY]       CHAR (10)       NOT NULL,
    [BASE_BEG_PAY]     DECIMAL (11, 2) NOT NULL,
    [BASE_END_PAY]     DECIMAL (11, 2) NOT NULL,
    [BASE_CURRENCY]    CHAR (5)        NOT NULL,
    [BASE_ND]          TINYINT         NOT NULL,
    [BASE_FEE]         DECIMAL (10)    NOT NULL,
    [CURR_CODE_2]      CHAR (5)        NOT NULL,
    [CURR_CODE_ND_2]   TINYINT         NOT NULL,
    [RELIGION]         CHAR (10)       NOT NULL,
    [LAST_NAME_PRE]    CHAR (30)       NOT NULL,
    [CONSENT]          CHAR (1)        NOT NULL,
    [COUNTY]           CHAR (25)       NOT NULL,
    [SUPP_ADDR1]       CHAR (30)       NOT NULL,
    [SUPP_ADDR2]       CHAR (30)       NOT NULL,
    [SUPP_ADDR3]       CHAR (30)       NOT NULL,
    [SUPP_ADDR4]       CHAR (30)       NOT NULL,
    [SUPP_CITY]        CHAR (18)       NOT NULL,
    [SUPP_STATE]       CHAR (2)        NOT NULL,
    [SUPP_ZIP]         CHAR (10)       NOT NULL,
    [SUPP_CNTRY_CD]    CHAR (2)        NOT NULL,
    [SUPP_PHONE_CNT]   CHAR (6)        NOT NULL,
    [SUPP_PHONE_NBR]   CHAR (15)       NOT NULL,
    [REQ_FILLED]       INT             NOT NULL,
    [POS_FILLED]       CHAR (12)       NOT NULL,
    [JOB_FILLED]       CHAR (9)        NOT NULL,
    [HIRED_PAY_RATE]   DECIMAL (13, 4) NOT NULL,
    [SUPERVISOR]       CHAR (10)       NOT NULL,
    [NBR_FTE_HIRED]    DECIMAL (7, 6)  NOT NULL,
    [BIRTH_CITY]       CHAR (18)       NOT NULL,
    [BIRTH_STATE]      CHAR (2)        NOT NULL,
    [BIRTH_CNTRY_CD]   CHAR (2)        NOT NULL,
    [VISIBLE_MIN]      CHAR (1)        NOT NULL,
    [ABORIGINAL]       CHAR (1)        NOT NULL,
    [DEPARTMENT]       CHAR (5)        NOT NULL,
    [UNION_CODE]       CHAR (10)       NOT NULL,
    [BARGAIN_UNIT]     CHAR (10)       NOT NULL,
    [SUPERVISOR_IND]   CHAR (10)       NOT NULL,
    [I9_STATUS]        CHAR (10)       NOT NULL,
    [I9_ALIEN_NBR]     CHAR (11)       NOT NULL,
    [I9_STA_EXP_DT]    DATETIME        NOT NULL,
    [I9_ADMIT_NBR]     CHAR (13)       NOT NULL,
    [I9_AUTHORIZE]     CHAR (30)       NOT NULL,
    [I9_DOC_TYPE_01]   CHAR (10)       NOT NULL,
    [I9_DOC_TYPE_02]   CHAR (10)       NOT NULL,
    [I9_DOC_DESCR_01]  CHAR (10)       NOT NULL,
    [I9_DOC_DESCR_02]  CHAR (10)       NOT NULL,
    [I9_DOC_NBR_01]    CHAR (20)       NOT NULL,
    [I9_DOC_NBR_02]    CHAR (20)       NOT NULL,
    [I9_DOC_EXP_DT_01] DATETIME        NOT NULL,
    [I9_DOC_EXP_DT_02] DATETIME        NOT NULL,
    [SALARY_CLASS]     CHAR (1)        NOT NULL,
    [PAY_FREQUENCY]    TINYINT         NOT NULL,
    [EXEMPT_EMP]       CHAR (1)        NOT NULL,
    [OT_PLAN_CODE]     CHAR (4)        NOT NULL,
    [SCHEDULE]         CHAR (9)        NOT NULL,
    [PAY_GRADE]        CHAR (3)        NOT NULL,
    [PAY_STEP]         SMALLINT        NOT NULL,
    [ANNUAL_HOURS]     SMALLINT        NOT NULL,
    [LOCAT_CODE]       CHAR (10)       NOT NULL,
    [HM_DIST_CO]       SMALLINT        NOT NULL,
    [HM_ACCT_UNIT]     CHAR (15)       NOT NULL,
    [HM_ACCOUNT]       INT             NOT NULL,
    [HM_SUB_ACCT]      SMALLINT        NOT NULL,
    [ACTIVITY]         CHAR (15)       NOT NULL,
    [ACCT_CATEGORY]    CHAR (5)        NOT NULL,
    [SUPP_COUNTY]      CHAR (25)       NOT NULL,
    [L_INDEX]          CHAR (4)        NOT NULL,
    [APLSET4_SS_SW]    CHAR (1)        NOT NULL,
    [L_ATAPL_SS_SW]    CHAR (1)        NOT NULL
);

