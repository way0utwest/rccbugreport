CREATE TABLE [dbo].[Blogs]
(
[BlogID] [int] NOT NULL IDENTITY(1, 1),
[BlogName] [varchar] (200) NULL,
[modifieddate] [datetime2] (3) NOT NULL CONSTRAINT [dfSysDateTime] DEFAULT (sysdatetime()),
[createdate] [datetime2] (3) NOT NULL CONSTRAINT [df_SysUTCDate] DEFAULT (sysdatetime()),
[BlogTagline] [varchar] (300) NULL,
[BlogURL] [varchar] (300) NULL
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[BlogArchiveModDate] ON [dbo].[Blogs] FOR UPDATE
AS
INSERT dbo.BlogArchive_ModDate
(   BlogID,
    modifieddate
)
SELECT Deleted.BlogID,
       Deleted.modifieddate 
 FROM Deleted
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[Blogs_DateChange] ON [dbo].[Blogs] FOR UPDATE
AS
BEGIN
    INSERT Blog_Archive
	SELECT top 10
	 Deleted.BlogID,
     Deleted.BlogName,
     Deleted.modifieddate,
     Deleted.createdate,
     Deleted.BlogTagline,
     Deleted.BlogURL
	 FROM Deleted
END
GO
ALTER TABLE [dbo].[Blogs] ADD CONSTRAINT [CK_blogs_blank] CHECK ((len([BlogName])>(0)))
GO
ALTER TABLE [dbo].[Blogs] ADD CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED ([BlogID])
GO
