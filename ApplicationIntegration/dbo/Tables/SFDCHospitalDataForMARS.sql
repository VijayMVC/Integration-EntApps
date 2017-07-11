CREATE TABLE [dbo].[SFDCHospitalDataForMARS] (
    [AccountName]               NVARCHAR (255) NOT NULL,
    [WebCode]                   CHAR (20)      NULL,
    [ParentAccount]             NVARCHAR (255) NULL,
    [AdmitRate]                 DECIMAL (18)   NULL,
    [CEPDivision]               NVARCHAR (255) NULL,
    [CEPRegion]                 NVARCHAR (255) NULL,
    [BillingState]              NVARCHAR (80)  NULL,
    [HospitalistContractHolder] NVARCHAR (255) NULL,
    [BedSizeRange]              NVARCHAR (255) NULL,
    [EDAdmissions]              DECIMAL (18)   NULL,
    [EDBed]                     DECIMAL (18)   NULL,
    [EDContractHolder]          NVARCHAR (255) NULL,
    [EDVists]                   DECIMAL (18)   NULL,
    [LicensedBeds]              DECIMAL (18)   NULL,
    [EmergencyDept]             NVARCHAR (255) NULL,
    [EmergencyMedicine]         VARCHAR (5)    NULL,
    [PrimaryService]            NVARCHAR (255) NULL,
    [TraumaLevel]               NVARCHAR (255) NULL,
    [MedicareID]                NVARCHAR (255) NULL,
    [MedicareID2]               NVARCHAR (255) NULL
);

