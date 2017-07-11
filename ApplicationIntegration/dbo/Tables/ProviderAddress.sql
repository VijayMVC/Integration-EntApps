CREATE TABLE [dbo].[ProviderAddress] (
    [SFID]                     NCHAR (18)    NOT NULL,
    [ProviderMasterID]         INT           NULL,
    [AddressType]              VARCHAR (20)  NULL,
    [AddressListOrder]         INT           NULL,
    [AddressForPayrollFlag]    CHAR (1)      NULL,
    [AddressForNonPayrollFlag] CHAR (1)      NULL,
    [Address1]                 VARCHAR (100) NULL,
    [Address2]                 VARCHAR (100) NULL,
    [City]                     VARCHAR (50)  NULL,
    [State]                    VARCHAR (50)  NULL,
    [ZipCode]                  VARCHAR (50)  NULL,
    [Country]                  VARCHAR (100) NULL,
    [PhoneNbr]                 VARCHAR (50)  NULL,
    [FaxNbr]                   VARCHAR (50)  NULL,
    [CreDate]                  DATETIME      CONSTRAINT [DF_ProviderAddress_CreDate] DEFAULT (getdate()) NOT NULL,
    [UpdDate]                  DATETIME      CONSTRAINT [DF_ProviderAddress_UpdDate] DEFAULT (getdate()) NOT NULL
);

