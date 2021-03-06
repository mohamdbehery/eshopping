USE [master]
GO
/****** Object:  Database [eShopping]    Script Date: 6/26/2019 1:22:47 AM ******/
CREATE DATABASE [eShopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eShopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\eShopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eShopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\eShopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [eShopping] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eShopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eShopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eShopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eShopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eShopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eShopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [eShopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eShopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eShopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eShopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eShopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eShopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eShopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eShopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eShopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eShopping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eShopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eShopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eShopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eShopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eShopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eShopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eShopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eShopping] SET RECOVERY FULL 
GO
ALTER DATABASE [eShopping] SET  MULTI_USER 
GO
ALTER DATABASE [eShopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eShopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eShopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eShopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eShopping] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'eShopping', N'ON'
GO
ALTER DATABASE [eShopping] SET QUERY_STORE = OFF
GO
USE [eShopping]
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
USE [eShopping]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/26/2019 1:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[Name_AR] [nvarchar](150) NULL,
	[Name_EN] [nvarchar](150) NULL,
	[Description_AR] [nvarchar](max) NULL,
	[Description_EN] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactMessages]    Script Date: 6/26/2019 1:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactMessages](
	[ContactMessageID] [bigint] IDENTITY(1,1) NOT NULL,
	[ContactName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
	[MessageContent] [nvarchar](max) NULL,
	[IsRead] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.ContactMessages] PRIMARY KEY CLUSTERED 
(
	[ContactMessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileLines]    Script Date: 6/26/2019 1:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileLines](
	[FileLineID] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentType] [int] NULL,
	[ParentID] [bigint] NOT NULL,
	[FilePath] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.FileLines] PRIMARY KEY CLUSTERED 
(
	[FileLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/26/2019 1:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductTypeID] [bigint] NULL,
	[Name_AR] [nvarchar](250) NULL,
	[Name_EN] [nvarchar](250) NULL,
	[Desc_AR] [nvarchar](max) NULL,
	[Desc_EN] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Qty] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products.Attributes]    Script Date: 6/26/2019 1:22:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products.Attributes](
	[AttributeID] [bigint] IDENTITY(1,1) NOT NULL,
	[AttributeName] [nvarchar](50) NULL,
	[AttributeTitle_AR] [nvarchar](50) NULL,
	[AttributeTitle_EN] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products.Attributes] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products.AttributesValues]    Script Date: 6/26/2019 1:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products.AttributesValues](
	[AttributeValueID] [bigint] IDENTITY(1,1) NOT NULL,
	[AttributeID] [bigint] NULL,
	[AttributeValue_AR] [nvarchar](max) NULL,
	[AttributeValue_EN] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products.AttributesValues] PRIMARY KEY CLUSTERED 
(
	[AttributeValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products.ProductAttributeValues]    Script Date: 6/26/2019 1:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products.ProductAttributeValues](
	[ProductID] [bigint] NULL,
	[AttributeValueID] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products.Requests]    Script Date: 6/26/2019 1:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products.Requests](
	[Product_RequestID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[Email] [nvarchar](50) NULL,
	[Qty] [int] NULL,
	[Price] [float] NULL,
	[TotalPrice] [float] NULL,
	[CreatedDate] [datetime] NULL,
	[Request_StatusID] [int] NULL,
 CONSTRAINT [PK_Products.Requests] PRIMARY KEY CLUSTERED 
(
	[Product_RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products.Types]    Script Date: 6/26/2019 1:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products.Types](
	[ProductTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name_AR] [nvarchar](50) NULL,
	[Name_EN] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Products.Types] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products.Types.AttributesValues]    Script Date: 6/26/2019 1:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products.Types.AttributesValues](
	[ProductTypeAttributeValueID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductTypeID] [bigint] NULL,
	[AttributeValueID] [bigint] NULL,
 CONSTRAINT [PK_Products.Types.AttributesValues] PRIMARY KEY CLUSTERED 
(
	[ProductTypeAttributeValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/26/2019 1:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[GroupID] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users.Groups]    Script Date: 6/26/2019 1:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users.Groups](
	[GroupID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users.Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [ParentID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [IsActive]) VALUES (1, NULL, N'اجهزة كهربائية', N'Electrical Device', N'اجهزة منزلية', N'Home Device', 1)
INSERT [dbo].[Categories] ([CategoryID], [ParentID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [IsActive]) VALUES (2, 1, N'تليفزيونات', N'TVs', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[ContactMessages] ON 

INSERT [dbo].[ContactMessages] ([ContactMessageID], [ContactName], [Email], [Mobile], [MessageContent], [IsRead], [IsDeleted], [CreatedDate]) VALUES (2, N'mohamed', N'medo@gmail.com', N'01067636963', N'zoka', 1, 0, CAST(N'2019-06-06T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ContactMessages] OFF
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products.Types] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[Products.Types] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products.Types]
GO
ALTER TABLE [dbo].[Products.AttributesValues]  WITH CHECK ADD  CONSTRAINT [FK_Products.AttributesValues_Products.Attributes] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Products.Attributes] ([AttributeID])
GO
ALTER TABLE [dbo].[Products.AttributesValues] CHECK CONSTRAINT [FK_Products.AttributesValues_Products.Attributes]
GO
ALTER TABLE [dbo].[Products.AttributesValues]  WITH CHECK ADD  CONSTRAINT [FK_Products.AttributesValues_Products.Attributes1] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Products.Attributes] ([AttributeID])
GO
ALTER TABLE [dbo].[Products.AttributesValues] CHECK CONSTRAINT [FK_Products.AttributesValues_Products.Attributes1]
GO
ALTER TABLE [dbo].[Products.ProductAttributeValues]  WITH CHECK ADD  CONSTRAINT [FK_Products.ProductAttributeValues_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Products.ProductAttributeValues] CHECK CONSTRAINT [FK_Products.ProductAttributeValues_Products]
GO
ALTER TABLE [dbo].[Products.ProductAttributeValues]  WITH CHECK ADD  CONSTRAINT [FK_Products.ProductAttributeValues_Products.AttributesValues] FOREIGN KEY([AttributeValueID])
REFERENCES [dbo].[Products.AttributesValues] ([AttributeValueID])
GO
ALTER TABLE [dbo].[Products.ProductAttributeValues] CHECK CONSTRAINT [FK_Products.ProductAttributeValues_Products.AttributesValues]
GO
ALTER TABLE [dbo].[Products.Types.AttributesValues]  WITH CHECK ADD  CONSTRAINT [FK_Products.Types.AttributesValues_Products.AttributesValues] FOREIGN KEY([AttributeValueID])
REFERENCES [dbo].[Products.AttributesValues] ([AttributeValueID])
GO
ALTER TABLE [dbo].[Products.Types.AttributesValues] CHECK CONSTRAINT [FK_Products.Types.AttributesValues_Products.AttributesValues]
GO
ALTER TABLE [dbo].[Products.Types.AttributesValues]  WITH CHECK ADD  CONSTRAINT [FK_Products.Types.AttributesValues_Products.Types.AttributesValues] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[Products.Types] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Products.Types.AttributesValues] CHECK CONSTRAINT [FK_Products.Types.AttributesValues_Products.Types.AttributesValues]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users.Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Users.Groups] ([GroupID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users.Groups]
GO
USE [master]
GO
ALTER DATABASE [eShopping] SET  READ_WRITE 
GO
