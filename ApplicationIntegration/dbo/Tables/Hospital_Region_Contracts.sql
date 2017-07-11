CREATE TABLE [dbo].[Hospital_Region_Contracts] (
    [ContractID]            NCHAR (18)      NOT NULL,
    [AccountId]             NCHAR (18)      NOT NULL,
    [StaffGroup]            VARCHAR (5)     NULL,
    [HospitalName]          NVARCHAR (255)  NULL,
    [WebName]               NVARCHAR (255)  NULL,
    [Addr]                  NVARCHAR (255)  NULL,
    [City]                  NVARCHAR (40)   NULL,
    [State]                 NVARCHAR (20)   NULL,
    [Zip]                   NVARCHAR (20)   NULL,
    [Nation]                NVARCHAR (40)   NULL,
    [Phone__c]              NVARCHAR (1300) NULL,
    [Fax__c]                NVARCHAR (1300) NULL,
    [Region]                VARCHAR (4)     NOT NULL,
    [ED_Contract_Holder__c] NCHAR (18)      NULL
);

