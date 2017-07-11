CREATE TABLE [dbo].[tlkpWebPage] (
    [WebPageID]  TINYINT       NOT NULL,
    [WebPageUrl] VARCHAR (250) NULL,
    CONSTRAINT [PK_tlkpWebPage] PRIMARY KEY NONCLUSTERED ([WebPageID] ASC) WITH (FILLFACTOR = 90)
);

