CREATE TABLE [dbo].[ReportPayrollExceptions] (
    [AuditMessage]     VARCHAR (200) NULL,
    [WebUsername]      VARCHAR (50)  NULL,
    [TimecardDate]     DATETIME      NULL,
    [LastName]         VARCHAR (60)  NULL,
    [FirstName]        VARCHAR (60)  NULL,
    [Title]            VARCHAR (20)  NULL,
    [ScheduleDate]     DATETIME      NULL,
    [SiteLocationName] VARCHAR (100) NULL,
    [ScheduleYear]     VARCHAR (10)  NULL,
    [ScheduleMonth]    VARCHAR (10)  NULL,
    [PAorMD]           VARCHAR (2)   NULL,
    [TCOrphanFlag]     CHAR (1)      NULL,
    [Credate]          DATETIME      NULL
);

