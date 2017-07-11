﻿CREATE TABLE [dbo].[WebPA_Cal_Schedule_Slots_4DR] (
    [id]                INT            NOT NULL,
    [uid]               CHAR (10)      NULL,
    [uid_N]             CHAR (10)      NULL,
    [type]              CHAR (4)       NULL,
    [date]              SMALLDATETIME  NULL,
    [site]              CHAR (10)      NULL,
    [isFTK]             CHAR (1)       NULL,
    [flag]              CHAR (1)       NULL,
    [flagWknd]          CHAR (1)       NULL,
    [isClinic]          CHAR (1)       NOT NULL,
    [timestart]         FLOAT (53)     NULL,
    [timestart_N]       FLOAT (53)     NULL,
    [timeend]           FLOAT (53)     NULL,
    [timeend_N]         FLOAT (53)     NULL,
    [hourNum]           FLOAT (53)     NULL,
    [timeStamp]         DATETIME       NULL,
    [modifierID]        CHAR (10)      NULL,
    [TSapprove]         DATETIME       NULL,
    [approverID]        CHAR (10)      NULL,
    [isApprove]         CHAR (1)       NULL,
    [isLock]            CHAR (1)       NOT NULL,
    [isHide]            CHAR (1)       NULL,
    [TSbatchupd]        DATETIME       NULL,
    [EPSKED_shftID]     VARCHAR (50)   NULL,
    [change_cmt]        NVARCHAR (500) NULL,
    [shift_markingCode] CHAR (1)       NULL,
    [shift_rank]        INT            NULL,
    [CreDate]           DATETIME       CONSTRAINT [DF_WebPA_Cal_Schedule_Slots_4DR_CreDate] DEFAULT (getdate()) NULL
);

