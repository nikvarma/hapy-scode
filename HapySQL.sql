USE [master]
GO
/****** Object:  Database [Hapy2]    Script Date: 10/9/2018 4:07:36 PM ******/
CREATE DATABASE [Hapy2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hapy2', FILENAME = N'E:\SQLServer\MSSQL14.SQLEXPRESS\MSSQL\DATA\Hapy2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hapy2_log', FILENAME = N'E:\SQLServer\MSSQL14.SQLEXPRESS\MSSQL\DATA\Hapy2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hapy2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hapy2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hapy2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hapy2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hapy2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hapy2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hapy2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hapy2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Hapy2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hapy2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hapy2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hapy2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hapy2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hapy2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hapy2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hapy2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hapy2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hapy2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hapy2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hapy2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hapy2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hapy2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hapy2] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Hapy2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hapy2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hapy2] SET  MULTI_USER 
GO
ALTER DATABASE [Hapy2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hapy2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hapy2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hapy2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hapy2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hapy2] SET QUERY_STORE = OFF
GO
USE [Hapy2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Hapy2]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/9/2018 4:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserSettings]    Script Date: 10/9/2018 4:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserSettings](
	[SId] [uniqueidentifier] NOT NULL,
	[Uid] [uniqueidentifier] NOT NULL,
	[SVoiceCall] [bit] NOT NULL,
	[SVideoCall] [bit] NOT NULL,
	[SShowCallerId] [bit] NOT NULL,
	[SAutoCallRecorder] [bit] NOT NULL,
	[SDeleteCallLogs] [bit] NOT NULL,
	[SVolumn] [bit] NOT NULL,
	[SVoiceCallVolumn] [bit] NOT NULL,
	[SVideoCallVolumn] [bit] NOT NULL,
	[SHideStatus] [bit] NOT NULL,
	[SHIdeDeliveredStatus] [bit] NOT NULL,
	[SHideProfile] [bit] NOT NULL,
	[SVisibletoContactList] [bit] NOT NULL,
	[DeleteChat] [int] NOT NULL,
	[ArchiveChat] [int] NOT NULL,
	[BackupChat] [int] NOT NULL,
	[SLocation] [bit] NOT NULL,
	[PostOnWall] [nvarchar](50) NOT NULL,
	[SPostVisible] [nvarchar](50) NOT NULL,
	[MSettingLocation] [bit] NOT NULL,
	[MBackup] [bit] NOT NULL,
	[MNotification] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_UserAppSettings] PRIMARY KEY CLUSTERED 
