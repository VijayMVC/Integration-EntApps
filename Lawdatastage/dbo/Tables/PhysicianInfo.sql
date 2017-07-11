﻿CREATE TABLE [dbo].[PhysicianInfo] (
    [ID]                   INT             NOT NULL,
    [MPID]                 INT             NULL,
    [FirstName]            NVARCHAR (50)   NOT NULL,
    [PreferredFirstName]   VARCHAR (50)    NULL,
    [MidName]              NVARCHAR (50)   NULL,
    [LastName]             NVARCHAR (50)   NOT NULL,
    [Username]             NVARCHAR (50)   NULL,
    [Username2_enc]        VARCHAR (50)    NULL,
    [Username2]            NVARCHAR (50)   NULL,
    [Password]             NVARCHAR (30)   NULL,
    [pwdlastchanged]       SMALLDATETIME   NULL,
    [SSN0]                 CHAR (4)        NULL,
    [SSN]                  CHAR (9)        NULL,
    [clockNum]             CHAR (5)        NULL,
    [GroupCode]            NVARCHAR (2000) NULL,
    [Title]                VARCHAR (50)    NOT NULL,
    [title_MPDB]           VARCHAR (50)    NULL,
    [Address]              NVARCHAR (255)  NOT NULL,
    [City]                 NVARCHAR (50)   NOT NULL,
    [State]                NVARCHAR (10)   NULL,
    [Zip]                  NVARCHAR (12)   NOT NULL,
    [Address1Type]         VARCHAR (50)    NULL,
    [Address2]             VARCHAR (255)   NULL,
    [City2]                VARCHAR (50)    NULL,
    [State2]               VARCHAR (10)    NULL,
    [Zip2]                 VARCHAR (12)    NULL,
    [Address2Type]         VARCHAR (50)    NULL,
    [Address3]             VARCHAR (255)   NULL,
    [City3]                VARCHAR (50)    NULL,
    [State3]               VARCHAR (10)    NULL,
    [Zip3]                 VARCHAR (12)    NULL,
    [Address3Type]         VARCHAR (50)    NULL,
    [PhoneBus]             NVARCHAR (50)   NULL,
    [PhoneHome]            NVARCHAR (50)   NULL,
    [Phone1]               VARCHAR (50)    NULL,
    [Phone2]               VARCHAR (50)    NULL,
    [Phone3]               VARCHAR (50)    NULL,
    [CellPhone]            VARCHAR (50)    NULL,
    [FaxBus]               NVARCHAR (50)   NULL,
    [FaxHome]              NVARCHAR (50)   NULL,
    [Pager]                NVARCHAR (50)   NULL,
    [Email]                VARCHAR (60)    NULL,
    [Email_cep]            NVARCHAR (60)   NULL,
    [Email2]               VARCHAR (60)    NULL,
    [AddressForPayroll]    SMALLINT        NULL,
    [AddressForNonPayroll] SMALLINT        NULL,
    [AddressForSiteLine]   SMALLINT        NULL,
    [MedSchool]            NVARCHAR (100)  NOT NULL,
    [LevelNum]             NVARCHAR (5)    NOT NULL,
    [DateLevel]            SMALLDATETIME   NULL,
    [DateHire]             SMALLDATETIME   NULL,
    [Personal]             NVARCHAR (1000) NOT NULL,
    [Site1]                NVARCHAR (5)    NULL,
    [Site2]                NVARCHAR (5)    NULL,
    [Site3]                NVARCHAR (5)    NULL,
    [Site4]                NVARCHAR (5)    NULL,
    [sitelist_tmp]         VARCHAR (100)   NOT NULL,
    [Memo]                 NVARCHAR (1000) NULL,
    [Status]               NVARCHAR (10)   NOT NULL,
    [FileList]             NVARCHAR (1000) NULL,
    [Code]                 NVARCHAR (255)  NOT NULL,
    [Locale_PagePref]      NVARCHAR (200)  NOT NULL,
    [flag_NewHire]         CHAR (1)        NOT NULL,
    [CerAdminSite]         VARCHAR (50)    NULL,
    [CerDefaultSite]       VARCHAR (50)    NULL,
    [staffGroup1]          VARCHAR (50)    NULL,
    [staffGroup2]          VARCHAR (50)    NULL
);

