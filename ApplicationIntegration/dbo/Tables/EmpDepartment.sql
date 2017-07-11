CREATE TABLE [dbo].[EmpDepartment] (
    [SFID]             NCHAR (18)    NULL,
    [ProviderMasterID] INT           NULL,
    [WebID]            INT           NULL,
    [HospSFID]         CHAR (18)     NULL,
    [Code]             CHAR (20)     NULL,
    [HospitalName]     VARCHAR (100) NULL,
    [PrimeSite]        VARCHAR (1)   NOT NULL
);

