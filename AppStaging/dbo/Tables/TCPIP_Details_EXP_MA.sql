CREATE TABLE [dbo].[TCPIP_Details_EXP_MA] (
    [id]         INT            NOT NULL,
    [Uid]        CHAR (10)      NOT NULL,
    [TCID0]      CHAR (4)       NULL,
    [TCID]       CHAR (9)       NULL,
    [dat]        DATETIME       NOT NULL,
    [vacDate]    NVARCHAR (200) NOT NULL,
    [hrs_vac]    INT            NOT NULL,
    [sickDate]   NVARCHAR (200) NOT NULL,
    [hrs_sick]   INT            NOT NULL,
    [holDate]    NVARCHAR (200) NOT NULL,
    [hrs_hol]    INT            NOT NULL,
    [othDate]    NVARCHAR (200) NOT NULL,
    [hrs_oth]    INT            NOT NULL,
    [oth_type]   CHAR (10)      NOT NULL,
    [isCheck]    CHAR (10)      NOT NULL,
    [isApproved] CHAR (10)      NOT NULL,
    [time_stmp]  DATETIME       NOT NULL,
    [admnName]   NVARCHAR (50)  NOT NULL,
    [flag]       CHAR (1)       NOT NULL
);

