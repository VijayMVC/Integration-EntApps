CREATE TABLE [dbo].[MDSummarySubtotals_2014] (
    [PayRollCheckDate]   DATETIME        NULL,
    [PayRollPayPeriod]   VARCHAR (10)    NULL,
    [Dept]               VARCHAR (6)     NULL,
    [DeptDescr]          VARCHAR (50)    NULL,
    [PayCode]            VARCHAR (5)     NULL,
    [PayCodeDescr]       VARCHAR (30)    NULL,
    [PayGroup]           VARCHAR (5)     NULL,
    [PayGroupDescr]      VARCHAR (30)    NULL,
    [TotalHours]         DECIMAL (10, 2) NULL,
    [TotalEarnings]      DECIMAL (10, 2) NULL,
    [IsPayCodeSubTotal]  CHAR (3)        NULL,
    [IsPayGroupSubTotal] CHAR (3)        NULL,
    [IsSiteSubTotal]     CHAR (3)        NULL,
    [RangeStartDate]     DATETIME        NULL,
    [RangeEndDate]       DATETIME        NULL,
    [CalendarYear]       VARCHAR (4)     NULL,
    [CreateDate]         DATETIME        NULL
);

