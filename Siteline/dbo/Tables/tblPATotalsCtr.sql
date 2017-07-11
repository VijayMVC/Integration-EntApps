CREATE TABLE [dbo].[tblPATotalsCtr] (
    [PATotalsID]         INT           IDENTITY (1, 1) NOT NULL,
    [CtrID]              INT           NULL,
    [Date]               SMALLDATETIME NULL,
    [SumOfLbrTotalHours] FLOAT (53)    NULL,
    CONSTRAINT [PK_tblPATotalsCtr] PRIMARY KEY NONCLUSTERED ([PATotalsID] ASC) WITH (FILLFACTOR = 90)
);

