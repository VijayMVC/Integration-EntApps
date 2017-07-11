CREATE TABLE [dbo].[tlkpHlthPln] (
    [HlthPlnID]      INT          IDENTITY (1, 1) NOT NULL,
    [HlthPlnName]    VARCHAR (50) NOT NULL,
    [HlthPlnComment] TEXT         NULL,
    CONSTRAINT [PK_tlkpHlthPln] PRIMARY KEY NONCLUSTERED ([HlthPlnName] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [HlthPlnID]
    ON [dbo].[tlkpHlthPln]([HlthPlnID] ASC) WITH (FILLFACTOR = 90);

