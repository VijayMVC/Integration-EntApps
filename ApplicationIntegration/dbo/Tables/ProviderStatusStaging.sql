CREATE TABLE [dbo].[ProviderStatusStaging] (
    [StaffGroup]           VARCHAR (50)  NULL,
    [SFID]                 CHAR (18)     NOT NULL,
    [ProviderMasterID]     VARCHAR (255) NULL,
    [WebID]                INT           NULL,
    [From]                 DATETIME2 (7) NULL,
    [To]                   DATETIME2 (7) NULL,
    [RecordStatus]         VARCHAR (255) NULL,
    [StaffStatus]          VARCHAR (255) NULL,
    [Active]               VARCHAR (1)   NOT NULL,
    [CorporateEmail]       VARCHAR (80)  NULL,
    [ForwardingEmail]      VARCHAR (80)  NULL,
    [PartnershipHistory]   VARCHAR (255) NULL,
    [PartnershipLevelDate] DATETIME2 (7) NULL,
    [Department]           VARCHAR (80)  NULL,
    [Facility]             CHAR (80)     NULL,
    [HireDate]             DATETIME      NULL,
    [PositionStatus]       VARCHAR (100) NULL,
    [CompleteRecordFlag]   CHAR (1)      NULL
);

