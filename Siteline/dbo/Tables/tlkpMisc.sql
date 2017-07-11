CREATE TABLE [dbo].[tlkpMisc] (
    [MiscID]   INT       NOT NULL,
    [MiscText] CHAR (40) NOT NULL,
    CONSTRAINT [PK_tlkpMisc] PRIMARY KEY CLUSTERED ([MiscID] ASC) WITH (FILLFACTOR = 90)
);

