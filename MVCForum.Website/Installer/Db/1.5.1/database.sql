/****** Object:  Table [dbo].[UploadedFile]    Script Date: 04/19/2013 12:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadedFile](
	[Id] [uniqueidentifier] NOT NULL,
	[Filename] [nvarchar](200) NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[Post_Id] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_UploadedFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[BannedWord]    Script Date: 04/17/2013 14:34:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannedWord](
	[Id] [uniqueidentifier] NOT NULL,
	[Word] [nvarchar](75) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_BannedWord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[BannedEmail]    Script Date: 04/16/2013 08:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannedEmail](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
CONSTRAINT [PK_BannedEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[TopicTag]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicTag](
	[Id] [uniqueidentifier] NOT NULL,
	[Tag] [nvarchar](100) NOT NULL,
	[Slug] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Topic_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[MembershipUser]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipUser](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordSalt] [nvarchar](128) NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttempt] [int] NOT NULL,
	[Slug] [nvarchar](150) NOT NULL,
	[Comment] [ntext] NULL,
	[Signature] [nvarchar](1000) NULL,
	[Age] [int] NULL,
	[Location] [nvarchar](100) NULL,
	[Website] [nvarchar](100) NULL,
	[Twitter] [nvarchar](60) NULL,
	[Facebook] [nvarchar](60) NULL,
	[Avatar] [nvarchar](500) NULL,
	[FacebookAccessToken] [nvarchar](300) NULL,
	[FacebookId] [bigint] NULL,
	[TwitterAccessToken] [nvarchar](300) NULL,
	[TwitterId] [nvarchar](150) NULL,
	[GoogleAccessToken] [nvarchar](300) NULL,
	[GoogleId] [nvarchar](150) NULL,
	[IsExternalAccount] [bit] NULL,
	[TwitterShowFeed] [bit] NULL,
	[DisableEmailNotifications] [bit] NULL,
	[DisablePosting] [bit] NULL,
	[DisablePrivateMessages] [bit] NULL,
	[DisableFileUploads] [bit] NULL,
	[LoginIdExpires] [datetime] NULL,
	[MiscAccessToken] [nvarchar](250) NULL,
	[Latitude] [nvarchar](40) NULL,
	[Longitude] [nvarchar](40) NULL,
	[LastActivityDate] [datetime] NULL,
 CONSTRAINT [PK_MembershipUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
) TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembershipRole]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipRole](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_MembershipRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[Category]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Description] [ntext] NULL,
	[Category_Id] [uniqueidentifier] NULL,
	[DateCreated] [datetime] NOT NULL,
	[Slug] [nvarchar](450) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[ModerateTopics] [bit] NOT NULL,
	[ModeratePosts] [bit] NOT NULL,
	[PageTitle] [nvarchar](80) NULL,
	[MetaDescription] [nvarchar](200) NULL,
	[Path] [nvarchar](2500) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
) TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocaleResourceKey]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocaleResourceKey](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Notes] [ntext] NULL,
	[DateAdded] [date] NOT NULL,
 CONSTRAINT [PK_LocaleResourceKey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
) TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LanguageCulture] [nvarchar](20) NOT NULL,
	[FlagImageFileName] [nvarchar](50) NULL,
	[RightToLeft] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[Badge]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Badge](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [ntext] NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[AwardsPoints] [int] NULL,
 CONSTRAINT [PK_Badge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
) TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Id] [uniqueidentifier] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[Poll]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poll](
	[Id] [uniqueidentifier] NOT NULL,
	[IsClosed] [bit] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Poll] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[MembershipUsersInRoles]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipUsersInRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleIdentifier] [uniqueidentifier] NOT NULL,
	[UserIdentifier] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MembershipUsersInRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[MembershipUserPoints]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipUserPoints](
	[Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[Points] [int] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_MembershipUser_Points] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[MembershipUser_Badge]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipUser_Badge](
	[Id] [uniqueidentifier] NOT NULL,
	[Badge_Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MembershipUser_Badge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[CategoryPermissionForRole]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryPermissionForRole](
	[Id] [uniqueidentifier] NOT NULL,
	[Permission_Id] [uniqueidentifier] NOT NULL,
	[MembershipRole_Id] [uniqueidentifier] NOT NULL,
	[Category_Id] [uniqueidentifier] NOT NULL,
	[IsTicked] [bit] NOT NULL,
 CONSTRAINT [PK_CategoryPermissionForRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[CategoryNotification]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryNotification](
	[Id] [uniqueidentifier] NOT NULL,
	[Category_Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CategoryNotification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[WaterResult]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WaterResult](
	[Id] [uniqueidentifier] NOT NULL,	
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Hot] [int] NULL,
	[Cold] [int] NULL
 CONSTRAINT [PK_WaterResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[BadgeTypeTimeLastChecked]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BadgeTypeTimeLastChecked](
	[Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[BadgeType] [nvarchar](50) NOT NULL,
	[TimeLastChecked] [datetime] NOT NULL,
 CONSTRAINT [PK_BadgeTypeTimeLastChecked] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[LocaleStringResource]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocaleStringResource](
	[Id] [uniqueidentifier] NOT NULL,
	[Language_Id] [uniqueidentifier] NOT NULL,
	[LocaleResourceKey_Id] [uniqueidentifier] NOT NULL,
	[ResourceValue] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_LocaleStringResource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[Solved] [bit] NOT NULL,
	[Category_Id] [uniqueidentifier] NOT NULL,
	[Post_Id] [uniqueidentifier] NULL,
	[Slug] [nvarchar](450) NOT NULL,
	[Views] [int] NULL,
	[IsSticky] [bit] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[Poll_Id] [uniqueidentifier] NULL,
	[Pending] [bit] NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [uniqueidentifier] NOT NULL,
	[ForumName] [nvarchar](500) NULL,
	[ForumUrl] [nvarchar](500) NULL,
	[IsClosed] [bit] NULL,
	[EnableRSSFeeds] [bit] NULL,
	[DisplayEditedBy] [bit] NULL,
	[EnablePostFileAttachments] [bit] NULL,
	[EnableMarkAsSolution] [bit] NULL,
	[EnableSpamReporting] [bit] NULL,
	[EnableMemberReporting] [bit] NULL,
	[EnableEmailSubscriptions] [bit] NULL,
	[ManuallyAuthoriseNewMembers] [bit] NULL,
	[EmailAdminOnNewMemberSignUp] [bit] NULL,
	[TopicsPerPage] [int] NULL,
	[PostsPerPage] [int] NULL,
	[EnablePrivateMessages] [bit] NULL,
	[MaxPrivateMessagesPerMember] [int] NULL,
	[PrivateMessageFloodControl] [int] NULL,
	[EnableSignatures] [bit] NULL,
	[EnablePoints] [bit] NULL,
	[PointsAllowedToVoteAmount] [int] NULL,
	[PointsAddedPerPost] [int] NULL,
	[PointsAddedPostiveVote] [int] NULL,
	[PointsAddedForSolution] [int] NULL,
	[PointsDeductedNagativeVote] [int] NULL,
	[AdminEmailAddress] [nvarchar](100) NULL,
	[NotificationReplyEmail] [nvarchar](100) NULL,
	[SMTP] [nvarchar](100) NULL,
	[SMTPUsername] [nvarchar](100) NULL,
	[SMTPPort] [nvarchar](10) NULL,
	[SMTPEnableSSL] [bit] NULL,
	[SMTPPassword] [nvarchar](100) NULL,
	[Theme] [nvarchar](100) NULL,
	[NewMemberStartingRole] [uniqueidentifier] NULL,
	[DefaultLanguage_Id] [uniqueidentifier] NOT NULL,
	[ActivitiesPerPage] [int] NULL,
	[EnableAkisment] [bit] NULL,
	[AkismentKey] [nvarchar](100) NULL,
	[CurrentDatabaseVersion] [nvarchar](10) NULL,
	[SpamQuestion] [nvarchar](500) NULL,
	[SpamAnswer] [nvarchar](500) NULL,
	[EnableSocialLogins] [bit] NULL,
	[EnablePolls] [bit] NULL,
	[NewMemberEmailConfirmation] [bit] NULL,
	[SuspendRegistration] [bit] NULL,
	[PageTitle] [nvarchar](80) NULL,
	[MetaDesc] [nvarchar](200) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[PrivateMessage]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivateMessage](
	[Id] [uniqueidentifier] NOT NULL,
	[UserTo_Id] [uniqueidentifier] NOT NULL,
	[UserFrom_Id] [uniqueidentifier] NOT NULL,
	[DateSent] [datetime] NOT NULL,
	[Subject] [nvarchar](80) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[IsSentMessage] [bit] NOT NULL,
 CONSTRAINT [PK_PrivateMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[Post]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[PostContent] [ntext] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[VoteCount] [int] NOT NULL,
	[Topic_Id] [uniqueidentifier] NOT NULL,
	[DateEdited] [datetime] NULL,
	[IsSolution] [bit] NOT NULL,
	[IsTopicStarter] [bit] NULL,
	[FlaggedAsSpam] [bit] NULL,
	[IpAddress] [nvarchar](50) NULL,
	[Pending] [bit] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
) TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicNotification]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicNotification](
	[Id] [uniqueidentifier] NOT NULL,
	[Topic_Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[Topic_Tag]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic_Tag](
	[Id] [uniqueidentifier] NOT NULL,
	[Topic_Id] [uniqueidentifier] NOT NULL,
	[TopicTag_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Topic_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[PollAnswer]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PollAnswer](
	[Id] [uniqueidentifier] NOT NULL,
	[Answer] [nvarchar](600) NOT NULL,
	[Poll_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PollAnswer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[Vote]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON 
GO
SET QUOTED_IDENTIFIER ON 
GO
CREATE TABLE [dbo].[Vote](
	[Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[Post_Id] [uniqueidentifier] NOT NULL,
	[Amount] [int] NOT NULL,
	[VotedByMembershipUser_Id] [uniqueidentifier] NULL,
	[DateVoted] [datetime] NULL,
 CONSTRAINT [PK_Vote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[PollVote]    Script Date: 04/08/2013 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PollVote](
	[Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [uniqueidentifier] NOT NULL,
	[PollAnswer_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PollVote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Default [DF_Category_SortOrder]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_Category_IsLocked]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_IsLocked]  DEFAULT ((0)) FOR [IsLocked]
GO
/****** Object:  Default [DF_CategoryPermissionForRole_HasPermission]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[CategoryPermissionForRole] ADD  CONSTRAINT [DF_CategoryPermissionForRole_HasPermission]  DEFAULT ((0)) FOR [IsTicked]
GO
/****** Object:  Default [MembershipUser_Badge_Id]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[MembershipUser_Badge] ADD  CONSTRAINT [MembershipUser_Badge_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [MembershipUsersInRoles_Id]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[MembershipUsersInRoles] ADD  CONSTRAINT [MembershipUsersInRoles_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Poll_IsClosed]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Poll] ADD  CONSTRAINT [DF_Poll_IsClosed]  DEFAULT ((0)) FOR [IsClosed]
GO
/****** Object:  Default [DF_Post_VoteCount]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Post] ADD  CONSTRAINT [DF_Post_VoteCount]  DEFAULT ((0)) FOR [VoteCount]
GO
/****** Object:  Default [DF_Post_IsApproved]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Post] ADD  CONSTRAINT [DF_Post_IsApproved]  DEFAULT ((0)) FOR [IsSolution]
GO
/****** Object:  Default [DF_Post_IsTopicStarter]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Post] ADD  CONSTRAINT [DF_Post_IsTopicStarter]  DEFAULT ((0)) FOR [IsTopicStarter]
GO
/****** Object:  Default [DF_PrivateMessage_IsRead]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[PrivateMessage] ADD  CONSTRAINT [DF_PrivateMessage_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
/****** Object:  Default [DF_Topic_Solved]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Topic] ADD  CONSTRAINT [DF_Topic_Solved]  DEFAULT ((0)) FOR [Solved]
GO
/****** Object:  Default [DF_Topic_IsSticky]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Topic] ADD  CONSTRAINT [DF_Topic_IsSticky]  DEFAULT ((0)) FOR [IsSticky]
GO
/****** Object:  Default [DF_Topic_IsLocked]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Topic] ADD  CONSTRAINT [DF_Topic_IsLocked]  DEFAULT ((0)) FOR [IsLocked]
GO
/****** Object:  Default [DF_Id]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Topic_Tag] ADD  CONSTRAINT [DF_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  ForeignKey [FK_BadgeTypeTimeLastChecked_MembershipUser]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[BadgeTypeTimeLastChecked]  WITH NOCHECK ADD  CONSTRAINT [FK_BadgeTypeTimeLastChecked_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[BadgeTypeTimeLastChecked] NOCHECK CONSTRAINT [FK_BadgeTypeTimeLastChecked_MembershipUser]
GO
/****** Object:  ForeignKey [FK_CategoryNotification_Category]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[CategoryNotification]  WITH CHECK ADD  CONSTRAINT [FK_CategoryNotification_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[CategoryNotification] CHECK CONSTRAINT [FK_CategoryNotification_Category]
GO
/****** Object:  ForeignKey [FK_CategoryNotification_MembershipUser]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[CategoryNotification]  WITH CHECK ADD  CONSTRAINT [FK_CategoryNotification_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[CategoryNotification] CHECK CONSTRAINT [FK_CategoryNotification_MembershipUser]
GO
/****** Object:  ForeignKey [FK_WaterResult_MembershipUser]    ******/
ALTER TABLE [dbo].[WaterResult]  WITH CHECK ADD CONSTRAINT [FK_WaterResult_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[WaterResult] CHECK CONSTRAINT [FK_WaterResult_MembershipUser]
GO
/****** Object:  ForeignKey [FK_CategoryPermissionForRole_Category]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[CategoryPermissionForRole]  WITH CHECK ADD  CONSTRAINT [FK_CategoryPermissionForRole_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[CategoryPermissionForRole] CHECK CONSTRAINT [FK_CategoryPermissionForRole_Category]
GO
/****** Object:  ForeignKey [FK_CategoryPermissionForRole_MembershipRole]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[CategoryPermissionForRole]  WITH CHECK ADD  CONSTRAINT [FK_CategoryPermissionForRole_MembershipRole] FOREIGN KEY([MembershipRole_Id])
REFERENCES [dbo].[MembershipRole] ([Id])
GO
ALTER TABLE [dbo].[CategoryPermissionForRole] CHECK CONSTRAINT [FK_CategoryPermissionForRole_MembershipRole]
GO
/****** Object:  ForeignKey [FK_CategoryPermissionForRole_Permission]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[CategoryPermissionForRole]  WITH CHECK ADD  CONSTRAINT [FK_CategoryPermissionForRole_Permission] FOREIGN KEY([Permission_Id])
REFERENCES [dbo].[Permission] ([Id])
GO
ALTER TABLE [dbo].[CategoryPermissionForRole] CHECK CONSTRAINT [FK_CategoryPermissionForRole_Permission]
GO
/****** Object:  ForeignKey [FK_LocaleStringResource_Language]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[LocaleStringResource]  WITH NOCHECK ADD  CONSTRAINT [FK_LocaleStringResource_Language] FOREIGN KEY([Language_Id])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[LocaleStringResource] NOCHECK CONSTRAINT [FK_LocaleStringResource_Language]
GO
/****** Object:  ForeignKey [FK_LocaleStringResource_LocaleResourceKey]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[LocaleStringResource]  WITH NOCHECK ADD  CONSTRAINT [FK_LocaleStringResource_LocaleResourceKey] FOREIGN KEY([LocaleResourceKey_Id])
REFERENCES [dbo].[LocaleResourceKey] ([Id])
GO
ALTER TABLE [dbo].[LocaleStringResource] NOCHECK CONSTRAINT [FK_LocaleStringResource_LocaleResourceKey]
GO
/****** Object:  ForeignKey [FK_MembershipUser_Badge_Badge]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[MembershipUser_Badge]  WITH NOCHECK ADD  CONSTRAINT [FK_MembershipUser_Badge_Badge] FOREIGN KEY([Badge_Id])
REFERENCES [dbo].[Badge] ([Id])
GO
ALTER TABLE [dbo].[MembershipUser_Badge] NOCHECK CONSTRAINT [FK_MembershipUser_Badge_Badge]
GO
/****** Object:  ForeignKey [FK_MembershipUser_Badge_MembershipUser]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[MembershipUser_Badge]  WITH NOCHECK ADD  CONSTRAINT [FK_MembershipUser_Badge_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[MembershipUser_Badge] NOCHECK CONSTRAINT [FK_MembershipUser_Badge_MembershipUser]
GO
/****** Object:  ForeignKey [FK_MembershipUserPoints_MembershipUser]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[MembershipUserPoints]  WITH NOCHECK ADD  CONSTRAINT [FK_MembershipUserPoints_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[MembershipUserPoints] NOCHECK CONSTRAINT [FK_MembershipUserPoints_MembershipUser]
GO
/****** Object:  ForeignKey [FK_MembershipUsersInRoles_MembershipRole1]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[MembershipUsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_MembershipUsersInRoles_MembershipRole1] FOREIGN KEY([RoleIdentifier])
REFERENCES [dbo].[MembershipRole] ([Id])
GO
ALTER TABLE [dbo].[MembershipUsersInRoles] CHECK CONSTRAINT [FK_MembershipUsersInRoles_MembershipRole1]
GO
/****** Object:  ForeignKey [FK_MembershipUsersInRoles_MembershipUser1]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[MembershipUsersInRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_MembershipUsersInRoles_MembershipUser1] FOREIGN KEY([UserIdentifier])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[MembershipUsersInRoles] NOCHECK CONSTRAINT [FK_MembershipUsersInRoles_MembershipUser1]
GO
/****** Object:  ForeignKey [FK_Poll_MembershipUser]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Poll]  WITH CHECK ADD  CONSTRAINT [FK_Poll_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[Poll] CHECK CONSTRAINT [FK_Poll_MembershipUser]
GO
/****** Object:  ForeignKey [FK_PollAnswer_Poll]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[PollAnswer]  WITH CHECK ADD  CONSTRAINT [FK_PollAnswer_Poll] FOREIGN KEY([Poll_Id])
REFERENCES [dbo].[Poll] ([Id])
GO
ALTER TABLE [dbo].[PollAnswer] CHECK CONSTRAINT [FK_PollAnswer_Poll]
GO
/****** Object:  ForeignKey [FK_PollVote_MembershipUser]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[PollVote]  WITH CHECK ADD  CONSTRAINT [FK_PollVote_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[PollVote] CHECK CONSTRAINT [FK_PollVote_MembershipUser]
GO
/****** Object:  ForeignKey [FK_PollVote_PollAnswer]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[PollVote]  WITH CHECK ADD  CONSTRAINT [FK_PollVote_PollAnswer] FOREIGN KEY([PollAnswer_Id])
REFERENCES [dbo].[PollAnswer] ([Id])
GO
ALTER TABLE [dbo].[PollVote] CHECK CONSTRAINT [FK_PollVote_PollAnswer]
GO
/****** Object:  ForeignKey [FK_Post_MembershipUser]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_MembershipUser]
GO
/****** Object:  ForeignKey [FK_Post_Topic]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Topic] FOREIGN KEY([Topic_Id])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Topic]
GO
/****** Object:  ForeignKey [FK_PrivateMessage_MembershipUser]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[PrivateMessage]  WITH NOCHECK ADD  CONSTRAINT [FK_PrivateMessage_MembershipUser] FOREIGN KEY([UserTo_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[PrivateMessage] NOCHECK CONSTRAINT [FK_PrivateMessage_MembershipUser]
GO
/****** Object:  ForeignKey [FK_PrivateMessage_MembershipUser1]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[PrivateMessage]  WITH NOCHECK ADD  CONSTRAINT [FK_PrivateMessage_MembershipUser1] FOREIGN KEY([UserFrom_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[PrivateMessage] NOCHECK CONSTRAINT [FK_PrivateMessage_MembershipUser1]
GO
/****** Object:  ForeignKey [FK_Settings_MembershipRole]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_MembershipRole] FOREIGN KEY([NewMemberStartingRole])
REFERENCES [dbo].[MembershipRole] ([Id])
GO
ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_Settings_MembershipRole]
GO
/****** Object:  ForeignKey [FK_Topic_Category]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Category]
GO
/****** Object:  ForeignKey [FK_Topic_MembershipUser]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Topic]  WITH NOCHECK ADD  CONSTRAINT [FK_Topic_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[Topic] NOCHECK CONSTRAINT [FK_Topic_MembershipUser]
GO
/****** Object:  ForeignKey [FK_Topic_Tag_Topic]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Topic_Tag]  WITH NOCHECK ADD  CONSTRAINT [FK_Topic_Tag_Topic] FOREIGN KEY([Topic_Id])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[Topic_Tag] NOCHECK CONSTRAINT [FK_Topic_Tag_Topic]
GO
/****** Object:  ForeignKey [FK_Topic_Tag_TopicTag]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Topic_Tag]  WITH NOCHECK ADD  CONSTRAINT [FK_Topic_Tag_TopicTag] FOREIGN KEY([TopicTag_Id])
REFERENCES [dbo].[TopicTag] ([Id])
GO
ALTER TABLE [dbo].[Topic_Tag] NOCHECK CONSTRAINT [FK_Topic_Tag_TopicTag]
GO
/****** Object:  ForeignKey [FK_TopicNotification_MembershipUser]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[TopicNotification]  WITH NOCHECK ADD  CONSTRAINT [FK_TopicNotification_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[TopicNotification] NOCHECK CONSTRAINT [FK_TopicNotification_MembershipUser]
GO
/****** Object:  ForeignKey [FK_TopicNotification_Topic]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[TopicNotification]  WITH CHECK ADD  CONSTRAINT [FK_TopicNotification_Topic] FOREIGN KEY([Topic_Id])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[TopicNotification] CHECK CONSTRAINT [FK_TopicNotification_Topic]
GO
/****** Object:  ForeignKey [FK_Vote_MembershipUser]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Vote]  WITH NOCHECK ADD  CONSTRAINT [FK_Vote_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[Vote] NOCHECK CONSTRAINT [FK_Vote_MembershipUser]
GO
/****** Object:  ForeignKey [FK_Vote_Post]    Script Date: 04/08/2013 20:17:47 ******/
ALTER TABLE [dbo].[Vote]  WITH NOCHECK ADD  CONSTRAINT [FK_Vote_Post] FOREIGN KEY([Post_Id])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Vote] NOCHECK CONSTRAINT [FK_Vote_Post]
GO

