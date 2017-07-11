CREATE TABLE [dbo].[PANP_lookup] (
    [id]                 INT            NOT NULL,
    [evalee]             CHAR (10)      NULL,
    [medDir]             VARCHAR (200)  NULL,
    [regDir]             VARCHAR (50)   NULL,
    [leadPA]             VARCHAR (50)   NULL,
    [siteCode]           CHAR (10)      NULL,
    [evalBatchID]        VARCHAR (50)   NULL,
    [headerID]           CHAR (10)      NULL,
    [status_self]        VARCHAR (50)   NULL,
    [status_MD]          VARCHAR (50)   NULL,
    [status_RD]          VARCHAR (50)   NULL,
    [selfCommentOnMD]    VARCHAR (7000) NULL,
    [selfCommentOnMDts]  VARCHAR (50)   NULL,
    [isNewHire]          VARCHAR (50)   NULL,
    [referToCommittee]   VARCHAR (50)   NULL,
    [mandatory]          VARCHAR (50)   NULL,
    [adminCommentOnMD]   VARCHAR (5000) NULL,
    [adminCommentOnMDTS] DATETIME       NULL,
    [lastUpdated]        DATETIME       NULL,
    [reEval]             VARCHAR (10)   NULL
);

