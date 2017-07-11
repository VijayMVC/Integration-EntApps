CREATE TABLE [dbo].[Ceridian_ChItem] (
    [CiMagic]     INT          NULL,
    [CiFlxIDCc]   INT          NULL,
    [CiFlxIDP2]   INT          NULL,
    [CiCRC]       INT          NULL,
    [CiSource]    INT          NULL,
    [CiNote]      INT          NULL,
    [CiFlxID]     INT          NOT NULL,
    [CiDateAdd]   DATETIME     NULL,
    [CiDateMod]   DATETIME     NULL,
    [CiDateDel]   DATETIME     NULL,
    [CiDateBeg]   DATETIME     NULL,
    [CiDateEnd]   DATETIME     NULL,
    [CiDateRBeg]  DATETIME     NULL,
    [CiDateREnd]  DATETIME     NULL,
    [CiUserName]  VARCHAR (20) NULL,
    [CiRecType]   VARCHAR (4)  NULL,
    [CiArchive]   VARCHAR (1)  NULL,
    [CiValue]     VARCHAR (30) NOT NULL,
    [CiDescrip]   VARCHAR (30) NULL,
    [CiInfo1]     VARCHAR (20) NULL,
    [CiUpsize_ts] BINARY (8)   NULL
);

