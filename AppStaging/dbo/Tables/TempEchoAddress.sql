CREATE TABLE [dbo].[TempEchoAddress] (
    [StaffGroup]       VARCHAR (50) NULL,
    [ActiveFlag]       CHAR (1)     NULL,
    [PGroupsTax_ID]    CHAR (15)    NULL,
    [AddressTax_ID]    CHAR (15)    NULL,
    [Echo_Dr_ID]       CHAR (12)    NULL,
    [Addr_ID]          CHAR (12)    NULL,
    [Fax]              CHAR (14)    NULL,
    [Sch_Type]         CHAR (5)     NULL,
    [SchTypeTxt]       VARCHAR (25) NULL,
    [Addr]             VARCHAR (30) NULL,
    [Addr2]            VARCHAR (30) NULL,
    [AddressListOrder] INT          NULL,
    [City]             CHAR (20)    NULL,
    [State]            CHAR (2)     NULL,
    [Zip]              CHAR (10)    NULL,
    [Phone]            CHAR (14)    NULL,
    [Cmt]              CHAR (40)    NULL,
    [Extension]        CHAR (5)     NULL,
    [Override]         BIT          NULL,
    [Phone2]           CHAR (14)    NULL,
    [Extension2]       CHAR (5)     NULL,
    [L_Pgroups]        CHAR (15)    NULL,
    [LocCodeTxt]       VARCHAR (25) NULL,
    [PTypeTxt]         VARCHAR (30) NULL,
    [PGroup_Nm]        VARCHAR (60) NULL,
    [Clia]             VARCHAR (15) NULL,
    [ProviderMasterID] INT          NULL
);


GO
CREATE CLUSTERED INDEX [TEA_Dr_ID_idx]
    ON [dbo].[TempEchoAddress]([Echo_Dr_ID] ASC) WITH (FILLFACTOR = 90);

