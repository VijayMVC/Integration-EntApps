CREATE TABLE [dbo].[WebTimecardRegional] (
    [id]               INT            NOT NULL,
    [webid]            VARCHAR (50)   NOT NULL,
    [dat]              DATETIME       NOT NULL,
    [hrs]              VARCHAR (50)   NOT NULL,
    [hrs2]             VARCHAR (50)   NULL,
    [hrs3]             VARCHAR (50)   NULL,
    [hrs3Numeric]      DECIMAL (4, 2) NULL,
    [hrs4]             VARCHAR (50)   NULL,
    [hrs4Numeric]      DECIMAL (4, 2) NULL,
    [hourType]         VARCHAR (50)   NULL,
    [site]             VARCHAR (50)   NULL,
    [cmt]              VARCHAR (2000) NOT NULL,
    [ProviderMasterID] INT            NULL,
    [LastName]         VARCHAR (50)   NULL,
    [FirstName]        VARCHAR (50)   NULL,
    [Month]            VARCHAR (10)   NULL
);

