﻿CREATE TABLE [dbo].[PracticeLookup] (
    [Practice]              CHAR (3)        NULL,
    [ParPracticeCode]       CHAR (3)        NULL,
    [PracOnlyName]          VARCHAR (100)   NULL,
    [LocationGroup]         VARCHAR (30)    NULL,
    [AreaGrouping]          VARCHAR (50)    NULL,
    [HospitalGroup]         VARCHAR (100)   NULL,
    [Region]                VARCHAR (50)    NULL,
    [RegionalDirector]      VARCHAR (40)    NULL,
    [MedicalDirector]       VARCHAR (50)    NULL,
    [ReimbursementDirector] VARCHAR (50)    NULL,
    [CEPFlag]               CHAR (1)        NULL,
    [MedicareRegion]        VARCHAR (50)    NULL,
    [AB75County]            VARCHAR (50)    NULL,
    [MBSIBilledSiteFlag]    CHAR (1)        NULL,
    [ActiveInactive]        VARCHAR (15)    NULL,
    [PracShortName]         VARCHAR (50)    NULL,
    [AverageMonthlyVolume]  DECIMAL (18, 4) NULL,
    [DivisionManager]       VARCHAR (50)    NULL,
    [Supervisor]            VARCHAR (50)    NULL,
    [MedicalDirectorCalc]   DECIMAL (18, 1) NULL,
    [Timeliness]            DECIMAL (18, 1) NULL,
    [Dictation]             DECIMAL (18, 1) NULL,
    [PreVerifyInsCard]      DECIMAL (18, 1) NULL,
    [ChartAssembly]         DECIMAL (18, 1) NULL,
    [ChartComplete]         DECIMAL (18, 1) NULL,
    [WIPMissingCharts]      DECIMAL (18, 1) NULL,
    [OnsiteCoder]           CHAR (1)        NULL,
    [OnsiteChartChaser]     CHAR (1)        NULL,
    [TotalIndex]            DECIMAL (18, 6) NULL,
    [SiteIndex]             DECIMAL (18, 6) NULL,
    [IndexAsPercentOfOne]   DECIMAL (18, 6) NULL,
    [DivisionTeam]          VARCHAR (5)     NULL,
    [DivisionName]          VARCHAR (25)    NULL,
    [Team]                  CHAR (1)        NULL,
    [AB75InsKey]            INT             NULL,
    [CreDate]               DATETIME        NULL,
    [UpdDate]               DATETIME        NULL
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[PracticeLookup] TO [MEDAMERICA\SpearM]
    AS [dbo];

