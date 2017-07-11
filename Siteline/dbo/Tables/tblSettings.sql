CREATE TABLE [dbo].[tblSettings] (
    [SetID]       TINYINT  NOT NULL,
    [SetLogOffYN] BIT      CONSTRAINT [DF_tblSettings_SetLogOffYN] DEFAULT (0) NOT NULL,
    [SetLockDate] DATETIME NULL,
    CONSTRAINT [PK_tblSettings] PRIMARY KEY NONCLUSTERED ([SetID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CK_tblSettings] CHECK ([SetLockDate] >= '12/1/2007')
);

