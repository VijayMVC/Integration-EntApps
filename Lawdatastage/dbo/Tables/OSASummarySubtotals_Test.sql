﻿CREATE TABLE [dbo].[OSASummarySubtotals_Test] (
    [PayRollCheckDate]           DATETIME        NULL,
    [PayRollPayPeriod]           VARCHAR (10)    NULL,
    [Dept]                       VARCHAR (6)     NULL,
    [DeptDescr]                  VARCHAR (50)    NULL,
    [ProviderMasterID]           INT             NULL,
    [CsuFlxIDeb]                 INT             NULL,
    [LastName]                   VARCHAR (50)    NULL,
    [FirstName]                  VARCHAR (30)    NULL,
    [MiddleName]                 VARCHAR (30)    NULL,
    [FullName]                   VARCHAR (100)   NULL,
    [PayCode]                    VARCHAR (5)     NULL,
    [PayCodeDescr]               VARCHAR (30)    NULL,
    [HourlyRate]                 DECIMAL (13, 4) NULL,
    [TotalCurrentHours]          DECIMAL (10, 2) NULL,
    [TotalCurrentEarnings]       DECIMAL (10, 2) NULL,
    [TotalYTDHours]              DECIMAL (10, 2) NULL,
    [TotalYTDEarnings]           DECIMAL (10, 2) NULL,
    [IsPayCodePerPersonSubTotal] CHAR (3)        NULL,
    [IsEmployeeSubTotal]         CHAR (3)        NULL,
    [IsSiteSubTotal]             CHAR (3)        NULL,
    [RangeStartDate]             DATETIME        NULL,
    [RangeEndDate]               DATETIME        NULL,
    [CalendarYear]               VARCHAR (4)     NULL,
    [CreateDate]                 DATETIME        NULL,
    [CurrentUnits]               DECIMAL (10, 2) NULL,
    [YTDUnits]                   DECIMAL (10, 2) NULL,
    [Client]                     CHAR (5)        NULL,
    [DisplayGroup]               TINYINT         NULL
);

