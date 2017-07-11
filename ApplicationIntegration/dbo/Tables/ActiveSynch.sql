CREATE TABLE [dbo].[ActiveSynch] (
    [UserDisplayName] NVARCHAR (255) NULL,
    [Domain]          NVARCHAR (255) NULL,
    [Company]         NVARCHAR (255) NULL,
    [LastName]        NVARCHAR (255) NULL,
    [firstname]       NVARCHAR (255) NULL,
    [MPID]            INT            NULL,
    [DeviceModel]     NVARCHAR (255) NULL,
    [DeviceType]      NVARCHAR (255) NULL,
    [OS]              NVARCHAR (255) NULL,
    [FirstSyncTime]   SMALLDATETIME  NULL,
    [F11]             NVARCHAR (255) NULL,
    [F12]             NVARCHAR (255) NULL
);

