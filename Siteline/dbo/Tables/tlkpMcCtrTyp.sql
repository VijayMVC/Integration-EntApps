CREATE TABLE [dbo].[tlkpMcCtrTyp] (
    [McCtrTypID]      INT          IDENTITY (1, 1) NOT NULL,
    [McCtrTypName]    VARCHAR (50) NOT NULL,
    [McCtrTypComment] TEXT         NULL,
    CONSTRAINT [PK_tlkpMcCtrTyp] PRIMARY KEY NONCLUSTERED ([McCtrTypID] ASC) WITH (FILLFACTOR = 90)
);

