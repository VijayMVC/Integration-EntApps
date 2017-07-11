﻿CREATE TABLE [dbo].[EmployeeBaseArchive] (
    [StaffGroup1]         VARCHAR (50)   NULL,
    [StaffGroup2]         VARCHAR (50)   NULL,
    [ProviderMasterID]    INT            NULL,
    [WebID]               INT            NULL,
    [SFID]                NCHAR (18)     NULL,
    [LawsonID]            INT            NULL,
    [TaxIDIncorporated]   VARCHAR (11)   NULL,
    [LastName]            VARCHAR (50)   NULL,
    [FirstName]           VARCHAR (50)   NULL,
    [MiddleNameOrInitial] VARCHAR (50)   NULL,
    [PreferredName]       VARCHAR (50)   NULL,
    [IncorporatedName]    VARCHAR (100)  NULL,
    [Title]               VARCHAR (100)  NULL,
    [MaritalStatus]       VARCHAR (50)   NULL,
    [SpouseName]          VARCHAR (50)   NULL,
    [Gender]              VARCHAR (10)   NULL,
    [EmailAddress]        VARCHAR (100)  NULL,
    [CellPhoneNbr]        VARCHAR (50)   NULL,
    [PagerNbr]            VARCHAR (50)   NULL,
    [AddressType1]        VARCHAR (20)   NULL,
    [Address1]            VARCHAR (100)  NULL,
    [City1]               VARCHAR (50)   NULL,
    [State1]              VARCHAR (50)   NULL,
    [ZipCode1]            VARCHAR (50)   NULL,
    [Country1]            VARCHAR (100)  NULL,
    [PhoneNbr1]           VARCHAR (50)   NULL,
    [FaxNbr1]             VARCHAR (50)   NULL,
    [AddressType2]        VARCHAR (20)   NULL,
    [Address2]            VARCHAR (100)  NULL,
    [City2]               VARCHAR (50)   NULL,
    [State2]              VARCHAR (50)   NULL,
    [ZipCode2]            VARCHAR (50)   NULL,
    [Country2]            VARCHAR (100)  NULL,
    [PhoneNbr2]           VARCHAR (50)   NULL,
    [FaxNbr2]             VARCHAR (50)   NULL,
    [PrimarySite]         VARCHAR (100)  NULL,
    [Site1]               VARCHAR (5)    NULL,
    [Site2]               VARCHAR (5)    NULL,
    [Site3]               VARCHAR (5)    NULL,
    [Site4]               VARCHAR (5)    NULL,
    [MedSchool]           VARCHAR (100)  NULL,
    [HireDate]            SMALLDATETIME  NULL,
    [Notes]               VARCHAR (2000) NULL,
    [TimeStmp]            DATETIME       NULL,
    [Author]              VARCHAR (60)   NULL,
    [UpdatedFlag]         CHAR (1)       NULL,
    [Status]              CHAR (2)       NULL,
    [NewHireSentFlag]     CHAR (1)       NULL,
    [NewHireSentDate]     DATETIME       NULL,
    [LoadDate]            DATETIME       NOT NULL
);

