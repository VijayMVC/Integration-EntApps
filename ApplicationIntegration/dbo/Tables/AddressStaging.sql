CREATE TABLE [dbo].[AddressStaging] (
    [SFID]                     CHAR (18)     NOT NULL,
    [ProviderMasterID]         INT           NULL,
    [Type]                     VARCHAR (50)  NULL,
    [AddressLine1]             VARCHAR (255) NULL,
    [AddressNew]               VARCHAR (255) NULL,
    [AddressCompare]           VARCHAR (255) NULL,
    [AddressLine2]             VARCHAR (255) NULL,
    [City]                     VARCHAR (100) NULL,
    [CompanyName]              VARCHAR (255) NULL,
    [State]                    VARCHAR (100) NULL,
    [Zip]                      VARCHAR (50)  NULL,
    [Fax]                      VARCHAR (50)  NULL,
    [Phone]                    VARCHAR (50)  NULL,
    [Phone2]                   VARCHAR (50)  NULL,
    [Primary]                  VARCHAR (5)   NULL,
    [AddressListOrder]         INT           NULL,
    [AddressForPayrollFlag]    CHAR (1)      NULL,
    [AddressForNonPayrollFlag] CHAR (1)      NULL,
    [CreDate]                  DATETIME      CONSTRAINT [DF_SFDCAddressStaging_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]                  DATETIME      CONSTRAINT [DF_SFDCAddressStaging_UpdDate] DEFAULT (getdate()) NULL
);

