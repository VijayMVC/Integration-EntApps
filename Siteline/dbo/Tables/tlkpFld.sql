CREATE TABLE [dbo].[tlkpFld] (
    [FldID]      VARCHAR (50) NOT NULL,
    [FldCaption] VARCHAR (50) NULL,
    [FldFlagYN]  BIT          CONSTRAINT [DF_tlkpFld_FldFlagYN] DEFAULT (0) NULL,
    CONSTRAINT [PK_tlkpFld] PRIMARY KEY NONCLUSTERED ([FldID] ASC) WITH (FILLFACTOR = 90)
);

