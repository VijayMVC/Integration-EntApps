CREATE TABLE [dbo].[LawsonHREMPUSF] (
    [COMPANY]       SMALLINT        NOT NULL,
    [EMP_APP]       TINYINT         NOT NULL,
    [EMPLOYEE]      INT             NOT NULL,
    [FIELD_KEY]     CHAR (2)        NOT NULL,
    [A_FIELD]       CHAR (10)       NOT NULL,
    [N_FIELD]       DECIMAL (11, 2) NOT NULL,
    [D_FIELD]       DATETIME        NOT NULL,
    [CURRENCY_CODE] CHAR (5)        NOT NULL,
    [CURR_ND]       TINYINT         NOT NULL,
    [BASE_CURRENCY] CHAR (5)        NOT NULL,
    [BASE_ND]       TINYINT         NOT NULL,
    [BASE_AMOUNT]   DECIMAL (15, 2) NOT NULL,
    [HEUSET3_SS_SW] CHAR (1)        NOT NULL
);

