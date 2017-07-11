CREATE TABLE [dbo].[BSwiftDemographicsForWeb] (
    [GROUP NUMBER]       VARCHAR (10)   NOT NULL,
    [EMPLOYEEID]         INT            NOT NULL,
    [FIRST NAME]         CHAR (15)      NOT NULL,
    [LAST NAME]          VARCHAR (8000) NULL,
    [BENEFIT CLASS CODE] VARCHAR (11)   NOT NULL,
    [HIRE DATE]          DATETIME       NOT NULL,
    [WORK EMAIL]         CHAR (60)      NULL,
    [USER NAME]          VARCHAR (35)   NULL,
    [EMPLOYMENT STATUS]  VARCHAR (1)    NOT NULL
);

