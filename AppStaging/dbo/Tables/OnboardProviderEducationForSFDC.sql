﻿CREATE TABLE [dbo].[OnboardProviderEducationForSFDC] (
    [SFDCName]               VARCHAR (80)  NULL,
    [ProviderMasterID]       INT           NOT NULL,
    [WebID]                  INT           NOT NULL,
    [SFID]                   VARCHAR (50)  NOT NULL,
    [EducationType]          VARCHAR (25)  NULL,
    [ProgramType]            VARCHAR (50)  NULL,
    [SchoolSFID]             VARCHAR (18)  NULL,
    [OfficialSchoolName]     VARCHAR (100) NULL,
    [ProfessionalSchoolName] VARCHAR (100) NULL,
    [Address]                VARCHAR (100) NULL,
    [Suite]                  VARCHAR (20)  NULL,
    [City]                   VARCHAR (50)  NULL,
    [State]                  VARCHAR (50)  NULL,
    [ZipCode]                VARCHAR (50)  NULL,
    [Country]                VARCHAR (100) NULL,
    [PhoneNbr]               VARCHAR (50)  NULL,
    [FaxNbr]                 VARCHAR (50)  NULL,
    [StartDate]              DATETIME      NULL,
    [EndDate]                DATETIME      NULL,
    [Degree]                 VARCHAR (100) NULL,
    [EducationCompleted]     CHAR (1)      NULL,
    [ProfessionalSchool]     VARCHAR (100) NULL,
    [ECFMG]                  CHAR (1)      NULL,
    [ECFMGNum]               VARCHAR (14)  NULL,
    [ECFMGIssueDate]         DATETIME      NULL
);

