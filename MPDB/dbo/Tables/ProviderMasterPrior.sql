﻿CREATE TABLE [dbo].[ProviderMasterPrior] (
    [ProviderMasterID]            INT           NOT NULL,
    [SSNFormatted]                VARCHAR (11)  NULL,
    [SSNUnformatted]              CHAR (10)     NULL,
    [TaxIDIncorporated]           VARCHAR (11)  NULL,
    [LastName]                    VARCHAR (50)  NULL,
    [FirstName]                   VARCHAR (50)  NULL,
    [MiddleNameOrInitial]         VARCHAR (50)  NULL,
    [PreferredName]               VARCHAR (50)  NULL,
    [IncorporatedName]            VARCHAR (100) NULL,
    [FormerLastName]              VARCHAR (50)  NULL,
    [FormerFirstName]             VARCHAR (50)  NULL,
    [FormerMiddleName]            VARCHAR (50)  NULL,
    [Title]                       VARCHAR (100) NULL,
    [TitleCompare]                VARCHAR (50)  NULL,
    [Gender]                      VARCHAR (10)  NULL,
    [PartnershipLevel]            VARCHAR (100) NULL,
    [EchoPartnershipLevelCode]    CHAR (3)      NULL,
    [PartnershipLevelDate]        DATETIME      NULL,
    [PartnershipLevelCode]        VARCHAR (10)  NULL,
    [DateOfBirth]                 DATETIME      NULL,
    [DateOfHire]                  DATETIME      NULL,
    [MaritalStatusCode]           CHAR (1)      NULL,
    [MaritalStatus]               VARCHAR (50)  NULL,
    [SpouseName]                  VARCHAR (100) NULL,
    [CEPEmailAddress]             VARCHAR (100) NULL,
    [EmailAddress1]               VARCHAR (100) NULL,
    [EmailAddress2]               VARCHAR (100) NULL,
    [CellPhoneNbr]                VARCHAR (50)  NULL,
    [PagerNbr]                    VARCHAR (50)  NULL,
    [MedSchool]                   VARCHAR (100) NULL,
    [WebID]                       INT           NULL,
    [CeridianFlxID]               INT           NULL,
    [CeridianClockNbr]            INT           NULL,
    [CeridianEbPSID]              VARCHAR (8)   NULL,
    [SiteLineCntID]               INT           NULL,
    [Echo_dr_no_ext]              CHAR (12)     NULL,
    [Echo_dr_ID]                  CHAR (12)     NULL,
    [ExchangeDirectoryName]       VARCHAR (50)  NULL,
    [ExchangeContainer]           VARCHAR (100) NULL,
    [ExchangeDirectoryName2]      VARCHAR (50)  NULL,
    [ExchangeContainer2]          VARCHAR (100) NULL,
    [ActiveInactiveFlag]          CHAR (1)      NULL,
    [CurrentlyNotComparedFlag]    CHAR (1)      NULL,
    [DuplicateOfProviderMasterID] INT           NULL,
    [StaffStatus]                 VARCHAR (50)  NULL,
    [CurrentStaffFlag]            CHAR (1)      NULL,
    [CurrentProviderFlag]         CHAR (1)      NULL,
    [NeedToFix]                   CHAR (1)      NULL,
    [CurrentlyIncorporatedFlag]   CHAR (1)      NULL,
    [FormerlyIncorporatedFlag]    CHAR (1)      NULL,
    [EMANewJersey]                CHAR (1)      NULL,
    [SSNIncorrectFlag]            CHAR (1)      NULL,
    [LoadFlag]                    CHAR (1)      NULL,
    [BatchNbrLoaded]              INT           NULL,
    [Notes]                       VARCHAR (255) NULL,
    [CEPPartnerFlag]              CHAR (1)      NULL,
    [MultipleClientFlag]          CHAR (1)      NULL,
    [PAFlag]                      CHAR (1)      NULL,
    [BoardMember]                 CHAR (1)      CONSTRAINT [DF_ProviderMasterPrior_BoardMember] DEFAULT ('N') NULL,
    [RegionalDirector]            CHAR (1)      NULL,
    [MedicalDirector]             CHAR (1)      CONSTRAINT [DF_ProviderMasterPrior_MedicalDirector] DEFAULT ('N') NULL,
    [AsstMedicalDirector]         CHAR (1)      CONSTRAINT [DF_ProviderMasterPrior_AsstMedicalDirector] DEFAULT ('N') NULL,
    [QIDirector]                  CHAR (1)      CONSTRAINT [DF_ProviderMasterPrior_QIDirector] DEFAULT ('N') NULL,
    [CommitteeMember]             CHAR (1)      CONSTRAINT [DF_ProviderMasterPrior_CommitteeMember] DEFAULT ('N') NULL,
    [AnyDirector]                 CHAR (1)      CONSTRAINT [DF_ProviderMasterPrior_AnyDirector] DEFAULT ('N') NULL,
    [LatestWorkDate]              DATETIME      NULL,
    [CREDate]                     DATETIME      NULL,
    [CreDate2]                    DATETIME      CONSTRAINT [DF_ProviderMasterPrior_CreDate2] DEFAULT (getdate()) NULL,
    [UPDDate]                     DATETIME      NULL
);

