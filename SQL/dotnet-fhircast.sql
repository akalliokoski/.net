USE [master]
GO
/****** Object:  Database [FhirCast1]    Script Date: 3/9/2019 8:59:08 AM ******/
CREATE DATABASE [FhirCast1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FhirCast1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FhirCast1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FhirCast1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FhirCast1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FhirCast1] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FhirCast1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FhirCast1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FhirCast1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FhirCast1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FhirCast1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FhirCast1] SET ARITHABORT OFF 
GO
ALTER DATABASE [FhirCast1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FhirCast1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FhirCast1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FhirCast1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FhirCast1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FhirCast1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FhirCast1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FhirCast1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FhirCast1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FhirCast1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FhirCast1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FhirCast1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FhirCast1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FhirCast1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FhirCast1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FhirCast1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FhirCast1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FhirCast1] SET RECOVERY FULL 
GO
ALTER DATABASE [FhirCast1] SET  MULTI_USER 
GO
ALTER DATABASE [FhirCast1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FhirCast1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FhirCast1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FhirCast1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FhirCast1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FhirCast1', N'ON'
GO
ALTER DATABASE [FhirCast1] SET QUERY_STORE = OFF
GO
USE [FhirCast1]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FhirCast1]
GO
/****** Object:  Table [dbo].[ClientApp]    Script Date: 3/9/2019 8:59:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientApp](
	[ClientAppID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Secret] [uniqueidentifier] NULL,
 CONSTRAINT [ClientApp_PK] PRIMARY KEY CLUSTERED 
(
	[ClientAppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientAppUser]    Script Date: 3/9/2019 8:59:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientAppUser](
	[ClientAppUserID] [int] IDENTITY(1,1) NOT NULL,
	[ClientAppID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserIdentityID] [int] NOT NULL,
 CONSTRAINT [ClientAppUser_PK] PRIMARY KEY CLUSTERED 
(
	[ClientAppUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [cau_appid_username] UNIQUE NONCLUSTERED 
(
	[ClientAppID] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserIdentity]    Script Date: 3/9/2019 8:59:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserIdentity](
	[UserIdentityID] [int] IDENTITY(1,1) NOT NULL,
	[Topic] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [UserIdentity_PK] PRIMARY KEY CLUSTERED 
(
	[UserIdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ClientApp] ADD  DEFAULT (newid()) FOR [Secret]
GO
ALTER TABLE [dbo].[UserIdentity] ADD  DEFAULT (newid()) FOR [Topic]
GO
ALTER TABLE [dbo].[ClientAppUser]  WITH CHECK ADD  CONSTRAINT [FK_ClientAppUser_ClientApp] FOREIGN KEY([ClientAppID])
REFERENCES [dbo].[ClientApp] ([ClientAppID])
GO
ALTER TABLE [dbo].[ClientAppUser] CHECK CONSTRAINT [FK_ClientAppUser_ClientApp]
GO
ALTER TABLE [dbo].[ClientAppUser]  WITH CHECK ADD  CONSTRAINT [FK_ClientAppUser_UserIdentity] FOREIGN KEY([UserIdentityID])
REFERENCES [dbo].[UserIdentity] ([UserIdentityID])
GO
ALTER TABLE [dbo].[ClientAppUser] CHECK CONSTRAINT [FK_ClientAppUser_UserIdentity]
GO
USE [master]
GO
ALTER DATABASE [FhirCast1] SET  READ_WRITE 
GO
