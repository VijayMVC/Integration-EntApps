CREATE TABLE [dbo].[tlkpFeeSchYr] (
    [FeeSchYrID]   INT          IDENTITY (1, 1) NOT NULL,
    [FeeSchYrName] VARCHAR (15) NOT NULL,
    PRIMARY KEY CLUSTERED ([FeeSchYrID] ASC) WITH (FILLFACTOR = 90)
);

