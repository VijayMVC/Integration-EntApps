CREATE TABLE [dbo].[StipendPay] (
    [EMPLOYEE]         INT             NOT NULL,
    [ProviderMasterID] INT             NULL,
    [LAST_NAME]        CHAR (30)       NOT NULL,
    [FIRST_NAME]       CHAR (15)       NOT NULL,
    [PAY_SUM_GRP]      CHAR (3)        NOT NULL,
    [DESCRIPTION]      CHAR (30)       NOT NULL,
    [WAGE_AMOUNT]      DECIMAL (13, 2) NOT NULL,
    [TR_DATE]          DATETIME        NOT NULL,
    [CHECK_ID]         DECIMAL (12)    NULL,
    [CHECK_DATE]       DATETIME        NULL,
    [PROCESS_LEVEL]    CHAR (5)        NOT NULL,
    [CHECK_NBR]        INT             NOT NULL
);

