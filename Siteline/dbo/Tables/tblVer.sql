CREATE TABLE [dbo].[tblVer] (
    [VerID]   INT          NOT NULL,
    [VerDate] DATETIME     NOT NULL,
    [VerNum]  VARCHAR (10) NULL,
    CONSTRAINT [PK_tblVer] PRIMARY KEY NONCLUSTERED ([VerID] ASC) WITH (FILLFACTOR = 90)
);

