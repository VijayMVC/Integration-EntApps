CREATE TABLE [dbo].[ProviderMaster] (
    [ProviderMasterID]            INT           NOT NULL,
    [SSNFormatted]                VARCHAR (11)  NULL,
    [SSNUnformatted]              CHAR (10)     NULL,
    [TaxIDIncorporated]           VARCHAR (11)  CONSTRAINT [DF_ProviderMaster_TaxIDIncorporated] DEFAULT (' ') NULL,
    [LastName]                    VARCHAR (50)  NULL,
    [FirstName]                   VARCHAR (50)  NULL,
    [MiddleNameOrInitial]         VARCHAR (50)  NULL,
    [PreferredName]               VARCHAR (50)  NULL,
    [IncorporatedName]            VARCHAR (100) CONSTRAINT [DF_ProviderMaster_IncorporatedName] DEFAULT (' ') NULL,
    [FormerLastName]              VARCHAR (50)  CONSTRAINT [DF_ProviderMaster_FormerLastName] DEFAULT (' ') NULL,
    [FormerFirstName]             VARCHAR (50)  CONSTRAINT [DF_ProviderMaster_FormerFirstName] DEFAULT (' ') NULL,
    [FormerMiddleName]            VARCHAR (50)  CONSTRAINT [DF_ProviderMaster_FormerMiddleName] DEFAULT (' ') NULL,
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
    [Echo_dr_id]                  CHAR (12)     NULL,
    [NationalID]                  VARCHAR (30)  NULL,
    [ExchangeDirectoryName]       VARCHAR (50)  NULL,
    [ExchangeContainer]           VARCHAR (100) NULL,
    [ExchangeDirectoryName2]      VARCHAR (50)  NULL,
    [ExchangeContainer2]          VARCHAR (100) NULL,
    [EmploymentCategory]          CHAR (1)      NULL,
    [EmploymentCategoryDate]      DATETIME      NULL,
    [CurrentlyNotComparedFlag]    CHAR (1)      CONSTRAINT [DF_ProviderMaster_CurrentlyNotComparedFlag] DEFAULT ('N') NULL,
    [DuplicateOfProviderMasterID] INT           NULL,
    [StaffStatus]                 VARCHAR (50)  NULL,
    [CurrentStaffFlag]            CHAR (1)      CONSTRAINT [DF_ProviderMaster_CurrentStaffFlag] DEFAULT ('Y') NULL,
    [CurrentProviderFlag]         CHAR (1)      CONSTRAINT [DF_ProviderMaster_CurrentProviderFlag] DEFAULT ('N') NULL,
    [NeedToFix]                   CHAR (1)      NULL,
    [CurrentlyIncorporatedFlag]   CHAR (1)      NULL,
    [FormerlyIncorporatedFlag]    CHAR (1)      NULL,
    [EMANewJersey]                CHAR (1)      CONSTRAINT [DF_ProviderMaster_EMANewJersey] DEFAULT ('N') NULL,
    [SSNIncorrectFlag]            CHAR (1)      CONSTRAINT [DF_ProviderMaster_SSNIncorrectFlag] DEFAULT ('N') NULL,
    [LoadFlag]                    CHAR (1)      NULL,
    [BatchNbrLoaded]              INT           NULL,
    [Notes]                       VARCHAR (255) NULL,
    [CEPPartnerFlag]              CHAR (1)      NULL,
    [MultipleClientFlag]          CHAR (1)      CONSTRAINT [DF_ProviderMaster_MultipleClientFlag] DEFAULT ('N') NULL,
    [PAFlag]                      CHAR (1)      NULL,
    [BoardMember]                 CHAR (1)      CONSTRAINT [DF_ProviderMaster_BoardMember] DEFAULT ('N') NULL,
    [RegionalDirector]            CHAR (1)      CONSTRAINT [DF_ProviderMaster_RegionalDirector] DEFAULT ('N') NULL,
    [MedicalDirector]             CHAR (1)      CONSTRAINT [DF_ProviderMaster_MedicalDirector] DEFAULT ('N') NULL,
    [AsstMedicalDirector]         CHAR (1)      CONSTRAINT [DF_ProviderMaster_AsstMedicalDirector] DEFAULT ('N') NULL,
    [QIDirector]                  CHAR (1)      CONSTRAINT [DF_ProviderMaster_QIDirector] DEFAULT ('N') NULL,
    [CommitteeMember]             CHAR (1)      CONSTRAINT [DF_ProviderMaster_CommitteeMember] DEFAULT ('N') NULL,
    [AnyDirector]                 CHAR (1)      CONSTRAINT [DF_ProviderMaster_AnyDirector] DEFAULT ('N') NULL,
    [LatestWorkDate]              DATETIME      NULL,
    [CREDate]                     DATETIME      CONSTRAINT [DF_ProviderMaster_CREDate] DEFAULT (getdate()) NULL,
    [CREDate2]                    DATETIME      CONSTRAINT [DF_ProviderMaster_CREDate2] DEFAULT (getdate()) NULL,
    [UPDDate]                     DATETIME      CONSTRAINT [DF_ProviderMaster_UPDDate] DEFAULT (getdate()) NULL,
    [LOA]                         VARCHAR (100) NULL,
    [LOADate]                     VARCHAR (100) NULL,
    CONSTRAINT [PK_ProviderMaster] PRIMARY KEY NONCLUSTERED ([ProviderMasterID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE CLUSTERED INDEX [ProviderMaster_ProviderMasterID_idx]
    ON [dbo].[ProviderMaster]([ProviderMasterID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE TRIGGER [ProviderMasterUpdateTrigger] ON dbo.ProviderMaster 
FOR UPDATE 
AS Update ProviderMaster set UpdDate = getdate()

GO
GRANT SELECT
    ON OBJECT::[dbo].[ProviderMaster] TO [MEDAMERICA\SpearM]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ProviderMaster] TO [BrainardE]
    AS [dbo];

