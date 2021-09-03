CREATE TABLE [dbo].[Contacts]
(
[ContactsID] [int] NOT NULL IDENTITY(1, 1),
[ContactFullName] [nvarchar] (100) NOT NULL,
[PhoneWork] [nvarchar] (25) NULL,
[PhoneMobile] [nvarchar] (25) NULL,
[Address1] [nvarchar] (128) NULL,
[Address2] [nvarchar] (128) NULL,
[Address3] [nvarchar] (128) NULL,
[CountryCode] [nvarchar] (4) NULL,
[JoiningDate] [datetime] NULL,
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [dfSysUTCDate] DEFAULT (sysdatetime()),
[Email] [nvarchar] (256) NULL,
[Photo] [image] NULL,
[ModifiedBy] [varchar] (50) NULL,
[StatusID] [int] NOT NULL,
[taxid] [varchar] (9) NULL
)
GO
ALTER TABLE [dbo].[Contacts] ADD CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED ([ContactsID])
GO
ALTER TABLE [dbo].[Contacts] ADD CONSTRAINT [FK_Contacts_Status_StatusID] FOREIGN KEY ([StatusID]) REFERENCES [dbo].[Status] ([Statusid])
GO
ADD SENSITIVITY CLASSIFICATION TO [dbo].[Contacts].[Address1] WITH (LABEL = 'Confidential', LABEL_ID = '331f0b13-76b5-2f1b-a77b-def5a73c73c2', INFORMATION_TYPE = 'Contact Info', INFORMATION_TYPE_ID = '5c503e21-22c6-81fa-620b-f369b8ec38d1')
GO
ADD SENSITIVITY CLASSIFICATION TO [dbo].[Contacts].[Address2] WITH (LABEL = 'Confidential', LABEL_ID = '331f0b13-76b5-2f1b-a77b-def5a73c73c2', INFORMATION_TYPE = 'Contact Info', INFORMATION_TYPE_ID = '5c503e21-22c6-81fa-620b-f369b8ec38d1')
GO
