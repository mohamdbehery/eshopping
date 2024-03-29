USE [master]
GO
/****** Object:  Database [eShopping]    Script Date: 7/17/2019 12:30:54 AM ******/
CREATE DATABASE [eShopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eShopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\eShopping.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'eShopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\eShopping_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eShopping] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [eShopping] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [eShopping] SET  MULTI_USER 
GO
ALTER DATABASE [eShopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eShopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eShopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eShopping] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [eShopping] SET DELAYED_DURABILITY = DISABLED 
GO
USE [eShopping]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[Name_AR] [nvarchar](150) NULL,
	[Name_EN] [nvarchar](150) NULL,
	[Description_AR] [nvarchar](max) NULL,
	[Description_EN] [nvarchar](max) NULL,
	[IsHighlighted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[ContactUsID] [int] IDENTITY(1,1) NOT NULL,
	[AboutUs_AR] [nvarchar](max) NULL,
	[AboutUs_EN] [nvarchar](max) NULL,
	[Address_AR] [nvarchar](500) NULL,
	[Address_EN] [nvarchar](500) NULL,
	[MobileNumber] [nvarchar](200) NULL,
	[FaxNumber] [nvarchar](200) NULL,
	[eMailAddress] [nvarchar](200) NULL,
	[FaceBookURL] [nvarchar](max) NULL,
	[GooglePlusURL] [nvarchar](max) NULL,
	[YoutubeURL] [nvarchar](max) NULL,
	[TwitterURL] [nvarchar](max) NULL,
	[LastModified] [datetime] NULL,
	[FooterStatement_AR] [nvarchar](max) NULL,
	[FooterStatement_EN] [nvarchar](max) NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[ContactUsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactUsMessages]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUsMessages](
	[ContactUsMessageID] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[eMailAddress] [nvarchar](max) NULL,
	[MobileNumber] [nvarchar](max) NULL,
	[MessageContent] [nvarchar](max) NULL,
	[IsRead] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.ContactMessages] PRIMARY KEY CLUSTERED 
(
	[ContactUsMessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FileStore]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileStore](
	[FileStoreID] [bigint] IDENTITY(1,1) NOT NULL,
	[FileType] [int] NOT NULL,
	[TypeID] [bigint] NOT NULL,
	[IsMain] [bit] NOT NULL,
	[FilePath] [nvarchar](max) NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[FileExtension] [nvarchar](20) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.FileLines] PRIMARY KEY CLUSTERED 
(
	[FileStoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Localizations]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Localizations](
	[LocalizationID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](200) NOT NULL,
	[Page] [varchar](200) NOT NULL,
	[Lang] [varchar](3) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Localizations] PRIMARY KEY CLUSTERED 
(
	[LocalizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductTypeID] [bigint] NULL,
	[Name_AR] [nvarchar](500) NULL,
	[Name_EN] [nvarchar](500) NULL,
	[Description_AR] [nvarchar](max) NULL,
	[Description_EN] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Qty] [int] NULL,
	[IsHighlighted] [bit] NOT NULL,
	[IsRecommended] [bit] NOT NULL CONSTRAINT [DF_Product_IsRecommended]  DEFAULT ((0)),
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product.ProductAttributeValues]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product.ProductAttributeValues](
	[ProductAttributeValueID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[AttributeID] [bigint] NULL,
	[AttributeValue_AR] [nvarchar](max) NULL,
	[AttributeValue_EN] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product.ProductAttributeValues] PRIMARY KEY CLUSTERED 
(
	[ProductAttributeValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product.Requests]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product.Requests](
	[ProductRequestID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[FullName] [nvarchar](500) NULL,
	[MobileNumber] [nvarchar](200) NULL,
	[eMailAddress] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[Qty] [int] NULL,
	[Price] [float] NULL,
	[TotalPrice] [float] NULL,
	[RequestNotes] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[IsDone] [bit] NOT NULL,
 CONSTRAINT [PK_Products.Requests] PRIMARY KEY CLUSTERED 
(
	[ProductRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttribute](
	[AttributeID] [bigint] IDENTITY(1,1) NOT NULL,
	[AttributeName] [nvarchar](200) NULL,
	[AttributeTitle_AR] [nvarchar](200) NULL,
	[AttributeTitle_EN] [nvarchar](200) NULL,
 CONSTRAINT [PK_Products.Attributes] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name_AR] [nvarchar](500) NULL,
	[Name_EN] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Products.Types] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductType.ProductAttributes]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType.ProductAttributes](
	[ProductTypeAttributeValueID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductTypeID] [bigint] NULL,
	[AttributeID] [bigint] NULL,
 CONSTRAINT [PK_Products.Types.AttributesValues] PRIMARY KEY CLUSTERED 
(
	[ProductTypeAttributeValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](200) NULL,
	[Password] [nvarchar](200) NULL,
	[eMailAddress] [nvarchar](200) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[AboutHim] [nvarchar](max) NULL,
	[GroupID] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ShowInfoToUsers] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 7/17/2019 12:30:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[GroupID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users.Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [ParentID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [IsHighlighted], [IsActive]) VALUES (83, NULL, N'أجهزة كهربائية', N'Gadgets', N'عن الأجهزة الكهربائية عن الأجهزة الكهربائية عن الأجهزة الكهربائية عن الأجهزة الكهربائية عن الأجهزة الكهربائية عن الأجهزة الكهربائية عن الأجهزة الكهربائية عن الأجهزة الكهربائية عن الأجهزة الكهربائية عن الأجهزة الكهربائية', N'About gadgets About gadgets About gadgets About gadgets About gadgets About gadgets About gadgets About gadgetsAbout gadgets About gadgets About gadgets About gadgets About gadgets About gadgets', 1, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [IsHighlighted], [IsActive]) VALUES (85, NULL, N'معدات ثقيلة', N'Heavy Equipment', N'عن المعدات الثقيلة عن المعدات الثقيلة عن المعدات الثقيلة عن المعدات الثقيلة عن المعدات الثقيلة عن المعدات الثقيلة عن المعدات الثقيلة عن المعدات الثقيلة عن المعدات الثقيلة عن المعدات الثقيلة عن المعدات الثقيلة عن المعدات الثقيلة', N' About Heavy Equipment About Heavy Equipment About Heavy Equipment About Heavy Equipment About Heavy Equipment About Heavy Equipment About Heavy Equipment About Heavy Equipment About Heavy Equipment About Heavy Equipment About Heavy Equipment', 0, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [IsHighlighted], [IsActive]) VALUES (87, 0, N'هواتف زكية', N'Smart phones', N'عن الهواتف الزكية عن الهواتف الزكية عن الهواتف الزكية عن الهواتف الزكية عن الهواتف الزكية عن الهواتف الزكية عن الهواتف الزكية عن الهواتف الزكية عن الهواتف الزكية عن الهواتف الزكية', N' About smart phones About smart phones About smart phones About smart phones About smart phones About smart phones About smart phones About smart phones About smart phonesAbout smart phones', 1, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[ContactUs] ON 

INSERT [dbo].[ContactUs] ([ContactUsID], [AboutUs_AR], [AboutUs_EN], [Address_AR], [Address_EN], [MobileNumber], [FaxNumber], [eMailAddress], [FaceBookURL], [GooglePlusURL], [YoutubeURL], [TwitterURL], [LastModified], [FooterStatement_AR], [FooterStatement_EN]) VALUES (1, N'عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع عن الموقع', N'this is about website this is about website this is about website this is about website this is about website this is about website this is about website this is about website this is about website this is about website this is about website this is about website', N'الزقازيق حى الزهور', N'Zagazig, Zohour district', N'01007330161', N'2115', N'mohamed.behery@yahoo.com', N'https://www.facebook.com/facebook $$$ https://www.facebook.com/facebook2', N'gplus', N'yt', N'tw', CAST(N'2019-07-16 23:10:55.293' AS DateTime), N'نحن هنا دائما لخدمتك فقط راسلنا على ', N'we always here to serve you, just contact us on')
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
SET IDENTITY_INSERT [dbo].[ContactUsMessages] ON 

INSERT [dbo].[ContactUsMessages] ([ContactUsMessageID], [FullName], [eMailAddress], [MobileNumber], [MessageContent], [IsRead], [IsDeleted], [CreatedDate]) VALUES (2, N'mohamed', N'medo@gmail.com', N'01067636963', N'zoka', 1, 0, CAST(N'2019-12-26 00:00:00.000' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ContactUsMessageID], [FullName], [eMailAddress], [MobileNumber], [MessageContent], [IsRead], [IsDeleted], [CreatedDate]) VALUES (6, N'mohameddddddd', N'medo@gmail.com', N'01067636963', N' سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا', 1, 0, CAST(N'2019-06-06 00:00:00.000' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ContactUsMessageID], [FullName], [eMailAddress], [MobileNumber], [MessageContent], [IsRead], [IsDeleted], [CreatedDate]) VALUES (9, N'ttttttttttttttttttttt', N'dd@dd.com', N'01010101010', N'ghghgh', 1, 0, CAST(N'2019-07-16 12:49:33.263' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ContactUsMessageID], [FullName], [eMailAddress], [MobileNumber], [MessageContent], [IsRead], [IsDeleted], [CreatedDate]) VALUES (10, N'sdf', N'sdfsd', N'sdf', N'sdfsdf', 1, 0, CAST(N'2019-07-16 12:50:13.387' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ContactUsMessageID], [FullName], [eMailAddress], [MobileNumber], [MessageContent], [IsRead], [IsDeleted], [CreatedDate]) VALUES (11, N'dfgd', N'gdfgd', N'dfgd', N'dfgdf', 0, 0, CAST(N'2019-07-16 12:53:17.123' AS DateTime))
SET IDENTITY_INSERT [dbo].[ContactUsMessages] OFF
SET IDENTITY_INSERT [dbo].[FileStore] ON 

INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (121, 3, 2, 0, N'Products_3_2_Screenshot_1.png', N'Products_3_2_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-11 15:17:18.807' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (122, 3, 2, 0, N'Products_3_2_Exceptional Exchange Rate Issue 1.png', N'Products_3_2_Exceptional Exchange Rate Issue 1.png', N'image/png', 1, CAST(N'2019-07-11 15:17:44.863' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (124, 3, 2, 1, N'Products_3_2_817_Screenshot_1.png', N'Products_3_2_817_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-11 15:23:07.817' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (125, 3, 5, 0, N'Products_3_5_178_Exceptional Exchange Rate Issue 1.png', N'Products_3_5_178_Exceptional Exchange Rate Issue 1.png', N'image/png', 1, CAST(N'2019-07-11 15:23:51.177' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (126, 3, 5, 1, N'Products_3_5_199_Screenshot_1.png', N'Products_3_5_199_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-11 15:23:51.200' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (127, 3, 4, 0, N'Products_3_4_262_Exceptional Exchange Rate Issue 1.png', N'Products_3_4_262_Exceptional Exchange Rate Issue 1.png', N'image/png', 1, CAST(N'2019-07-11 15:33:47.263' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (129, 3, 4, 1, N'Products_3_4_889_Screenshot_1.png', N'Products_3_4_889_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-12 07:26:54.890' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (130, 1, 1, 1, N'Products_3_5_199_Screenshot_1.png', N'Products_3_5_199_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-11 15:23:51.200' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (131, 2, 0, 0, N'Categories_2_0_636_2017-best-phones-1.jpg', N'Categories_2_0_636_2017-best-phones-1.jpg', N'image/jpeg', 1, CAST(N'2019-07-14 09:11:43.637' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (132, 2, 85, 0, N'Categories_2_85_62_900x501-1_-78-nO-y4E9-WaP.jpg', N'Categories_2_85_62_900x501-1_-78-nO-y4E9-WaP.jpg', N'image/jpeg', 1, CAST(N'2019-07-14 09:13:53.063' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (133, 2, 83, 0, N'Categories_2_83_631_imagesSIKQ0IPN.jpg', N'Categories_2_83_631_imagesSIKQ0IPN.jpg', N'image/jpeg', 1, CAST(N'2019-07-14 10:11:08.633' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (134, 3, 6, 1, N'Products_3_6_516_admin.png', N'Products_3_6_516_admin.png', N'image/png', 1, CAST(N'2019-07-14 10:31:01.517' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [IsMain], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (135, 3, 3, 1, N'Products_3_3_452_admin.png', N'Products_3_3_452_admin.png', N'image/png', 1, CAST(N'2019-07-14 10:31:34.453' AS DateTime))
SET IDENTITY_INSERT [dbo].[FileStore] OFF
SET IDENTITY_INSERT [dbo].[Localizations] ON 

INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (1, N'AppName1', N'home', N'en', N'Zajil')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (2, N'AppName1', N'home', N'ar', N'زاجل')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (3, N'AppName2', N'home', N'en', N'Shop')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (4, N'AppName2', N'home', N'ar', N'شوب')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (5, N'LangText', N'home', N'en', N'العربية')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (6, N'LangText', N'home', N'ar', N'EN')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (7, N'PlaceholderSearch', N'home', N'en', N'Search')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (8, N'PlaceholderSearch', N'home', N'ar', N'بحث')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (9, N'MenuHome', N'home', N'en', N'Home')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (10, N'MenuHome', N'home', N'ar', N'الرئيسية')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (11, N'MenuPopular', N'home', N'en', N'Popular')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (12, N'MenuPopular', N'home', N'ar', N'الأكثر شهرة')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (13, N'MenuAllCategories', N'home', N'en', N'All Categories')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (14, N'MenuAllCategories', N'home', N'ar', N'كل التصنيفات')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (15, N'MenuContactUs', N'home', N'en', N'Contact Us')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (16, N'MenuContactUs', N'home', N'ar', N'اتصل بنا')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (17, N'CopyrightText', N'home', N'en', N'Copyright © 2019 Zajil-Shop. All rights reserved.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (18, N'CopyrightText', N'home', N'ar', N'جميع الحقوق © 2019 محفوظة لدى زاجل شوب.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (19, N'SliderGetItNowButton', N'home', N'en', N'Get It Now')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (20, N'SliderGetItNowButton', N'home', N'ar', N'اطلب الان')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (21, N'PriceCurrency', N'home', N'en', N'EGP')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (22, N'PriceCurrency', N'home', N'ar', N'جنيه مصرى')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (23, N'OrderNowButton', N'home', N'en', N'Order Now')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (24, N'OrderNowButton', N'home', N'ar', N'اطلب الان')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (25, N'MostText', N'home', N'en', N'Most')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (26, N'MostText', N'home', N'ar', N'الأكثر')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (27, N'RequestedText', N'home', N'en', N'requested')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (28, N'RequestedText', N'home', N'ar', N'طلبا')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (29, N'RecommendedText', N'home', N'en', N'Recommended')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (30, N'RecommendedText', N'home', N'ar', N'الموصى به')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (31, N'AllText', N'categories', N'en', N'All')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (32, N'AllText', N'categories', N'ar', N'كل')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (33, N'CategoriesText', N'categories', N'en', N'categories')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (34, N'CategoriesText', N'categories', N'ar', N'التصنيفات')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (35, N'ContactUsMessageStatus', N'contact-us', N'en', N'Thank you, message sent successfully.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (36, N'ContactUsMessageStatus', N'contact-us', N'ar', N'شكرا .. تم ارسال رسالتك بنجاح.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (37, N'ContactText', N'contact-us', N'en', N'Contact')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (38, N'ContactText', N'contact-us', N'ar', N'اتصل')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (39, N'UsText', N'contact-us', N'en', N'us')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (40, N'UsText', N'contact-us', N'ar', N'بنا')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (41, N'GetInTouchText', N'contact-us', N'en', N'Get In Touch')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (42, N'GetInTouchText', N'contact-us', N'ar', N'كن على اتصال')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (43, N'PlaceholderName', N'contact-us', N'en', N'Name')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (44, N'PlaceholderName', N'contact-us', N'ar', N'الاسم')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (45, N'NameValidation', N'contact-us', N'en', N'Please enter your full name.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (46, N'NameValidation', N'contact-us', N'ar', N'من فضلك ادخل الاسم.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (47, N'PlaceholderEmail', N'contact-us', N'en', N'E-Mail')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (48, N'PlaceholderEmail', N'contact-us', N'ar', N'البريد الالكترونى')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (49, N'EmailValidation', N'contact-us', N'en', N'Please enter your e-mail address.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (50, N'EmailValidation', N'contact-us', N'ar', N'من فضلك ادخل البريد الالكترونى')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (51, N'PlaceholderMobileNumber', N'contact-us', N'en', N'Mobile number')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (52, N'PlaceholderMobileNumber', N'contact-us', N'ar', N'رقم الموبايل')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (53, N'MobileNumberValidation', N'contact-us', N'en', N'Please enter your mobile number.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (54, N'MobileNumberValidation', N'contact-us', N'ar', N'من فضلك ادخل رقم الموبايل.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (55, N'PlaceholderYourMessageHere', N'contact-us', N'en', N'Your message here')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (56, N'PlaceholderYourMessageHere', N'contact-us', N'ar', N'اكتب رسالتك هنا')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (57, N'MessageValidation', N'contact-us', N'en', N'Please enter  your message.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (58, N'MessageValidation', N'contact-us', N'ar', N'من فضلك ادخل رسالتك.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (59, N'SendButton', N'contact-us', N'en', N'Send')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (60, N'SendButton', N'contact-us', N'ar', N'ارسال')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (61, N'InvalidLoginMessage', N'login', N'en', N'Invalid user name or password!!')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (62, N'InvalidLoginMessage', N'login', N'ar', N'اسم المستخدم أو كلمة المرور غير صالحين.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (63, N'LoginText', N'login', N'en', N'Login')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (64, N'LoginText', N'login', N'ar', N'تسجيل الدخول')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (65, N'LoginToYourAccountText', N'login', N'en', N'Login to your account')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (66, N'LoginToYourAccountText', N'login', N'ar', N'قم بتسجيل الدخول الى حسابك')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (67, N'PlaceholderEmailAddress', N'login', N'en', N'E-Mail address')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (68, N'PlaceholderEmailAddress', N'login', N'ar', N'البريد الالكترونى')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (69, N'PlaceholderPassword', N'login', N'en', N'Password')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (70, N'PlaceholderPassword', N'login', N'ar', N'كلمة المرور')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (71, N'LoginButton', N'login', N'en', N'Login')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (72, N'LoginButton', N'login', N'ar', N'تسجيل الدخول')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (73, N'ProductRequestStatus', N'product-details', N'en', N'Thank you, we will contact you as soon as we can.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (74, N'ProductRequestStatus', N'product-details', N'ar', N'شكرا لطلبك .. سوف يقوم أحد مندوبينا بالاتصال بكم بأسرع وقت ممكن.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (75, N'AvailableQuantityText', N'product-details', N'en', N'Available Quantity')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (76, N'AvailableQuantityText', N'product-details', N'ar', N'الكمية المتاحة')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (77, N'SubmitAnOrderText', N'product-details', N'en', N'Submit an order')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (78, N'SubmitAnOrderText', N'product-details', N'ar', N'طلب المنتج')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (79, N'GUESTText', N'product-details', N'en', N'GUEST')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (80, N'GUESTText', N'product-details', N'ar', N'زائر')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (81, N'ProductRequestStatement', N'product-details', N'en', N'Product request statement Product request statement Product request statement Product request statement Product request statement Product request statement Product request statement Product request statement Product request statement ')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (82, N'ProductRequestStatement', N'product-details', N'ar', N'جملة طلب المنتج جملة طلب المنتج جملة طلب المنتج جملة طلب المنتج جملة طلب المنتج جملة طلب المنتج جملة طلب المنتج جملة طلب المنتج جملة طلب المنتج جملة طلب المنتج جملة طلب المنتج جملة طلب المنتج جملة طلب المنتج ')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (83, N'FillOrderDetailsText', N'product-details', N'en', N'Fill order details')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (84, N'FillOrderDetailsText', N'product-details', N'ar', N'استمارة طلب المنتج')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (85, N'PlaceholderName', N'product-details', N'en', N'Name')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (86, N'PlaceholderName', N'product-details', N'ar', N'الاسم')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (87, N'FullNameValidation', N'product-details', N'ar', N'من فضلك ادخل الاسم.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (88, N'FullNameValidation', N'product-details', N'en', N'Please enter your name.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (89, N'PlaceholderEMail', N'product-details', N'en', N'E-Mail address')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (90, N'PlaceholderEMail', N'product-details', N'ar', N'البريد الالكترونى')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (91, N'EMailAddressValidation', N'product-details', N'en', N'Please enter your E-Mail address')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (92, N'EMailAddressValidation', N'product-details', N'ar', N'من فضلك ادخل البريد الالكترونى')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (93, N'PlaceholderMobileNumber', N'product-details', N'en', N'Mobile number')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (94, N'PlaceholderMobileNumber', N'product-details', N'ar', N'رقم الموبايل')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (95, N'MobileNumberValidation', N'product-details', N'en', N'Please enter your mobile number.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (96, N'MobileNumberValidation', N'product-details', N'ar', N'من فضلك ادخل رقم الموبايل.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (97, N'PlaceholderAddress', N'product-details', N'en', N'Address')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (98, N'PlaceholderAddress', N'product-details', N'ar', N'العنوان')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (99, N'AddressValidation', N'product-details', N'en', N'Please enter your address.')
GO
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (100, N'AddressValidation', N'product-details', N'ar', N'من فضلك ادخل عنوانك.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (101, N'PlaceholderQuantity', N'product-details', N'en', N'Quantity')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (102, N'PlaceholderQuantity', N'product-details', N'ar', N'الكمية')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (103, N'QtyValidation', N'product-details', N'en', N'Please enter the desired quantity.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (104, N'QtyValidation', N'product-details', N'ar', N'من فضلك ادخل الكمية المطلوبة.')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (105, N'PlaceholderYourNotesHere', N'product-details', N'en', N'Your notes here')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (106, N'PlaceholderYourNotesHere', N'product-details', N'ar', N'ملاحظاتك هنا')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (107, N'OrderText', N'product-details', N'en', N'Order')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (108, N'OrderText', N'product-details', N'ar', N'اطلب')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (109, N'SearchResultsText', N'search-results', N'en', N'Search results')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (110, N'SearchResultsText', N'search-results', N'ar', N'نتائج البحث')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (111, N'SearchResultsOfText', N'search-results', N'en', N'Search results of ')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (112, N'SearchResultsOfText', N'search-results', N'ar', N'نتائج بحث ')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (113, N'ResultText', N'search-results', N'en', N'result')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (114, N'ResultText', N'search-results', N'ar', N'نتيجة')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (115, N'ContactInfoText', N'contact-us', N'en', N'Contact info')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (116, N'ContactInfoText', N'contact-us', N'ar', N'بيانات الاتصال')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (117, N'IncText', N'contact-us', N'en', N'Inc')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (118, N'SocialNetworkingText', N'contact-us', N'en', N'Social networking')
INSERT [dbo].[Localizations] ([LocalizationID], [Code], [Page], [Lang], [Text]) VALUES (119, N'SocialNetworkingText', N'contact-us', N'ar', N'شبكات التواصل الأجتماعى')
SET IDENTITY_INSERT [dbo].[Localizations] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductTypeID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [Price], [Qty], [IsHighlighted], [IsRecommended], [IsActive], [CreatedDate], [CategoryID]) VALUES (2, 1, N'تليفزيون توشيبا 43 بوصة', N'Toshiba 43 inch', N'تليفزيون توشيبا 43 بوصة', N' About toshiba 43 inch  About toshiba 43 inch  About toshiba 43 inch  About toshiba 43 inch  About toshiba 43 inch  About toshiba 43 inch About toshiba 43 inch ', 6000, 6, 1, 0, 1, NULL, 83)
INSERT [dbo].[Product] ([ProductID], [ProductTypeID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [Price], [Qty], [IsHighlighted], [IsRecommended], [IsActive], [CreatedDate], [CategoryID]) VALUES (3, 14, N'حفار x320 ', N'حفار x320 ', N'حفار x320 ', N'حفار x320 ', 700000, 2, 0, 0, 1, NULL, 85)
INSERT [dbo].[Product] ([ProductID], [ProductTypeID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [Price], [Qty], [IsHighlighted], [IsRecommended], [IsActive], [CreatedDate], [CategoryID]) VALUES (4, 14, N'جرار زراعى', N'جرار زراعى', N'جرار زراعى', N'جرار زراعى', 640000, 8, 0, 0, 1, NULL, 85)
INSERT [dbo].[Product] ([ProductID], [ProductTypeID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [Price], [Qty], [IsHighlighted], [IsRecommended], [IsActive], [CreatedDate], [CategoryID]) VALUES (5, 17, N'ثلاجة  كريازى 14 قدم', N'ثلاجة  كريازى 14 قدم', N'ثلاجة  كريازى 14 قدمsssss', N'ثلاجة  كريازى 14 قدم', 8000, 15, 0, 0, 1, NULL, 83)
INSERT [dbo].[Product] ([ProductID], [ProductTypeID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [Price], [Qty], [IsHighlighted], [IsRecommended], [IsActive], [CreatedDate], [CategoryID]) VALUES (6, 2, N'غسالة يونيفرسال', N'غسالة يونيفرسال', N'غسالة يونيفرسال', N'غسالة يونيفرسال', 6330, 75, 1, 1, 1, NULL, 83)
INSERT [dbo].[Product] ([ProductID], [ProductTypeID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [Price], [Qty], [IsHighlighted], [IsRecommended], [IsActive], [CreatedDate], [CategoryID]) VALUES (7, 2, N'كيتشن ماشين', N'كيتشن ماشين', N'كيتشن ماشين', N'كيتشن ماشين', 3500, 65, 1, 0, 1, NULL, 83)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Product.ProductAttributeValues] ON 

INSERT [dbo].[Product.ProductAttributeValues] ([ProductAttributeValueID], [ProductID], [AttributeID], [AttributeValue_AR], [AttributeValue_EN]) VALUES (5, 2, 4, N'FFF', N'FF')
SET IDENTITY_INSERT [dbo].[Product.ProductAttributeValues] OFF
SET IDENTITY_INSERT [dbo].[Product.Requests] ON 

INSERT [dbo].[Product.Requests] ([ProductRequestID], [ProductID], [FullName], [MobileNumber], [eMailAddress], [Address], [Qty], [Price], [TotalPrice], [RequestNotes], [CreatedDate], [IsDone]) VALUES (1, 2, N'عمر أحمد', N'01007330161', N'x@x.com', N'15 شارع 4 حى الزهور', 1, 6000, 6000, N'ممكن توصيل المنتج للعنوان المطلوب ؟', NULL, 1)
INSERT [dbo].[Product.Requests] ([ProductRequestID], [ProductID], [FullName], [MobileNumber], [eMailAddress], [Address], [Qty], [Price], [TotalPrice], [RequestNotes], [CreatedDate], [IsDone]) VALUES (2, 2, N'توفيق عبد العزيز', N'01005588888', N'y@y.com', N'حى القومية', 2, 6000, 12000, N'ممكن توصيل المنتج للعنوان المطلوب ؟', NULL, 1)
INSERT [dbo].[Product.Requests] ([ProductRequestID], [ProductID], [FullName], [MobileNumber], [eMailAddress], [Address], [Qty], [Price], [TotalPrice], [RequestNotes], [CreatedDate], [IsDone]) VALUES (3, 2, N'ryghtrty', N'12121212121', N'ftdfg', N'fdfdfdfdf', 5, 6000, 30000, N'sdfdsf', NULL, 0)
INSERT [dbo].[Product.Requests] ([ProductRequestID], [ProductID], [FullName], [MobileNumber], [eMailAddress], [Address], [Qty], [Price], [TotalPrice], [RequestNotes], [CreatedDate], [IsDone]) VALUES (4, 2, N'dsafsadf', N'01245454545', N'ads', N'ljh lihl', 6, 6000, 36000, N'sdfgsdfsf', NULL, 0)
SET IDENTITY_INSERT [dbo].[Product.Requests] OFF
SET IDENTITY_INSERT [dbo].[ProductAttribute] ON 

INSERT [dbo].[ProductAttribute] ([AttributeID], [AttributeName], [AttributeTitle_AR], [AttributeTitle_EN]) VALUES (2, N'اللون', N'متوفر بلون', N'متوفر بلون')
INSERT [dbo].[ProductAttribute] ([AttributeID], [AttributeName], [AttributeTitle_AR], [AttributeTitle_EN]) VALUES (3, N'الحجم', N'الحجم', N'الحجم')
INSERT [dbo].[ProductAttribute] ([AttributeID], [AttributeName], [AttributeTitle_AR], [AttributeTitle_EN]) VALUES (4, N'المقاس', N'المقاس', N'المقاس')
INSERT [dbo].[ProductAttribute] ([AttributeID], [AttributeName], [AttributeTitle_AR], [AttributeTitle_EN]) VALUES (5, N'الموديل', N'الموديل', N'الموديل')
SET IDENTITY_INSERT [dbo].[ProductAttribute] OFF
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeID], [Name_AR], [Name_EN], [IsActive], [IsDeleted], [CreatedDate]) VALUES (1, N'تليفزيونات', N'TVs', 1, 0, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [Name_AR], [Name_EN], [IsActive], [IsDeleted], [CreatedDate]) VALUES (2, N'غسالات', N'Washing machines', 1, 0, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [Name_AR], [Name_EN], [IsActive], [IsDeleted], [CreatedDate]) VALUES (14, N'لوادر', N'Loaders', 1, 0, CAST(N'2019-07-14 10:28:56.777' AS DateTime))
INSERT [dbo].[ProductType] ([ProductTypeID], [Name_AR], [Name_EN], [IsActive], [IsDeleted], [CreatedDate]) VALUES (15, N'موبايلات', N'Mobiles', 1, 0, CAST(N'2019-07-14 10:29:22.607' AS DateTime))
INSERT [dbo].[ProductType] ([ProductTypeID], [Name_AR], [Name_EN], [IsActive], [IsDeleted], [CreatedDate]) VALUES (16, N'تابلت', N'Tablets', 1, 0, CAST(N'2019-07-14 10:29:38.087' AS DateTime))
INSERT [dbo].[ProductType] ([ProductTypeID], [Name_AR], [Name_EN], [IsActive], [IsDeleted], [CreatedDate]) VALUES (17, N'ثلاجات', N'Fridges', 1, 0, CAST(N'2019-07-14 10:30:32.370' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductType] OFF
SET IDENTITY_INSERT [dbo].[ProductType.ProductAttributes] ON 

INSERT [dbo].[ProductType.ProductAttributes] ([ProductTypeAttributeValueID], [ProductTypeID], [AttributeID]) VALUES (59, 1, 2)
INSERT [dbo].[ProductType.ProductAttributes] ([ProductTypeAttributeValueID], [ProductTypeID], [AttributeID]) VALUES (60, 1, 3)
INSERT [dbo].[ProductType.ProductAttributes] ([ProductTypeAttributeValueID], [ProductTypeID], [AttributeID]) VALUES (61, 1, 5)
INSERT [dbo].[ProductType.ProductAttributes] ([ProductTypeAttributeValueID], [ProductTypeID], [AttributeID]) VALUES (62, 1, 4)
INSERT [dbo].[ProductType.ProductAttributes] ([ProductTypeAttributeValueID], [ProductTypeID], [AttributeID]) VALUES (63, 2, 2)
SET IDENTITY_INSERT [dbo].[ProductType.ProductAttributes] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [Password], [eMailAddress], [MobileNumber], [AboutHim], [GroupID], [CreatedDate], [ShowInfoToUsers], [IsActive], [IsDeleted], [LastLogin]) VALUES (1, N'محمد بحيرى', N'Omar@123', N'mohamd.behery@yahoo.com', N'01007330161', NULL, N'Admin', NULL, 1, 1, 0, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Password], [eMailAddress], [MobileNumber], [AboutHim], [GroupID], [CreatedDate], [ShowInfoToUsers], [IsActive], [IsDeleted], [LastLogin]) VALUES (2, N'سليمان السيد', N'Omar@123', N'soliman.elsayed@yahoo.com', N'01005545485', NULL, N'Admin', NULL, 1, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([GroupID], [Description]) VALUES (N'Admin', N'Administrators')
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products.Types] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Products_Products.Types]
GO
ALTER TABLE [dbo].[Product.ProductAttributeValues]  WITH CHECK ADD  CONSTRAINT [FK_Product.ProductAttributeValues_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Product.ProductAttributeValues] CHECK CONSTRAINT [FK_Product.ProductAttributeValues_Product]
GO
ALTER TABLE [dbo].[Product.ProductAttributeValues]  WITH CHECK ADD  CONSTRAINT [FK_Product.ProductAttributeValues_ProductAttribute] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[ProductAttribute] ([AttributeID])
GO
ALTER TABLE [dbo].[Product.ProductAttributeValues] CHECK CONSTRAINT [FK_Product.ProductAttributeValues_ProductAttribute]
GO
ALTER TABLE [dbo].[Product.Requests]  WITH CHECK ADD  CONSTRAINT [FK_Product.Requests_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Product.Requests] CHECK CONSTRAINT [FK_Product.Requests_Product]
GO
ALTER TABLE [dbo].[ProductType.ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_Products.Types.AttributesValues_Products.Types.AttributesValues] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[ProductType.ProductAttributes] CHECK CONSTRAINT [FK_Products.Types.AttributesValues_Products.Types.AttributesValues]
GO
ALTER TABLE [dbo].[ProductType.ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductType.ProductAttributes_ProductAttribute] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[ProductAttribute] ([AttributeID])
GO
ALTER TABLE [dbo].[ProductType.ProductAttributes] CHECK CONSTRAINT [FK_ProductType.ProductAttributes_ProductAttribute]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users.Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[UserGroup] ([GroupID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_Users_Users.Groups]
GO
USE [master]
GO
ALTER DATABASE [eShopping] SET  READ_WRITE 
GO
