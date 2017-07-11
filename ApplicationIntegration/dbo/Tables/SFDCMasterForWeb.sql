CREATE TABLE [dbo].[SFDCMasterForWeb] (
    [ProviderMasterID] INT          NULL,
    [WebID]            INT          NULL,
    [FormattedSSN]     VARCHAR (11) NULL,
    [CreDate]          DATETIME     CONSTRAINT [DF_SFDCMasterForWeb_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]          DATETIME     CONSTRAINT [DF_SFDCMasterForWeb_UpdDate] DEFAULT (getdate()) NULL
);

