CREATE TABLE [dbo].[AppLogger]
(
[LogDate] [datetime2] NOT NULL,
[LogCat] [varchar] (100) NULL,
[LogMsg] [varchar] (max) NULL,
[readflag] [bit] NULL,
[Completed] [bit] NULL
)
GO
ALTER TABLE [dbo].[AppLogger] ADD CONSTRAINT [PK_AppLogger] PRIMARY KEY CLUSTERED ([LogDate])
GO
