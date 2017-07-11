CREATE TABLE [dbo].[ProviderAddressStaffGroup] (
    [ProviderMasterID]         INT           NOT NULL,
    [StaffGroup]               VARCHAR (50)  NULL,
    [AddressType]              VARCHAR (20)  NULL,
    [AddressListOrder]         INT           NULL,
    [AddressForPayrollFlag]    CHAR (1)      NULL,
    [AddressForNonPayrollFlag] CHAR (1)      NULL,
    [Address1]                 VARCHAR (100) NULL,
    [AddressNew]               VARCHAR (255) NULL,
    [AddressCompare]           VARCHAR (255) NULL,
    [Address2]                 VARCHAR (100) NULL,
    [City]                     VARCHAR (50)  NULL,
    [State]                    VARCHAR (50)  NULL,
    [ZipCode]                  VARCHAR (50)  NULL,
    [Country]                  VARCHAR (100) NULL,
    [PhoneNbr]                 VARCHAR (50)  NULL,
    [FaxNbr]                   VARCHAR (50)  NULL,
    [CreDate]                  DATETIME      NULL,
    [UpdDate]                  DATETIME      NULL
);