(
	[SId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CallChatSettings]    Script Date: 10/9/2018 4:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CallChatSettings](
	[CId] [uniqueidentifier] NOT NULL,
	[CFromId] [uniqueidentifier] NOT NULL,
	[CToId] [uniqueidentifier] NOT NULL,
	[CCallBlocked] [bit] NOT NULL,
	[CChatBlocked] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_CallChatMapping] PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatMessages]    Script Date: 10/9/2018 4:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMessages](
	[MId] [uniqueidentifier] NOT NULL,
	[MContent] [nvarchar](max) NOT NULL,
	[CCSId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ChatMessages] PRIMARY KEY CLUSTERED 
(
	[MId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 10/9/2018 4:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [uniqueidentifier] NOT NULL,
	[FromId] [uniqueidentifier] NOT NULL,
	[ContentText] [nvarchar](max) NOT NULL,
	[PostId] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompDetails]    Script Date: 10/9/2018 4:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompDetails](
	[cid] [uniqueidentifier] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
	[cstatus] [bit] NOT NULL,
	[isactive] [bit] NOT NULL,
 CONSTRAINT [PK_CompDetails] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devices]    Script Date: 10/9/2018 4:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices](
	[DId] [int] IDENTITY(1,1) NOT NULL,
	[DName] [nvarchar](50) NOT NULL,
	[DType] [nvarchar](50) NOT NULL,
	[DIsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Devices] PRIMARY KEY CLUSTERED 
(
	[DId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FTokens]    Script Date: 10/9/2018 4:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FTokens](
	[tid] [uniqueidentifier] NOT NULL,
	[tdeviceuuid] [nvarchar](max) NOT NULL,
	[ttoken] [nvarchar](max) NOT NULL,
	[isactive] [bit] NOT NULL,
 CONSTRAINT [PK_FToken] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationDetails]    Script Date: 10/9/2018 4:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationDetails](
	[aid] [uniqueidentifier] NOT NULL,
	[address] [nvarchar](200) NULL,
	[acountry] [nvarchar](50) NOT NULL,
	[acode] [nvarchar](50) NULL,
	[alocation] [nvarchar](50) NULL,
	[astrees] [nvarchar](50) NULL,
	[acity] [nvarchar](50) NULL,
	[astate] [nvarchar](50) NULL,
	[alat] [float] NOT NULL,
	[alng] [float] NOT NULL,
	[isactive] [bit] NULL,
	[refernceid] [uniqueidentifier] NOT NULL,
	[googleplaceid] [nvarchar](500) NULL,
 CONSTRAINT [PK_LocationDetails] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loggings]    Script Date: 10/9/2018 4:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loggings](
	[LID] [uniqueidentifier] NOT NULL,
	[LMessage] [nvarchar](max) NULL,
	[LClassname] [nvarchar](50) NULL,
	[LMethodeName] [nvarchar](50) NULL,
	[LExtraInformation] [nvarchar](max) NULL,
 CONSTRAINT [PK_Logging] PRIMARY KEY CLUSTERED 
(
	[LID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaType]    Script Date: 10/9/2018 4:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_MediaType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsAPIs]    Script Date: 10/9/2018 4:07:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsAPIs](
	[Nid] [uniqueidentifier] NOT NULL,
	[Nauthor] [nvarchar](max) NULL,
	[Ntitle] [nvarchar](max) NULL,
	[Ndescription] [nvarchar](max) NULL,
	[NpublishedAt] [nvarchar](max) NULL,
	[NurlToImage] [nvarchar](max) NULL,
	[Nurl] [nvarchar](max) NULL,
	[NUrlid] [nvarchar](max) NULL,
	[Nname] [nvarchar](max) NULL,
	[Timestamp] [timestamp] NOT NULL,
	[NType] [nvarchar](50) NULL,
 CONSTRAINT [PK_NewAPI] PRIMARY KEY CLUSTERED 
(
	[Nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTPVerifications]    Script Date: 10/9/2018 4:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTPVerifications](
	[oId] [uniqueidentifier] NOT NULL,
	[oCode] [nvarchar](max) NOT NULL,
	[oToken] [nvarchar](max) NOT NULL,
	[oVerifyed] [bit] NOT NULL,
	[oAccount] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.OTPVerifications] PRIMARY KEY CLUSTERED 
(
	[oId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostDetails]    Script Date: 10/9/2018 4:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostDetails](
	[PDId] [uniqueidentifier] NOT NULL,
	[PId] [uniqueidentifier] NOT NULL,
	[PMediaURL] [nvarchar](500) NOT NULL,
	[PMediaType] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_PostDetails] PRIMARY KEY CLUSTERED 
(
	[PDId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostLikes]    Script Date: 10/9/2018 4:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostLikes](
	[Id] [uniqueidentifier] NOT NULL,
	[PId] [uniqueidentifier] NOT NULL,
	[FromId] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 10/9/2018 4:07:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [uniqueidentifier] NOT NULL,
	[ToId] [uniqueidentifier] NOT NULL,
	[FromId] [uniqueidentifier] NOT NULL,
	[ContentText] [varchar](max) NOT NULL,
	[VisibleTo] [nvarchar](50) NOT NULL,
	[PLocation] [nvarchar](max) NULL,
	[PTaggedTo] [nvarchar](max) NULL,
	[PFeelingIcon] [nvarchar](max) NULL,
	[PMedia] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[PIsBadReported] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostType]    Script Date: 10/9/2018 4:07:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_PostType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostViews]    Script Date: 10/9/2018 4:07:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostViews](
	[Id] [uniqueidentifier] NOT NULL,
	[PId] [uniqueidentifier] NOT NULL,
	[FromId] [uniqueidentifier] NOT NULL,
	[Isactive] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Views] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shares]    Script Date: 10/9/2018 4:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shares](
	[Id] [uniqueidentifier] NOT NULL,
	[PostId] [uniqueidentifier] NOT NULL,
	[FromId] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Shares] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubComments]    Script Date: 10/9/2018 4:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubComments](
	[Id] [uniqueidentifier] NOT NULL,
	[CommentId] [uniqueidentifier] NOT NULL,
	[FromId] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[ContentText] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SubComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnRegisterdDevices]    Script Date: 10/9/2018 4:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnRegisterdDevices](
	[urid] [uniqueidentifier] NOT NULL,
	[urdtype] [int] NOT NULL,
	[urdid] [nvarchar](max) NULL,
	[urdnumber] [nvarchar](80) NULL,
	[tokenid] [uniqueidentifier] NOT NULL,
	[uisactive] [bit] NOT NULL,
	[uisverifyed] [bit] NOT NULL,
 CONSTRAINT [PK_UnRegisterdDevices] PRIMARY KEY CLUSTERED 
(
	[urid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCompDetails]    Script Date: 10/9/2018 4:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCompDetails](
	[ucid] [uniqueidentifier] NOT NULL,
	[ucstartdate] [date] NOT NULL,
	[ucenddate] [date] NOT NULL,
	[ucstatus] [bit] NOT NULL,
	[uccompid] [uniqueidentifier] NOT NULL,
	[uuid] [uniqueidentifier] NOT NULL,
	[isactive] [bit] NOT NULL,
 CONSTRAINT [PK_UserCompDetails] PRIMARY KEY CLUSTERED 
(
	[ucid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserConnectRequests]    Script Date: 10/9/2018 4:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserConnectRequests](
	[Id] [uniqueidentifier] NOT NULL,
	[FromId] [uniqueidentifier] NOT NULL,
	[ToId] [uniqueidentifier] NOT NULL,
	[RequestMessage] [nvarchar](500) NOT NULL,
	[IsRequestAccpted] [bit] NOT NULL,
	[IsBlocked] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_UserConnectRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersInfoes]    Script Date: 10/9/2018 4:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInfoes](
	[uid] [uniqueidentifier] NOT NULL,
	[uname] [nvarchar](50) NOT NULL,
	[udob] [date] NOT NULL,
	[ugender] [nvarchar](50) NULL,
	[ufname] [nvarchar](50) NOT NULL,
	[ulname] [nvarchar](50) NOT NULL,
	[uprimarynumbercode] [int] NOT NULL,
	[uprimarynumber] [bigint] NOT NULL,
	[uemailid] [nchar](10) NULL,
	[usecondarycode] [int] NULL,
	[usecondarynumber] [bigint] NULL,
	[uabout] [nvarchar](300) NULL,
	[udesc] [nvarchar](500) NULL,
	[uwallimage] [nvarchar](max) NULL,
	[uprofileimage] [nvarchar](max) NULL,
	[ustatus] [bit] NOT NULL,
	[isactive] [bit] NOT NULL,
 CONSTRAINT [PK_UsersInfo] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SId]  DEFAULT (newid()) FOR [SId]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SVoiceCall]  DEFAULT ((1)) FOR [SVoiceCall]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SVideoCall]  DEFAULT ((1)) FOR [SVideoCall]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SShowCallerId]  DEFAULT ((1)) FOR [SShowCallerId]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SAutoCallRecorder]  DEFAULT ((0)) FOR [SAutoCallRecorder]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SDeleteCallLogs]  DEFAULT ((0)) FOR [SDeleteCallLogs]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_AppUserSettings_SVolumn]  DEFAULT ((1)) FOR [SVolumn]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SVoiceCallVolumn]  DEFAULT ((1)) FOR [SVoiceCallVolumn]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SVideoCallVolumn]  DEFAULT ((1)) FOR [SVideoCallVolumn]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SHideStatus]  DEFAULT ((0)) FOR [SHideStatus]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SHIdeDeliveredStatus]  DEFAULT ((0)) FOR [SHIdeDeliveredStatus]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SHideProfile]  DEFAULT ((0)) FOR [SHideProfile]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SVisibletoContactLst]  DEFAULT ((0)) FOR [SVisibletoContactList]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_DeleteChat]  DEFAULT ((30)) FOR [DeleteChat]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_ArchiveChat]  DEFAULT ((30)) FOR [ArchiveChat]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_BackupChat]  DEFAULT ((30)) FOR [BackupChat]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SLocation]  DEFAULT ((1)) FOR [SLocation]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_AppUserSettings_PostOnWall]  DEFAULT (N'Everyone') FOR [PostOnWall]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_SPostVisible]  DEFAULT (N'Public') FOR [SPostVisible]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_MSettingLocation]  DEFAULT ((1)) FOR [MSettingLocation]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_MBackup]  DEFAULT ((0)) FOR [MBackup]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_MNotification]  DEFAULT ((1)) FOR [MNotification]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[AppUserSettings] ADD  CONSTRAINT [DF_UserAppSettings_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[CallChatSettings] ADD  CONSTRAINT [DF_CallChatMapping_CId]  DEFAULT (newid()) FOR [CId]
GO
ALTER TABLE [dbo].[CallChatSettings] ADD  CONSTRAINT [DF_CallChatMapping_CCallBlocked]  DEFAULT ((0)) FOR [CCallBlocked]
GO
ALTER TABLE [dbo].[CallChatSettings] ADD  CONSTRAINT [DF_CallChatMapping_CChatBlocked]  DEFAULT ((0)) FOR [CChatBlocked]
GO
ALTER TABLE [dbo].[CallChatSettings] ADD  CONSTRAINT [DF_CallChatMapping_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[CallChatSettings] ADD  CONSTRAINT [DF_CallChatMapping_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[ChatMessages] ADD  CONSTRAINT [DF_ChatMessages_MId]  DEFAULT (newid()) FOR [MId]
GO
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [DF_Comments_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[CompDetails] ADD  CONSTRAINT [DF_CompDetails_cid]  DEFAULT (newid()) FOR [cid]
GO
ALTER TABLE [dbo].[CompDetails] ADD  CONSTRAINT [DF_CompDetails_cstatus]  DEFAULT ((0)) FOR [cstatus]
GO
ALTER TABLE [dbo].[CompDetails] ADD  CONSTRAINT [DF_CompDetails_isactive]  DEFAULT ((0)) FOR [isactive]
GO
ALTER TABLE [dbo].[FTokens] ADD  CONSTRAINT [DF_FToken_tid]  DEFAULT (newid()) FOR [tid]
GO
ALTER TABLE [dbo].[FTokens] ADD  CONSTRAINT [DF_FToken_isactive]  DEFAULT ((0)) FOR [isactive]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_aid]  DEFAULT (newid()) FOR [aid]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_alat]  DEFAULT ((0)) FOR [alat]
GO
ALTER TABLE [dbo].[LocationDetails] ADD  CONSTRAINT [DF_LocationDetails_alng]  DEFAULT ((0)) FOR [alng]
GO
ALTER TABLE [dbo].[Loggings] ADD  CONSTRAINT [DF_Logging_LID]  DEFAULT (newid()) FOR [LID]
GO
ALTER TABLE [dbo].[MediaType] ADD  CONSTRAINT [DF_MediaType_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[MediaType] ADD  CONSTRAINT [DF_MediaType_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[NewsAPIs] ADD  CONSTRAINT [DF_NewAPI_Nid]  DEFAULT (newid()) FOR [Nid]
GO
ALTER TABLE [dbo].[OTPVerifications] ADD  CONSTRAINT [DF_OTPVerifications_oId]  DEFAULT (newid()) FOR [oId]
GO
ALTER TABLE [dbo].[PostDetails] ADD  CONSTRAINT [DF_PostDetails_PDId]  DEFAULT (newid()) FOR [PDId]
GO
ALTER TABLE [dbo].[PostDetails] ADD  CONSTRAINT [DF_PostDetails_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[PostDetails] ADD  CONSTRAINT [DF_PostDetails_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[PostLikes] ADD  CONSTRAINT [DF_Likes_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_PIsBadReported]  DEFAULT ((0)) FOR [PIsBadReported]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[PostViews] ADD  CONSTRAINT [DF_Views_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[SubComments] ADD  CONSTRAINT [DF_SubComments_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[UnRegisterdDevices] ADD  CONSTRAINT [DF_UnRegisterdDevices_urid]  DEFAULT (newid()) FOR [urid]
GO
ALTER TABLE [dbo].[UserCompDetails] ADD  CONSTRAINT [DF_UserCompDetails_ucid]  DEFAULT (newid()) FOR [ucid]
GO
ALTER TABLE [dbo].[UserCompDetails] ADD  CONSTRAINT [DF_UserCompDetails_ucstatus]  DEFAULT ((0)) FOR [ucstatus]
GO
ALTER TABLE [dbo].[UserCompDetails] ADD  CONSTRAINT [DF_UserCompDetails_isactive]  DEFAULT ((0)) FOR [isactive]
GO
ALTER TABLE [dbo].[UserConnectRequests] ADD  CONSTRAINT [DF_UserConnectRequest_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[UserConnectRequests] ADD  CONSTRAINT [DF_UserConnectRequest_IsRequestAccpted]  DEFAULT ((0)) FOR [IsRequestAccpted]
GO
ALTER TABLE [dbo].[UserConnectRequests] ADD  CONSTRAINT [DF_UserConnectRequest_IsBlocked]  DEFAULT ((0)) FOR [IsBlocked]
GO
ALTER TABLE [dbo].[UserConnectRequests] ADD  CONSTRAINT [DF_UserConnectRequest_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[UsersInfoes] ADD  CONSTRAINT [DF_UsersInfo_uid]  DEFAULT (newid()) FOR [uid]
GO
ALTER TABLE [dbo].[UsersInfoes] ADD  CONSTRAINT [DF_UsersInfoes_uabout]  DEFAULT (N'I am Online') FOR [uabout]
GO
ALTER TABLE [dbo].[UsersInfoes] ADD  CONSTRAINT [DF_UsersInfo_isactive]  DEFAULT ((0)) FOR [isactive]
GO
ALTER TABLE [dbo].[AppUserSettings]  WITH CHECK ADD  CONSTRAINT [FK_UserAppSettings_UsersInfoes] FOREIGN KEY([Uid])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[AppUserSettings] CHECK CONSTRAINT [FK_UserAppSettings_UsersInfoes]
GO
ALTER TABLE [dbo].[CallChatSettings]  WITH CHECK ADD  CONSTRAINT [FK_CallChatMapping_UsersInfoes] FOREIGN KEY([CToId])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[CallChatSettings] CHECK CONSTRAINT [FK_CallChatMapping_UsersInfoes]
GO
ALTER TABLE [dbo].[CallChatSettings]  WITH CHECK ADD  CONSTRAINT [FK_CallChatMapping_UsersInfoes1] FOREIGN KEY([CFromId])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[CallChatSettings] CHECK CONSTRAINT [FK_CallChatMapping_UsersInfoes1]
GO
ALTER TABLE [dbo].[ChatMessages]  WITH CHECK ADD  CONSTRAINT [FK_ChatMessages_CallChatSetting] FOREIGN KEY([CCSId])
REFERENCES [dbo].[CallChatSettings] ([CId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChatMessages] CHECK CONSTRAINT [FK_ChatMessages_CallChatSetting]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_UsersInfoes] FOREIGN KEY([FromId])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_UsersInfoes]
GO
ALTER TABLE [dbo].[PostDetails]  WITH CHECK ADD  CONSTRAINT [FK_PostDetails_MediaType] FOREIGN KEY([PMediaType])
REFERENCES [dbo].[MediaType] ([Id])
GO
ALTER TABLE [dbo].[PostDetails] CHECK CONSTRAINT [FK_PostDetails_MediaType]
GO
ALTER TABLE [dbo].[PostDetails]  WITH CHECK ADD  CONSTRAINT [FK_PostDetails_Posts] FOREIGN KEY([PId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostDetails] CHECK CONSTRAINT [FK_PostDetails_Posts]
GO
ALTER TABLE [dbo].[PostLikes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Posts] FOREIGN KEY([PId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostLikes] CHECK CONSTRAINT [FK_Likes_Posts]
GO
ALTER TABLE [dbo].[PostLikes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_UsersInfoes] FOREIGN KEY([FromId])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[PostLikes] CHECK CONSTRAINT [FK_Likes_UsersInfoes]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostType] FOREIGN KEY([Type])
REFERENCES [dbo].[PostType] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_PostType]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_UsersInfoes] FOREIGN KEY([ToId])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_UsersInfoes]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_UsersInfoes1] FOREIGN KEY([FromId])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_UsersInfoes1]
GO
ALTER TABLE [dbo].[PostViews]  WITH CHECK ADD  CONSTRAINT [FK_Views_Posts] FOREIGN KEY([PId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostViews] CHECK CONSTRAINT [FK_Views_Posts]
GO
ALTER TABLE [dbo].[PostViews]  WITH CHECK ADD  CONSTRAINT [FK_Views_UsersInfoes] FOREIGN KEY([FromId])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[PostViews] CHECK CONSTRAINT [FK_Views_UsersInfoes]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Shares_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Shares_Posts]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Shares_UsersInfoes] FOREIGN KEY([FromId])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Shares_UsersInfoes]
GO
ALTER TABLE [dbo].[SubComments]  WITH CHECK ADD  CONSTRAINT [FK_SubComments_Comments] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[SubComments] CHECK CONSTRAINT [FK_SubComments_Comments]
GO
ALTER TABLE [dbo].[SubComments]  WITH CHECK ADD  CONSTRAINT [FK_SubComments_UsersInfoes] FOREIGN KEY([FromId])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[SubComments] CHECK CONSTRAINT [FK_SubComments_UsersInfoes]
GO
ALTER TABLE [dbo].[UnRegisterdDevices]  WITH CHECK ADD  CONSTRAINT [FK_UnRegisterdDevices_Devices] FOREIGN KEY([urdtype])
REFERENCES [dbo].[Devices] ([DId])
GO
ALTER TABLE [dbo].[UnRegisterdDevices] CHECK CONSTRAINT [FK_UnRegisterdDevices_Devices]
GO
ALTER TABLE [dbo].[UnRegisterdDevices]  WITH CHECK ADD  CONSTRAINT [FK_UnRegisterdDevices_FToken] FOREIGN KEY([tokenid])
REFERENCES [dbo].[FTokens] ([tid])
GO
ALTER TABLE [dbo].[UnRegisterdDevices] CHECK CONSTRAINT [FK_UnRegisterdDevices_FToken]
GO
ALTER TABLE [dbo].[UserCompDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserCompDetails_CompDetails] FOREIGN KEY([uccompid])
REFERENCES [dbo].[CompDetails] ([cid])
GO
ALTER TABLE [dbo].[UserCompDetails] CHECK CONSTRAINT [FK_UserCompDetails_CompDetails]
GO
ALTER TABLE [dbo].[UserCompDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserCompDetails_UsersInfos] FOREIGN KEY([uuid])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[UserCompDetails] CHECK CONSTRAINT [FK_UserCompDetails_UsersInfos]
GO
ALTER TABLE [dbo].[UserConnectRequests]  WITH CHECK ADD  CONSTRAINT [FK_UserConnectRequest_UsersInfoes] FOREIGN KEY([ToId])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[UserConnectRequests] CHECK CONSTRAINT [FK_UserConnectRequest_UsersInfoes]
GO
ALTER TABLE [dbo].[UserConnectRequests]  WITH CHECK ADD  CONSTRAINT [FK_UserConnectRequest_UsersInfoes1] FOREIGN KEY([FromId])
REFERENCES [dbo].[UsersInfoes] ([uid])
GO
ALTER TABLE [dbo].[UserConnectRequests] CHECK CONSTRAINT [FK_UserConnectRequest_UsersInfoes1]
GO
/****** Object:  StoredProcedure [dbo].[getSP_ChatId]    Script Date: 10/9/2018 4:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getSP_ChatId]
	@fid uniqueidentifier,
	@tid uniqueidentifier,
	@status bit = 1
AS
BEGIN
	SET NOCOUNT ON;
	select * from CallChatSettings cleftside where cleftside.CFromId = @fid and cleftside.CToId = @tid 
	union select * from CallChatSettings crightside where crightside.CFromId = @tid and crightside.CToId = @fid; 
END
GO
/****** Object:  StoredProcedure [dbo].[searchSP_Users]    Script Date: 10/9/2018 4:07:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchSP_Users]
	@searchBy uniqueidentifier,
	@searchTxt nvarchar(80),
	@searchOn nvarchar(50),
	@searchType nvarchar(50),
	@pageNumber int = 1,
	@pageSize int = 20,
	@id uniqueidentifier = null,
	@searchStatus bit  = 1,
	@searchIsActive bit = 1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @searchQuery varchar(max) = null;
	declare @searchWhereQuery varchar(max) = ' where 1 = 1 ';
	declare @searchFinalQuery varchar(max) = null;
	declare @searchFinalExecQuery varchar(max) = null;
	declare @paging nvarchar(max) = ' offset '+ convert(nvarchar(8), @pageSize) +' * ('+ convert(nvarchar(8), @pageNumber) +' -1) rows fetch next ' + convert(nvarchar(8), @pageSize) + ' rows only';

	set @searchQuery = 'u.uid as [user.uid], uname as [user.name], uabout as [user.about], udesc [user.desc], uwallimage [user.uwallimage], uprofileimage [user.uprofileimage], u.isactive as [user.active], u.ustatus as [user.status],
	  userloc.acountry as [user.location.country], userloc.address as [user.location.address], ucrq.FromId as [user.friend.fid], ucrq.ToId as [user.friend.tid], ucrq.IsBlocked as [user.friend.isblocked],
	   ucrq.IsRequestAccpted as [user.friend.isaccpted], ucrq.id as [user.friend.id] ';

	if @searchType = 'post' or @searchType = 'usercomp' or @searchType = 'all'
	begin
		set @searchQuery += ', uccompid as [user.comp.id],comploc.acountry as [user.comp.location.country], ucstartdate as [user.comp.startdate], ucenddate as [user.comp.enddate]';
	end

	if @searchType = 'post' or @searchType = 'usersettings' or @searchType = 'all'
	begin
		set @searchQuery += ',usersetting.SShowCallerId as [user.settings.showcallerid], usersetting.SHIdeDeliveredStatus as [user.settings.hidedeliverystatus], usersetting.SHideStatus as [user.settings.hidestatus], usersetting.SHideProfile as [user.settings.hideprofile]';
    end

	if @searchOn = 'username'
	begin
		set @searchWhereQuery += ' and u.uname like ''%'+ @searchTxt +'%''';
	end

	if @searchOn = 'location'
	begin
		set @searchWhereQuery += ' and userloc.alocation = '+ @searchTxt +'';
	end

	if @searchOn = 'country'
	begin
		set @searchWhereQuery += ' and userloc.acountry = '+ @searchTxt +'';
	end

	if @searchOn = 'location-country'
	begin
		set @searchWhereQuery += ' and userloc.acountry = '+ @searchTxt +' and userloc.alocation = '+ @searchTxt +'';
	end
	
	if @searchOn = 'id' and @id != null
	begin
		set @searchWhereQuery += ' and u.uid = '+ convert(nvarchar(max), @id) + '';
	end

	if @searchIsActive != null
	begin
		set @searchWhereQuery += ' and u.isactive = '+ convert(nvarchar(max), @searchIsActive) + '';
	end

	if @searchStatus != null
	begin
		set @searchWhereQuery += ' and u.ustatus = '+ convert(nvarchar(max), @searchStatus) + '';
	end
	
	set @searchFinalQuery = @searchQuery +'
		from UsersInfoes u left join AppUserSettings usersetting on u.uid = usersetting.Uid left join UserConnectRequests ucrq on (u.uid = ucrq.ToId or u.uid = ucrq.FromId)
	   left join UserCompDetails usercomp on u.uid = usercomp.uuid left join LocationDetails comploc on usercomp.ucid = comploc.refernceid left join LocationDetails userloc on userloc.refernceid = u.uid
	  left join CompDetails comp on comp.cid = usercomp.uccompid '+ @searchWhereQuery +' order by u.uname' + @paging + ' ';
	  
  set @searchFinalExecQuery = 'select (select '+ @searchFinalQuery +' for json path) as jsonResult';
  print @searchFinalExecQuery;
  exec(@searchFinalExecQuery);

END






GO
USE [master]
GO
ALTER DATABASE [Hapy2] SET  READ_WRITE 
GO
