CREATE TABLE [dbo].[CPAC_r_eval] (
    [id]                   INT            NOT NULL,
    [evalID]               CHAR (10)      NULL,
    [regID]                VARCHAR (50)   NULL,
    [eval_based_upon]      VARCHAR (50)   NULL,
    [comment_overall]      VARCHAR (1000) NULL,
    [comment_CEP_standard] VARCHAR (1000) NULL,
    [leadership]           CHAR (10)      NULL,
    [reason_leadership]    VARCHAR (1000) NULL,
    [performance]          CHAR (10)      NULL,
    [reason_performance]   VARCHAR (1000) NULL,
    [recommend]            CHAR (10)      NULL,
    [reason_recommend]     VARCHAR (1000) NULL,
    [director_signature]   VARCHAR (50)   NOT NULL,
    [director_date]        VARCHAR (50)   NOT NULL
);

