﻿CREATE TABLE [dbo].[WebCPACEvalHeaderStaging] (
    [echo_dr_no_ext]            VARCHAR (30)    NULL,
    [PhysicianName]             VARCHAR (100)   NULL,
    [Site1]                     VARCHAR (200)   NULL,
    [Site1MedicalDirector]      VARCHAR (100)   NULL,
    [Region1]                   VARCHAR (100)   NULL,
    [Site2]                     VARCHAR (200)   NULL,
    [Site2MedicalDirector]      VARCHAR (100)   NULL,
    [Region2]                   VARCHAR (100)   NULL,
    [DateOfHire]                DATETIME        NULL,
    [BoardCertification]        VARCHAR (100)   NULL,
    [BoardCertificationExpDate] DATETIME        NULL,
    [CurrentLevel]              VARCHAR (10)    NULL,
    [CurrentLevelDate]          DATETIME        NULL,
    [AdvanceLevel]              VARCHAR (10)    NULL,
    [TotalHours]                NUMERIC (10, 2) NULL,
    [TotalHoursImport]          VARCHAR (10)    NULL,
    [AcceleratedAdv]            VARCHAR (10)    NULL,
    [MedDirectorIsEvalueeSite1] CHAR (1)        NULL,
    [MedDirectorIsEvalueeSite2] CHAR (1)        NULL,
    [WebCodeSite1]              VARCHAR (10)    NULL,
    [WebCodeSite2]              VARCHAR (10)    NULL,
    [RegionCode1]               VARCHAR (10)    NULL,
    [RegionCode2]               VARCHAR (10)    NULL,
    [ProviderMasterID]          INT             NULL,
    [ProviderMasterIDMD1]       INT             NULL,
    [ProviderMasterIDMD2]       INT             NULL,
    [ProviderMasterIDRD1]       INT             NULL,
    [ProviderMasterIDRD2]       INT             NULL,
    [SiteLocationID1]           INT             NULL,
    [SiteLocationID2]           INT             NULL,
    [RegionID1]                 INT             NULL,
    [RegionID2]                 INT             NULL,
    [Credate]                   DATETIME        CONSTRAINT [DF_WebCPACEvalHeaderStaging_Credate] DEFAULT (getdate()) NULL
);

