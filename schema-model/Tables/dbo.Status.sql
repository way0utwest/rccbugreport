CREATE TABLE [dbo].[Status]
(
[Statusid] [int] NOT NULL,
[Status] [varchar] (50) NULL,
[ModifiedDate] [datetime2] NULL,
[Active] [bit] NULL
)
GO
ALTER TABLE [dbo].[Status] ADD CONSTRAINT [pk_Status] PRIMARY KEY CLUSTERED ([Statusid])
GO
