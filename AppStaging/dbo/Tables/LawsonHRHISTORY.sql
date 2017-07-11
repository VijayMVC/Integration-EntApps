CREATE TABLE [dbo].[LawsonHRHISTORY] (
    [COMPANY]       SMALLINT        NOT NULL,
    [EMPLOYEE]      INT             NOT NULL,
    [OBJ_ID]        DECIMAL (12)    NOT NULL,
    [FLD_NBR]       SMALLINT        NOT NULL,
    [BEG_DATE]      DATETIME        NOT NULL,
    [SEQ_NBR]       SMALLINT        NOT NULL,
    [N_VALUE]       DECIMAL (15, 6) NOT NULL,
    [A_VALUE]       CHAR (30)       NOT NULL,
    [D_VALUE]       DATETIME        NOT NULL,
    [ACT_OBJ_ID]    DECIMAL (12)    NOT NULL,
    [USER_ID]       CHAR (10)       NOT NULL,
    [DATE_STAMP]    DATETIME        NOT NULL,
    [TIME_STAMP]    DECIMAL (6)     NOT NULL,
    [DATA_TYPE]     CHAR (1)        NOT NULL,
    [POS_LEVEL]     SMALLINT        NOT NULL,
    [CURRENCY_CODE] CHAR (5)        NOT NULL,
    [CURR_ND]       TINYINT         NOT NULL,
    [HRHSET4_SS_SW] CHAR (1)        NOT NULL
);

