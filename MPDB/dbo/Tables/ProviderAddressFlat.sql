CREATE TABLE [dbo].[ProviderAddressFlat] (
    [StaffGroup]                VARCHAR (50)  NULL,
    [ProviderMasterID]          INT           NULL,
    [WebID]                     INT           NULL,
    [AddressType1]              VARCHAR (20)  NULL,
    [AddressForPayrollFlag1]    CHAR (3)      NULL,
    [AddressForNonPayrollFlag1] CHAR (3)      NULL,
    [Address1]                  VARCHAR (100) NULL,
    [City1]                     VARCHAR (50)  NULL,
    [State1]                    VARCHAR (50)  NULL,
    [ZipCode1]                  VARCHAR (50)  NULL,
    [Country1]                  VARCHAR (100) NULL,
    [PhoneNbr1]                 VARCHAR (50)  NULL,
    [FaxNbr1]                   VARCHAR (50)  NULL,
    [AddressType2]              VARCHAR (20)  NULL,
    [AddressForPayrollFlag2]    CHAR (3)      NULL,
    [AddressForNonPayrollFlag2] CHAR (3)      NULL,
    [Address2]                  VARCHAR (100) NULL,
    [City2]                     VARCHAR (50)  NULL,
    [State2]                    VARCHAR (50)  NULL,
    [ZipCode2]                  VARCHAR (50)  NULL,
    [Country2]                  VARCHAR (100) NULL,
    [PhoneNbr2]                 VARCHAR (50)  NULL,
    [FaxNbr2]                   VARCHAR (50)  NULL,
    [AddressType3]              VARCHAR (20)  NULL,
    [AddressForPayrollFlag3]    CHAR (3)      NULL,
    [AddressForNonPayrollFlag3] CHAR (3)      NULL,
    [Address3]                  VARCHAR (100) NULL,
    [City3]                     VARCHAR (50)  NULL,
    [State3]                    VARCHAR (50)  NULL,
    [ZipCode3]                  VARCHAR (50)  NULL,
    [Country3]                  VARCHAR (100) NULL,
    [PhoneNbr3]                 VARCHAR (50)  NULL,
    [FaxNbr3]                   VARCHAR (50)  NULL,
    CONSTRAINT [FK_ProviderAddressFlat_ProviderMaster] FOREIGN KEY ([ProviderMasterID]) REFERENCES [dbo].[ProviderMaster] ([ProviderMasterID])
);


GO
CREATE CLUSTERED INDEX [PAF_StaffGroupPMID_idx]
    ON [dbo].[ProviderAddressFlat]([StaffGroup] ASC, [ProviderMasterID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [PAF_WebID_idx]
    ON [dbo].[ProviderAddressFlat]([WebID] ASC) WITH (FILLFACTOR = 90);

