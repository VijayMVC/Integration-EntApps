﻿CREATE TABLE [dbo].[PA_TCPIP_details] (
    [id]               INT             NOT NULL,
    [TCID]             CHAR (10)       NULL,
    [dat]              SMALLDATETIME   NULL,
    [site]             CHAR (10)       NULL,
    [isPrimary]        CHAR (1)        NULL,
    [startHr]          DECIMAL (10, 4) NULL,
    [hrs_day]          DECIMAL (10, 4) NULL,
    [hrs_nite]         DECIMAL (10, 4) NULL,
    [hrs_wknd]         DECIMAL (10, 4) NULL,
    [brkIn]            CHAR (10)       NULL,
    [brkOut]           CHAR (10)       NULL,
    [hrs_BRK]          DECIMAL (10, 4) NULL,
    [hrs_admin]        DECIMAL (10, 4) NULL,
    [hrs_mtg]          DECIMAL (10, 4) NULL,
    [hrs_oth]          DECIMAL (10, 4) NULL,
    [typeoth]          CHAR (10)       NULL,
    [hrs_PTO]          DECIMAL (10, 4) NULL,
    [hrs_sick]         DECIMAL (10, 4) NULL,
    [commnt]           VARCHAR (200)   NULL,
    [hrs_day_4OT]      DECIMAL (10, 4) NULL,
    [hrs_nite_4OT]     DECIMAL (10, 4) NULL,
    [hrs_wknd_4OT]     DECIMAL (10, 4) NULL,
    [hrs_day_woBRK]    DECIMAL (10, 4) NULL,
    [hrs_nite_woBRK]   DECIMAL (10, 4) NULL,
    [hrs_wknd_woBRK]   DECIMAL (10, 4) NULL,
    [hrs_TTL_4OT]      DECIMAL (10, 4) NULL,
    [hrs_TTL]          DECIMAL (10, 4) NULL,
    [hrs_STT]          DECIMAL (10, 4) NULL,
    [hrs_day_STT]      DECIMAL (10, 4) NULL,
    [hrs_nite_STT]     DECIMAL (10, 4) NULL,
    [hrs_wknd_STT]     DECIMAL (10, 4) NULL,
    [hrs_OT]           DECIMAL (10, 4) NULL,
    [hrs_day_OT]       DECIMAL (10, 4) NULL,
    [hrs_nite_OT]      DECIMAL (10, 4) NULL,
    [hrs_wknd_OT]      DECIMAL (10, 4) NULL,
    [hrs_DT]           DECIMAL (10, 4) NULL,
    [hrs_day_DT]       DECIMAL (10, 4) NULL,
    [hrs_nite_DT]      DECIMAL (10, 4) NULL,
    [hrs_wknd_DT]      DECIMAL (10, 4) NULL,
    [adj_hrs_STT]      DECIMAL (10, 4) NULL,
    [adj_hrs_day_STT]  DECIMAL (10, 4) NULL,
    [adj_hrs_nite_STT] DECIMAL (10, 4) NULL,
    [adj_hrs_wknd_STT] DECIMAL (10, 4) NULL,
    [adj_hrs_OT]       DECIMAL (10, 4) NULL,
    [adj_hrs_day_OT]   DECIMAL (10, 4) NULL,
    [adj_hrs_nite_OT]  DECIMAL (10, 4) NULL,
    [adj_hrs_wknd_OT]  DECIMAL (10, 4) NULL,
    [adj_hrs_DT]       DECIMAL (10, 4) NULL,
    [adj_hrs_day_DT]   DECIMAL (10, 4) NULL,
    [adj_hrs_nite_DT]  DECIMAL (10, 4) NULL,
    [adj_hrs_wknd_DT]  DECIMAL (10, 4) NULL
);

