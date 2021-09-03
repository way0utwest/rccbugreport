CREATE TABLE [dbo].[BlogContent]
(
[BlogContentKey] [int] NOT NULL IDENTITY(1, 1),
[BlogID] [int] NULL,
[BlogEntryTitle] [varchar] (200) NULL,
[BlogEntry] [varchar] (max) NULL,
[BlogContentStatus] [int] NULL
)
GO
ALTER TABLE [dbo].[BlogContent] ADD CONSTRAINT [BlogContentPK] PRIMARY KEY CLUSTERED ([BlogContentKey])
GO
ALTER TABLE [dbo].[BlogContent] ADD CONSTRAINT [BlogContent_Blogs_BlogID] FOREIGN KEY ([BlogID]) REFERENCES [dbo].[Blogs] ([BlogID])
GO
