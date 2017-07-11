CREATE TABLE [dbo].[JOB_REC_Opening_4DR] (
    [openingID]          INT            NOT NULL,
    [siteCode]           VARCHAR (4)    NOT NULL,
    [filledByProviderID] INT            NOT NULL,
    [recruiterID]        INT            NULL,
    [datePosted]         DATETIME       NOT NULL,
    [dateClosed]         DATETIME       NULL,
    [openingType]        VARCHAR (500)  NULL,
    [actionID]           INT            NULL,
    [isFullTime]         VARCHAR (1)    NOT NULL,
    [isInternal]         VARCHAR (1)    NOT NULL,
    [theDescription]     VARCHAR (8000) NULL,
    [closingNotes]       VARCHAR (8000) NULL,
    [dateInitialContact] DATETIME       NULL,
    [datePresentedToMD]  DATETIME       NULL,
    [dateMDInterview]    DATETIME       NULL,
    [totalInterviewed]   INT            NULL,
    [UDF1]               VARCHAR (500)  NULL,
    [UDF2]               VARCHAR (500)  NULL,
    [UDF3]               VARCHAR (500)  NULL,
    [UDF4]               VARCHAR (500)  NULL,
    [CreDate]            DATETIME       CONSTRAINT [DF_JOB_REC_Opening_4DR_CreDate] DEFAULT (getdate()) NULL
);

