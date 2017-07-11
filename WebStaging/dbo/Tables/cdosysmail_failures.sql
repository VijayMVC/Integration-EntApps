CREATE TABLE [dbo].[cdosysmail_failures] (
    [Date of Failure]        DATETIME       NULL,
    [Spid]                   INT            NULL,
    [From]                   VARCHAR (100)  NULL,
    [To]                     VARCHAR (100)  NULL,
    [Subject]                VARCHAR (100)  NULL,
    [Body]                   VARCHAR (4000) NULL,
    [iMsg]                   INT            NULL,
    [Hr]                     INT            NULL,
    [Source of Failure]      VARCHAR (255)  NULL,
    [Description of Failure] VARCHAR (500)  NULL,
    [Output from Failure]    VARCHAR (1000) NULL,
    [Comment about Failure]  VARCHAR (50)   NULL
);

