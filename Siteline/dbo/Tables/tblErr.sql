CREATE TABLE [dbo].[tblErr] (
    [ErrID]          INT           IDENTITY (1, 1) NOT NULL,
    [ErrDescription] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblErr] PRIMARY KEY CLUSTERED ([ErrID] ASC)
);

