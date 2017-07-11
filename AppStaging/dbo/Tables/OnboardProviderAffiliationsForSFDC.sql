﻿CREATE TABLE [dbo].[OnboardProviderAffiliationsForSFDC] (
    [SFDCName]             VARCHAR (80)   NULL,
    [ProviderMasterID]     INT            NOT NULL,
    [WebID]                INT            NOT NULL,
    [SFID]                 VARCHAR (50)   NOT NULL,
    [AffiliationType]      VARCHAR (25)   NULL,
    [EmployerSFID]         VARCHAR (18)   NULL,
    [EmployerName]         VARCHAR (100)  NULL,
    [EmployerNameOther]    VARCHAR (100)  NULL,
    [Address]              VARCHAR (100)  NULL,
    [Suite]                VARCHAR (20)   NULL,
    [City]                 VARCHAR (50)   NULL,
    [State]                VARCHAR (50)   NULL,
    [ZipCode]              VARCHAR (50)   NULL,
    [Country]              VARCHAR (100)  NULL,
    [PhoneNbr]             VARCHAR (50)   NULL,
    [Fax]                  VARCHAR (50)   NULL,
    [Department]           VARCHAR (50)   NULL,
    [Position]             VARCHAR (100)  NULL,
    [CurrentlyWorking]     VARCHAR (10)   NULL,
    [FromDate]             DATETIME       NULL,
    [ToDate]               DATETIME       NULL,
    [FullPrivilege]        CHAR (1)       NULL,
    [TempPrivilege]        CHAR (1)       NULL,
    [AdmitPrivilegeStatus] VARCHAR (50)   NULL,
    [ReasonForDeparture]   VARCHAR (100)  NULL,
    [Comments]             VARCHAR (1000) NULL
);

