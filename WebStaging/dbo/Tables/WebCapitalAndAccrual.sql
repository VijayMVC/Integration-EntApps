﻿CREATE TABLE [dbo].[WebCapitalAndAccrual] (
    [ID1]              INT          IDENTITY (1, 1) NOT NULL,
    [ProviderMasterID] INT          NULL,
    [ClockNo]          VARCHAR (10) NULL,
    [Credate]          DATETIME     CONSTRAINT [DF_WebCapitalAndAccrual_Credate] DEFAULT (getdate()) NULL,
    [CapMD1]           DECIMAL (10) NULL,
    [AccrMD1]          DECIMAL (10) NULL,
    [PeMD1]            DECIMAL (10) NULL,
    [CapAOP1]          DECIMAL (10) NULL,
    [AccrAOP1]         DECIMAL (10) NULL,
    [PeAOP1]           DECIMAL (10) NULL,
    [CapTAP1]          DECIMAL (10) NULL,
    [AccrTAP1]         DECIMAL (10) NULL,
    [PeTAP1]           DECIMAL (10) NULL,
    [CapMD2]           DECIMAL (10) NULL,
    [AccrMD2]          DECIMAL (10) NULL,
    [PeMD2]            DECIMAL (10) NULL,
    [CapAOP2]          DECIMAL (10) NULL,
    [AccrAOP2]         DECIMAL (10) NULL,
    [PeAOP2]           DECIMAL (10) NULL,
    [CapTAP2]          DECIMAL (10) NULL,
    [AccrTAP2]         DECIMAL (10) NULL,
    [PeTAP2]           DECIMAL (10) NULL,
    [CapMD3]           DECIMAL (10) NULL,
    [AccrMD3]          DECIMAL (10) NULL,
    [PeMD3]            DECIMAL (10) NULL,
    [CapAOP3]          DECIMAL (10) NULL,
    [AccrAOP3]         DECIMAL (10) NULL,
    [PeAOP3]           DECIMAL (10) NULL,
    [CapTAP3]          DECIMAL (10) NULL,
    [AccrTAP3]         DECIMAL (10) NULL,
    [PeTAP3]           DECIMAL (10) NULL,
    [CapMD4]           DECIMAL (10) NULL,
    [AccrMD4]          DECIMAL (10) NULL,
    [PeMD4]            DECIMAL (10) NULL,
    [CapAOP4]          DECIMAL (10) NULL,
    [AccrAOP4]         DECIMAL (10) NULL,
    [PeAOP4]           DECIMAL (10) NULL,
    [CapTAP4]          DECIMAL (10) NULL,
    [AccrTAP4]         DECIMAL (10) NULL,
    [PeTAP4]           DECIMAL (10) NULL,
    [CapMD5]           DECIMAL (10) NULL,
    [AccrMD5]          DECIMAL (10) NULL,
    [PeMD5]            DECIMAL (10) NULL,
    [CapAOP5]          DECIMAL (10) NULL,
    [AccrAOP5]         DECIMAL (10) NULL,
    [PeAOP5]           DECIMAL (10) NULL,
    [CapTAP5]          DECIMAL (10) NULL,
    [AccrTAP5]         DECIMAL (10) NULL,
    [PeTAP5]           DECIMAL (10) NULL,
    [CapMD6]           DECIMAL (10) NULL,
    [AccrMD6]          DECIMAL (10) NULL,
    [PeMD6]            DECIMAL (10) NULL,
    [CapAOP6]          DECIMAL (10) NULL,
    [AccrAOP6]         DECIMAL (10) NULL,
    [PeAOP6]           DECIMAL (10) NULL,
    [CapTAP6]          DECIMAL (10) NULL,
    [AccrTAP6]         DECIMAL (10) NULL,
    [PeTAP6]           DECIMAL (10) NULL,
    [CapMD7]           DECIMAL (10) NULL,
    [AccrMD7]          DECIMAL (10) NULL,
    [PeMD7]            DECIMAL (10) NULL,
    [CapAOP7]          DECIMAL (10) NULL,
    [AccrAOP7]         DECIMAL (10) NULL,
    [PeAOP7]           DECIMAL (10) NULL,
    [CapTAP7]          DECIMAL (10) NULL,
    [AccrTAP7]         DECIMAL (10) NULL,
    [PeTAP7]           DECIMAL (10) NULL,
    [CapMD8]           DECIMAL (10) NULL,
    [AccrMD8]          DECIMAL (10) NULL,
    [PeMD8]            DECIMAL (10) NULL,
    [CapAOP8]          DECIMAL (10) NULL,
    [AccrAOP8]         DECIMAL (10) NULL,
    [PeAOP8]           DECIMAL (10) NULL,
    [CapTAP8]          DECIMAL (10) NULL,
    [AccrTAP8]         DECIMAL (10) NULL,
    [PeTAP8]           DECIMAL (10) NULL,
    [CapMD9]           DECIMAL (10) NULL,
    [AccrMD9]          DECIMAL (10) NULL,
    [PeMD9]            DECIMAL (10) NULL,
    [CapAOP9]          DECIMAL (10) NULL,
    [AccrAOP9]         DECIMAL (10) NULL,
    [PeAOP9]           DECIMAL (10) NULL,
    [CapTAP9]          DECIMAL (10) NULL,
    [AccrTAP9]         DECIMAL (10) NULL,
    [PeTAP9]           DECIMAL (10) NULL
);

