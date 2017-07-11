CREATE TABLE [dbo].[DBADBBackupInfo] (
    [ServerName]        NVARCHAR (255) NULL,
    [DatabaseName]      NVARCHAR (255) NULL,
    [BackupFolder]      NVARCHAR (255) NULL,
    [FullBackup]        NVARCHAR (255) NULL,
    [TransactionBackup] NVARCHAR (255) NULL,
    [LastFullBackup]    DATETIME       NULL,
    [LastLogBackup]     DATETIME       NULL,
    [FullBackupAgeDays] NVARCHAR (255) NULL,
    [LogBackupAgeHours] NVARCHAR (255) NULL
);

