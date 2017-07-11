CREATE TABLE [dbo].[MAExemptTimecard] (
    [id]           INT            NOT NULL,
    [LastName]     VARCHAR (100)  NULL,
    [FirstName]    VARCHAR (100)  NULL,
    [TCID]         CHAR (9)       NULL,
    [TCDate]       DATETIME       NOT NULL,
    [VacDate]      NVARCHAR (200) NOT NULL,
    [VacHours]     INT            NOT NULL,
    [SickDate]     NVARCHAR (200) NOT NULL,
    [SickHours]    INT            NOT NULL,
    [HolidayDate]  NVARCHAR (200) NOT NULL,
    [HolidayHours] INT            NOT NULL,
    [OtherDate]    NVARCHAR (200) NOT NULL,
    [OtherHours]   INT            NOT NULL,
    [OtherType]    CHAR (10)      NOT NULL,
    [isCheck]      CHAR (10)      NOT NULL,
    [isApproved]   CHAR (10)      NOT NULL,
    [TimeStamp]    DATETIME       NOT NULL,
    [AdminName]    NVARCHAR (50)  NOT NULL,
    [Flag]         CHAR (1)       NOT NULL
);

