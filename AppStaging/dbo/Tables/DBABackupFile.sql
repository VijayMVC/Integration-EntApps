CREATE TABLE [dbo].[DBABackupFile] (
    [FileID]           INT             IDENTITY (1, 1) NOT NULL,
    [FullFileName]     NVARCHAR (2048) NOT NULL,
    [FolderLocation]   NVARCHAR (2048) NULL,
    [FileDateTime]     DATETIME        NULL,
    [FileSizeInBytes]  BIGINT          NULL,
    [FileExtension]    NVARCHAR (20)   NULL,
    [FileDatabaseName] NVARCHAR (2048) NULL,
    [DBServerName]     NVARCHAR (50)   NULL,
    [CreDate]          DATETIME        DEFAULT (getdate()) NULL
);

