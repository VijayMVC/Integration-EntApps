CREATE TABLE [dbo].[tblGlbStt] (
    [GlbSttID]     INT        IDENTITY (1, 1) NOT NULL,
    [GlbSttNote]   TEXT       NULL,
    [GlbTimeStamp] ROWVERSION NULL,
    CONSTRAINT [PK_tblGlbStt] PRIMARY KEY NONCLUSTERED ([GlbSttID] ASC) WITH (FILLFACTOR = 90)
);

