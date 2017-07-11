CREATE TABLE [dbo].[SFDCAddressForWeb] (
    [ProviderMasterID] INT           NULL,
    [WebID]            INT           NULL,
    [AddressLine1]     VARCHAR (255) NULL,
    [AddressLine2]     VARCHAR (255) NULL,
    [City]             VARCHAR (100) NULL,
    [State]            VARCHAR (100) NULL,
    [Zip]              VARCHAR (50)  NULL,
    [AddressType]      VARCHAR (50)  NULL,
    [PrimaryAddress]   CHAR (1)      NULL,
    [CreDate]          DATETIME      CONSTRAINT [DF_SFDCAddressForWeb_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]          DATETIME      CONSTRAINT [DF_SFDCAddressForWeb_UpdDate] DEFAULT (getdate()) NULL
);

