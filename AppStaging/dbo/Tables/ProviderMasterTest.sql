CREATE TABLE [dbo].[ProviderMasterTest] (
    [GROSS_PAY]      DECIMAL (13, 2) NOT NULL,
    [NET_PAY_AMT]    DECIMAL (13, 2) NOT NULL,
    [LAST_NAME]      CHAR (30)       NOT NULL,
    [FIRST_NAME]     CHAR (15)       NOT NULL,
    [NICK_NAME]      CHAR (30)       NOT NULL,
    [PRO_RATE_TOTAL] DECIMAL (13, 4) NOT NULL,
    [PRO_RATE_A_SAL] DECIMAL (13, 4) NOT NULL,
    [DEPARTMENT]     CHAR (5)        NOT NULL
);

