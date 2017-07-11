﻿CREATE TABLE [dbo].[TempSFDCMissingFromPMDB] (
    [SFID]               VARCHAR (18)  NULL,
    [StaffGroup]         VARCHAR (50)  NULL,
    [Facility]           CHAR (80)     NULL,
    [LastName]           VARCHAR (50)  NULL,
    [FirstName]          VARCHAR (50)  NULL,
    [Title]              VARCHAR (50)  NULL,
    [SiteName]           VARCHAR (100) NULL,
    [StaffStatus]        VARCHAR (100) NULL,
    [RecordStatus]       VARCHAR (100) NULL,
    [IncompleteSSNFlag]  CHAR (1)      NULL,
    [NoAddressFlag]      CHAR (1)      NULL,
    [NoRecordStatusFlag] CHAR (1)      NULL,
    [NoStaffStatusFlag]  CHAR (1)      NULL,
    [NoSiteFlag]         CHAR (1)      NULL,
    [NoEmailFlag]        CHAR (1)      NULL,
    [NoFirstNameFlag]    CHAR (1)      NULL,
    [NoLastNameFlag]     CHAR (1)      NULL,
    [NoDateOfHireFlag]   CHAR (1)      NULL,
    [NoDepartmentFlag]   CHAR (1)      NULL,
    [NoTitleFlag]        CHAR (1)      NULL,
    [CreDate]            DATETIME      NULL,
    [UpdDate]            DATETIME      NULL
);

