CREATE TABLE [dbo].[LocumTenen] (
    [LastName]  NVARCHAR (80)  NOT NULL,
    [FirstName] NVARCHAR (40)  NULL,
    [Title__c]  NVARCHAR (255) NULL,
    [NPI]       NVARCHAR (10)  NULL,
    [Status]    INT            NOT NULL,
    [Type]      NVARCHAR (255) NULL
);

