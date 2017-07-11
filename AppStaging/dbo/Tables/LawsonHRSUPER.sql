CREATE TABLE [dbo].[LawsonHRSUPER] (
    [COMPANY]       SMALLINT     NOT NULL,
    [CODE]          CHAR (10)    NOT NULL,
    [DESCRIPTION]   CHAR (30)    NOT NULL,
    [EMPLOYEE]      INT          NOT NULL,
    [OBJ_ID]        DECIMAL (12) NOT NULL,
    [EFFECT_DATE]   DATETIME     NOT NULL,
    [ACTIVE_FLAG]   CHAR (1)     NOT NULL,
    [SUPER_RPTS_TO] CHAR (10)    NOT NULL,
    [USER1]         CHAR (10)    NOT NULL,
    [USER2]         CHAR (10)    NOT NULL,
    [USER3]         CHAR (10)    NOT NULL,
    [USER4]         CHAR (10)    NOT NULL,
    [USER5]         CHAR (10)    NOT NULL,
    [HSUSET4_SS_SW] CHAR (1)     NOT NULL
);

