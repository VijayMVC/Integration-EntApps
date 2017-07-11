CREATE TABLE [dbo].[LawsonHRUSERFLDS] (
    [FIELD_KEY]     CHAR (2)        NOT NULL,
    [FIELD_NAME]    CHAR (20)       NOT NULL,
    [FIELD_TYPE]    CHAR (1)        NOT NULL,
    [BEG_NUMBER]    DECIMAL (11, 2) NOT NULL,
    [END_NUMBER]    DECIMAL (11, 2) NOT NULL,
    [BEG_DATE]      DATETIME        NOT NULL,
    [END_DATE]      DATETIME        NOT NULL,
    [PERS_ACTION]   CHAR (1)        NOT NULL,
    [LOG_FLAG]      CHAR (1)        NOT NULL,
    [REQ_FLAG]      CHAR (1)        NOT NULL,
    [SEC_LEVEL]     TINYINT         NOT NULL,
    [R_INDICATOR]   CHAR (1)        NOT NULL,
    [REQ_VALUE]     CHAR (1)        NOT NULL,
    [CURRENCY_FLAG] CHAR (1)        NOT NULL,
    [ACTIVE_FLAG]   CHAR (1)        NOT NULL,
    [HRUSET3_SS_SW] CHAR (1)        NOT NULL,
    [HRUSET4_SS_SW] CHAR (1)        NOT NULL
);

