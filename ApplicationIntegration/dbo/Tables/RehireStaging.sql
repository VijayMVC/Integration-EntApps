CREATE TABLE [dbo].[RehireStaging] (
    [SFID]             CHAR (18)     NOT NULL,
    [FacID]            CHAR (18)     NULL,
    [Facility]         CHAR (80)     NULL,
    [Department]       VARCHAR (80)  NULL,
    [RecordStatus]     VARCHAR (255) NULL,
    [StaffStatus]      VARCHAR (255) NULL,
    [StaffGroup]       VARCHAR (50)  NULL,
    [ProviderMasterID] VARCHAR (255) NULL,
    [Active]           VARCHAR (1)   NOT NULL,
    [Rehire]           VARCHAR (1)   NOT NULL,
    [From]             DATETIME2 (7) NULL,
    [To]               DATETIME2 (7) NULL,
    [DateRehired]      DATETIME      NOT NULL,
    [LoadedToOnboard]  DATETIME      NULL
);

