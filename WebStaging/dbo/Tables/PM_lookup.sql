CREATE TABLE [dbo].[PM_lookup] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [LastName]    NVARCHAR (25) NOT NULL,
    [FirstName]   NVARCHAR (25) NOT NULL,
    [MidName]     CHAR (10)     NULL,
    [Code]        NVARCHAR (50) NOT NULL,
    [Lvl]         CHAR (10)     NULL,
    [IsAvailable] CHAR (1)      NULL
);

