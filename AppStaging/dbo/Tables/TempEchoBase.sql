CREATE TABLE [dbo].[TempEchoBase] (
    [Echo_Dr_No_Ext]      CHAR (12)     NULL,
    [Echo_Dr_ID]          CHAR (12)     NULL,
    [LastName]            VARCHAR (50)  NULL,
    [FirstName]           VARCHAR (50)  NULL,
    [PreferredName]       VARCHAR (50)  NULL,
    [MiddleNameOrInitial] VARCHAR (50)  NULL,
    [Title]               VARCHAR (100) NULL,
    [Gender]              VARCHAR (10)  NULL,
    [PagerNbr]            VARCHAR (50)  NULL,
    [SsnFormatted]        VARCHAR (11)  NULL,
    [SSNUnformatted]      VARCHAR (10)  NULL,
    [FormerLastName]      VARCHAR (50)  NULL,
    [FormerFirstName]     VARCHAR (50)  NULL,
    [FormerMiddleName]    VARCHAR (50)  NULL,
    [BatchNbrLoaded]      INT           NULL,
    [MaritalStatus]       VARCHAR (50)  NULL,
    [MaritalStatusCode]   CHAR (1)      NULL,
    [SpouseName]          VARCHAR (100) NULL,
    [Echo_Org_Name]       VARCHAR (100) NULL,
    [CellPhoneNbr]        VARCHAR (50)  NULL,
    [ProviderMasterID]    INT           NULL,
    [WebID]               INT           NULL,
    [MultipleClientFlag]  CHAR (1)      CONSTRAINT [DF_TempEchoBase_MultipleClientFlag] DEFAULT ('N') NULL,
    [CompleteRecordFlag]  CHAR (1)      CONSTRAINT [DF_TempEchoBase_CompleteRecordFlag] DEFAULT ('N') NULL,
    [ActiveFlag]          CHAR (1)      CONSTRAINT [DF_TempEchoBase_ActiveFlag] DEFAULT ('N') NULL
);


GO
CREATE CLUSTERED INDEX [TEB_EchoDrID_idx]
    ON [dbo].[TempEchoBase]([Echo_Dr_ID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TEB_PMastID_idx]
    ON [dbo].[TempEchoBase]([ProviderMasterID] ASC) WITH (FILLFACTOR = 90);

