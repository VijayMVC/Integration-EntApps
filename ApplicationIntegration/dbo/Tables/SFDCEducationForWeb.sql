CREATE TABLE [dbo].[SFDCEducationForWeb] (
    [ProviderMasterID] INT          NULL,
    [WebID]            INT          NULL,
    [EducationType]    VARCHAR (50) NULL,
    [Education]        VARCHAR (80) NULL,
    [FromDate]         DATETIME     NULL,
    [ToDate]           DATETIME     NULL,
    [CreDate]          DATETIME     CONSTRAINT [DF_SFDCEducationForWeb_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]          DATETIME     CONSTRAINT [DF_SFDCEducationForWeb_UpdDate] DEFAULT (getdate()) NULL
);

