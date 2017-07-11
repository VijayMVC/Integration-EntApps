CREATE TABLE [dbo].[TempGalenChange] (
    [TempGALENChangeID] INT          IDENTITY (1, 1) NOT NULL,
    [StaffGroup]        VARCHAR (50) NULL,
    [ProviderMasterID]  INT          NULL,
    [NameChanged]       CHAR (1)     CONSTRAINT [DF_TempGalenChange_NameChanged] DEFAULT ('N') NULL,
    [AddressChanged]    CHAR (1)     CONSTRAINT [DF_TempGalenChange_AddressChanged] DEFAULT ('N') NULL,
    [PhoneChanged]      CHAR (1)     CONSTRAINT [DF_TempGalenChange_PhoneChanged] DEFAULT ('N') NULL,
    [FaxChanged]        CHAR (1)     CONSTRAINT [DF_TempGalenChange_FaxChanged] DEFAULT ('N') NULL,
    [CellPhoneChanged]  CHAR (1)     CONSTRAINT [DF_TempGalenChange_CellPhoneChanged] DEFAULT ('N') NULL,
    [PagerChanged]      CHAR (1)     CONSTRAINT [DF_TempGalenChange_PagerChanged] DEFAULT ('N') NULL,
    [SentFlag]          CHAR (1)     NULL,
    [SentDate]          DATETIME     NULL,
    [CreDate]           DATETIME     CONSTRAINT [DF_TempGalenChange_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]           DATETIME     CONSTRAINT [DF_TempGalenChange_UpdDate] DEFAULT (getdate()) NULL
);

