CREATE TABLE [dbo].[tblRgn] (
    [RgnID]           INT          IDENTITY (1, 1) NOT NULL,
    [RgnDir_CntID]    INT          NULL,
    [RgnDirAss_CntID] INT          NULL,
    [RgnAss_CntID]    INT          NULL,
    [RgnName]         VARCHAR (50) NULL,
    [RgnTimeStamp]    ROWVERSION   NULL
);

