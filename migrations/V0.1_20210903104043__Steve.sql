SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
DECLARE @associate bit
SELECT @associate = CASE SERVERPROPERTY('EngineEdition') WHEN 5 THEN 1 ELSE 0 END
IF @associate = 0 EXEC sp_executesql N'SELECT @count = COUNT(*) FROM master.dbo.syslogins WHERE loginname = N''ADORelease''', N'@count bit OUT', @associate OUT
IF @associate = 1
BEGIN
    PRINT N'Creating user [ADORelease] and mapping to the login [ADORelease]'
    CREATE USER [ADORelease] FOR LOGIN [ADORelease]
END
ELSE
BEGIN
    PRINT N'Creating user [ADORelease] without login'
    CREATE USER [ADORelease] WITHOUT LOGIN
END
GO
PRINT N'Creating [dbo].[AppLogger]'
GO
CREATE TABLE [dbo].[AppLogger]
(
[LogDate] [datetime2] NOT NULL,
[LogCat] [varchar] (100) NULL,
[LogMsg] [varchar] (max) NULL,
[readflag] [bit] NULL,
[Completed] [bit] NULL
)
GO
PRINT N'Creating primary key [PK_AppLogger] on [dbo].[AppLogger]'
GO
ALTER TABLE [dbo].[AppLogger] ADD CONSTRAINT [PK_AppLogger] PRIMARY KEY CLUSTERED ([LogDate])
GO
PRINT N'Creating [dbo].[AddLog]'
GO
CREATE PROCEDURE [dbo].[AddLog]
    @logMsg VARCHAR(2000),
    @Logdate DATETIME2 = NULL,
    @LogCat VARCHAR(200) = ''
AS
BEGIN
    IF @Logdate IS NULL
        SELECT @Logdate = GETDATE()
    INSERT dbo.AppLogger
    (
        LogDate,
        LogCat,
        LogMsg,
        readflag
    )
    VALUES
    (   @Logdate, -- LogDate - datetime2(7)
        @LogCat,  -- LogCat - varchar(100)
        @logMsg,  -- LogMsg - varchar(max)
        NULL     -- readflag - bit
    );

END;
GO
GRANT CONNECT TO [ADORelease]
