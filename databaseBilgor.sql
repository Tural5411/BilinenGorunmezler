USE [Bilgor]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
	[PhotoId] [int] NULL,
	[Biography] [nvarchar](max) NULL,
	[Facebook] [nvarchar](150) NULL,
	[Instagram] [nvarchar](150) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_book]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_book](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Context] [nvarchar](max) NULL,
	[Page] [int] NULL,
	[WriterId] [int] NULL,
	[Filename] [nvarchar](500) NULL,
	[Fileurl] [nvarchar](1500) NULL,
	[BookCategoryId] [int] NULL,
	[PhotoId] [int] NULL,
 CONSTRAINT [PK_tbl_book] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_bookCategory]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bookCategory](
	[BookCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](70) NULL,
	[Description] [nchar](10) NULL,
	[PhotoId] [int] NULL,
 CONSTRAINT [PK_tbl_bookCategory] PRIMARY KEY CLUSTERED 
(
	[BookCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](70) NULL,
	[PhotoId] [int] NULL,
 CONSTRAINT [PK_tbl_category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_photo]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_photo](
	[PhotoId] [int] IDENTITY(1,1) NOT NULL,
	[URL] [nvarchar](600) NULL,
 CONSTRAINT [PK_tbl_photo] PRIMARY KEY CLUSTERED 
(
	[PhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_post]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](300) NULL,
	[Context] [nvarchar](max) NULL,
	[Views] [int] NULL,
	[Active] [bit] NULL,
	[Accept] [bit] NULL,
	[DateTime] [datetime] NULL,
	[CategoryId] [int] NULL,
	[AuthorId] [uniqueidentifier] NULL,
	[PhotoId] [int] NULL,
 CONSTRAINT [PK_tbl_post] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_video]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_video](
	[VideoId] [int] IDENTITY(1,1) NOT NULL,
	[VideoURL] [nvarchar](600) NULL,
	[PhotoId] [int] NULL,
	[Title] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_video] PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Writer]    Script Date: 27.01.2021 12:33:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Writer](
	[WriterId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_tbl_Writer] PRIMARY KEY CLUSTERED 
(
	[WriterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', NULL)
GO
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'0f5f039b-6cdc-4fbd-80f1-96216afeb518', N'ze5BJmEd+fOBvv0ylYrvNmtpuPA=', 1, N'JlwriXIWk0dOktlyCl036A==', NULL, N'Fatima@mail.ru', N'fatima@mail.ru', N'sual', N'Rj2tp8VT6RL3QFYyE+usU0yCcjs=', 1, 0, CAST(N'2021-01-01T14:57:26.000' AS DateTime), CAST(N'2021-01-26T19:30:57.267' AS DateTime), CAST(N'2021-01-01T14:57:26.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'90679ef8-4605-44b3-9f7d-70d512e3cd11', N'8vnCTtAzrwYzjVsryEGExMswHLA=', 1, N'VkzUVd03u8g3XE2G9rGnNA==', NULL, N'Gunel@mail.ru', N'gunel@mail.ru', N'sual', N'GJk7fW+tnnIT0Fxa0BSTjetmMIs=', 1, 0, CAST(N'2021-01-01T17:59:27.000' AS DateTime), CAST(N'2021-01-26T19:30:52.130' AS DateTime), CAST(N'2021-01-01T17:59:27.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'db7bec22-8dbb-4525-b5c8-f2891e5dedff', N'q3F/t7kJMqWhC3CY2+nuFtgc5pg=', 1, N'Nml1uBkhPu+69+Qre+Cmkw==', NULL, N'hemze@mail.ru', N'hemze@mail.ru', N'sual', N'7bTkD8PkDy2/JKndatLTqBf3+yk=', 1, 0, CAST(N'2021-01-20T18:15:52.000' AS DateTime), CAST(N'2021-01-26T14:48:38.820' AS DateTime), CAST(N'2021-01-20T18:15:52.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'981eb82c-c227-4b8d-87bd-84d1c25193a5', N'EFTsWYXX53QoUhKpnncCO3fHHBo=', 1, N'n/fbq0pSXRYxx2vViLrQow==', NULL, N'taleh@gmail.com', N'taleh@gmail.com', N'sual', N'bNQmorY4eBlkUI7GmqBbIvnSYbw=', 1, 0, CAST(N'2020-12-30T12:29:39.000' AS DateTime), CAST(N'2021-01-26T14:48:19.583' AS DateTime), CAST(N'2020-12-30T12:29:39.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', N'A8NklhnzXssgb1fXPpcuKHp0UpY=', 1, N'4db3OTuRYSQze/4VYbK4Xg==', NULL, N'tural@mail.ru', N'tural@mail.ru', N'sual', N'fIchhQPU+q98D7bKkOxFjc1ZTAQ=', 1, 0, CAST(N'2020-12-30T12:22:43.000' AS DateTime), CAST(N'2021-01-26T19:03:23.420' AS DateTime), CAST(N'2021-01-18T19:24:59.643' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'084b2068-1b11-4150-8662-116a90f80d64', N'Jkt/PGX9DeNmRHaV6mmgb384Zlk=', 1, N'H2r2tpUtS7UG+NoB/Ffsrw==', NULL, N'turalabdulkhaligov@gmail.com', N'turalabdulkhaligov@gmail.com', N'Sual', N'O1vYytJ66vNVS0lZ+XwmHO9wkIo=', 1, 0, CAST(N'2021-01-01T17:37:21.000' AS DateTime), CAST(N'2021-01-01T17:58:26.573' AS DateTime), CAST(N'2021-01-01T17:37:21.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'86b561eb-3b10-4a3a-9a63-b82ee902b246', N'Admin', N'admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'c9389fdf-3741-4a48-981c-4af0ff142e6d', N'Moderator', N'moderator', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'7a912267-2ba1-4682-9027-cb6836f71dea', N'Yazıçı', N'yazıçı', NULL)
GO
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [PhotoId], [Biography], [Facebook], [Instagram]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'90679ef8-4605-44b3-9f7d-70d512e3cd11', N'Ayten', N'ayten', NULL, 0, CAST(N'2021-01-26T19:30:52.130' AS DateTime), 67, NULL, NULL, NULL)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [PhotoId], [Biography], [Facebook], [Instagram]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'0f5f039b-6cdc-4fbd-80f1-96216afeb518', N'Cavid', N'cavid', NULL, 0, CAST(N'2021-01-26T19:30:57.267' AS DateTime), 68, NULL, NULL, NULL)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [PhotoId], [Biography], [Facebook], [Instagram]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'db7bec22-8dbb-4525-b5c8-f2891e5dedff', N'Hemze5411', N'hemze5411', NULL, 0, CAST(N'2021-01-26T14:48:38.820' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [PhotoId], [Biography], [Facebook], [Instagram]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'981eb82c-c227-4b8d-87bd-84d1c25193a5', N'Taleh', N'taleh', NULL, 0, CAST(N'2021-01-26T14:48:19.583' AS DateTime), 66, NULL, NULL, NULL)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [PhotoId], [Biography], [Facebook], [Instagram]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', N'Tural', N'tural', NULL, 0, CAST(N'2021-01-26T19:03:23.420' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [PhotoId], [Biography], [Facebook], [Instagram]) VALUES (N'be4e72a1-ee25-4daa-bf38-8cafa02f9050', N'084b2068-1b11-4150-8662-116a90f80d64', N'TuralAbdul', N'turalabdul', NULL, 0, CAST(N'2021-01-01T17:58:26.573' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'981eb82c-c227-4b8d-87bd-84d1c25193a5', N'86b561eb-3b10-4a3a-9a63-b82ee902b246')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', N'86b561eb-3b10-4a3a-9a63-b82ee902b246')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'981eb82c-c227-4b8d-87bd-84d1c25193a5', N'7a912267-2ba1-4682-9027-cb6836f71dea')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0f5f039b-6cdc-4fbd-80f1-96216afeb518', N'7a912267-2ba1-4682-9027-cb6836f71dea')
GO
SET IDENTITY_INSERT [dbo].[tbl_book] ON 

INSERT [dbo].[tbl_book] ([BookId], [Name], [Context], [Page], [WriterId], [Filename], [Fileurl], [BookCategoryId], [PhotoId]) VALUES (1, N'Səfillər1', N'“Otello”nu Şekspirin digər tragediyalarından fərqləndirən əsas xüsusiyyət odur ki, Otello nə kral, nə şahzadə, nə də kral olmaq ehtirası və bu ehtirası reallaşdırmaq arzusu olan biridir. Otello, sadəcə, Venesiya dövlətinə xidmət edən adi kapitandır. Şübhəyə əsaslanaraq qərar qəbul etmək, insanların taleyinə hökm etmək istəyi, hisslərin ən qarışığı olan sevgi və şübhəylə qarşı-qarşıya qalmaq əsərin əsas ideyasıdır. Faciə təkcə Otellonun yox, bütün insanlığın faciəsidir. ', 700, 1, N'Cart', N'/Upload/bookb233b7062f91454e9e338a1302723d15.pdf', 1, 36)
INSERT [dbo].[tbl_book] ([BookId], [Name], [Context], [Page], [WriterId], [Filename], [Fileurl], [BookCategoryId], [PhotoId]) VALUES (2, N'Çevrilmə', N'“Otello”nu Şekspirin digər tragediyalarından fərqləndirən əsas xüsusiyyət odur ki, Otello nə kral, nə şahzadə, nə də kral olmaq ehtirası və bu ehtirası reallaşdırmaq arzusu olan biridir. Otello, sadəcə, Venesiya dövlətinə xidmət edən adi kapitandır. Şübhəyə əsaslanaraq qərar qəbul etmək, insanların taleyinə hökm etmək istəyi, hisslərin ən qarışığı olan sevgi və şübhəylə qarşı-qarşıya qalmaq əsərin əsas ideyasıdır. Faciə təkcə Otellonun yox, bütün insanlığın faciəsidir. ', 190, 1, N'cart1', N'/Upload/book/c68362f8d10f4fac82d06684831f936c.pdf', 2, 37)
INSERT [dbo].[tbl_book] ([BookId], [Name], [Context], [Page], [WriterId], [Filename], [Fileurl], [BookCategoryId], [PhotoId]) VALUES (13, N'Atama məktublar', N'“Otello”nu Şekspirin digər tragediyalarından fərqləndirən əsas xüsusiyyət odur ki, Otello nə kral, nə şahzadə, nə də kral olmaq ehtirası və bu ehtirası reallaşdırmaq arzusu olan biridir. Otello, sadəcə, Venesiya dövlətinə xidmət edən adi kapitandır. Şübhəyə əsaslanaraq qərar qəbul etmək, insanların taleyinə hökm etmək istəyi, hisslərin ən qarışığı olan sevgi və şübhəylə qarşı-qarşıya qalmaq əsərin əsas ideyasıdır. Faciə təkcə Otellonun yox, bütün insanlığın faciəsidir. ', 167, 1, N'cart2', N'/Upload/book/e2579cbad5484ef791719e462be9f53f.png', 3, 35)
INSERT [dbo].[tbl_book] ([BookId], [Name], [Context], [Page], [WriterId], [Filename], [Fileurl], [BookCategoryId], [PhotoId]) VALUES (19, N'Böyük Çörçill', N'“Otello”nu Şekspirin digər tragediyalarından fərqləndirən əsas xüsusiyyət odur ki, Otello nə kral, nə şahzadə, nə də kral olmaq ehtirası və bu ehtirası reallaşdırmaq arzusu olan biridir. Otello, sadəcə, Venesiya dövlətinə xidmət edən adi kapitandır. Şübhəyə əsaslanaraq qərar qəbul etmək, insanların taleyinə hökm etmək istəyi, hisslərin ən qarışığı olan sevgi və şübhəylə qarşı-qarşıya qalmaq əsərin əsas ideyasıdır. Faciə təkcə Otellonun yox, bütün insanlığın faciəsidir. ', 450, 1, N'cart3', N'/Upload/book/d201a1f3d2dd4603a74c376f6c358fd4.png', 2, 38)
INSERT [dbo].[tbl_book] ([BookId], [Name], [Context], [Page], [WriterId], [Filename], [Fileurl], [BookCategoryId], [PhotoId]) VALUES (20, N'İncognito / Beyinin Gizli Həyatı – David Eagleman', N'“Otello”nu Şekspirin digər tragediyalarından fərqləndirən əsas xüsusiyyət odur ki, Otello nə kral, nə şahzadə, nə də kral olmaq ehtirası və bu ehtirası reallaşdırmaq arzusu olan biridir. Otello, sadəcə, Venesiya dövlətinə xidmət edən adi kapitandır. Şübhəyə əsaslanaraq qərar qəbul etmək, insanların taleyinə hökm etmək istəyi, hisslərin ən qarışığı olan sevgi və şübhəylə qarşı-qarşıya qalmaq əsərin əsas ideyasıdır. Faciə təkcə Otellonun yox, bütün insanlığın faciəsidir. ', 300, 2, NULL, N'/Upload/bookb233b7062f91454e9e338a1302723d15.pdf', 4, 39)
INSERT [dbo].[tbl_book] ([BookId], [Name], [Context], [Page], [WriterId], [Filename], [Fileurl], [BookCategoryId], [PhotoId]) VALUES (21, N'XXI Əsr Üçün 21 Dərs – Yuval Noah Harari', N'“Otello”nu Şekspirin digər tragediyalarından fərqləndirən əsas xüsusiyyət odur ki, Otello nə kral, nə şahzadə, nə də kral olmaq ehtirası və bu ehtirası reallaşdırmaq arzusu olan biridir. Otello, sadəcə, Venesiya dövlətinə xidmət edən adi kapitandır.
Şübhəyə əsaslanaraq qərar qəbul etmək, insanların taleyinə hökm etmək istəyi, hisslərin ən qarışığı olan sevgi və şübhəylə qarşı-qarşıya qalmaq əsərin əsas ideyasıdır. Faciə təkcə Otellonun yox, bütün insanlığın faciəsidir.

Üz qabığının tərtibatı: Rafael Qasım
Kompüter tərtibatı: Rahilə Şamil
Korrektor: Vüqar Babazadə
Bakı, Qanun Nəşriyyat“Otello”nu Şekspirin digər tragediyalarından fərqləndirən əsas xüsusiyyət odur ki, Otello nə kral, nə şahzadə, nə də kral olmaq ehtirası və bu ehtirası reallaşdırmaq arzusu olan biridir. Otello, sadəcə, Venesiya dövlətinə xidmət edən adi kapitandır. Şübhəyə əsaslanaraq qərar qəbul etmək, insanların taleyinə hökm etmək istəyi, hisslərin ən qarışığı olan sevgi və şübhəylə qarşı-qarşıya qalmaq əsərin əsas ideyasıdır. Faciə təkcə Otellonun yox, bütün insanlığın faciəsidir. ı, 2020', 430, 1, NULL, N'/Upload/bookb233b7062f91454e9e338a1302723d15.pdf', 5, 40)
INSERT [dbo].[tbl_book] ([BookId], [Name], [Context], [Page], [WriterId], [Filename], [Fileurl], [BookCategoryId], [PhotoId]) VALUES (22, N'KOSMOS - Karl Edvard Saqan', N'“Otello”nu Şekspirin digər tragediyalarından fərqləndirən əsas xüsusiyyət odur ki, Otello nə kral, nə şahzadə, nə də kral olmaq ehtirası və bu ehtirası reallaşdırmaq arzusu olan biridir. Otello, sadəcə, Venesiya dövlətinə xidmət edən adi kapitandır. Şübhəyə əsaslanaraq qərar qəbul etmək, insanların taleyinə hökm etmək istəyi, hisslərin ən qarışığı olan sevgi və şübhəylə qarşı-qarşıya qalmaq əsərin əsas ideyasıdır. Faciə təkcə Otellonun yox, bütün insanlığın faciəsidir. ', 540, 2, NULL, N'/Upload/bookb233b7062f91454e9e338a1302723d15.pdf', 5, 41)
INSERT [dbo].[tbl_book] ([BookId], [Name], [Context], [Page], [WriterId], [Filename], [Fileurl], [BookCategoryId], [PhotoId]) VALUES (23, N'Zamanın Qısa Tarixi – Stephen Hawking', N'“Otello”nu Şekspirin digər tragediyalarından fərqləndirən əsas xüsusiyyət odur ki, Otello nə kral, nə şahzadə, nə də kral olmaq ehtirası və bu ehtirası reallaşdırmaq arzusu olan biridir. Otello, sadəcə, Venesiya dövlətinə xidmət edən adi kapitandır. Şübhəyə əsaslanaraq qərar qəbul etmək, insanların taleyinə hökm etmək istəyi, hisslərin ən qarışığı olan sevgi və şübhəylə qarşı-qarşıya qalmaq əsərin əsas ideyasıdır. Faciə təkcə Otellonun yox, bütün insanlığın faciəsidir. ', 241, 2, NULL, N'/Upload/bookb233b7062f91454e9e338a1302723d15.pdf', 6, 42)
INSERT [dbo].[tbl_book] ([BookId], [Name], [Context], [Page], [WriterId], [Filename], [Fileurl], [BookCategoryId], [PhotoId]) VALUES (24, N'TANRININ TARİXİ- Karen Armstronq', N'“Otello”nu Şekspirin digər tragediyalarından fərqləndirən əsas xüsusiyyət odur ki, Otello nə kral, nə şahzadə, nə də kral olmaq ehtirası və bu ehtirası reallaşdırmaq arzusu olan biridir. Otello, sadəcə, Venesiya dövlətinə xidmət edən adi kapitandır. Şübhəyə əsaslanaraq qərar qəbul etmək, insanların taleyinə hökm etmək istəyi, hisslərin ən qarışığı olan sevgi və şübhəylə qarşı-qarşıya qalmaq əsərin əsas ideyasıdır. Faciə təkcə Otellonun yox, bütün insanlığın faciəsidir. ', 700, 2, NULL, N'/Upload/bookb233b7062f91454e9e338a1302723d15.pdf', 7, 43)
INSERT [dbo].[tbl_book] ([BookId], [Name], [Context], [Page], [WriterId], [Filename], [Fileurl], [BookCategoryId], [PhotoId]) VALUES (25, N' Amfibiya adam - Aleksandr Belyayev', N'#  Amfibiya adam - Aleksandr Belyayev

 Amfibiya adam - Aleksandr Belyayev', 256, 1, NULL, N'/Upload/book/0e54cdcd25484a439949d95d1bc49621.jpeg', 6, 54)
SET IDENTITY_INSERT [dbo].[tbl_book] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_bookCategory] ON 

INSERT [dbo].[tbl_bookCategory] ([BookCategoryId], [Name], [Description], [PhotoId]) VALUES (1, N'Fəlsəfə', N'Fəlsəfə   ', NULL)
INSERT [dbo].[tbl_bookCategory] ([BookCategoryId], [Name], [Description], [PhotoId]) VALUES (2, N'Roman', N'Roman     ', NULL)
INSERT [dbo].[tbl_bookCategory] ([BookCategoryId], [Name], [Description], [PhotoId]) VALUES (3, N'Elmi', N'Elmi      ', NULL)
INSERT [dbo].[tbl_bookCategory] ([BookCategoryId], [Name], [Description], [PhotoId]) VALUES (4, N'Hekayə', NULL, NULL)
INSERT [dbo].[tbl_bookCategory] ([BookCategoryId], [Name], [Description], [PhotoId]) VALUES (5, N'Psixalogiya', NULL, NULL)
INSERT [dbo].[tbl_bookCategory] ([BookCategoryId], [Name], [Description], [PhotoId]) VALUES (6, N'Tarix', NULL, NULL)
INSERT [dbo].[tbl_bookCategory] ([BookCategoryId], [Name], [Description], [PhotoId]) VALUES (7, N'Siyasət', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_bookCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_category] ON 

INSERT [dbo].[tbl_category] ([CategoryId], [Name], [PhotoId]) VALUES (6, N'Psixalogiya', 6)
INSERT [dbo].[tbl_category] ([CategoryId], [Name], [PhotoId]) VALUES (7, N'Təkamül', 7)
INSERT [dbo].[tbl_category] ([CategoryId], [Name], [PhotoId]) VALUES (8, N'Fəlsəfə', 53)
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_photo] ON 

INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (6, N'/Upload/images/c6225b6fd961458882794bac3b56893d.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (7, N'/Upload/images/abde7c0f20324a019bbee71960bcb057.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (8, N'/Upload/images/015f96ee8e254cae8f6c29b381435dcc.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (9, N'/Upload/images/75b9aaa17ca84e8da19821536a2043f0.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (10, N'/Upload/images/5e24255413b7409da408106544bd69da.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (13, N'/Upload/images/4d4f183141fa46939180083a59504f42.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (15, N'/Upload/images/141d8f63d4334c04a87e12045ddf3402.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (16, N'/Upload/images/0539e89bfeab497e824519dd8352ab5b.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (17, N'/Upload/images/29cdefffad3a49cd907fe396a6fb1d8e.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (18, N'/Upload/images/c341f063c7fc463995b560e415ef6508.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (19, N'/Upload/images/59e0dafcacf14170ab9ce9995bed948c.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (20, N'/Upload/images/f242342aa661454ea5a959547b18b929.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (21, N'/Upload/images/c13466a3a5774a64820eeab1ae8da128.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (22, N'/Upload/images/2c4ae034fe034ac6ab6b539547da11fa.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (23, N'/Upload/book/b021022017a9416ca5261ea1c56ed32e.pdf')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (24, N'/Upload/book/196744c7f52e4cb6a94b501d4a83b953.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (25, N'/Upload/book/9dc1200b43cb4b5aab4888e487d9b0d6.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (26, N'/Upload/book/ec4d1f9ae3204525b6ff2ad995e24a7e.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (27, N'/Upload/book/38ad96bc215641acb6f88c08bb273609.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (28, N'/Upload/book/ff1cf29a2b89463ebfaa76768b7d9797.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (29, N'/Upload/book/65feb57d249c4becb3234b6b15b8a7f0.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (30, N'/Upload/book/c59a7e02087f4e878854ff7b90deccb4.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (31, N'/Upload/book/611f9a2ce45642139de75c578d80b63b.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (32, N'/Upload/book/62a04dcd5c154fb8a20a319cec906170.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (33, N'/Upload/book/c200b3c93a5142eb9558646f502e2d64.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (34, N'/Upload/book/2fa6f40c351649d7b9acd00dec861816.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (35, N'/Upload/images/591552d4d57f4ed68d7b93a4c3c4a8ec.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (36, N'/Upload/images/cf308ae3fef54b088cd123dab08b870d.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (37, N'/Upload/images/26d011c927454bd58a6c89bb787c19ad.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (38, N'/Upload/book/82b5bfca4bc243aba59c4965679f650b.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (39, N'/Upload/book/8556e45c6593494dafbee5d4393cdb6a.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (40, N'/Upload/book/7e2edfc0a9614c5da99696495947d899.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (41, N'/Upload/book/af4ea707a1ca4a328ab7dda382d65d2c.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (42, N'/Upload/book/f8f25164c1c04e39b6ab1b8d4badc74a.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (43, N'/Upload/book/b779aa537abe422b897b6174385f82ab.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (44, N'/Upload/images/yt1.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (45, N'/Upload/images/yt2.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (46, N'/Upload/images/yt3.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (47, N'/Upload/images/yt4.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (49, N'/Upload/images/6833ba3604904883bac405e95917d2d8.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (50, N'/Upload/images/d55376b7c4104221a5b1de696a455189.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (51, N'/Upload/images/27116eae76bb4a599b55b3abaf5d1ba4.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (52, N'/Upload/images/f08b0dc2672e47d2909e2a7285fe4e96.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (53, NULL)
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (54, N'/Upload/book/ef5d3c4dd42a4adba9b8537122a154ed.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (55, N'/Upload/images/95e4b6d45a774036874f6ea8cc5b4a33.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (56, N'/Upload/images/69c61eaa44854b6996a743ece25aa373.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (57, N'/Upload/images/a0054da4c15a47d187627ca460e06f07.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (58, N'/Upload/images/aa5cfa3d44684d5a94b0ef3faf677277.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (59, N'/Upload/images/60d9f014650341e28cb0f35fd1a8e2ac.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (60, N'/Upload/images/9f1fa0ab1d0848f881ab464ff7e643ed.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (61, N'/Upload/images/cc4ffc01fc7d4c3bb0d25ae2234395fa.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (62, N'/Upload/images/44664abc284b474fbf25cdd52d617d01.png')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (63, N'/Upload/images/16ea9c087a0d477e918bf9494a74c67d.jpg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (64, N'/Upload/images/5ff70e587e244ade9745129fcc19ba73.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (65, N'/Upload/images/53f374e82e1e474992d1d0d32436e6bc.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (66, N'/Upload/images/taleh.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (67, N'/Upload/images/ayt.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (68, N'/Upload/images/vido.jpeg')
INSERT [dbo].[tbl_photo] ([PhotoId], [URL]) VALUES (69, N'/Upload/images/f5f20424caef49ae833b7d6b70a26b68.jpg')
SET IDENTITY_INSERT [dbo].[tbl_photo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_post] ON 

INSERT [dbo].[tbl_post] ([PostId], [Title], [Context], [Views], [Active], [Accept], [DateTime], [CategoryId], [AuthorId], [PhotoId]) VALUES (8, N'Oğlanlar Qızlardan Daha Ağıllıdır?', N'# Oğlanlar Qızlardan Daha Ağıllıdır?

**Kişilərin** qadınlardan daha ağıllı olduğu şablonu uzun bir keçmişə sahibdir. Sadəcə keçmişdə hər hansı bir kişi qarşısındakı kişi rəqibi udaraq qalib olurdusa o daha ağıllı hesab olunurdu. Buna uzun müddət bu cür inanıldı.  
Yəni kişilər qadınlardan daha ağıllıdır?

**İlk** araşdırma kişilərin beyni qadınların beynindən 8 ilə 13% arasında daha böyük olduğunu göstərdi ancaq çox keçmədi ki, beyinin ölçüsü bədənin ölçüsünə görə böyük və yaxud kiçik olduğu bilindi. Qadınların beyinlərində daha çox qırışıqlıq olduğuna görə daha böyük bir kortikal sahəyə mənsubdur.  
Digər yandanda daha böyük beyin daha ağıllı olmaq mənasını vermir.Balinalar fillər və delfinlər insanın beynindən daha böyük beyinə sahib olmaqlarına baxmayaraq şüuri davranışları bizdən daha azdır. Kişi beyni sağ beyin lobu və sol beyin lobu ilə ayrı ayrı əlaqə yaradırsa qadınlarda iki beyin lobu qarşılıqlı əlaqədə olur.

_**14000 beyin**_ və cinsiyyət qarşılaşdırması nəticəsində kişilər və qadınların tipik beyin quruluşları test edildi. Niyə kişilər gündəlik olaraq video oyunlar oynayır və qızlar gündəlik yazır adlı tipik beyin quruluşlarını incələdilər. Nəticə olaraq sadəcə 0,1% qadın oyuna maraq göstərdi və kişilər də gündəliy tutdular. Yüksək zəka sayəsində alınan nəticələr göz ardı edilə bilər. Normal olaraq iki cinsiyyət arasında fərq yoxdur.Ancaq qadınlar yüksək dərəcədə şifahi bacarıqlar göstərirlərsə, kişilər də güclü vizual bacarıqlar sərgiləyirlər.Qəribə şəkildə həyata keçirilən testlərdəki kişilərin sayını çoxaltdıqca ,həm aşagı həm yuxarı zəka səviyyələr ortaya çıxdı. 22 növ çalışmanın analizində olan bir meta testində 3.3 ilə 5.5 IQ arasında kişilərin qadınlardan üstün zəkaya sahib olduğu tapıldı ancaq bu çalışma metodu akademiya tərəfindən pis qarşılandı.  
Dildə, riyaziyyatda və elmdəki akademik performansda qadınlar öz ölkələrində 70% daha üst nəticə əldə edir.  
Beynəlxalq zəka dəyərləndirmə programındakı testdə isə hər iki cinsin nümayəndələri eyni nəticə göstərdi. İslandiya və bənzəri ölkələrdə qızlar daha yaxşı nəticə göstərdi . bu mədəniyyətdən və çevrədəki faktorlardan ortaya çıxdığı müəyyən olundu.Yəni insan biologiyası ilə əlaqəsi yoxdur.  
Ətraf basqısı deyilən bir şey qadınlar üzərində daha basqındır.  
Qadınları kişilərdən daha aşagı zəkada göstərən ətraf onlara psixoloji təsir göstərir.Lakin bu, təziq göstərilməyən ərazilərdə qadınlar kişilərdən daha çox uğurlar qazanır.  
Hətta valideynlər belə googla axtarış siyahılarında " oğlumun özəl bacarığı varmı " cümləsi 5,5 dəfə qızları üçün axtarışlarından daha çoxdur.  
Qızlar bu önyargını 6 yaşlarında qazanırlar.  
5 Yaşındakı qız və oğlana eyni anda bir hadisəni danışsaz hər iki fərd öz cinsiyyətinə uyğun hadisəni dərk edəcək. Hətta özünüzdən daha ağıllı fərdlə oyun oynamaq istəyərsinizmi sualına cavab 5 yaş qrupu razı olsada , 6 yaş qrupu qızlar bunun uyğun olmadığını deyir əvvəldə dediyimiz kimi 6 yaşdan sonra qızlarda önyargı formalaşır buda onlarda güvən əksikliyinə çevrilir.

Bütün bu əngəllərə baxmayaraq qadınlar elmə tövhə verməyə davam edir. Marie Curie radiasiyanı kəşf edən ilk qadın rentgenlərimizi onun sayəsində öyrənə bilirik.  
Caroline Herschel 1787ci illərdə 14 nebula quyruqlu ulduz və 561 yeni ulduz tapdı. Mary Enning- 200 milyon illik fosillər tapdı və dogmatik hekayələrdən uzaqlaşmağa insanlara yardımçı oldu. Liza Mitner - çəyirdək birləşməsi qavramını irəli sürdü qısacası nüvə birləşməsini tapdı. Barbara McClinton -DNT və genetika elmini öyrəndi çalışmalar etdi.Bugün hüceyrə genetikasından danışa biliriksə barbara mcclintona borcluyuq. Rozalina Franklin DNT''mizi başa düşməyimizə kömək oldu. Katerina Jhonson Apollo 11in aya enişini təmin etdi. Və 2017-ci ildə Məryəm Mirzekhani Nobel mükafatını alan ilk qadın oldu.

Yazar: Aytən Kərimova', 0, 1, 0, CAST(N'2021-01-19T19:11:11.573' AS DateTime), 6, N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', 55)
INSERT [dbo].[tbl_post] ([PostId], [Title], [Context], [Views], [Active], [Accept], [DateTime], [CategoryId], [AuthorId], [PhotoId]) VALUES (9, N'Panteizm nədir?', N'# Panteizm nədir?

"Panteizm" termini ilk dəfə İrlandiyalı azad düşünən John Toland (1705) yazılarında ortaya çıxan və Yunancada kökləri "pan" (hamısı) və "theos" ( Tanrı) sözlərindən yaradılan modern bir termindir. Ancaq adından fərqli olaraq fikrin özü çox qədimdir və fəlsəfə ilə bağlıdır. Panteizm metafizik və dini bir mövqedir. Dünyanın dini ənənələrinin və mənəvi yazılarının əksəriyyəti panteist fikir və duyğularla əks olunur. Məsələn, Advaita Vedanta məktəbinin Hinduizmində, Kabbalistik Yəhudiliyin, Kelt mənəviyyatının və sufi mistikasının bəzi növlərində bu xüsusən belədir.  
Panteizm kimi fəlsəfi düşüncə tərzini ilk dəfə 17-ci əsrin ortalarında Dekartdan ilhamlanan Hollandiyalı filosof Barux Spinoza tərəfindən irəli sürülüb. Spinoza o dövrlərdə artıq yerini bərkitmiş rəsmi din olan xristianlıq və iudaizmi tənqid edir, onların sadəcə sərt ehkamlar və rituallar sayəsində gücləndiyini deyirdi. O, İncilin tarixini tənqidi təfsir edən ilk insan idi.   
Spinoza hər şeyin təbiət olduğunu deməklə yanaşı təbiəti Tanrı ilə eyniləşdirirdi. Hər şey bir-biri ilə əlaqəlidir, hər şey bir bütündür və bir vəhdət içində bir-birinə bağlanır. Panteizmin qısa tərifi Spinozanın da dediyi kimi: Hər şey Tanrıdadı, Tanrı hər şeydir. Panteizmə (və Spinozaya) görə Tanrı təbiəti özü kənarda durmaq üçün yaratmayıb. Panteistlərə görə təbiət, kainat mövcud olan maddi və mənəvi hər şey Tanrının bir parçasıdı. Bizlər də cismən, ruhən və fikrən onun bir parçasıyıq. Spinozanın sözləri ilə qısa bir tərif versək "Biz onda yaşayır, hərəkət edirik, varlığımız ondadır". Yəni sən özün düşünsən, sən özün hərəkət etsən də, sənin fikirlərini təbiət düşünür və sənin vasitənlə hərəkət edir.   
Buradan belə bir nəticəyə gəlmək olar ki, biz özümüz qərar verə bilmirik? Panteizmin buna izahı odur ki, bəli biz istədiyimiz kimi qərar verə bilərik, ancaq biz bir bütünün parçasıyıq və bu bütündən yəni Tanrıdan kənara çıxa bilmərik.   
Panteist fikirlərin ədəbiyyatda tapıla bilər digər vacib mənbəyi Goethe, Coleridge, Wordsworth, Emerson, Walt Whitman, DH Lawrence və Robinson Jeffers kimi yazıçılardır. Yüksək mədəniyyətlə məhdudlaşmamaqla yanaşı, panteist mövzular populyar mediada, məsələn, "Ulduz Döyüşləri", "Avatar" və "Aslan Kral"kimi filmlərdə də işlənib.

Yazar: Aydan', 2, 1, 0, CAST(N'2021-01-19T19:12:02.440' AS DateTime), 6, N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', 56)
INSERT [dbo].[tbl_post] ([PostId], [Title], [Context], [Views], [Active], [Accept], [DateTime], [CategoryId], [AuthorId], [PhotoId]) VALUES (10, N'Ateizm nədir?', N'# Ateizm nədir?

_**"Ateizm"**_ tipik olaraq "teizm"lə müyyənləşdirilir. Teizm isə ümumi olaraq "Tanrının var olduğuna inam" kimi bilinir. Fəlsəfədə ateizm Tanrının mövcud olmadığı (və ya daha geniş şəkildə tanrıların olmadığı) kimi qəbul edilməlidir. Bu tərif ateizmi dini fəlsəfədəki ən vacib metafizik suallardan birinə, yəni “Tanrı varmı?” sualına birbaşa cavab vermək qabiliyyətinə malik olduğunu göstərmiş olur. Beləcə bu suala yalnız iki mümkün cavab olur: "bəli" yəni teizm, "xeyir" yəni ateizm. "Bilmirəm", "heç kim bilmir", "məni maraqlandırmır", "müsbət cavab heç vaxt təsbit olunmadı" və ya "sual mənasızdır" bu kimi cavablar isə  suala birbaşa cavab deyildir. 

> Beləliklə, ateizm, adətən, ilahi həqiqəti təsdiqləyən və tez-tez varlığını nümayiş etdirməyə çalışan teizmdən və eyni zamanda sualları cavabsız və ya cavabsız tapdığını iddia edərək tanrı olub-olmadığı sualını açıq qoyan aqnostisizmdən də seçilir. 

Yəhudiliyin, Xristianlığın və İslamın mərkəzi, ortaq bir yanı, bir və yalnız bir Tanrının gerçəkliyinin təsdiqidir. Bu inancların tərəfdarları, kainatı yoxdan yaradan və bütün yaratdıqları üzərində mütləq suverenliyə sahib olan bir Tanrı olduğuna inanırlar. Ateizmin növləri çoxdur, lakin bütün ateistlər bu cür inancları rədd edirlər. Ancaq ateizm sadəcə Yəhudilik, Xristianlıq və İslamın təməl əsaslarını rədd edilməsi deyil. Eyni zamanda  Afrika dinlərin Dinka və Nuer, antropomorf klassik tanrıları olan Yunanıstan və Roma, ülvi anlayışları olan Hinduizm və Buddizm kimi dini inancları da rədd edir. Ümumiyyətlə, ateizm Tanrı və ya tanrıları inkar etməkdir və əgər din mənəvi varlıqlara inama görə müəyyən edilirsə, ateizm bütün dini inancların rədd edilməsidir.  
Yuxarıda da qeyd edildiyi kimi ateizmin bir çox növü var. Onlara misal olaraq William Rowe (1979) tərəfindən irəli sürülən Tanrı olmasa da bəzi (intellektual cəhətdən inkişaf etmiş) insanların Tanrının var olduğuna inanmaqda haqlı olduqları mövqedir "dostanə ateizm". Bir digəri "sevgisiz ateizm" isə, ateizmin doğru olduğu və heç bir teistik inancın haqlı olmadığını deyir. Digər biri isə "laqeyid ateizm"dir və bu  konkret olaraq nə dost, nə də dost olmayan bir ateist olma vəziyyətidir. Son olaraq ən maraqlısı isə "Tanrı təraftarı ateizm"dir. Bu termin John Schellenberg tərəfindən irəli sürülüb. Belə bir ateist aşağıdakı fikirlərə rəğbət göstərə bilər:

Allaha inanmaq Allaha təhqirdir. Çünki bir tərəfdən onun hesaba alınmaz dərəcədə qəddarlıq etdiyini düşünməkdir. Digər tərəfdən, insanın varlıqlarını inkar etmək üçün qeyri-adi bir şəkildə onlara rəhbərlik etməsi lazım olan bir alət - zəkalarını verdiyini düşünməkdir. Əgər mövcuddursa, təhsillə bağlı hər cür iddiası olanlar arasında ən çox sevdiyi ateistlər və aqnostiklər olduğu qənaətinə gəlmək cazibədardır. Çünki onu ən ciddi qəbul edənlərdir. (Strawson 1990)

 Eyni zamanda "yeni ateizm" termini də var. Ancaq "yeni ateizm" termini müəyyən bir fəlsəfi mövqe və ya fenomen seçmirdi, o bunun əvəzinə, dörd müəllif tərəfindən tanınan bir hərəkat üçün məşhur bir etiketdir. Bunlar Richard Dawkins, Daniel Dennett, Sam Harris, və Christopher Hitchens idi.

Yazar: Aydan', 3, 1, 0, CAST(N'2021-01-19T19:13:23.913' AS DateTime), 6, N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', 57)
INSERT [dbo].[tbl_post] ([PostId], [Title], [Context], [Views], [Active], [Accept], [DateTime], [CategoryId], [AuthorId], [PhotoId]) VALUES (11, N'Plasebo effekti nədir?', N'# Plasebo effekti nədir?

Bu "əsl" tibbi müalicə kimi görünən bir şeydir - ancaq bir plasebo deyil. Bu həb, vuruş və ya başqa bir növ "saxta" müalicə ola bilər. Bütün plaseboların ortaq xüsusiyyəti, sağlamlığa təsir edən aktiv maddənin olmamasıdır.  
Tədqiqatçılar, yeni bir dərman və ya digər müalicənin müəyyən bir vəziyyətə təsirinin nə olduğunu başa düşməyə kömək etmək üçün tədqiqatlar zamanı plasebodan istifadə edirlər.  
Məsələn, bir araşdırmada bəzi insanlara xolesterolu azaltmaq üçün yeni bir dərman verilə bilər. Digərləri plasebo alırlar. Tədqiqatdakı insanların heç biri həqiqi müalicə və ya plasebo qəbul edib-etmədiyini bilmir.  
Tədqiqatçılar daha sonra dərman və plasebonun tədqiqatdakı insanlara təsirini müqayisə edirlər. Bu yolla, onlar yeni dərmanın effektivliyini təyin edə və yan təsirləri idarə edə bilərlər.  
İnsanlar bir plasebo aldıqlarını bilsələr də bir plasebo nəticə verə biləcəyi bəzi şərtlər var. Tədqiqatlar plasebo-nun aşağıdakı kimi şərtlərə təsir göstərə biləcəyini göstərir.

### Depressiya

### ağrı

Yuxu pozğunluğu

Narahat bağırsaq sindromu

Menopoz

Astma ilə əlaqəli bir araşdırmada, bir plasebo inhalerindən istifadə edən insanlar nəfəs testlərində oturmaqdan və heç bir şey etmədən daha yaxşı bir şey etmədi. Lakin, tədqiqatçılar insanların necə hiss etdiklərini bildikdə, plasebo həblərinin relyef təmin edərkən dərman kimi təsirli olduğu bildirildi.

### Plasebo effekti necə işləyir?

Plasebo effekti ilə bağlı araşdırma ağıl və bədən arasındakı əlaqəyə yönəlmişdir. Ən çox yayılmış nəzəriyyələrdən biri plasebo effektinin insanın gözlədiyi səbəbə bağlı olmasıdır. Bir adam bir həb qəbul etməsini gözləyirsə, bədənin öz kimyəvi maddəsinin bir dərmanın səbəb ola biləcəyi ilə oxşar təsiri olması mümkündür.  
Məsələn, bir araşdırmada insanlara bir plasebo verildi və bunun bir stimullaşdırıcı olduğu söylədi. Həb aldıqdan sonra nəbz dərəcələri artdı, qan təzyiqi yüksəldi və reaksiya dərəcələri yaxşılaşdı.İnsanlara eyni həb verildikdə və yatmağa kömək edəcəklərini söylədikdə bunun mənfi təsirlərini hiss etdilər.  
Mütəxəssislər, bir insanın nə qədər güclü olacağını gözlədiyi və nəticələrin görünüb-görünməməsi arasında bir əlaqənin olduğunu da söyləyirlər. Emosiya nə qədər güclü olarsa, bir insanın müsbət təsirlərə məruz qalması ehtimalı daha yüksəkdir. Bir xəstə ilə bir tibb işçisi arasındakı qarşılıqlı təsir səbəbindən dərin bir təsir ola bilər.  
Eyni şey mənfi təsirlərə də aiddir. İnsanlar baş ağrısı, ürək bulanması və ya yuxusuzluq kimi yan təsirlərin olacağını gözləyirlərsə, bu reaksiyaların baş vermə ehtimalı daha yüksəkdir.  
Plasebo effektinin gözləntilərdən asılı olması onu xəyali və ya saxta hala gətirmir. Bəzi tədqiqatlar plasebo effekti ilə baş verən real fiziki dəyişikliklərin olduğunu göstərir. Məsələn, bəzi tədqiqatlar bədənin təbii ağrı kəsicilərindən biri olan endorfin istehsalının artmasını sənədləşdirmişdir.  
Plasebo effekti ilə bağlı bir problem, bir araşdırma zamanı həqiqi bir dərmanın təsirini ayırmaq çətin ola bilər. Plasebo effekti ilə müalicənin təsirini ayırd etməyin yollarını tapmaq müalicəni yaxşılaşdırmağa və dərman sınağının qiymətini azaltmağa kömək edə bilər. 

Nosebo effekti nədir?

Nosebo effekti plasebo effekti ilə oxşar vəziyyətlərdə baş verir, lakin bunun üzərində həddən artıq iş olmaması bu konsepsiyanı bir az sirli edir.  
Valideynlər övladlarının dəfələrlə ən kiçik ağrıları həddindən artıq dərəcədə sərtləşməsini gördülər, onlara şəkər verdilər və bunun ağrılarını yüngülləşdirəcəyini söylədilər. Bu, demək olar ki, həmişə işləyir (əlbəttə ki, həqiqətən dəhşətli ağrılar olduqda istisna olmaqla). Bu məsləhətlərin gücünün düşünə biləcəyinizdən daha çox olduğunu sübut edən yalnız bir nümunədir.  
Plasebo effekti ilə olduğu kimi, nosebo effekti təsiri də yanlış gözləntilərə görə baş verir. İkisi arasındakı fərq, nosebo effekti təsirində gözləntilərin mənfi olmasıdır. Dərmanın pis yan təsirlərə səbəb olacağını düşünən xəstə tamamilə düşündüyü problemlərlə qarşılaşır, ancaq xəstə səhv məlumat verildiyini bildikdən sonra bu təsirlər yox olur. Bu dəyişikliklərə səbəb olan inanılmaz nevroloji proseslər prefrontal, orbifrontal və ön cingül korteksinin stimullaşdırılması nəticəsində təsirli olur.  
Eyni şey amigdala, onurğa beyni, periakuaduktal boz maddə və beynin mükafat mərkəzində olur. Emar ilə edilən araşdırmalara görə beynin bu hissələri sağlamlığınızı qavramağınıza təsir edir. Bu cür işlər qeyri-etik sahələrə də daxil ola biləcəyi üçün bəzi mübahisəli məqamları ehtiva edə bilər.  
Həqiqəti söyləmədən xəstələrə faydasız müalicə tətbiq etmək bir çox problemə yol aça bilər. Münaqişə ümumiyyətlə həkimlər tərəfindən yaranır, çünki onların vəzifəsi simptomları minimuma endirmək, onları pisləşdirməmək və baş verməmələrini təmin etməkdir.

"Xoşbəxtliyin mənbəyi bütünlükdə sağlamlıqdır."  
\- George William Curtis

" Science" jurnalında yayımlanan son bir araşdırmaya görə, dərman qiymətinin insanın şüursuz reaksiyasına böyük təsir göstərdiyi deyilir. 49 nəfərlik qrupdakı hər adama bir qab krem ​​verildi. Bu kremin ekzema müalicəsində istifadə olunan iki fərqli maddəni ehtiva edən bir nümunə olduğu deyilir. Əslində, yalnız bir tərkib hissədən ibarət idi.Mavi qablarda (Çox bahalı və daha yaxşı keyfiyyətlə əlaqəli) qırmızı qablarda (daha asan əldə edilə bilən dərmanlarla əlaqəli) qablarda eyni krem var idi Könüllülərə, dərilərinin çox həssas olduğu üçün yəqin ki, yanacaqlarını hiss etdikləri bildirildi. Yarım saat bədənlərinə tətbiq etməli və sonra bədənlərini istilənə biləcək bir yerə getməli idilər.  
Bunun necə səsləndiyini bilmirik, amma nəticələr olduqca aydın idi. Mavi qabdakı kremdən istifadə edənlər, digər qrupdakılara nisbətən daha çox ağrı hiss etdiklərini söylədi. Çünki daha bahalı kremləri daha ağır effektlərlə əlaqələndirirdilər. Bu təkrarlanan və artan intensivlik psixoloji tədqiqatçılar, həmçinin "plasebo effekti" ilə stimullaşdırılan beynin sahələrinin nosebo effekti təsirində də stimullaşdırıldığını aşkar etdilər. Əsas fərq müxtəlif sinir bölgələrində stimullaşdırılmış boz maddə idi. Bu şəkildə, beynin eyni nöqtələri stimullaşdırılsa da, bu nöqtələrin fərqli yollarla aktivləşdirildiyi aydın oldu.  
Alimlər fibromiyalji xəstələrində analoji təcrübələr aparıblar. Bu xəstəliyi olan insanların dərmanlar səbəbiylə daha çox mənfi təcrübə yaşadıqlarını bildikdə, nosebo effekti olan bir qrup xəstəni müalicə etmək qərarına gəldilər.  
Nosebo effekti fibromiyalji xəstələrinin o qədər problem yaşamasına səbəb oldu ki, hətta əksər müalicələrdən imtina etdilər.  
"Nosebo effekti" ilə maraqlana bilərsiniz. Əvvəla, niyə bu konsepsiya ilə bağlı daha bir araşdırma aparılmır? Və onların təsiri həqiqətən çox insan üçün çoxdur? Şəxsiyyət əlamətləri əsasında bunu dəstəkləyəcək heç bir tədqiqat aparılmasa da, insanın motivasiyasının nəticələrə təsir göstərməsi doğru ola bilər.  
Dərman səbəb olduğu dəyişikliklərdən daha çox həyəcan keçirən insanlar daha çox ağrı hiss edirlər. Belə hallarda görünə bilən xəstəlik, xəstələrin əlamətlərinə mənfi təsir göstərə bilər. Bir daha beynimizi idarə etməyi öyrənməyimiz lazım olan çox güclü bir vasitədir.

Yazar: Əsədov Qəhrəman', 5, 1, 0, CAST(N'2021-01-19T19:14:39.210' AS DateTime), 6, N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', 58)
INSERT [dbo].[tbl_post] ([PostId], [Title], [Context], [Views], [Active], [Accept], [DateTime], [CategoryId], [AuthorId], [PhotoId]) VALUES (12, N'İnsanlar hələdə təkamül edir?', N'# İnsanlar hələdə təkamül edir?

**İnsanlar hələdə təkamül edir?**

Homo sapiens ( latınca “ağıllı insan” və ya “bilən insan”) primatlar qrupunun böyük insansı meymunlar familyasına daxil olan və “homo” cinsində yer alan tək canlı türüdür. Atomik olaraq 300 min il öncə Afrikada ortaya çıxmış və müasir davranışlarına 50 min il öncə qovuşmuşdur.  Dik duruşumuz sayəsində, inkişaf etmiş bir beyinə, mücərrəd düşünmə qabiliyyətinə, danışıq xüsusiyətinə sahib olan bizlər, sahib olduğumuz qabiliyyətlər, dünyadakı digər bütün canlı növlərindən fərqli olaraq, bizlərə gündəlik həyatımızda istifadə edə biləcəyimiz avadanlıqlar düzəltməyimizə imkan yaratmışdır. Ətrafda baş verən hadisələri fərqində olmağımız, rasional zəkamız kimi yüksək səviyyədə düşünməmizə imkan yardan xususiyyətlər insanı “insan”edən özəlliklər hesab olunur.  Bir zamanlar təbiətin içində, mağaralarda sürü halında yaşayan, əldə etdiyimiz qidaları bişirmədən  yeyən (1 milyon il öncə homosapienslər ocağı kəşf edənə qədər), çaylaq daşlarından hazırladığımız bıçaq, nizə kimi alətlərdən istifadə edən və tamamilə ibtidai bir həyat yaşayan bizlər, bu gün hündür binalarda yaşayır, ləziz yeməkləri yeməy üçün bahalı restoranlara yollanır, bir yerdən başqa yerə getmək üçün bahalı avtomobillərdən istifadə edir, gərəkdiyində quş kimi səmada uçur, gərəkdiyində isə balıq kimi dənizdə üzürük. Homo sapiensin təkamülü  daş alətlərdən smartfon telefonlara yüksəldiyi halda, təkamül dəvam edirmi? Gələcəkdə insan oğlunu nələr gözləyir?  İlk öncə onu izah etmək lazımdır ki, təkamül prossesi çox uzun bir dövrü əhatə edir. İnsan oğlunu ibtidai həyat   
tərzindən, bu günə gəlib çıxması üçün milyon illər zamana ehtiyac duyulub. Təkamül isə dəvamlı bir prossesdir. Hər zaman dəvam edir. Hər bir canlıda instinkt olaraq mühitə uyğunlaşma prossesi gedir və bu da hər zaman canlılarda təkamül prosesinin dəvam etməsinə şərait yaradır. İnsanların yaratdığı mədəniyyət və bununla birlikdə inkişaf edən texnologiya və tibb sahəsində edilən yeniliklər, insanlarda, artıq bütün  canlılardan fərqli olaraq təbiətin qanunlardan sərbəst bir şəkildə yaşadığımız düşüncəsini yarada bilər. Ama bu belə deyil. Təbiət durmadan inkişaf edir və təkamül canlıların genetik frekanslarında dəyişikliklərə səbəb olur. Bu da illər keçsədə, gen hovuzunda dəyişikliklər olacağını göstərir. Bu gün təbii artıma baxacaq olarsaq doğum faizinin ən çox olduğu ölkələr Latın Amerikası, Afrika və Asiya ölkəlidir. Buda onu göstərirki gələcəkdə insan gen havuzunda daha çox bu irqdən olan insanların genleri üstünlük təşki edəcək.  Və eyniylə çiçək xəstəliyinidə buna misal gətirmək olar. Çiçək xəstəliyi yayılan dövrdə xəstəliyə yoluxanların çoxu yeni uşaq dünyaya gətirmədi, buda bu xəstəliyin yeni genlərə ötürülməsinin qisməndə olsa qarşsını aldı, zaman keçdikcə insanlara edilən peyvəndlər və müxtəlif tədbirlər sayəsində bu gün artıq çiçək xəstəliyi yer üzündən tamamilə təmizlənib və artıq gen hovuzundan çiçək xəstəliyi kimi bir xəstəlik mövcud deyil.  Durmadan inkişaf edən texnologiya, tibb sahəsində edilən yeniliklər və digər inkişaf ünsürlərinin insanın genomunda hələ çox dəyişikliklərə səbəb olacağı gözlənilir. Ümumiyyətlə təkamül bizə keçmiş haqqında fikir söyləməyə imkan yaradır gələcək haqqında isə teoriyalar çoxdur tam   
olaraq isə nə olacağını və təkamülün bizi necə canlı varlıqlara dönüşəcəyi ilə bağlı dəqiq fikir söyləmək mümkün deyildir. Bəlkə biolabaratoriyalarda insan orqanlarının istehsalına başlanacaq və buda insanların uzun ömürlülük (bəlkədə sonsuz) müddətini artıracaq. Bəlkə də bütün bu inkişaf və yeniliklərlə özümüz özümüzün sonunu tezləşdirəcəyik.', 3, 1, 0, CAST(N'2021-01-19T19:15:20.867' AS DateTime), 6, N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', 59)
INSERT [dbo].[tbl_post] ([PostId], [Title], [Context], [Views], [Active], [Accept], [DateTime], [CategoryId], [AuthorId], [PhotoId]) VALUES (13, N'Yuxuda Beynimizdə nələr olur?', N'# Yuxuda Beynimizdə nələr olur?

Yuxuladığımız zaman bədənimiz yuxu rejiminə keçir, REM(Rapid Eye Movement) yuxusuna keçdiyimiz zaman bütün əzələlərimizin hərəkəti dayanır və gözlərimiz xaric hər yerimiz keçici olaraq iflic olur. Bundan qorxmağa dəyməz, əslində bədənimizin keçici olaraq iflic olması yaxşıdır. Ona görə ki, əgər belə olmasaydı yuxuda etdiklərimizi realda fiziki olaraq həyata keçirərdik. Bundan sonra beyin kökündəki sinir hüceyrələri təsadüfi şəkildə bir-birilə əlaqəyə girir. Bəzi mütəxəssislər bu işarətləri mənalandırmağın yuxuları əmələ gətirdiyini bildirir. Frontal korteks, yəni beynin ön tərəfindəki idrak vəzifəsini yerinə yetirən bölmə fəaliyyətini dayandırır.Buna görə də, siz bir-birindən tamamilə fərqli yuxular da görə bilərsiniz. Yuxular beyindəki iki önəmli bölümü - yaddaşın beşiyi hesab edilən "Hipokampus" ilə duyğularımızı idarə etməkdə böyük önəm kəsb edən amigdalanı bir-birilə əlaqələndirir. Yuxuda baş vermiş hadisələri və eləcə də, qəribə və həqiqətə sığmayan şəkildə görərkən qorxmağınız və ya xoşbəxt olmağınız da buna görədir.  
Gözləriniz açıq olmasa da beyninizin görüntüləri analiz edən mərkəzi - görüntü korteksi öz fəaliyyətini davam etdirir. Bu da yuxuları beyninizdə görməyinizi təmin edir. Əksər yuxular REM yuxularında görülür. REM-dən kənarda nadir hallarda yuxu görə bilərsiniz. Lakin bu yuxu adi olar.   
Niyə bəs Yuxu görürük?

yuxular əslində tamamilə bizə aid və bizim yaratdığımız xəyallardır. 

Məsələn, gün içində böyük bir münaqişə yaşadınız, ya da sizi çox kədərləndirən bir hadisə oldu. Yuxuda bunu öz formalaşdırdığınız şəkildə görməyiniz mümkündür. Təbii ki, bu birbaşa sizinlə əlaqəsi olmayan şeylər də olabilər, amma şüuraltınız və yaşadığınız hadisələr yuxu əsnasında da sizdən əl çəkmir. Çox yorulduğumuz günlərdə 7 yuxu görə bilərik. Ancaq bu yuxuların az qismini xatırlayırıq. İstisnalar əlbəttə, mümkündür. Bəzi vaxtlar yuxunun tamamını da xatırlaya  bilərik. Yuxuları xatırlamamağımızın bir səbəbi də zehnin özünümüdafiə sistemi ilə əlaqələdir. Əgər hər şeyi xatırlasaydınız, yuxu ilə gerçəyi bir-birindən fərqləndirə bilməzdiniz. Ümumiyyətlə mütəxəssislərin rəyinə görə, yuxular yaşadıqlarımızı şüuraltına həkk etməyimizə kömək edir. Həmçinin, oyanma anı yaxınlaşdıqca yuxuların daha tez görülməsi ilə zehnin reallığa alışmasına yardımçı olması ilə bağlıdır. Bəzən görüb unutduğunuz yuxular həqiqi həyatda sizə dejavyu yaşadar. O günü əvvəldən yaşamış kimi hiss edərsiniz. Və ya birincə dəfə getdiyiniz bir yerə "mən buranı bir yerdən xatırlıyıram" deyə bilərsən

İndi isə yuxular haqqında az bilinən məlumatları təqdim edirəm.

1\. Oyandıqdan sora ilk 5 dəqiqə gördüyümüz yuxunun 50 faizini, 10 dəqiqə tamamında isə 90 faizini unuduruq.   
2.Yuxular simvolikdir. Bir mövzu ilə əlaqədar gördüyünüz yuxu tam olaraq o mövzunu ifadə etmir. Yuxular sizə hər hansı bir hadisəni işarələrlə başa salır. Yuxuların dərin simvol dili vardır.   
3.Yuxunun həqiqi həyatla birləşməsi. Zehnimiz, bədənimiz o anda eşitdiyi və ya hiss etdiyi şeyləri yuxularımızla birləşdirir.  Məsələn, yuxuda konsertdə olduğunuzu gördüyünüz zaman həqiqi həyatda radioda musiqi səslənir.   
4.Yuxu iflici. Dərin yuxu zamanı beynimizdəki bir sistem hərəkətə keçir və bədənimizin hərəkət etməsini əngəlləyir.   
Bu yuxu zamanı bizim fiziki olaraq zədə almamağımız üçündür.   
5.Yuxuda gördüyümüz tanımadığımız insanlar əslində həyatda qarşılaşdığımız ama xatırlamadığımız insanlardır. Zehnimiz heç zaman yeni simalar yaratmaz.   
6\. Həddən artıq psixoloji problemləri olan insanlardan başqa hamı yuxu görür. Yuxu görmədiyini düşünən insanlar əslində yuxularını çox tez unudurlar.   
7\. Xoruldayan zaman yuxu görmək mümkün deyil. Elmi olaraq sübut edilməsə də, aparılan araşdırmalarda xoruldayan insanların  daha az, qısa və unudulan yuxular gördüyü izlənilib  
8\. Yuxu ilə bağlı bildiyimiz hər şey son 25 ilin nəticəsidir.

Yazar: Əsədov Qəhrəman', 1, 1, 0, CAST(N'2021-01-19T19:16:27.130' AS DateTime), 6, N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', 60)
INSERT [dbo].[tbl_post] ([PostId], [Title], [Context], [Views], [Active], [Accept], [DateTime], [CategoryId], [AuthorId], [PhotoId]) VALUES (14, N'Qiymət niyə məhsulun üzərinə yazılır??', N'<p><a href="https://www.youtube.com/watch?v=qoeSO8fj4N0">saca</a># Qiymət niyə məhsulun &uuml;zərinə yazılır? Frenk Vultor adı sizə nə deyir? Tanıyırsız onu? &Ccedil;ox g&uuml;man ki, birinci dəfədir adını eşidirsiz, amma o sizə he&ccedil; olmasa həftədə bir dəfə də olsa təsir edir, sizin həyat tərziniz və vərdişlərinizdən bəzilərini formalaşdırıb. Gəlin sizə bu yazıq uşağın hadisəsini danışım. Vulvort kasıb bir kənd&ccedil;i ailəsində doğulur və belində buğda kisələri, odun və saman daşıyaraq b&ouml;y&uuml;y&uuml;r. 21 yaşına kimi bostanda atasına k&ouml;mək edir və g&uuml;n&uuml; torpaqla ke&ccedil;ir. &zwnj;Bu c&uuml;r həyatın onu məhv edəcəyini anlayıb bir g&uuml;n evdən qa&ccedil;ır, &quot;Lankaster&quot; adlı ki&ccedil;ik &nbsp;şəhərciyə gəlib &ccedil;ıxır. Frenk savadsız və bacarıqsız olduğundan bilmir nə işləsin, eləcə də ona b&ouml;y&uuml;k utanc verən kəkələməsi (pəltəklik) onun &ouml;z&uuml;nə inamını lap aşağı endirir. Təsəvv&uuml;r edin, he&ccedil; bir m&uuml;sbət cəhədiniz yoxdur, he&ccedil; nə bacarmırsınız və &uuml;stəlik də kəkələyirsən və səni insanlar başa d&uuml;şm&uuml;rlər, bəziləri isə, sadəcə g&uuml;l&uuml;r. Beləcə başqa iş tapa bilməyən Frenk balaca bir d&uuml;kanda satıcının k&ouml;mək&ccedil;isi vəzifəsində işləməyə başlayır. Daim kəkələməsi və m&uuml;ştərilərlə d&uuml;zg&uuml;n danışa bilməməsinə g&ouml;rə d&uuml;kan sahibi onu danlayır və başıboş, bədbəxt adlandırır. Beləcə &uuml;rəyi də zəif olan Frenk g&uuml;nlərin bir g&uuml;n&uuml; başı gicəllənir və yerə yıxılır. Huşunu itirir. D&uuml;kan sahibi qərara gəlir ki, artıq onu qovmaq lazımdır, belə səfeh, savadız və şikəst k&ouml;mək&ccedil;idən bir şey &ccedil;ıxmayacaq. Hələ &uuml;rəyi də zəifdir. Beləcə onu qovmağa bəhanə olsun deyə d&uuml;kan&ccedil;ı Frenkə belə bir şərt qoyur. &quot;Mən gedirəm və d&uuml;kanı sənə tapşırıram, əgər bu g&uuml;n satılan mallar həmişəkindən bir dollar az olsa səni işdən qovacam, bu g&uuml;n səni tək qoyuram! Sat malları!&quot; Onsuz da &ouml;z&uuml;nə inamı az olan Frenk lap əlini &uuml;z&uuml;r hər şeydən. D&uuml;kanda tək qalan Frenk &nbsp;saata baxır və g&ouml;r&uuml;r ki, artıq d&uuml;kanın a&ccedil;ılışına bir saat qalıb. Bir azdan m&uuml;ştərilər gələcək və malların qiymətini soruşduqca o kəkələyəcək və m&uuml;ştərilər he&ccedil;nə almayıb &ccedil;ıxıb gedəcək. Bir də harda iş tapsın, harada bir quru &ccedil;&ouml;rək tapsın axı &ouml;z&uuml;nə (Dostlar, diqqətlə oxuyun , demək olar ki, he&ccedil; bir şansı olmayan bir uşaq ... Belə bir uşağın milyon&ccedil;u olması qeyri-m&uuml;mk&uuml;n bir şeydir. Və &uuml;stəlik milyon&ccedil;u olmasına yeganə səbəb həmin g&uuml;n&uuml;n olması. Onun kəkələməsi və d&uuml;kanda tək qalması onu necə milyon&ccedil;u eləyə bilərdi ki? Ən qəribəsi odur ki, bu doğru&ccedil;u bir insanın həyatıdır. Bu nə nağıldır, nə qurma. İndi Frenkin d&uuml;nyada ilk dəfə nəyi kəşf etdiyini biləcəksiniz).Kəkələyəcəyindən utanan savadsız Frenk saata baxır, artıq d&uuml;kanın a&ccedil;ılmasına on beş dəqiqə qalıb, g&ouml;rəsən, o necə etsin ki, alıcılarla dil tapa bilsin. Beləcə anbardan bir kağız par&ccedil;ası cırıb onu balaca hissələrə b&ouml;l&uuml;r və hər kağızın &uuml;zərinə yapışdırır. Nə &uuml;&ccedil;&uuml;n təxmini qiymətləri? &Ccedil;&uuml;nki Frenkin bu hərəkətinə kimi he&ccedil; bir alim he&ccedil; bir Amerika d&uuml;kanında satılan malın qiyməti yazılmamışdı, satıcı m&uuml;ştəriyə baxaraq təxmini qiyməti &nbsp;fikirləşirdi və daha sonra onlar bazarlaşırlar. Beləcə Frenk ilk dəfə olaraq d&uuml;nyada qiymətlərin malların &uuml;zərində olmasını fikirləşir. Sən demə, təkcə Frenk yox, elə alıcılar da satıcıdan utandığından bəzən bəzi malları qiymətini soruşmur , &ccedil;ox y&uuml;ksək qiymət deyiləcəyindən &ccedil;ox şeylər alırlar və həmin g&uuml;n&uuml;n alış-verişi bir həftənin alış verişi qədər &ccedil;ox olur. &Ccedil;ox ke&ccedil;mir ki Frenk işdən &ccedil;ıxır və yığdığı pullara &ouml;z d&uuml;kanını a&ccedil;ır, daha sonra birini də və birini də, beləcə ilk supermarketlərin əsasını qoyur. Super marketlər ilk d&uuml;kanlar olur ki, m&uuml;ştəri mala yaxınlaşıb &ouml;z&uuml; onun əlinə g&ouml;t&uuml;r&uuml;b və qiymətini bilərək kassaya yaxınlaşıb &ouml;z&uuml; onu əlinə g&ouml;t&uuml;r&uuml;b və qiymətini bilərək kassaya yaxınlaşa bilər. 1919-cu ildə Frenk Vulvordun sərvəti 65 milyon dollara &ccedil;atır və o Nyu-Yorkun ən h&uuml;nd&uuml;r binasını tikir &quot;Vulvord-Bildinq&quot; Kim deyə bilərdi ki, kəkələyən,&uuml;rəyi gedib yerə yıxılan savadsız kənd&ccedil;i uşaq Nyu-Yorkda o vaxt ən h&uuml;nd&uuml;r binanın tikəcək və b&uuml;t&uuml;n d&uuml;nya &uuml;zrə yeni alış-veriş sistemi yaradacaq. Biz bu g&uuml;n də o kəkələyən uşağın fikirləşdiyi supermarketlərdən istifadə edirik və bunun həyatımızı nə qədər rahatlaşdırdığına şahid oluruq. Halbuki hər şeyi bir uşağın utancaqlığından başlamışdı. Bacara bilmədiyinizi d&uuml;ş&uuml;nməyin, hər şey doğurdan da sizə aslıdır. Və ən əsası Səhv buraxmaqdan qorxmayın , Diqqətlə oxuyun bizə səhv etməyin pis olduğunu məktəbdə &ouml;yrədiblər, Səhv cavab verən iki alır və valideynlərini sinif rəhbəri danlayır,səhv edənləri m&uuml;əllimlər sevmir və uşaqlar dolayır, beləcə bizdə səhv etmək qorxusu o qədər m&ouml;hkəmlənir ki, he&ccedil; bir işə başlamaq istəmirik. He&ccedil; bir suala cavab vermək istəmirik, səhv olacağından qorxuruq. Ətraf m&uuml;hitin bizi dolanması bizim &uuml;&ccedil;&uuml;n &ouml;l&uuml;mdən betərdir. Yazar: Əsədov Qəhrəman</p>

<figure class="easyimage easyimage-full"><img alt="" src="blob:https://localhost:44330/36ec82bf-9110-4eab-be78-b90419028d36" width="1000" />
<figcaption></figcaption>
</figure>

<p>&nbsp;</p>
', 1, 1, 0, CAST(N'2021-01-19T19:17:47.073' AS DateTime), 6, N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', 61)
INSERT [dbo].[tbl_post] ([PostId], [Title], [Context], [Views], [Active], [Accept], [DateTime], [CategoryId], [AuthorId], [PhotoId]) VALUES (15, N'Ailə daxili münaqişələr', N'# Ailə daxili münaqişələr

Ailə canlı təsisatdır.O da dialektika qanunları na tabedir.Bu mənada da söhbət heç də ailədə münaqişənin olub-olmaması haqqında getmir Münaqişəniz ailə əslində yoxdur və ola da bilməz.Bu məsələnin düzgün başa düşmək üçün,birinci növbədə, münaqişənin mənəvi məzmununa diqqət yetirilməlidir.   
 Münaqişə ailədə ünsiyyəin özünəməxsus cəhəti kimi meydana çıxır,ərin, yaxud arvadın öz mövqeyini dəqiqləşdirmək,həyat yoldaşına təsir etmək, hətta bəzən sadəcə olaraq özünətəsdiq meyillərinin ifadəsi kimi nəzərə çarpır. Ailənin formalaşdığı ilk mərhələlərdə açıq və ya gizli münaqişənin tez-tez müşahidə olunması da məhz bununla bağlıdır   
1.Ər -arvadın tələbatlarının, o cümlədən seksual tələbatlarının təmin olunmaması əsasında əmələ gələn;   
2.Onların tərbiyəsi, xüsusilə xarakteri və mənəvi inkişafı ilə bağlı olan;   
3.Ər-arvadın özlərinin qarşılıqlı hüquq və vəzifələrindən, ailədə əmək bölgüsündən, uşaqlara göstərilən qulluqdan narazı olması əsasında əmələ gələn münaqişələrə daha çox  təsadüf olunur.   
 Ailə münaqişələrinin ən başlıca səbəbi uzun müddət Maddi səbəblərlə (ailənin təmin olunması,pulun xərclənməsi,mənzili problemi və s.) Bağlı olmuşdur . Şəxsiyyətin hərtərəfli inkişafı, xüsusilə istər ərin, istərsə arvadın təhsil-peşə səviyyəsinin yüksəlməsi, tələbat sahəsinin zənginləşməsi və.s nəticəsində ailə münasibətlərində mənəvi-psixoloji amillər daha mühüm rol oynamağa başlamışdır. Bu cəhət ailə münaqişələrində bütün aydınlığı ilə özünü göstərir. Münaqişələrin əmələ gəlməsində mənəvi-psixoloji səbəblərin rolu gündən-günə artır.   
 Burada "inkişaf çətinlikləri" adlanan səbəblər haqqında da ayrıca danışmaq lazım gəlir. Mühüm cəhət ondan ibarətdir ki, hüquq bərabərliyi və iqtisadi müstəqillik qazanmış qadın ailə həyatında daha fəal rol oynayır. Halbuki kişilər çox vaxt psixoloji ətalət gücünə ailədə başcılıq etməyə cəhd etməyə göstərirlər. Başqa sözlə, onların şüur və hissləri ailənin yeni inkişaf səviyyəsində uyğun gəlmir. Kəskin ailə münaqişələrinin bir çoxu bu zəmində meydana çıxır. Hətta bəzən ailədə böhranlı vəziyyət əmələ gəlir: ər-arvad aylarla bir-birini dindirmir və yaxud gündə bir-birilə vuruşur, uşaqların, qohuməqrəbanln, qonşuların yanında bir-birini təhqir edirlər; ərin və ya arvadın evdən küsüb getməsi hallarına da az təsadüf olunmur.   
 Boşanmaların bir qismi ər-arvad vəfasızlığl (xəyanəti) nəticəsində baş verir. Bu Azərbaycanlı ailələrdə geniş yayılmamışdır. Demək olar ki, cüzilik təşkil edir. Lakin hər halda bu kimi hallara rast gəlinir. İnsan xisləti heç zaman dostluqda, məhəbbətdə, işgüzar münasibətlərdə , öz xalqına,Vətənə münasibətdə xəyanət dözməmişdir. Yalnız şüurlu, bilərəkdən atılmış addımdan başqa hər şeyi -səhvi, diqqətsizliyi,düşüncəsiz hərəkəti hətta təsadüfi məğlub olmanlda bağışlamaq mümkündür. Bəşəriyyət bu hissə qarşı nə üçün belə barışmazdır? Cavabl aydındır : insanların bir-birinə inamı olmadan birgə iş, fəaliyyətin mümkün deyildir. Xəyanət, yeri gələndə, hətta bir xalqın taleyini belə həll edir. Qonşunun qonşuya xəyanəti də çətin bağışlana bilər. Ailə içərisində ki xəyanət isə daha dəhşətlidir. Ona görə də bu dünyaya göz açan gündən uşaqlar xəyanət hissi yad olmalıdır.   
 Azərbaycanlı ailələr üçün ər-arvadın sərxoşluğa qurşanması da səciyyəvi hal deyildir. Papiros çəkməyə və içməyə meylə xüsusilə qadınlar arasında çox nadir hallarda rast gəlmək mümkündür. Lakin bəzi kişilər içkiyə həddindən artıq aludəçiliyi nəticəsində ailə dağılır. Bu zaman boşanmanın təşəbbüsçüsü ,adətən, qadınlar olurlar. Onlar sərxoşluq kimi bir bəlanı ailə həyatı, uşaqların tərbiyəsi üçün normal şəraitlə bir araya sığmaz sanırlar.   
 Qısqanclıq 3 şəkildə özünü büruzə verir:   
1) kişi və ya qadın azca qısqanır, sonrada yanıldığını başa düşüb peşmançılıq hissi keçirir ,zəifliyinə təəssüflənir   
2)kişi və qadın son dərəcədə özündən çıxır, danışığına, hərəkətlərinə hədd qoymur   
3) kişi və qadın yalnız özünə təsəlli verməklə kifayətlənir.   
 Ailədə əlverişli psixoloji iqlim   
Öz-özünə əmələ gəlmir. O, cəmiyyət qarşısında, ailəsi-həyat yoldaşı və uşaqları qarşısında məsuliyyətli və borcunu düzgün başa düşən ağıllı,həssas ər və arvadın, ata və ananın gündəlik səyi ilə yaranır. Bu baxımdan onlar öz ailə dramının nəinki müəllifləri,həm də aktyorlarıdır. Ər və arvad,ata və ana özlərini müdrik və nəcib insan olduqlarını bu ailə rolları vasitəsilə göstərməlidirlər. 

Yazar: Əsədov Qəhrəman', 2, 1, 0, CAST(N'2021-01-19T19:18:32.960' AS DateTime), 6, N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', 62)
INSERT [dbo].[tbl_post] ([PostId], [Title], [Context], [Views], [Active], [Accept], [DateTime], [CategoryId], [AuthorId], [PhotoId]) VALUES (16, N'Travmaları unuduruq yoxsa gizlədirik?', N'# Travmaları unuduruq yoxsa gizlədirik?

Sənə bir sualım var. Bir anlığına da olsa xatırlamanı istəyirəm, sənə acı çəkdirən bir hadisəni uşaqlıqda yaşadığın bir travmanı xatırla! Hər şeyi xatırlaya bildin?  Dəqiq xatırladığından əminsən? “arada bəzi xırdalıqları unutmuş ola bilərəm” dediyini hiss edirəm sanki. O zaman sənə bir şey deyim. Uşaq vaxtı yaşadığın travmalarda və ya qorxunc hadisələr də şüuruna gəlməyən elə şeylər ola bilərki, onlar heç də düşündüyün qədər xırda-para şeylər olmaya bilər.  Şüuraltımız şüurumuzdan təhdidkar sayılan və xoşa gəlməyən hadisələri gizlədir və özündə saxlayır. Hər hansı bir zamanda şüurlu olaraq fərqində olduğumuz bir şey, buzdağının görünən hisəsidir. Şüuraltımızın basdırdığı hadisələr, şüurumuzun fərqindəliyindən uzaqda bir yerlərdə bağlanılaraq gizli qalırlar.  Bu “ego”nun özünü qoruma mexanizmasıdır. Bastırılmış xatirələrin yenidən xatırlanması sayəsində uşaq zorakılığı ilə bağlı çox sayda hadisənin üstü açılmışdır. Şiddət cinayətini anlatan insanlar, işlədikləri cinayəti bartırmış olduqları görünməkdədir. Belə ki, bu insanlar törətdikləri cinayətin böyük bir bölümünü bastırmış olurlar. Çünki onlar cinayəti törətdikdən sonra vicdan əzabı çəkirlər və bundan qurtulmaq üçün şüuraltı müəyyən şeyləri gizlətməyə məcbur qalır. Və cinayəti törədən insanlarda 80%-i uşaqlıqda özlərinində valideyinləri tərəfindən zorakılığa məruz qaldıqları ortaya çıxmışdır. Burda xatırlanan xatirələrin oxşar xususiyyətləri çoxdur, bunlardan biridə, qadınların 8 yaşından öncə ataları tərəfindən uyğunsuz   
cinsəl davranışlara məruz qalmasıdır. Bu xatirələr xususi konsultasiyalarda xatırlanır və bu konsultasiyalarda zorakılıqların çoxunda ata və ya ögey ataları tərəfindən törədildiyi ortaya çıxmışdır.  Bastırma,  düşüncələri şüuraltına çəkib acı verən və ya təhlükəli düşüncələri şüuraltına girməsinə mane olma prossesidir.  Bu zaman duyğu oradadır, lakin arxasındakı düşüncə mövcud deyildir.  Freud fikirlərini, histeriya üzərində çalışmaları zamanı inkişaf etdirmişdir. Bastırmanın şüur ilə egonu ayırdığını və bunun şəxsiyyət bölünməsinə gətirib çıxardığını deyirdi. Eyni zamanda bastırma, sağlıqlı və normal, duyğu və həycanların ortaya çıxmasına mane olur.  Bastırma bütünlükdə şəxsiyyəti, təməlindən sarsıdır, zəiflədir. Lakin sonralar Freud bunun normal bir qoruma mexanizması olduğunu da söyləmişdir.  Bastırılmayla bağlı psixoloqlar tərəfindən bir çox təcrübə aparılmışdır. Bunlardan birində yeni doğum edən qadınlardan necə bir sancı çəkdikləri soruşulur və eyni sualı bir neçə ay sonra təkrar soruşurlar bu səfər qadınlar ilk söylədiklərindən daha yüngül bir ağrı çəkdiklərini iddia edirlər.  Əslində bastırmayla bağlı bir başqa teoriya da deyilirki, əslində şuuraltı düşüncələri və hadisələri gizlətmir. Sadəcə olaraq o düşüncələrin xatırlanmamasının səbəbi, düşüncənin geri çağırılmasında yaranan problemlə bağlı olduğunu söyləyirlər. Həmən düşüncələri geri çağırmaq üçün ipucları yoxdur. Əlbətdə bu da sadəcə bir teoriyadır   
və bastırılma ilə bağlı ilk öncə anlatdığım fikir daha çox yayılmışdır.  Bastırılma mövzusu konsultasiyalarda, laborotoriyalarda və məhkəmə salonlarında müzakirə mövzusu olmuşdur. Bastırlmanın şəxsiyyət bölünməsi kimi önəmli problemlərə səbəb olduğundan bütün psixologiya terminologiyaları içərisində bu mövzu yazarlara və rejisorlara daha maraqlı gəlmişdir.  Bunun üzərinə bir çox film çəkilmiş kitablar yazılmışdır. 

Yazar: Sevinc Rəhimova', 7, 1, 0, CAST(N'2021-01-19T19:19:31.727' AS DateTime), 8, N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', 63)
INSERT [dbo].[tbl_post] ([PostId], [Title], [Context], [Views], [Active], [Accept], [DateTime], [CategoryId], [AuthorId], [PhotoId]) VALUES (17, N'Cəmiyyətə Adaptasiya', N'<blockquote>
<p><strong># Cəmiyyətə Adaptasiya **Yaşadığımız şəhərdə**</strong>, təhsil aldığımız &uuml;niversitet və məktəbdə, dostlarımızla birlikdə toplandığınız ki&ccedil;ik yığıncaqlarda, insanlara uyğunlaşmaqda &ccedil;ətinlik &ccedil;əkdiyiniz olurmu? Insanların sizdən fərqli d&uuml;ş&uuml;nd&uuml;y&uuml; fikrindəsiniz? &Uuml;mumiyyətlə D&uuml;nyaca məşhur psixoloqlar və sosyoloqlar cəmiyyətin qaydalarına və normalarına baş qaldıran, bu qaydalara riayət etməyən və uyğunlaşmaqdan _qa&ccedil;an insanları_ maraqla incələyirlər. bu incələmərin (yəni testlərin) nəticələri isə onları durmadan heyrətləndirir. Məktəblərdə şagirdlərin bir birinə bənzər formaları, koranə bi şəkildə sərvət xərcləyən &ldquo;moda qurbanlarımız&rdquo;, hər kəsin əlində dolanan bahalı telefonlar, &uuml;mumiyyətlə insanları, başqalarının davranışlarını təkrarlamağa məcbur edən, gər&ccedil;ək və ya xəyali sosyal təzyiqlər nələrdir? Uyğunlaşma ilə bağlı bir &ccedil;ox təcr&uuml;blər aparılmışdır. Lakin,iki təcr&uuml;bə bunlar arasında daha &ccedil;ox diqqət &ccedil;əkmişdir. Bunlardan ilkində bir ne&ccedil;ə tələbə, qaranlıq bir otaqda toplanılır. Onlardan yalnızca biri, hər şeydən xəbərsiz olur. Yerdə qalanlar isə x&uuml;susi olaraq se&ccedil;ilmiş, aktyor tələbələrdir və otaqda oynanılacaq oyundan xəbərdar olurlar. Qaranlıqda divara bəyaz bir işıq n&ouml;qtəsi yansılıtır və tələbələrdən həmin n&ouml;qtənin tərpəndiyi anda bildirməkləri istənilir. &Ouml;ncədən x&uuml;susi olaraq toplanmış tələbələr yerdə qalan bir tələbəni &ccedil;aşdırmaq &uuml;&ccedil;&uuml;n n&ouml;qtənin hərəkət etdiğini iddia edirlər. Testə gətirilmiş tələbə isə &ouml;ncələr doğru yanıtlar versədə sonradan otaqdakı digər tələbələrin fikirlərinə qoşulur və n&ouml;qtə tərpənmədiyi halda tərpəndiyini iddia edir. Bu test bir ne&ccedil;ə dəfə təkrarlanır və &ccedil;oxusunda nəticə eyni olur. &gt; Ikinci təcr&uuml;bə isə, 1952-ci ildə Amerikan psixoloq olan Asch tərəfindən aparılır. Tələbələr hər qrupda beş nəfər olmaqla, iki qrupa ayrılır. Tələbələr hamısı bir masa ətrafında toplanılır. Onlara iki kart verilir. Və bir kartın i&ccedil;ində m&uuml;xtəlif &ouml;l&ccedil;&uuml;lərlə sıralanmış (məs. A,B,C) cızıqlar olur. Digər kartda isə sadəcə bir n&uuml;munə cızıq olur. Və tələbələrdən birinci kartdakı cızıqlardan hansının, n&uuml;munə cızıqla eyni &ouml;l&ccedil;&uuml;də olduğu soruşulur. Lakin, bu tələbələrdən ikinci qrup, &ouml;ncədən planlanmış şəkildə, durmadan yanlış cavablar verirlər. Birinci qruptakı tələbələr isə, &ouml;ncələr doğru cavablar versələr də, sonralar cavablarını dəyişirlər. Cızıqların &ouml;l&ccedil;&uuml;ləri arasındakı fərqlər &ccedil;ox net olmağına baxmayaraq tələbələr &ccedil;aşırlar və cavab verməkdən &ccedil;əkinirlər. Aschın bu təcr&uuml;bələri dəfələrlə təkrarlanır. İnsanların cavablarına təsir edən m&uuml;əyyən amillər olsada, testin nəticəsi 75% bir g&ouml;stəriciylə eyni olur. Bəs onda belə bir sual yaranır; Niyə insanlar başqalarının hərəkətlərini təkrar etməyə meyillidirlər? Bu suala qısaca cavan verəcək olarsaq; &quot;insanlar daima haqlı olmaq və sevilmək istəyirlər&quot; cavabını verə bilərik. Daha dərinə enəcək olarsaq isə, insanlar daima necə davranacaqları haqqında başqalarından kopya &ccedil;əkməyə &ccedil;alışırlar. Ətrafımızdakıların bizdən daha &ccedil;ox, bizim isə onlardan daha az şey bildiyinə inandığımız təqdirdə &quot;k&uuml;tlənin arxasından gedəcəyik&quot;. &Ccedil;oxumuz &ouml;z&uuml;m&uuml;z&uuml; bir sosyal qrupun n&uuml;mayəndəsi olaraq g&ouml;r&uuml;r&uuml;k. N&uuml;mayəndə olmaq isə, qaydaları və normaları izləməmiz anlamını veririr. Və bu tam olaraq cəmiyyət basqısının &ouml;z&uuml;d&uuml;r. &quot;Aid olma ehtiyacımız&quot; səbəbindən bu davranışları sərgiləyirik. Daha olğun insanlar və ego g&uuml;c&uuml; daha &ccedil;ox olan insanlar, cəmiyyətə daha az uyğunlaşa bilirlər. Eyni zamanda mentalitet və mədəni b&ouml;y&uuml;d&uuml;lmə tərzimizdə cəmiyyətə uyğunlaşmamıza b&ouml;y&uuml;k təsir g&ouml;stərir. Və son olaraq, Amerikan r&uuml;yası denilən bir şey var əminəmki &ccedil;oxunuz bundan xəbərdarsınız. James Baldwin demişdirki &quot;Amerikan r&uuml;yası, hər kəsin m&uuml;mk&uuml;n olduğunca &ccedil;ox bir birinə bənzəməsini istəyir&quot;. Buna g&ouml;rə b&ouml;y&uuml;k ehtimalla hər zaman bizə, &quot;əgər uğurlu olmaq istəyirsənsə işlədiyin şirkətin tərzini mənimsəməlisən&quot; deyirlər. Biolojik robot kimi proqramlanılmış, eyni geyimdə, eyni beyində insanlar toplusu. Fikirlərin başqalarının qərarlarından asılıdır və eyni zamanda, başqalarının qərarlarıda sənin fikirlərindən. O zaman sizə bir sual. Bəs siz nə istəyirsiz? Hər kəs kimi uyumlu olmaqmı yoxsa...? Rəhimova Sevinc | Bilinən G&ouml;r&uuml;nməzlər</p>
</blockquote>

<figure class="easyimage easyimage-full"><img alt="" src="blob:https://localhost:44330/ecf623b4-2285-45ca-bf44-ccf14404144c" width="1000" />
<figcaption>sadas</figcaption>
</figure>

<p>&nbsp;</p>
', 6, 1, 0, CAST(N'2021-01-19T20:16:26.177' AS DateTime), 8, N'b0ee3cb1-38db-445e-8215-b77aa2ad4763', 64)
INSERT [dbo].[tbl_post] ([PostId], [Title], [Context], [Views], [Active], [Accept], [DateTime], [CategoryId], [AuthorId], [PhotoId]) VALUES (19, N'Çernobildə yetişən göbələk,Marsda insanları radiasiyadan qoruyacaq', N'<h2>Çernobildə yetişən göbələk,Marsda insanları radiasiyadan qoruyacaq</h2><p>Marsa insanlı səyahətlər üçün hazırlıqlar dəvam ederkən,heyəti ölümcük kosmik radiasiyadan qorumaq üçün helə də müxtəlif həllər axtarılır.Dünyanın ən prestijli universitetlərindən olan elm adamları,Çernobil Atom elektrik stansiyası ətrafında yaşayan bir göbələk növünün , radiasiyanı udmaqla kosmosda istifadə edilə biləcəyinə dair &nbsp;güclü sübutlar tapıblar.<span style="background-color:hsl(210, 75%, 60%);">"New Scientist"</span> jurnalının hesabatlına görə,Beynəlxalq Kosmik Stansiyada(ISS) sınaqdan keçirilmiş bir nümunə kosmik şüalara mane ola bildi.</p><figure class="image"><img src="https://163602-560839-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2020/04/Gram%E2%80%99s-stain-Panel-A-and-India-ink-stain-Panel-B-revealed-abundant-encapsulated-round-yeasts-with-some-budding-forms..jpeg" alt="Cryptococcus neoformans | Mycology | Microbe Notes"></figure><p>&nbsp;</p><p>&nbsp;</p><p>Normalda qalxanların paslanmaz polad və ya fərqli materialdan düzəldilməsi və kosmosa ayrı göndərilməsi planlansa da,xərclər gedərək artır.ISS də çalışan , John Hopkins və Stanford Universitenin elm adamları sadəcə 2mm qalınlığında bir Cryptococcus &nbsp;neoformans göbələk nümunəsinin belə kosmik şüaları %2 nisbətində bloklayaraq udduğunu açıqladılar.Təbii ki , 2% nisbətində qorunma insanları zərərli kosmik şüalardan qoruya bilməz.Lakin elm adamları , qalınlıq əgər 21 sm olarsa onda gələcək Mars gəzintilərində kosmonavtları qoruya biləcəklərini dedilər.</p><h3>Mantar özünü bərpa edə bilir</h3><p>Bundan əlavə ,tədqiqatçılar bu göbələk materialı ilə kosmik geyimin nece örtülməsini araşdırırlar.New Scientist''in hesabatına görə , bu araşdırmanın əsası zədələnmiş göbələklərin özlərini bərpa edərək böyüməsidir."Bu göbəyəli möhtəşəm edən şey , sadəcə ondan bir neçə qrama ehtiyacınızın olmasıdır".Göbələk özünü kopyalayır və bərpa edir.Hətta günəş partlamaları radiasiya qalxanlna zərər vursa da , bir neçə günə əvvəlki halına gələcəkdir.</p><p>&nbsp;</p><h3>Cryptococcus Neoformans haqqında &nbsp;</h3><p>Cryptococcus neoformans, həm bitki, həm də heyvanlarda yaşaya bilən &nbsp;qapalı maya tipli göbələkdir. Teleomorph, Filobasidiella neoformans adı ilə də tanınan bu növ, əsas beş göbələk növündən biri olan Basidiomycota sinfinə aiddir. C. neoformanlar ümumiyyətlə (tək hüceyrəli) mayalar kimi qönçələnərək çoxalırlar.</p><figure class="image"><img src="https://drfungus.org/wp-content/uploads/2017/02/csf1_L.jpg" alt="Cryptococcus Species - Doctor Fungus"></figure><p>&nbsp;</p>', 7, 1, 0, CAST(N'2021-01-26T23:32:39.600' AS DateTime), 7, N'0f5f039b-6cdc-4fbd-80f1-96216afeb518', 69)
SET IDENTITY_INSERT [dbo].[tbl_post] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_video] ON 

INSERT [dbo].[tbl_video] ([VideoId], [VideoURL], [PhotoId], [Title]) VALUES (1, N'https://www.youtube.com/watch?v=i1rNXDezxO8', 44, N'Niyə ölürük? (Reenkarnasyon, Mistik, Fəlsəfə)')
INSERT [dbo].[tbl_video] ([VideoId], [VideoURL], [PhotoId], [Title]) VALUES (2, N'https://www.youtube.com/watch?v=i1rNXDezxO8', 45, N'Niyə Azərbaycanda "LOTULARIN" Sayı Artır?')
INSERT [dbo].[tbl_video] ([VideoId], [VideoURL], [PhotoId], [Title]) VALUES (3, N'https://www.youtube.com/watch?v=i1rNXDezxO8', 46, N'Niyə Azərbaycanda "LOTULARIN" Sayı Artır?')
INSERT [dbo].[tbl_video] ([VideoId], [VideoURL], [PhotoId], [Title]) VALUES (4, NULL, 52, N'600 sui-qəsddən canını qurtaran Fidel!')
INSERT [dbo].[tbl_video] ([VideoId], [VideoURL], [PhotoId], [Title]) VALUES (8, N'https://www.youtube.com/watch?v=_xf72GyhhDg', 49, N'Marixuana çəkdikdə Beynində Nələr Olur?')
SET IDENTITY_INSERT [dbo].[tbl_video] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Writer] ON 

INSERT [dbo].[tbl_Writer] ([WriterId], [FullName], [Description]) VALUES (1, N'Frans Kafka', N'Kafka')
INSERT [dbo].[tbl_Writer] ([WriterId], [FullName], [Description]) VALUES (2, N'Viktor Huqo', N'Huqo')
SET IDENTITY_INSERT [dbo].[tbl_Writer] OFF
GO
/****** Object:  Index [PK__aspnet_A__C93A4C98AFF1DC2C]    Script Date: 27.01.2021 12:33:17 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__aspnet_A__17477DE4D25525B8]    Script Date: 27.01.2021 12:33:17 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__aspnet_A__309103312F80A941]    Script Date: 27.01.2021 12:33:17 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_M__1788CC4DD8DFCAD6]    Script Date: 27.01.2021 12:33:17 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__CD67DC58F0793684]    Script Date: 27.01.2021 12:33:17 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__3214EC06863DAF7E]    Script Date: 27.01.2021 12:33:17 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_R__8AFACE1B7E55305C]    Script Date: 27.01.2021 12:33:17 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_U__1788CC4D0CFAB978]    Script Date: 27.01.2021 12:33:17 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
ALTER TABLE [dbo].[tbl_post] ADD  CONSTRAINT [DF_tbl_post_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD  CONSTRAINT [FK_aspnet_Users_tbl_photo] FOREIGN KEY([PhotoId])
REFERENCES [dbo].[tbl_photo] ([PhotoId])
GO
ALTER TABLE [dbo].[aspnet_Users] CHECK CONSTRAINT [FK_aspnet_Users_tbl_photo]
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[tbl_book]  WITH CHECK ADD  CONSTRAINT [FK_tbl_book_tbl_bookCategory] FOREIGN KEY([BookCategoryId])
REFERENCES [dbo].[tbl_bookCategory] ([BookCategoryId])
GO
ALTER TABLE [dbo].[tbl_book] CHECK CONSTRAINT [FK_tbl_book_tbl_bookCategory]
GO
ALTER TABLE [dbo].[tbl_book]  WITH CHECK ADD  CONSTRAINT [FK_tbl_book_tbl_photo] FOREIGN KEY([PhotoId])
REFERENCES [dbo].[tbl_photo] ([PhotoId])
GO
ALTER TABLE [dbo].[tbl_book] CHECK CONSTRAINT [FK_tbl_book_tbl_photo]
GO
ALTER TABLE [dbo].[tbl_book]  WITH CHECK ADD  CONSTRAINT [FK_tbl_book_tbl_Writer] FOREIGN KEY([WriterId])
REFERENCES [dbo].[tbl_Writer] ([WriterId])
GO
ALTER TABLE [dbo].[tbl_book] CHECK CONSTRAINT [FK_tbl_book_tbl_Writer]
GO
ALTER TABLE [dbo].[tbl_bookCategory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_bookCategory_tbl_photo] FOREIGN KEY([PhotoId])
REFERENCES [dbo].[tbl_photo] ([PhotoId])
GO
ALTER TABLE [dbo].[tbl_bookCategory] CHECK CONSTRAINT [FK_tbl_bookCategory_tbl_photo]
GO
ALTER TABLE [dbo].[tbl_category]  WITH CHECK ADD  CONSTRAINT [FK_tbl_category_tbl_photo] FOREIGN KEY([PhotoId])
REFERENCES [dbo].[tbl_photo] ([PhotoId])
GO
ALTER TABLE [dbo].[tbl_category] CHECK CONSTRAINT [FK_tbl_category_tbl_photo]
GO
ALTER TABLE [dbo].[tbl_post]  WITH CHECK ADD  CONSTRAINT [FK_tbl_post_aspnet_Users] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[tbl_post] CHECK CONSTRAINT [FK_tbl_post_aspnet_Users]
GO
ALTER TABLE [dbo].[tbl_post]  WITH CHECK ADD  CONSTRAINT [FK_tbl_post_tbl_category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tbl_category] ([CategoryId])
GO
ALTER TABLE [dbo].[tbl_post] CHECK CONSTRAINT [FK_tbl_post_tbl_category]
GO
ALTER TABLE [dbo].[tbl_post]  WITH CHECK ADD  CONSTRAINT [FK_tbl_post_tbl_photo] FOREIGN KEY([PhotoId])
REFERENCES [dbo].[tbl_photo] ([PhotoId])
GO
ALTER TABLE [dbo].[tbl_post] CHECK CONSTRAINT [FK_tbl_post_tbl_photo]
GO
ALTER TABLE [dbo].[tbl_video]  WITH CHECK ADD  CONSTRAINT [FK_tbl_video_tbl_photo] FOREIGN KEY([PhotoId])
REFERENCES [dbo].[tbl_photo] ([PhotoId])
GO
ALTER TABLE [dbo].[tbl_video] CHECK CONSTRAINT [FK_tbl_video_tbl_photo]
GO
