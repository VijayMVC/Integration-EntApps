CREATE TABLE [dbo].[SFDCSocietiesForWeb] (
    [ProviderMasterID] INT          NULL,
    [WebID]            INT          NULL,
    [Society]          VARCHAR (40) NULL,
    [Position]         VARCHAR (30) NULL,
    [DueDate]          DATETIME     NULL,
    [CreDate]          DATETIME     CONSTRAINT [DF_SFDCSocietiesForWeb_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]          DATETIME     CONSTRAINT [DF_SFDCSocietiesForWeb_UpdDate] DEFAULT (getdate()) NULL
);

