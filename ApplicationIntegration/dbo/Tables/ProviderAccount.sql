﻿CREATE TABLE [dbo].[ProviderAccount] (
    [ProviderMasterID]        INT           NOT NULL,
    [WebID]                   INT           NOT NULL,
    [SFID]                    VARCHAR (50)  NOT NULL,
    [StaffGroup1]             VARCHAR (10)  NULL,
    [StaffGroup2]             VARCHAR (10)  NULL,
    [LastName]                VARCHAR (50)  NULL,
    [FirstName]               VARCHAR (50)  NULL,
    [MiddleName]              VARCHAR (50)  NULL,
    [Suffix]                  VARCHAR (3)   NULL,
    [PreferredName]           VARCHAR (50)  NULL,
    [OtherLastName1]          VARCHAR (50)  NULL,
    [OtherFirstName1]         VARCHAR (50)  NULL,
    [OtherMiddleName1]        VARCHAR (50)  NULL,
    [OtherSuffix1]            VARCHAR (3)   NULL,
    [OtherNameDate1]          DATETIME      NULL,
    [OtherLastName2]          VARCHAR (50)  NULL,
    [OtherFirstName2]         VARCHAR (50)  NULL,
    [OtherMiddleName2]        VARCHAR (50)  NULL,
    [OtherSuffix2]            VARCHAR (3)   NULL,
    [OtherNameDate2]          DATETIME      NULL,
    [ProfessionalTitle]       VARCHAR (100) NULL,
    [OtherProfessionalTitle1] VARCHAR (100) NULL,
    [OtherProfessionalTitle2] VARCHAR (100) NULL,
    [Gender]                  CHAR (1)      NULL,
    [DOB]                     DATETIME      NULL,
    [CountryOfBirth]          VARCHAR (100) NULL,
    [StateOfBirth]            VARCHAR (100) NULL,
    [CityOfBirth]             VARCHAR (50)  NULL,
    [DriverLicenseState]      VARCHAR (100) NULL,
    [DriverLicenseNo]         VARCHAR (100) NULL,
    [DriverLicenseExpDt]      DATETIME      NULL,
    [SSN]                     VARCHAR (11)  NULL,
    [FNIN]                    VARCHAR (11)  NULL,
    [FNINCountryIssued]       VARCHAR (100) NULL,
    [OtherLang1]              VARCHAR (50)  NULL,
    [OtherLang2]              VARCHAR (50)  NULL,
    [OtherLang3]              VARCHAR (50)  NULL,
    [MaritalStatus]           VARCHAR (50)  NULL,
    [PartnerName]             VARCHAR (100) NULL,
    [PrimaryAddress]          VARCHAR (50)  NULL,
    [PrimarySuite]            VARCHAR (20)  NULL,
    [PrimaryCity]             VARCHAR (50)  NULL,
    [PrimaryState]            VARCHAR (50)  NULL,
    [PrimaryZipCode]          VARCHAR (50)  NULL,
    [PrimaryCountry]          VARCHAR (100) NULL,
    [SecondaryAddress]        VARCHAR (50)  NULL,
    [SecondarySuite]          VARCHAR (20)  NULL,
    [SecondaryCity]           VARCHAR (50)  NULL,
    [SecondaryState]          VARCHAR (50)  NULL,
    [SecondaryZipCode]        VARCHAR (50)  NULL,
    [SecondaryCountry]        VARCHAR (100) NULL,
    [MailingAddress]          VARCHAR (20)  NULL,
    [MobileNbr]               VARCHAR (20)  NULL,
    [PhoneNbr]                VARCHAR (20)  NULL,
    [PhoneNbr2]               VARCHAR (20)  NULL,
    [FaxNbr]                  VARCHAR (50)  NULL,
    [Email1]                  VARCHAR (100) NULL,
    [Email2]                  VARCHAR (100) NULL,
    [PreferredContact]        VARCHAR (50)  NULL,
    [MedicareProvider]        CHAR (1)      NULL,
    [MedicareNum]             VARCHAR (14)  NULL,
    [NPINum]                  VARCHAR (14)  NULL,
    [MedicaidProvider]        CHAR (1)      NULL,
    [MedicaidNum]             VARCHAR (14)  NULL,
    [WorkCompNum]             VARCHAR (14)  NULL,
    [HireDate]                DATETIME      NULL,
    [OtherInfo]               TEXT          NULL,
    [ProviderType_Flag]       VARCHAR (5)   NULL,
    [Approved]                CHAR (1)      NULL,
    [SF_Flag]                 VARCHAR (50)  NULL,
    [CreDate]                 DATETIME      CONSTRAINT [DF_ProviderAccount_CreDate] DEFAULT (getdate()) NULL
);

