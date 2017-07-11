CREATE TABLE [dbo].[DeptLookupArchive] (
    [StaffGroup]      VARCHAR (4)  NOT NULL,
    [DeptId]          CHAR (5)     NOT NULL,
    [DeptCode]        VARCHAR (10) NULL,
    [DeptDescription] CHAR (30)    NOT NULL,
    [LoadDate]        DATETIME     NOT NULL
);

