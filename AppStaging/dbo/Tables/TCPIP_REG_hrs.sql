CREATE TABLE [dbo].[TCPIP_REG_hrs] (
    [id]       INT            NOT NULL,
    [webid]    VARCHAR (50)   NOT NULL,
    [dat]      DATETIME       NOT NULL,
    [hrs]      VARCHAR (50)   NOT NULL,
    [hrs2]     VARCHAR (50)   NULL,
    [hrs3]     VARCHAR (50)   NULL,
    [hrs4]     VARCHAR (50)   NULL,
    [hourType] VARCHAR (50)   NULL,
    [site]     VARCHAR (50)   NULL,
    [cmt]      VARCHAR (2000) NOT NULL
);

