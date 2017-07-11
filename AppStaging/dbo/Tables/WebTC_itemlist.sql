CREATE TABLE [dbo].[WebTC_itemlist] (
    [id]            INT           NOT NULL,
    [siteCode]      CHAR (4)      NULL,
    [TCitemlist]    VARCHAR (100) NULL,
    [lockAvailDate] CHAR (4)      NULL,
    [lockTCdate]    CHAR (4)      NULL,
    [maxShiftNum]   CHAR (4)      NULL,
    [ts]            SMALLDATETIME NULL,
    [userName]      CHAR (10)     NULL
);