GO

/******************PROMO BLOCK *****************************/
IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'PromoCode'))
BEGIN
  ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK_Address_PromoCode]
  drop table [dbo].[PromoCode]
END
GO


IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Address'))
BEGIN
								  drop table [dbo].[Address]
END
GO

CREATE TABLE [dbo].[Address](
	[Id] [uniqueidentifier] NOT NULL,
	[House] [int] NOT NULL,
	[Porch] [int] NOT NULL,
	[Floor] [int] NOT NULL,
	[Flat] [int] NOT NULL,
	[Owner] [varchar](70) NULL,	
	[MembershipUser_Id] [uniqueidentifier] NULL,
	[PromoCode] [varchar](6) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  ForeignKey [FK_WaterResult_MembershipUser]    ******/
ALTER TABLE [dbo].[Address]  WITH CHECK ADD CONSTRAINT [FK_Address_MembershipUser] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[MembershipUser] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_MembershipUser]
GO

delete from [dbo].[Address]

GO

insert into [dbo].[Address] values (NEWID(),1,1,1,1,NULL,NULL,'2FDQLK')
insert into [dbo].[Address] values (NEWID(),1,1,1,2,NULL,NULL,'B7M437')
insert into [dbo].[Address] values (NEWID(),1,1,1,3,NULL,NULL,'8N5G82')
insert into [dbo].[Address] values (NEWID(),1,1,1,4,NULL,NULL,'VL3DLB')
insert into [dbo].[Address] values (NEWID(),1,1,1,5,NULL,NULL,'7YW3LB')
insert into [dbo].[Address] values (NEWID(),1,1,2,6,NULL,NULL,'K868L9')
insert into [dbo].[Address] values (NEWID(),1,1,2,7,NULL,NULL,'BC43JX')
insert into [dbo].[Address] values (NEWID(),1,1,2,8,NULL,NULL,'5V44YH')
insert into [dbo].[Address] values (NEWID(),1,1,2,9,NULL,NULL,'TZ37C6')
insert into [dbo].[Address] values (NEWID(),1,1,2,10,NULL,NULL,'HV95UC')
insert into [dbo].[Address] values (NEWID(),1,1,3,11,NULL,NULL,'7DACDA')
insert into [dbo].[Address] values (NEWID(),1,1,3,12,NULL,NULL,'J7Y26M')
insert into [dbo].[Address] values (NEWID(),1,1,3,13,NULL,NULL,'TJK2XL')
insert into [dbo].[Address] values (NEWID(),1,1,3,14,NULL,NULL,'XLN779')
insert into [dbo].[Address] values (NEWID(),1,1,3,15,NULL,NULL,'9MNXS8')
insert into [dbo].[Address] values (NEWID(),1,1,4,16,NULL,NULL,'SWHJW3')
insert into [dbo].[Address] values (NEWID(),1,1,4,17,NULL,NULL,'7GSN4U')
insert into [dbo].[Address] values (NEWID(),1,1,4,18,NULL,NULL,'N2MLGQ')
insert into [dbo].[Address] values (NEWID(),1,1,4,19,NULL,NULL,'HAT5VJ')
insert into [dbo].[Address] values (NEWID(),1,1,4,20,NULL,NULL,'V2CVJU')
insert into [dbo].[Address] values (NEWID(),1,1,5,21,NULL,NULL,'PGUHZ9')
insert into [dbo].[Address] values (NEWID(),1,1,5,22,NULL,NULL,'KBWTTK')
insert into [dbo].[Address] values (NEWID(),1,1,5,23,NULL,NULL,'5ZJHXU')
insert into [dbo].[Address] values (NEWID(),1,1,5,24,NULL,NULL,'PLTUM8')
insert into [dbo].[Address] values (NEWID(),1,1,5,25,NULL,NULL,'LQ85KW')
insert into [dbo].[Address] values (NEWID(),1,1,6,26,NULL,NULL,'BG6E8Q')
insert into [dbo].[Address] values (NEWID(),1,1,6,27,NULL,NULL,'BC3VW3')
insert into [dbo].[Address] values (NEWID(),1,1,6,28,NULL,NULL,'S9P2W3')
insert into [dbo].[Address] values (NEWID(),1,1,6,29,NULL,NULL,'L72U87')
insert into [dbo].[Address] values (NEWID(),1,1,6,30,NULL,NULL,'7A36EZ')
insert into [dbo].[Address] values (NEWID(),1,1,7,31,NULL,NULL,'J5A5X3')
insert into [dbo].[Address] values (NEWID(),1,1,7,32,NULL,NULL,'5NKZHV')
insert into [dbo].[Address] values (NEWID(),1,1,7,33,NULL,NULL,'9FFL9X')
insert into [dbo].[Address] values (NEWID(),1,1,7,34,NULL,NULL,'GY8JVY')
insert into [dbo].[Address] values (NEWID(),1,1,7,35,NULL,NULL,'7DZTMS')
insert into [dbo].[Address] values (NEWID(),1,1,8,36,NULL,NULL,'8W64NQ')
insert into [dbo].[Address] values (NEWID(),1,1,8,37,NULL,NULL,'UTN9LE')
insert into [dbo].[Address] values (NEWID(),1,1,8,38,NULL,NULL,'Q72WC9')
insert into [dbo].[Address] values (NEWID(),1,1,8,39,NULL,NULL,'WV4X3Q')
insert into [dbo].[Address] values (NEWID(),1,1,8,40,NULL,NULL,'RBKUEF')
insert into [dbo].[Address] values (NEWID(),1,1,9,41,NULL,NULL,'KKCPX5')
insert into [dbo].[Address] values (NEWID(),1,1,9,42,NULL,NULL,'CQFHET')
insert into [dbo].[Address] values (NEWID(),1,1,9,43,NULL,NULL,'P9UTQR')
insert into [dbo].[Address] values (NEWID(),1,1,9,44,NULL,NULL,'M3KRSQ')
insert into [dbo].[Address] values (NEWID(),1,1,9,45,NULL,NULL,'MBD2KW')
insert into [dbo].[Address] values (NEWID(),1,2,1,46,NULL,NULL,'QGH2SG')
insert into [dbo].[Address] values (NEWID(),1,2,1,47,NULL,NULL,'F3UXCJ')
insert into [dbo].[Address] values (NEWID(),1,2,1,48,NULL,NULL,'TX5THM')
insert into [dbo].[Address] values (NEWID(),1,2,1,49,NULL,NULL,'H6GWYH')
insert into [dbo].[Address] values (NEWID(),1,2,2,50,NULL,NULL,'H8YHWL')
insert into [dbo].[Address] values (NEWID(),1,2,2,51,NULL,NULL,'LEG4QS')
insert into [dbo].[Address] values (NEWID(),1,2,2,52,NULL,NULL,'4F8TD5')
insert into [dbo].[Address] values (NEWID(),1,2,2,53,NULL,NULL,'WPYNTV')
insert into [dbo].[Address] values (NEWID(),1,2,3,54,NULL,NULL,'DUC5R4')
insert into [dbo].[Address] values (NEWID(),1,2,3,55,NULL,NULL,'EY8JWV')
insert into [dbo].[Address] values (NEWID(),1,2,3,56,NULL,NULL,'YVE7UM')
insert into [dbo].[Address] values (NEWID(),1,2,3,57,NULL,NULL,'LQQ43R')
insert into [dbo].[Address] values (NEWID(),1,2,4,58,NULL,NULL,'XQKLMM')
insert into [dbo].[Address] values (NEWID(),1,2,4,59,NULL,NULL,'H27JR5')
insert into [dbo].[Address] values (NEWID(),1,2,4,60,NULL,NULL,'NSQPQT')
insert into [dbo].[Address] values (NEWID(),1,2,4,61,NULL,NULL,'YRVRGS')
insert into [dbo].[Address] values (NEWID(),1,2,5,62,NULL,NULL,'CT8E2L')
insert into [dbo].[Address] values (NEWID(),1,2,5,63,NULL,NULL,'7S9EKX')
insert into [dbo].[Address] values (NEWID(),1,2,5,64,NULL,NULL,'LBNPHL')
insert into [dbo].[Address] values (NEWID(),1,2,5,65,NULL,NULL,'SUXCD6')
insert into [dbo].[Address] values (NEWID(),1,2,6,66,NULL,NULL,'M8A8E2')
insert into [dbo].[Address] values (NEWID(),1,2,6,67,NULL,NULL,'VX9C5E')
insert into [dbo].[Address] values (NEWID(),1,2,6,68,NULL,NULL,'W9HMTB')
insert into [dbo].[Address] values (NEWID(),1,2,6,69,NULL,NULL,'CW5CA5')
insert into [dbo].[Address] values (NEWID(),1,2,7,70,NULL,NULL,'4RSA3G')
insert into [dbo].[Address] values (NEWID(),1,2,7,71,NULL,NULL,'9NY73H')
insert into [dbo].[Address] values (NEWID(),1,2,7,72,NULL,NULL,'P3DRAK')
insert into [dbo].[Address] values (NEWID(),1,2,7,73,NULL,NULL,'7B8UTK')
insert into [dbo].[Address] values (NEWID(),1,2,8,74,NULL,NULL,'8W7NWT')
insert into [dbo].[Address] values (NEWID(),1,2,8,75,NULL,NULL,'LZUKHM')
insert into [dbo].[Address] values (NEWID(),1,2,8,76,NULL,NULL,'A24GHX')
insert into [dbo].[Address] values (NEWID(),1,2,8,77,NULL,NULL,'WHQ7BB')
insert into [dbo].[Address] values (NEWID(),1,2,9,78,NULL,NULL,'MC4P3N')
insert into [dbo].[Address] values (NEWID(),1,2,9,79,NULL,NULL,'5KLRJ3')
insert into [dbo].[Address] values (NEWID(),1,2,9,80,NULL,NULL,'DJL9EG')
insert into [dbo].[Address] values (NEWID(),1,2,9,81,NULL,NULL,'4VPKGZ')
insert into [dbo].[Address] values (NEWID(),1,3,1,82,NULL,NULL,'P39HXP')
insert into [dbo].[Address] values (NEWID(),1,3,1,83,NULL,NULL,'2KZT9Y')
insert into [dbo].[Address] values (NEWID(),1,3,1,84,NULL,NULL,'KH39NA')
insert into [dbo].[Address] values (NEWID(),1,3,1,85,NULL,NULL,'YCZREH')
insert into [dbo].[Address] values (NEWID(),1,3,2,86,NULL,NULL,'KFHCTQ')
insert into [dbo].[Address] values (NEWID(),1,3,2,87,NULL,NULL,'BUJ3ML')
insert into [dbo].[Address] values (NEWID(),1,3,2,88,NULL,NULL,'AZEZ7Y')
insert into [dbo].[Address] values (NEWID(),1,3,2,89,NULL,NULL,'RLH2Q3')
insert into [dbo].[Address] values (NEWID(),1,3,2,90,NULL,NULL,'J5RWRH')
insert into [dbo].[Address] values (NEWID(),1,3,3,91,NULL,NULL,'QNEAPQ')
insert into [dbo].[Address] values (NEWID(),1,3,3,92,NULL,NULL,'UHYA2W')
insert into [dbo].[Address] values (NEWID(),1,3,3,93,NULL,NULL,'78PN6W')
insert into [dbo].[Address] values (NEWID(),1,3,3,94,NULL,NULL,'LTGRBG')
insert into [dbo].[Address] values (NEWID(),1,3,3,95,NULL,NULL,'YDUAMY')
insert into [dbo].[Address] values (NEWID(),1,3,4,96,NULL,NULL,'Z5T3ZC')
insert into [dbo].[Address] values (NEWID(),1,3,4,97,NULL,NULL,'5Z6PXT')
insert into [dbo].[Address] values (NEWID(),1,3,4,98,NULL,NULL,'5XKNJ2')
insert into [dbo].[Address] values (NEWID(),1,3,4,99,NULL,NULL,'QFVA9D')
insert into [dbo].[Address] values (NEWID(),1,3,4,100,NULL,NULL,'3R35LL')
insert into [dbo].[Address] values (NEWID(),1,3,5,101,NULL,NULL,'D59MS4')
insert into [dbo].[Address] values (NEWID(),1,3,5,102,NULL,NULL,'2Z5YXC')
insert into [dbo].[Address] values (NEWID(),1,3,5,103,NULL,NULL,'CDJ94W')
insert into [dbo].[Address] values (NEWID(),1,3,5,104,NULL,NULL,'WHTFCC')
insert into [dbo].[Address] values (NEWID(),1,3,5,105,NULL,NULL,'TH3GWK')
insert into [dbo].[Address] values (NEWID(),1,3,6,106,NULL,NULL,'7UUHER')
insert into [dbo].[Address] values (NEWID(),1,3,6,107,NULL,NULL,'AGX292')
insert into [dbo].[Address] values (NEWID(),1,3,6,108,NULL,NULL,'L6X9BF')
insert into [dbo].[Address] values (NEWID(),1,3,6,109,NULL,NULL,'W63W23')
insert into [dbo].[Address] values (NEWID(),1,3,6,110,NULL,NULL,'7783GV')
insert into [dbo].[Address] values (NEWID(),1,3,7,111,NULL,NULL,'PQEA5Q')
insert into [dbo].[Address] values (NEWID(),1,3,7,112,NULL,NULL,'LS6W9C')
insert into [dbo].[Address] values (NEWID(),1,3,7,113,NULL,NULL,'BECVKP')
insert into [dbo].[Address] values (NEWID(),1,3,7,114,NULL,NULL,'5A9NBZ')
insert into [dbo].[Address] values (NEWID(),1,3,7,115,NULL,NULL,'CWKYAZ')
insert into [dbo].[Address] values (NEWID(),1,3,8,116,NULL,NULL,'DK8R9V')
insert into [dbo].[Address] values (NEWID(),1,3,8,117,NULL,NULL,'4UXLRJ')
insert into [dbo].[Address] values (NEWID(),1,3,8,118,NULL,NULL,'QWM6TL')
insert into [dbo].[Address] values (NEWID(),1,3,8,119,NULL,NULL,'4L6M8N')
insert into [dbo].[Address] values (NEWID(),1,3,8,120,NULL,NULL,'CNHNGF')
insert into [dbo].[Address] values (NEWID(),1,3,9,121,NULL,NULL,'X3AXZM')
insert into [dbo].[Address] values (NEWID(),1,3,9,122,NULL,NULL,'MJ5GYZ')
insert into [dbo].[Address] values (NEWID(),1,3,9,123,NULL,NULL,'TEHNM5')
insert into [dbo].[Address] values (NEWID(),1,3,9,124,NULL,NULL,'YG4882')
insert into [dbo].[Address] values (NEWID(),1,3,9,125,NULL,NULL,'EMV3NU')
insert into [dbo].[Address] values (NEWID(),1,4,1,126,NULL,NULL,'GGTUAS')
insert into [dbo].[Address] values (NEWID(),1,4,1,127,NULL,NULL,'LRN6S4')
insert into [dbo].[Address] values (NEWID(),1,4,1,128,NULL,NULL,'68Q7YP')
insert into [dbo].[Address] values (NEWID(),1,4,1,129,NULL,NULL,'K95XPA')
insert into [dbo].[Address] values (NEWID(),1,4,2,130,NULL,NULL,'WDYL8Y')
insert into [dbo].[Address] values (NEWID(),1,4,2,131,NULL,NULL,'VYWMYD')
insert into [dbo].[Address] values (NEWID(),1,4,2,132,NULL,NULL,'24D7UL')
insert into [dbo].[Address] values (NEWID(),1,4,2,133,NULL,NULL,'AYBYP3')
insert into [dbo].[Address] values (NEWID(),1,4,3,134,NULL,NULL,'SQYSNC')
insert into [dbo].[Address] values (NEWID(),1,4,3,135,NULL,NULL,'KT69VM')
insert into [dbo].[Address] values (NEWID(),1,4,3,136,NULL,NULL,'JY3JZU')
insert into [dbo].[Address] values (NEWID(),1,4,3,137,NULL,NULL,'4WP6RG')
insert into [dbo].[Address] values (NEWID(),1,4,4,138,NULL,NULL,'GULTBC')
insert into [dbo].[Address] values (NEWID(),1,4,4,139,NULL,NULL,'HKDT62')
insert into [dbo].[Address] values (NEWID(),1,4,4,140,NULL,NULL,'7CD54E')
insert into [dbo].[Address] values (NEWID(),1,4,4,141,NULL,NULL,'ACB8Q6')
insert into [dbo].[Address] values (NEWID(),1,4,5,142,NULL,NULL,'ZNVKEX')
insert into [dbo].[Address] values (NEWID(),1,4,5,143,NULL,NULL,'JMNVJN')
insert into [dbo].[Address] values (NEWID(),1,4,5,144,NULL,NULL,'6CV8TN')
insert into [dbo].[Address] values (NEWID(),1,4,5,145,NULL,NULL,'MLA8SU')
insert into [dbo].[Address] values (NEWID(),1,4,6,146,NULL,NULL,'7Y94ZT')
insert into [dbo].[Address] values (NEWID(),1,4,6,147,NULL,NULL,'CP7GEY')
insert into [dbo].[Address] values (NEWID(),1,4,6,148,NULL,NULL,'8WXLWP')
insert into [dbo].[Address] values (NEWID(),1,4,6,149,NULL,NULL,'FSSEDM')
insert into [dbo].[Address] values (NEWID(),1,4,7,150,NULL,NULL,'FXQDZN')
insert into [dbo].[Address] values (NEWID(),1,4,7,151,NULL,NULL,'5NX8NK')
insert into [dbo].[Address] values (NEWID(),1,4,7,152,NULL,NULL,'DJD7FZ')
insert into [dbo].[Address] values (NEWID(),1,4,7,153,NULL,NULL,'H7MF83')
insert into [dbo].[Address] values (NEWID(),1,4,8,154,NULL,NULL,'DYQASL')
insert into [dbo].[Address] values (NEWID(),1,4,8,155,NULL,NULL,'JUMDCH')
insert into [dbo].[Address] values (NEWID(),1,4,8,156,NULL,NULL,'LQWSLB')
insert into [dbo].[Address] values (NEWID(),1,4,8,157,NULL,NULL,'7N2VQX')
insert into [dbo].[Address] values (NEWID(),1,4,9,158,NULL,NULL,'RNQFFM')
insert into [dbo].[Address] values (NEWID(),1,4,9,159,NULL,NULL,'A6KP95')
insert into [dbo].[Address] values (NEWID(),1,4,9,160,NULL,NULL,'7GSMBD')
insert into [dbo].[Address] values (NEWID(),1,4,9,161,NULL,NULL,'9ZWZ3C')
insert into [dbo].[Address] values (NEWID(),1,4,1,162,NULL,NULL,'Z6J52Y')
insert into [dbo].[Address] values (NEWID(),1,4,1,163,NULL,NULL,'4SM8M3')
insert into [dbo].[Address] values (NEWID(),1,4,1,164,NULL,NULL,'GLTGCT')
insert into [dbo].[Address] values (NEWID(),1,4,1,165,NULL,NULL,'9FAXYW')
insert into [dbo].[Address] values (NEWID(),1,4,2,166,NULL,NULL,'8DP3QQ')
insert into [dbo].[Address] values (NEWID(),1,4,2,167,NULL,NULL,'WLPCRX')
insert into [dbo].[Address] values (NEWID(),1,4,2,168,NULL,NULL,'4X6L6H')
insert into [dbo].[Address] values (NEWID(),1,4,2,169,NULL,NULL,'YXBMLS')
insert into [dbo].[Address] values (NEWID(),1,4,3,170,NULL,NULL,'9YG7VK')
insert into [dbo].[Address] values (NEWID(),1,4,3,171,NULL,NULL,'2MZXEC')
insert into [dbo].[Address] values (NEWID(),1,4,3,172,NULL,NULL,'DA9JYY')
insert into [dbo].[Address] values (NEWID(),1,4,3,173,NULL,NULL,'R2DUZQ')
insert into [dbo].[Address] values (NEWID(),1,4,4,174,NULL,NULL,'TAYVBQ')
insert into [dbo].[Address] values (NEWID(),1,4,4,175,NULL,NULL,'JAFAL7')
insert into [dbo].[Address] values (NEWID(),1,4,4,176,NULL,NULL,'WHAV6F')
insert into [dbo].[Address] values (NEWID(),1,4,4,177,NULL,NULL,'BPU8CT')
insert into [dbo].[Address] values (NEWID(),1,4,5,178,NULL,NULL,'QFFEHV')
insert into [dbo].[Address] values (NEWID(),1,4,5,179,NULL,NULL,'PBNDL9')
insert into [dbo].[Address] values (NEWID(),1,4,5,180,NULL,NULL,'EJN2R7')
insert into [dbo].[Address] values (NEWID(),1,4,5,181,NULL,NULL,'K74M9H')
insert into [dbo].[Address] values (NEWID(),1,4,6,182,NULL,NULL,'XLMAAG')
insert into [dbo].[Address] values (NEWID(),1,4,6,183,NULL,NULL,'E9ZM8J')
insert into [dbo].[Address] values (NEWID(),1,4,6,184,NULL,NULL,'MKAQ73')
insert into [dbo].[Address] values (NEWID(),1,4,6,185,NULL,NULL,'C7FXAS')
insert into [dbo].[Address] values (NEWID(),1,4,7,186,NULL,NULL,'PGQ2JU')
insert into [dbo].[Address] values (NEWID(),1,4,7,187,NULL,NULL,'FEWA99')
insert into [dbo].[Address] values (NEWID(),1,4,7,188,NULL,NULL,'6GFMKC')
insert into [dbo].[Address] values (NEWID(),1,4,7,189,NULL,NULL,'G54NY7')
insert into [dbo].[Address] values (NEWID(),1,4,8,190,NULL,NULL,'4HT6CX')
insert into [dbo].[Address] values (NEWID(),1,4,8,191,NULL,NULL,'XGL6B8')
insert into [dbo].[Address] values (NEWID(),1,4,8,192,NULL,NULL,'Z88WEH')
insert into [dbo].[Address] values (NEWID(),1,4,8,193,NULL,NULL,'M2648N')
insert into [dbo].[Address] values (NEWID(),1,4,9,194,NULL,NULL,'3SBKR3')
insert into [dbo].[Address] values (NEWID(),1,4,9,195,NULL,NULL,'V5N8H6')
insert into [dbo].[Address] values (NEWID(),1,4,9,196,NULL,NULL,'MW5ST2')
insert into [dbo].[Address] values (NEWID(),1,4,9,197,NULL,NULL,'WFXJTG')
insert into [dbo].[Address] values (NEWID(),2,1,1,1,NULL,NULL,'ERP68Y')
insert into [dbo].[Address] values (NEWID(),2,1,1,2,NULL,NULL,'DYWKSZ')
insert into [dbo].[Address] values (NEWID(),2,1,1,3,NULL,NULL,'ZSSBV4')
insert into [dbo].[Address] values (NEWID(),2,1,1,4,NULL,NULL,'T6XCQF')
insert into [dbo].[Address] values (NEWID(),2,1,2,5,NULL,NULL,'KJJDXX')
insert into [dbo].[Address] values (NEWID(),2,1,2,6,NULL,NULL,'EQV9CX')
insert into [dbo].[Address] values (NEWID(),2,1,2,7,NULL,NULL,'GVDPP2')
insert into [dbo].[Address] values (NEWID(),2,1,2,8,NULL,NULL,'X7K6UT')
insert into [dbo].[Address] values (NEWID(),2,1,3,9,NULL,NULL,'TFAHXR')
insert into [dbo].[Address] values (NEWID(),2,1,3,10,NULL,NULL,'TQTC5W')
insert into [dbo].[Address] values (NEWID(),2,1,3,11,NULL,NULL,'PQ95U7')
insert into [dbo].[Address] values (NEWID(),2,1,3,12,NULL,NULL,'38YJBT')
insert into [dbo].[Address] values (NEWID(),2,1,4,13,NULL,NULL,'XRKVYE')
insert into [dbo].[Address] values (NEWID(),2,1,4,14,NULL,NULL,'FXFSUC')
insert into [dbo].[Address] values (NEWID(),2,1,4,15,NULL,NULL,'FSD27V')
insert into [dbo].[Address] values (NEWID(),2,1,4,16,NULL,NULL,'23G3P2')
insert into [dbo].[Address] values (NEWID(),2,1,5,17,NULL,NULL,'3NGDGH')
insert into [dbo].[Address] values (NEWID(),2,1,5,18,NULL,NULL,'2FQ4V4')
insert into [dbo].[Address] values (NEWID(),2,1,5,19,NULL,NULL,'XN9MQN')
insert into [dbo].[Address] values (NEWID(),2,1,5,20,NULL,NULL,'SCSKLN')
insert into [dbo].[Address] values (NEWID(),2,1,6,21,NULL,NULL,'NLQ92S')
insert into [dbo].[Address] values (NEWID(),2,1,6,22,NULL,NULL,'DSHTKE')
insert into [dbo].[Address] values (NEWID(),2,1,6,23,NULL,NULL,'6DWHF2')
insert into [dbo].[Address] values (NEWID(),2,1,6,24,NULL,NULL,'9VNA2C')
insert into [dbo].[Address] values (NEWID(),2,1,7,25,NULL,NULL,'977QFY')
insert into [dbo].[Address] values (NEWID(),2,1,7,26,NULL,NULL,'DZNY7E')
insert into [dbo].[Address] values (NEWID(),2,1,7,27,NULL,NULL,'C64VBH')
insert into [dbo].[Address] values (NEWID(),2,1,7,28,NULL,NULL,'UUJUPM')
insert into [dbo].[Address] values (NEWID(),2,1,8,29,NULL,NULL,'Q5CRQM')
insert into [dbo].[Address] values (NEWID(),2,1,8,30,NULL,NULL,'KDQNS8')
insert into [dbo].[Address] values (NEWID(),2,1,8,31,NULL,NULL,'NSP6GE')
insert into [dbo].[Address] values (NEWID(),2,1,8,32,NULL,NULL,'L88QDM')
insert into [dbo].[Address] values (NEWID(),2,1,9,33,NULL,NULL,'SPLA3S')
insert into [dbo].[Address] values (NEWID(),2,1,9,34,NULL,NULL,'SZAYWH')
insert into [dbo].[Address] values (NEWID(),2,1,9,35,NULL,NULL,'G9WBJH')
insert into [dbo].[Address] values (NEWID(),2,1,9,36,NULL,NULL,'Y2TH7R')
insert into [dbo].[Address] values (NEWID(),2,2,1,37,NULL,NULL,'CJZYHP')
insert into [dbo].[Address] values (NEWID(),2,2,1,38,NULL,NULL,'BTBN2A')
insert into [dbo].[Address] values (NEWID(),2,2,1,39,NULL,NULL,'8UWU68')
insert into [dbo].[Address] values (NEWID(),2,2,1,40,NULL,NULL,'6N339M')
insert into [dbo].[Address] values (NEWID(),2,2,2,41,NULL,NULL,'K9AAUK')
insert into [dbo].[Address] values (NEWID(),2,2,2,42,NULL,NULL,'DMYRJV')
insert into [dbo].[Address] values (NEWID(),2,2,2,43,NULL,NULL,'6JQRAP')
insert into [dbo].[Address] values (NEWID(),2,2,2,44,NULL,NULL,'NSDP9M')
insert into [dbo].[Address] values (NEWID(),2,2,2,45,NULL,NULL,'TZKZ8N')
insert into [dbo].[Address] values (NEWID(),2,2,3,46,NULL,NULL,'VV7A8R')
insert into [dbo].[Address] values (NEWID(),2,2,3,47,NULL,NULL,'YRED8U')
insert into [dbo].[Address] values (NEWID(),2,2,3,48,NULL,NULL,'7W7ED8')
insert into [dbo].[Address] values (NEWID(),2,2,3,49,NULL,NULL,'EEUH9L')
insert into [dbo].[Address] values (NEWID(),2,2,3,50,NULL,NULL,'5Z7GKG')
insert into [dbo].[Address] values (NEWID(),2,2,4,51,NULL,NULL,'MA9L59')
insert into [dbo].[Address] values (NEWID(),2,2,4,52,NULL,NULL,'A65NUF')
insert into [dbo].[Address] values (NEWID(),2,2,4,53,NULL,NULL,'ZV42VZ')
insert into [dbo].[Address] values (NEWID(),2,2,4,54,NULL,NULL,'R6ZTPZ')
insert into [dbo].[Address] values (NEWID(),2,2,4,55,NULL,NULL,'L7VUHL')
insert into [dbo].[Address] values (NEWID(),2,2,5,56,NULL,NULL,'X4HKNB')
insert into [dbo].[Address] values (NEWID(),2,2,5,57,NULL,NULL,'QK2BRS')
insert into [dbo].[Address] values (NEWID(),2,2,5,58,NULL,NULL,'T24H9S')
insert into [dbo].[Address] values (NEWID(),2,2,5,59,NULL,NULL,'LV2TBZ')
insert into [dbo].[Address] values (NEWID(),2,2,5,60,NULL,NULL,'5NVX6J')
insert into [dbo].[Address] values (NEWID(),2,2,6,61,NULL,NULL,'BBPE9H')
insert into [dbo].[Address] values (NEWID(),2,2,6,62,NULL,NULL,'DYXWYZ')
insert into [dbo].[Address] values (NEWID(),2,2,6,63,NULL,NULL,'D9CHA4')
insert into [dbo].[Address] values (NEWID(),2,2,6,64,NULL,NULL,'XEKPU4')
insert into [dbo].[Address] values (NEWID(),2,2,6,65,NULL,NULL,'JQBR6T')
insert into [dbo].[Address] values (NEWID(),2,2,7,66,NULL,NULL,'26ZFT7')
insert into [dbo].[Address] values (NEWID(),2,2,7,67,NULL,NULL,'ZGK3QG')
insert into [dbo].[Address] values (NEWID(),2,2,7,68,NULL,NULL,'JT487Y')
insert into [dbo].[Address] values (NEWID(),2,2,7,69,NULL,NULL,'T2LK7L')
insert into [dbo].[Address] values (NEWID(),2,2,7,70,NULL,NULL,'6EXZKV')
insert into [dbo].[Address] values (NEWID(),2,2,8,71,NULL,NULL,'GRSG9E')
insert into [dbo].[Address] values (NEWID(),2,2,8,72,NULL,NULL,'25FKS4')
insert into [dbo].[Address] values (NEWID(),2,2,8,73,NULL,NULL,'QMGXT4')
insert into [dbo].[Address] values (NEWID(),2,2,8,74,NULL,NULL,'TPBP4H')
insert into [dbo].[Address] values (NEWID(),2,2,8,75,NULL,NULL,'QCYDJD')
insert into [dbo].[Address] values (NEWID(),2,2,9,76,NULL,NULL,'9MM9XP')
insert into [dbo].[Address] values (NEWID(),2,2,9,77,NULL,NULL,'56JZ2E')
insert into [dbo].[Address] values (NEWID(),2,2,9,73,NULL,NULL,'BADGGS')
insert into [dbo].[Address] values (NEWID(),2,2,9,79,NULL,NULL,'7PV3TA')
insert into [dbo].[Address] values (NEWID(),2,2,9,80,NULL,NULL,'TWTR8A')
insert into [dbo].[Address] values (NEWID(),2,3,1,81,NULL,NULL,'832RA5')
insert into [dbo].[Address] values (NEWID(),2,3,1,82,NULL,NULL,'QFJ4F5')
insert into [dbo].[Address] values (NEWID(),2,3,1,83,NULL,NULL,'48D2ZB')
insert into [dbo].[Address] values (NEWID(),2,3,1,84,NULL,NULL,'ZT9S6R')
insert into [dbo].[Address] values (NEWID(),2,3,2,85,NULL,NULL,'97DN9N')
insert into [dbo].[Address] values (NEWID(),2,3,2,86,NULL,NULL,'VKWZB4')
insert into [dbo].[Address] values (NEWID(),2,3,2,87,NULL,NULL,'G5AA65')
insert into [dbo].[Address] values (NEWID(),2,3,2,88,NULL,NULL,'BQSCXF')
insert into [dbo].[Address] values (NEWID(),2,3,3,89,NULL,NULL,'TJ9FYF')
insert into [dbo].[Address] values (NEWID(),2,3,3,90,NULL,NULL,'5T3JEK')
insert into [dbo].[Address] values (NEWID(),2,3,3,91,NULL,NULL,'ZB8DNF')
insert into [dbo].[Address] values (NEWID(),2,3,3,92,NULL,NULL,'9PTULE')
insert into [dbo].[Address] values (NEWID(),2,3,4,93,NULL,NULL,'MKFXRT')
insert into [dbo].[Address] values (NEWID(),2,3,4,94,NULL,NULL,'XB2GEW')
insert into [dbo].[Address] values (NEWID(),2,3,4,95,NULL,NULL,'Y7V3LE')
insert into [dbo].[Address] values (NEWID(),2,3,4,96,NULL,NULL,'T4U94A')
insert into [dbo].[Address] values (NEWID(),2,3,5,97,NULL,NULL,'VTU3UN')
insert into [dbo].[Address] values (NEWID(),2,3,5,98,NULL,NULL,'Y6PYVQ')
insert into [dbo].[Address] values (NEWID(),2,3,5,99,NULL,NULL,'UNMXLK')
insert into [dbo].[Address] values (NEWID(),2,3,5,100,NULL,NULL,'J567BG')
insert into [dbo].[Address] values (NEWID(),2,3,6,101,NULL,NULL,'2NK9Y6')
insert into [dbo].[Address] values (NEWID(),2,3,6,102,NULL,NULL,'Z9FSEX')
insert into [dbo].[Address] values (NEWID(),2,3,6,103,NULL,NULL,'XRJYFD')
insert into [dbo].[Address] values (NEWID(),2,3,6,104,NULL,NULL,'4YXGEF')
insert into [dbo].[Address] values (NEWID(),2,3,7,105,NULL,NULL,'WHUV6R')
insert into [dbo].[Address] values (NEWID(),2,3,7,106,NULL,NULL,'L9WLK4')
insert into [dbo].[Address] values (NEWID(),2,3,7,107,NULL,NULL,'LTC53X')
insert into [dbo].[Address] values (NEWID(),2,3,7,108,NULL,NULL,'D5PE5K')
insert into [dbo].[Address] values (NEWID(),2,3,8,109,NULL,NULL,'DU28US')
insert into [dbo].[Address] values (NEWID(),2,3,8,110,NULL,NULL,'WGSDSQ')
insert into [dbo].[Address] values (NEWID(),2,3,8,111,NULL,NULL,'3WJDMA')
insert into [dbo].[Address] values (NEWID(),2,3,8,112,NULL,NULL,'AXYDCJ')
insert into [dbo].[Address] values (NEWID(),2,3,9,113,NULL,NULL,'6ST4FQ')
insert into [dbo].[Address] values (NEWID(),2,3,9,114,NULL,NULL,'V9LPBA')
insert into [dbo].[Address] values (NEWID(),2,3,9,115,NULL,NULL,'HJ9EQ9')
insert into [dbo].[Address] values (NEWID(),2,3,9,116,NULL,NULL,'KHLPXA')
insert into [dbo].[Address] values (NEWID(),2,4,1,117,NULL,NULL,'G9BDKX')
insert into [dbo].[Address] values (NEWID(),2,4,1,118,NULL,NULL,'RN7A9Y')
insert into [dbo].[Address] values (NEWID(),2,4,1,119,NULL,NULL,'KBHGAB')
insert into [dbo].[Address] values (NEWID(),2,4,1,120,NULL,NULL,'FKJA94')
insert into [dbo].[Address] values (NEWID(),2,4,2,121,NULL,NULL,'C8HL8Y')
insert into [dbo].[Address] values (NEWID(),2,4,2,122,NULL,NULL,'EMC2NP')
insert into [dbo].[Address] values (NEWID(),2,4,2,123,NULL,NULL,'NG86A2')
insert into [dbo].[Address] values (NEWID(),2,4,2,124,NULL,NULL,'QNNYN2')
insert into [dbo].[Address] values (NEWID(),2,4,3,125,NULL,NULL,'W6QQVW')
insert into [dbo].[Address] values (NEWID(),2,4,3,126,NULL,NULL,'QM2JJ9')
insert into [dbo].[Address] values (NEWID(),2,4,3,127,NULL,NULL,'4B7XPG')
insert into [dbo].[Address] values (NEWID(),2,4,3,128,NULL,NULL,'XA5B3C')
insert into [dbo].[Address] values (NEWID(),2,4,4,129,NULL,NULL,'HCMLSU')
insert into [dbo].[Address] values (NEWID(),2,4,4,130,NULL,NULL,'8JUDLZ')
insert into [dbo].[Address] values (NEWID(),2,4,4,131,NULL,NULL,'4VA83Q')
insert into [dbo].[Address] values (NEWID(),2,4,4,132,NULL,NULL,'QDLTFY')
insert into [dbo].[Address] values (NEWID(),2,4,5,133,NULL,NULL,'YP24KJ')
insert into [dbo].[Address] values (NEWID(),2,4,5,134,NULL,NULL,'P2LX7X')
insert into [dbo].[Address] values (NEWID(),2,4,5,135,NULL,NULL,'8F2NPJ')
insert into [dbo].[Address] values (NEWID(),2,4,5,136,NULL,NULL,'EHH454')
insert into [dbo].[Address] values (NEWID(),2,4,6,137,NULL,NULL,'P8VWA2')
insert into [dbo].[Address] values (NEWID(),2,4,6,138,NULL,NULL,'PGHK8L')
insert into [dbo].[Address] values (NEWID(),2,4,6,139,NULL,NULL,'DUR6BG')
insert into [dbo].[Address] values (NEWID(),2,4,6,140,NULL,NULL,'Y4YQ82')
insert into [dbo].[Address] values (NEWID(),2,4,7,141,NULL,NULL,'2DTLZQ')
insert into [dbo].[Address] values (NEWID(),2,4,7,142,NULL,NULL,'A48D5C')
insert into [dbo].[Address] values (NEWID(),2,4,7,143,NULL,NULL,'ELC49F')
insert into [dbo].[Address] values (NEWID(),2,4,7,144,NULL,NULL,'N2GJR9')
insert into [dbo].[Address] values (NEWID(),2,4,8,145,NULL,NULL,'8EXRPY')
insert into [dbo].[Address] values (NEWID(),2,4,8,146,NULL,NULL,'F3P3PK')
insert into [dbo].[Address] values (NEWID(),2,4,8,147,NULL,NULL,'USR68N')
insert into [dbo].[Address] values (NEWID(),2,4,8,148,NULL,NULL,'CEL94T')
insert into [dbo].[Address] values (NEWID(),2,4,9,149,NULL,NULL,'RPLRE8')
insert into [dbo].[Address] values (NEWID(),2,4,9,150,NULL,NULL,'UNXGKB')
insert into [dbo].[Address] values (NEWID(),2,4,9,151,NULL,NULL,'UTWVS3')
insert into [dbo].[Address] values (NEWID(),2,4,9,152,NULL,NULL,'EAJYJZ')
insert into [dbo].[Address] values (NEWID(),2,5,1,153,NULL,NULL,'NJVSGR')
insert into [dbo].[Address] values (NEWID(),2,5,1,154,NULL,NULL,'T5HH7X')
insert into [dbo].[Address] values (NEWID(),2,5,1,155,NULL,NULL,'SYPPMY')
insert into [dbo].[Address] values (NEWID(),2,5,1,156,NULL,NULL,'RBQYER')
insert into [dbo].[Address] values (NEWID(),2,5,2,157,NULL,NULL,'E5D6AD')
insert into [dbo].[Address] values (NEWID(),2,5,2,158,NULL,NULL,'7PC6X4')
insert into [dbo].[Address] values (NEWID(),2,5,2,159,NULL,NULL,'4KDS56')
insert into [dbo].[Address] values (NEWID(),2,5,2,160,NULL,NULL,'XLWZMK')
insert into [dbo].[Address] values (NEWID(),2,5,2,161,NULL,NULL,'7C37CK')
insert into [dbo].[Address] values (NEWID(),2,5,3,162,NULL,NULL,'9WKMX2')
insert into [dbo].[Address] values (NEWID(),2,5,3,163,NULL,NULL,'J8VQ7H')
insert into [dbo].[Address] values (NEWID(),2,5,3,164,NULL,NULL,'4HB2EF')
insert into [dbo].[Address] values (NEWID(),2,5,3,165,NULL,NULL,'8GTVZD')
insert into [dbo].[Address] values (NEWID(),2,5,3,166,NULL,NULL,'48RKUT')
insert into [dbo].[Address] values (NEWID(),2,5,4,167,NULL,NULL,'S43AWK')
insert into [dbo].[Address] values (NEWID(),2,5,4,168,NULL,NULL,'GUWDRS')
insert into [dbo].[Address] values (NEWID(),2,5,4,169,NULL,NULL,'WA235P')
insert into [dbo].[Address] values (NEWID(),2,5,4,170,NULL,NULL,'2TUFZW')
insert into [dbo].[Address] values (NEWID(),2,5,4,171,NULL,NULL,'BXHDJ5')
insert into [dbo].[Address] values (NEWID(),2,5,5,172,NULL,NULL,'B457BX')
insert into [dbo].[Address] values (NEWID(),2,5,5,173,NULL,NULL,'H3DZ5Q')
insert into [dbo].[Address] values (NEWID(),2,5,5,174,NULL,NULL,'SZ5UZX')
insert into [dbo].[Address] values (NEWID(),2,5,5,175,NULL,NULL,'ZM7XJA')
insert into [dbo].[Address] values (NEWID(),2,5,5,176,NULL,NULL,'JQH6H2')
insert into [dbo].[Address] values (NEWID(),2,5,6,177,NULL,NULL,'JQRZ3M')
insert into [dbo].[Address] values (NEWID(),2,5,6,178,NULL,NULL,'69EWFK')
insert into [dbo].[Address] values (NEWID(),2,5,6,179,NULL,NULL,'SL2ALX')
insert into [dbo].[Address] values (NEWID(),2,5,6,180,NULL,NULL,'QSRS4X')
insert into [dbo].[Address] values (NEWID(),2,5,6,181,NULL,NULL,'FWGEW5')
insert into [dbo].[Address] values (NEWID(),2,5,7,182,NULL,NULL,'R4UHZQ')
insert into [dbo].[Address] values (NEWID(),2,5,7,183,NULL,NULL,'NDAEDK')
insert into [dbo].[Address] values (NEWID(),2,5,7,184,NULL,NULL,'CPTCD8')
insert into [dbo].[Address] values (NEWID(),2,5,7,185,NULL,NULL,'AHL64Q')
insert into [dbo].[Address] values (NEWID(),2,5,7,186,NULL,NULL,'65MZ2R')
insert into [dbo].[Address] values (NEWID(),2,5,8,177,NULL,NULL,'AF56TT')
insert into [dbo].[Address] values (NEWID(),2,5,8,188,NULL,NULL,'3ENNH5')
insert into [dbo].[Address] values (NEWID(),2,5,8,189,NULL,NULL,'KQGPAP')
insert into [dbo].[Address] values (NEWID(),2,5,8,190,NULL,NULL,'G4FH2W')
insert into [dbo].[Address] values (NEWID(),2,5,8,191,NULL,NULL,'758BTH')
insert into [dbo].[Address] values (NEWID(),2,5,9,192,NULL,NULL,'JZN66Z')
insert into [dbo].[Address] values (NEWID(),2,5,9,193,NULL,NULL,'XDPYHS')
insert into [dbo].[Address] values (NEWID(),2,5,9,194,NULL,NULL,'X5UAF6')
insert into [dbo].[Address] values (NEWID(),2,5,9,195,NULL,NULL,'7NTQB9')
insert into [dbo].[Address] values (NEWID(),2,5,9,196,NULL,NULL,'T4UWP7')
insert into [dbo].[Address] values (NEWID(),2,6,1,197,NULL,NULL,'TPUKJ6')
insert into [dbo].[Address] values (NEWID(),2,6,1,198,NULL,NULL,'5DE9WV')
insert into [dbo].[Address] values (NEWID(),2,6,1,199,NULL,NULL,'SYDZFU')
insert into [dbo].[Address] values (NEWID(),2,6,1,200,NULL,NULL,'RG6532')
insert into [dbo].[Address] values (NEWID(),2,6,1,201,NULL,NULL,'2WU2J3')
insert into [dbo].[Address] values (NEWID(),2,6,2,202,NULL,NULL,'XPPF5A')
insert into [dbo].[Address] values (NEWID(),2,6,2,203,NULL,NULL,'YWHNZW')
insert into [dbo].[Address] values (NEWID(),2,6,2,204,NULL,NULL,'MSTDUP')
insert into [dbo].[Address] values (NEWID(),2,6,2,205,NULL,NULL,'27Y4MV')
insert into [dbo].[Address] values (NEWID(),2,6,2,206,NULL,NULL,'VU9XWN')
insert into [dbo].[Address] values (NEWID(),2,6,3,207,NULL,NULL,'PBLVVA')
insert into [dbo].[Address] values (NEWID(),2,6,3,208,NULL,NULL,'3CESWL')
insert into [dbo].[Address] values (NEWID(),2,6,3,209,NULL,NULL,'XGDS36')
insert into [dbo].[Address] values (NEWID(),2,6,3,210,NULL,NULL,'U2PS9A')
insert into [dbo].[Address] values (NEWID(),2,6,3,211,NULL,NULL,'Z7K8FD')
insert into [dbo].[Address] values (NEWID(),2,6,4,212,NULL,NULL,'A9GJYS')
insert into [dbo].[Address] values (NEWID(),2,6,4,213,NULL,NULL,'KVQCPH')
insert into [dbo].[Address] values (NEWID(),2,6,4,214,NULL,NULL,'JXYVLA')
insert into [dbo].[Address] values (NEWID(),2,6,4,215,NULL,NULL,'DUK7K5')
insert into [dbo].[Address] values (NEWID(),2,6,4,216,NULL,NULL,'AEMNFS')
insert into [dbo].[Address] values (NEWID(),2,6,5,217,NULL,NULL,'EJ4EE8')
insert into [dbo].[Address] values (NEWID(),2,6,5,218,NULL,NULL,'B7VFUW')
insert into [dbo].[Address] values (NEWID(),2,6,5,219,NULL,NULL,'CUJCE3')
insert into [dbo].[Address] values (NEWID(),2,6,5,220,NULL,NULL,'PWXAW6')
insert into [dbo].[Address] values (NEWID(),2,6,5,221,NULL,NULL,'FKQCV9')
insert into [dbo].[Address] values (NEWID(),2,6,6,222,NULL,NULL,'HCCJ6F')
insert into [dbo].[Address] values (NEWID(),2,6,6,223,NULL,NULL,'Z2QCZ8')
insert into [dbo].[Address] values (NEWID(),2,6,6,224,NULL,NULL,'WL77EN')
insert into [dbo].[Address] values (NEWID(),2,6,6,225,NULL,NULL,'9AAYBG')
insert into [dbo].[Address] values (NEWID(),2,6,6,226,NULL,NULL,'VK5BSJ')
insert into [dbo].[Address] values (NEWID(),2,6,7,227,NULL,NULL,'H34FTV')
insert into [dbo].[Address] values (NEWID(),2,6,7,228,NULL,NULL,'AT7LUT')
insert into [dbo].[Address] values (NEWID(),2,6,7,229,NULL,NULL,'T29Z4D')
insert into [dbo].[Address] values (NEWID(),2,6,7,230,NULL,NULL,'3EQZNE')
insert into [dbo].[Address] values (NEWID(),2,6,7,231,NULL,NULL,'7JXNGU')
insert into [dbo].[Address] values (NEWID(),2,6,8,232,NULL,NULL,'8T3GTN')
insert into [dbo].[Address] values (NEWID(),2,6,8,233,NULL,NULL,'9L9ANB')
insert into [dbo].[Address] values (NEWID(),2,6,8,234,NULL,NULL,'5JKQKD')
insert into [dbo].[Address] values (NEWID(),2,6,8,235,NULL,NULL,'DBY5YR')
insert into [dbo].[Address] values (NEWID(),2,6,8,236,NULL,NULL,'3BENQS')
insert into [dbo].[Address] values (NEWID(),2,6,9,237,NULL,NULL,'8SAR32')
insert into [dbo].[Address] values (NEWID(),2,6,9,238,NULL,NULL,'G7GNKA')
insert into [dbo].[Address] values (NEWID(),2,6,9,239,NULL,NULL,'BTJUMR')
insert into [dbo].[Address] values (NEWID(),2,6,9,240,NULL,NULL,'JPEF22')
insert into [dbo].[Address] values (NEWID(),2,6,9,241,NULL,NULL,'KTJ6UK')

GO