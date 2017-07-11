CREATE TABLE [dbo].[CAL_schedule_avail_4DR] (
    [id]           INT            NOT NULL,
    [site]         CHAR (4)       NOT NULL,
    [date]         SMALLDATETIME  NULL,
    [uid]          CHAR (10)      NULL,
    [allDayStatus] VARCHAR (500)  NULL,
    [timestart1]   VARCHAR (10)   NULL,
    [timeend1]     VARCHAR (10)   NULL,
    [isPrefer1]    CHAR (1)       NULL,
    [timestart2]   VARCHAR (10)   NULL,
    [timeend2]     VARCHAR (10)   NULL,
    [isPrefer2]    CHAR (1)       NULL,
    [NumHours]     CHAR (10)      NULL,
    [NumShifts]    CHAR (10)      NULL,
    [NumMaxCons]   CHAR (10)      NULL,
    [MaxNight]     CHAR (10)      NULL,
    [comment]      VARCHAR (4000) NULL,
    [ts]           SMALLDATETIME  NULL,
    [shiftList]    VARCHAR (5000) NULL,
    [CreDate]      DATETIME       CONSTRAINT [DF_CAL_schedule_avail_4DR_CreDate] DEFAULT (getdate()) NULL
);

