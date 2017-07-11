﻿CREATE TABLE [dbo].[tblSts] (
    [StsID]   INT      IDENTITY (1, 1) NOT NULL,
    [StsTime] DATETIME NULL,
    CONSTRAINT [PK_tblSts] PRIMARY KEY NONCLUSTERED ([StsID] ASC) WITH (FILLFACTOR = 90)
);

