CREATE TABLE [dbo].[POLL_answers] (
    [A_ID]       INT             NOT NULL,
    [Survey_ID]  CHAR (30)       NOT NULL,
    [Q_ID]       CHAR (10)       NOT NULL,
    [authorName] NVARCHAR (80)   NULL,
    [webID]      VARCHAR (50)    NULL,
    [ageInMonth] INT             NULL,
    [A_1]        NVARCHAR (2000) NULL,
    [A_2]        CHAR (10)       NULL,
    [date_post]  DATETIME        NULL
);

