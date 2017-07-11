CREATE TABLE [dbo].[SFDCHospital] (
    [ContractId]           NCHAR (18)     NULL,
    [AccountId]            NCHAR (18)     NOT NULL,
    [StaffGroup]           VARCHAR (5)    NOT NULL,
    [HospitalName]         NVARCHAR (255) NULL,
    [WebName]              NVARCHAR (267) NULL,
    [Addr]                 NVARCHAR (255) NULL,
    [City]                 NVARCHAR (40)  NULL,
    [State]                NVARCHAR (20)  NULL,
    [Zip]                  NVARCHAR (20)  NULL,
    [Nation]               NVARCHAR (40)  NULL,
    [Phone]                NVARCHAR (40)  NULL,
    [Fax]                  NVARCHAR (40)  NULL,
    [Region]               VARCHAR (4)    NULL,
    [PracticeLocation]     NVARCHAR (255) NULL,
    [PracticeLocationCode] NVARCHAR (10)  NULL
);

