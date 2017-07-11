CREATE TABLE [dbo].[TempGalenChange2] (
    [StaffGroup]       VARCHAR (50) NULL,
    [ProviderMasterID] INT          NULL,
    [NameChanged]      CHAR (1)     CONSTRAINT [DF_TempGalenChange2_NameChanged] DEFAULT ('N') NULL,
    [AddressChanged]   CHAR (1)     CONSTRAINT [DF_TempGalenChange2_AddressChanged] DEFAULT ('N') NULL,
    [PhoneChanged]     CHAR (1)     CONSTRAINT [DF_TempGalenChange2_PhoneChanged] DEFAULT ('N') NULL,
    [FaxChanged]       CHAR (1)     CONSTRAINT [DF_TempGalenChange2_FaxChanged] DEFAULT ('N') NULL,
    [CellPhoneChanged] CHAR (1)     CONSTRAINT [DF_TempGalenChange2_CellPhoneChanged] DEFAULT ('N') NULL,
    [PagerChanged]     CHAR (1)     CONSTRAINT [DF_TempGalenChange2_PagerChanged] DEFAULT ('N') NULL
);

