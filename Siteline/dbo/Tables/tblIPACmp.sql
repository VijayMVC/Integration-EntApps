CREATE TABLE [dbo].[tblIPACmp] (
    [IPACmpID]        INT            IDENTITY (1, 1) NOT NULL,
    [IPACmpIPA_CmpID] INT            NULL,
    [IPACmpAf_CmpID]  CHAR (50)      NULL,
    [IPACmpType]      INT            NOT NULL,
    [IPACmpComment]   VARCHAR (2000) NULL,
    PRIMARY KEY CLUSTERED ([IPACmpID] ASC) WITH (FILLFACTOR = 90)
);

