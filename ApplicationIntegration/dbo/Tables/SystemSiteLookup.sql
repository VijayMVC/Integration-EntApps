CREATE TABLE [dbo].[SystemSiteLookup] (
    [Code]         CHAR (20)      NULL,
    [HospitalName] VARCHAR (100)  NULL,
    [SFID]         CHAR (18)      NULL,
    [TCstruct]     VARCHAR (50)   NULL,
    [WebCode]      NVARCHAR (255) NULL,
    [ProcessLevel] FLOAT (53)     NULL,
    [CtrKey]       VARCHAR (100)  NULL,
    [CtrTin]       INT            NULL,
    [Bdg_CtrID]    INT            NULL,
    [BdgPatients]  INT            NULL,
    [MARSPractice] CHAR (3)       NULL,
    [Ctr_CtrTypID] VARCHAR (10)   NULL,
    [CtrID]        INT            NULL
);

