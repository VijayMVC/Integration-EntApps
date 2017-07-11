CREATE TABLE [dbo].[tlkpSbj] (
    [SbjID]      INT          IDENTITY (1, 1) NOT NULL,
    [SbjName]    VARCHAR (50) NOT NULL,
    [SbjComment] TEXT         NULL,
    CONSTRAINT [PK_tlkpSbj] PRIMARY KEY NONCLUSTERED ([SbjID] ASC) WITH (FILLFACTOR = 90)
);

