CREATE TABLE [dbo].[CPAC_lookup] (
    [id]                INT            NOT NULL,
    [evalee]            CHAR (10)      NULL,
    [medDir]            CHAR (10)      NULL,
    [regDir]            CHAR (10)      NULL,
    [siteCode]          CHAR (10)      NULL,
    [evalBatchID]       CHAR (50)      NULL,
    [headerID]          CHAR (10)      NULL,
    [status_self]       CHAR (10)      NULL,
    [status_MD]         CHAR (10)      NULL,
    [status_RD]         CHAR (10)      NULL,
    [selfCommentOnMD]   VARCHAR (8000) NULL,
    [selfCommentOnMDts] NVARCHAR (50)  NULL
);

