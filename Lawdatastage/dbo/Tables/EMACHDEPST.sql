﻿CREATE TABLE [dbo].[EMACHDEPST] (
    [COMPANY]        SMALLINT        NOT NULL,
    [EMPLOYEE]       INT             NOT NULL,
    [ACH_DIST_NBR]   SMALLINT        NOT NULL,
    [OCCURANCES]     SMALLINT        NOT NULL,
    [REMAIN_OCCUR]   SMALLINT        NOT NULL,
    [EBANK_ID]       INT             NOT NULL,
    [EBNK_ACCT_NBR]  CHAR (17)       NOT NULL,
    [ACCOUNT_TYPE]   CHAR (1)        NOT NULL,
    [ACH_PRENOTIFY]  CHAR (1)        NOT NULL,
    [NET_PERCENT]    DECIMAL (7, 3)  NOT NULL,
    [DEPOSIT_AMT]    DECIMAL (13, 2) NOT NULL,
    [DESCRIPTION]    CHAR (30)       NOT NULL,
    [CHECK_DESC]     CHAR (8)        NOT NULL,
    [BEG_DATE]       DATETIME        NOT NULL,
    [END_DATE]       DATETIME        NOT NULL,
    [DED_CYCLE_01]   CHAR (1)        NOT NULL,
    [DED_CYCLE_02]   CHAR (1)        NOT NULL,
    [DED_CYCLE_03]   CHAR (1)        NOT NULL,
    [DED_CYCLE_04]   CHAR (1)        NOT NULL,
    [DED_CYCLE_05]   CHAR (1)        NOT NULL,
    [DED_CYCLE_06]   CHAR (1)        NOT NULL,
    [DED_CYCLE_07]   CHAR (1)        NOT NULL,
    [DED_CYCLE_08]   CHAR (1)        NOT NULL,
    [DED_CYCLE_09]   CHAR (1)        NOT NULL,
    [DEFAULT_FLAG]   CHAR (1)        NOT NULL,
    [BANK_ROLL_NO]   CHAR (20)       NOT NULL,
    [ACH_DIST_ORDER] SMALLINT        NOT NULL,
    [CA_INST_NBR]    SMALLINT        NOT NULL,
    [CA_TRANSIT_NBR] INT             NOT NULL,
    [COUNTRY_CODE]   CHAR (2)        NOT NULL,
    [CURRENCY_CODE]  CHAR (5)        NOT NULL,
    [CURR_ND]        TINYINT         NOT NULL,
    [PENS_SEQ_NBR]   SMALLINT        NOT NULL,
    [NON_STD_ENTRY]  TINYINT         NOT NULL,
    [ORIG_ACCT_NBR]  CHAR (17)       NOT NULL,
    [PAYABLE_TO]     CHAR (38)       NOT NULL,
    [CREATE_DATE]    DATETIME        NOT NULL,
    [CREATE_TIME]    DECIMAL (6)     NOT NULL,
    [CREATE_USER_ID] CHAR (10)       NOT NULL,
    [DATE_STAMP]     DATETIME        NOT NULL,
    [TIME_STAMP]     DECIMAL (6)     NOT NULL,
    [USER_ID]        CHAR (10)       NOT NULL,
    [EADSET2_SS_SW]  CHAR (1)        NOT NULL,
    [EADSET3_SS_SW]  CHAR (1)        NOT NULL,
    [EADSET4_SS_SW]  CHAR (1)        NOT NULL,
    [EADSET5_SS_SW]  CHAR (1)        NOT NULL,
    [EADSET7_SS_SW]  CHAR (1)        NOT NULL,
    [EADSET8_SS_SW]  CHAR (1)        NOT NULL
);

