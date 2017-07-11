CREATE TABLE [dbo].[SFDCDupe] (
    [LastName]           NVARCHAR (80)   NOT NULL,
    [FirstName]          NVARCHAR (40)   NULL,
    [Email]              NVARCHAR (80)   NULL,
    [Title]              NVARCHAR (255)  NULL,
    [Alternate_Email__c] NVARCHAR (80)   NULL,
    [MName]              NVARCHAR (1300) NULL,
    [Street]             NVARCHAR (255)  NULL,
    [City]               NVARCHAR (40)   NULL,
    [State]              NVARCHAR (80)   NULL,
    [PostalCode]         NVARCHAR (20)   NULL,
    [Phone]              NVARCHAR (40)   NULL,
    [MobilePhone]        NVARCHAR (40)   NULL,
    [CreatedBy]          NVARCHAR (121)  NOT NULL,
    [CreatedDate]        DATETIME2 (7)   NOT NULL,
    [RecType]            NVARCHAR (80)   NOT NULL,
    [Type]               VARCHAR (7)     NOT NULL
);

