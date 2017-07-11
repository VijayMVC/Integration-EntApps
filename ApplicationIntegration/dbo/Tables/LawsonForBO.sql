CREATE TABLE [dbo].[LawsonForBO] (
    [ProviderMasterID]  INT       NULL,
    [EMPLOYEE]          INT       NOT NULL,
    [EMP_STATUS]        CHAR (2)  NOT NULL,
    [LAST_NAME]         CHAR (30) NOT NULL,
    [FIRST_NAME]        CHAR (15) NOT NULL,
    [HireDate]          DATETIME  NOT NULL,
    [AdjHireDate]       DATETIME  NOT NULL,
    [BEN_DATE_1]        DATETIME  NOT NULL,
    [BEN_DATE_2]        DATETIME  NOT NULL,
    [PROCESS_LEVEL]     CHAR (5)  NOT NULL,
    [Process_LevelDesc] CHAR (30) NOT NULL,
    [JOB_CODE]          CHAR (9)  NOT NULL,
    [JobCodeDesc]       CHAR (30) NOT NULL,
    [PositionCode]      CHAR (12) NOT NULL,
    [POS_LEVEL]         SMALLINT  NOT NULL
);

