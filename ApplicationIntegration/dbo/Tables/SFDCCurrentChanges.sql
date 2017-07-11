CREATE TABLE [dbo].[SFDCCurrentChanges] (
    [PMBLastName]      VARCHAR (50)   NULL,
    [PMBFirstName]     VARCHAR (50)   NULL,
    [SFID]             VARCHAR (18)   NOT NULL,
    [LastModifiedBy]   NVARCHAR (121) NOT NULL,
    [LastModifiedDate] DATETIME2 (7)  NOT NULL,
    [FieldModified]    NVARCHAR (255) NOT NULL,
    [SFDCValue]        NVARCHAR (255) NULL,
    [PMDBValue]        NVARCHAR (255) NULL,
    [PMBSite1]         VARCHAR (5)    NULL,
    [PMBSite2]         VARCHAR (5)    NULL,
    [PMBSite3]         VARCHAR (5)    NULL,
    [PMBSite4]         VARCHAR (5)    NULL,
    [PMBSite5]         VARCHAR (5)    NULL,
    [PMBSite6]         VARCHAR (5)    NULL,
    [PMBSite7]         VARCHAR (5)    NULL,
    [PMBSite8]         VARCHAR (5)    NULL,
    [Change]           CHAR (1)       CONSTRAINT [DF_SFDCCurrentChanges_Change] DEFAULT ('N') NULL,
    [SentFlag]         VARCHAR (1)    NOT NULL,
    [SentDate]         DATETIME       NULL,
    [LastModifiedByID] VARCHAR (18)   NULL
);

