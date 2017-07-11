CREATE TABLE [dbo].[ProviderHoursDetail_MonthEnd] (
    [Site]             CHAR (4)        NULL,
    [SiteName]         VARCHAR (200)   NULL,
    [ProviderMasterID] INT             NULL,
    [LastName]         VARCHAR (50)    NULL,
    [FirstName]        VARCHAR (50)    NULL,
    [WebID]            INT             NULL,
    [DateOfService]    DATETIME        NULL,
    [Month]            CHAR (6)        NULL,
    [TimeStart]        DECIMAL (10, 2) NULL,
    [TimeEnd]          DECIMAL (10, 2) NULL,
    [TotalHours]       DECIMAL (10, 2) NULL,
    [PAFlag]           CHAR (1)        NULL,
    [ShiftFlag]        CHAR (1)        NULL,
    [isFTK]            CHAR (1)        NULL,
    [CreDate]          DATETIME        NULL,
    [UpdDate]          DATETIME        NULL,
    [LOADDATE]         DATETIME        CONSTRAINT [DF_ProviderHoursDetail_MonthEnd_LOADDATE] DEFAULT (getdate()) NULL
);

