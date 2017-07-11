CREATE TABLE [dbo].[TempStaffHistory] (
    [Echo_dr_id]               CHAR (12)     NULL,
    [StaffGroup]               VARCHAR (50)  NULL,
    [ProviderMasterID]         INT           NULL,
    [WebID]                    INT           NULL,
    [Echo_Fac_Cd]              CHAR (4)      NULL,
    [StaffSubGroup]            VARCHAR (50)  NULL,
    [StaffArea]                VARCHAR (50)  NULL,
    [StartDate]                DATETIME      NULL,
    [EndDate]                  DATETIME      NULL,
    [CorporateEmail]           VARCHAR (100) NULL,
    [ForwardingEmail]          VARCHAR (100) NULL,
    [StaffStatus]              VARCHAR (50)  NULL,
    [PartnershipLevel]         VARCHAR (100) NULL,
    [PartnershipLevelCode]     VARCHAR (10)  NULL,
    [EchoPartnershipLevelCode] CHAR (10)     NULL,
    [PartnershipLevelDate]     DATETIME      NULL,
    [ActiveFlag]               CHAR (1)      CONSTRAINT [DF_TempStaffHistory_ActiveFlag] DEFAULT ('N') NULL,
    [EchoConnectPWD]           VARCHAR (10)  NULL,
    [CompleteRecordFlag]       CHAR (1)      CONSTRAINT [DF_TempStaffHistory_CompleteRecordFlag] DEFAULT ('N') NULL
);


GO
CREATE CLUSTERED INDEX [TSH_Echo_Dr_No_ID]
    ON [dbo].[TempStaffHistory]([Echo_dr_id] ASC) WITH (FILLFACTOR = 90);

