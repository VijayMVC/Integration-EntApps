CREATE TABLE [dbo].[Galen_NoAdoptionProviders] (
    [Ttl]              VARCHAR (2)   NOT NULL,
    [ProviderMasterID] INT           NULL,
    [WebID]            INT           NULL,
    [WeeksBack]        INT           NOT NULL,
    [RunDate]          DATETIME      NOT NULL,
    [LastName]         VARCHAR (50)  NULL,
    [FirstName]        VARCHAR (50)  NULL,
    [Title]            VARCHAR (100) NULL,
    [EmailAddress]     VARCHAR (100) NULL,
    [CEPEmail]         VARCHAR (100) NULL,
    [Site1]            VARCHAR (5)   NULL,
    [Site2]            VARCHAR (5)   NULL,
    [Site3]            VARCHAR (5)   NULL,
    [Site4]            VARCHAR (5)   NULL,
    [Status]           CHAR (1)      NULL,
    [CEPLevel]         VARCHAR (5)   NULL,
    [HireDate]         SMALLDATETIME NULL
);

