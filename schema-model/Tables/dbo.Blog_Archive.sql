CREATE TABLE [dbo].[Blog_Archive]
(
[BlogArchiveID] [int] NOT NULL IDENTITY(1, 1),
[BlogID] [int] NULL,
[BlogName] [varchar] (200) NULL,
[ModDate] [datetime2] NULL,
[CrDate] [datetime2] NULL,
[Tagline] [varchar] (200) NULL,
[BlogURL] [varchar] (200) NULL
)
GO
ALTER TABLE [dbo].[Blog_Archive] ADD CONSTRAINT [Blog_Archive_PK] PRIMARY KEY CLUSTERED ([BlogArchiveID])
GO
