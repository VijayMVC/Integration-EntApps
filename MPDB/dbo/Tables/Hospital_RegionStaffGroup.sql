CREATE TABLE [dbo].[Hospital_RegionStaffGroup] (
    [ID]           INT            NULL,
    [StaffGroup]   VARCHAR (50)   NULL,
    [Code]         CHAR (20)      NOT NULL,
    [HospitalName] NVARCHAR (100) NOT NULL,
    [Site_Dir]     NCHAR (50)     NULL,
    [AssSite_Dir]  NCHAR (50)     NULL,
    [Reimb_Dir]    NCHAR (50)     NULL,
    [CMO]          NCHAR (10)     NULL,
    [EMS_dir]      NCHAR (10)     NULL,
    [NP_dir]       NCHAR (10)     NULL,
    [QI_DIR]       NCHAR (50)     NULL,
    [QI_authors]   NVARCHAR (100) NULL,
    [other_admin]  NVARCHAR (50)  NULL,
    [Region]       CHAR (5)       NULL,
    [Description]  NVARCHAR (800) NULL,
    [ContactInfo]  NVARCHAR (200) NULL,
    [MDrate]       CHAR (5)       NULL,
    [division]     CHAR (10)      NULL,
    [dept]         CHAR (10)      NULL,
    [TCstruct]     VARCHAR (50)   NULL
);

