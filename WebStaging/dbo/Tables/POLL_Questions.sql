CREATE TABLE [dbo].[POLL_Questions] (
    [Q_ID]      INT            NOT NULL,
    [Survey_ID] CHAR (30)      NOT NULL,
    [Q_format]  CHAR (1)       NULL,
    [Q_caption] NVARCHAR (800) NULL,
    [Q_order]   INT            NULL
);

