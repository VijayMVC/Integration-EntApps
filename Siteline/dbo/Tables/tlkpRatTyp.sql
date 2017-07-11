CREATE TABLE [dbo].[tlkpRatTyp] (
    [RatTypID]      INT          IDENTITY (1, 1) NOT NULL,
    [RatTypName]    VARCHAR (50) NOT NULL,
    [RatTypComment] VARCHAR (50) NULL,
    CONSTRAINT [PK_tlkpRatTyp] PRIMARY KEY NONCLUSTERED ([RatTypName] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RatTypID]
    ON [dbo].[tlkpRatTyp]([RatTypID] ASC) WITH (FILLFACTOR = 90);

