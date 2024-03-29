USE [master]
GO
/****** Object:  Database [eShopping]    Script Date: 7/9/2019 12:57:26 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 7/9/2019 12:57:26 AM ******/
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
/****** Object:  Table [dbo].[ContactUs]    Script Date: 7/9/2019 12:57:26 AM ******/
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
/****** Object:  Table [dbo].[ContactUsMessages]    Script Date: 7/9/2019 12:57:26 AM ******/
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
/****** Object:  Table [dbo].[FileStore]    Script Date: 7/9/2019 12:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileStore](
	[FileStoreID] [bigint] IDENTITY(1,1) NOT NULL,
	[FileType] [int] NULL,
	[TypeID] [bigint] NOT NULL,
	[FilePath] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[FileExtension] [nvarchar](10) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.FileLines] PRIMARY KEY CLUSTERED 
(
	[FileStoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/9/2019 12:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductTypeID] [bigint] NULL,
	[Name_AR] [nvarchar](250) NULL,
	[Name_EN] [nvarchar](250) NULL,
	[Description_AR] [nvarchar](max) NULL,
	[Description_EN] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Qty] [int] NULL,
	[IsHighlighted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product.ProductAttributeValues]    Script Date: 7/9/2019 12:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product.ProductAttributeValues](
	[ProductAttributeValueID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[AttributeID] [bigint] NULL,
	[AttributeValue_AR] [nvarchar](max) NULL,
	[AttributeValue_EN] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product.Requests]    Script Date: 7/9/2019 12:57:26 AM ******/
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
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 7/9/2019 12:57:26 AM ******/
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
/****** Object:  Table [dbo].[ProductType]    Script Date: 7/9/2019 12:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name_AR] [nvarchar](50) NULL,
	[Name_EN] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Products.Types] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductType.ProductAttributes]    Script Date: 7/9/2019 12:57:26 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 7/9/2019 12:57:26 AM ******/
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
/****** Object:  Table [dbo].[UserGroup]    Script Date: 7/9/2019 12:57:26 AM ******/
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

INSERT [dbo].[Category] ([CategoryID], [ParentID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [IsHighlighted], [IsActive]) VALUES (83, NULL, N'أجهزة كهربائية', N'أجهزة كهربائية', N'أجهزة كهربائية', N'أجهزة كهربائية', 1, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [IsHighlighted], [IsActive]) VALUES (85, 0, N'معدات ثقيلة', N'معدات ثقيلة', N'معدات ثقيلة', N'معدات ثقيلة', 1, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[ContactUs] ON 

INSERT [dbo].[ContactUs] ([ContactUsID], [AboutUs_AR], [AboutUs_EN], [Address_AR], [Address_EN], [MobileNumber], [FaxNumber], [eMailAddress], [FaceBookURL], [GooglePlusURL], [YoutubeURL], [TwitterURL], [LastModified], [FooterStatement_AR], [FooterStatement_EN]) VALUES (1, N'ننن', N'ننن', N'ت', N'نننننننن', N'ننن', N'ننن', N'ننن', N'kkkkkkkkkk', N'ننن', N'ننن', N'ننن', CAST(N'2019-07-08 23:21:52.847' AS DateTime), N'ننن', N'نن')
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
SET IDENTITY_INSERT [dbo].[ContactUsMessages] ON 

INSERT [dbo].[ContactUsMessages] ([ContactUsMessageID], [FullName], [eMailAddress], [MobileNumber], [MessageContent], [IsRead], [IsDeleted], [CreatedDate]) VALUES (2, N'mohamed', N'medo@gmail.com', N'01067636963', N'zoka', 1, 0, CAST(N'2019-12-26 00:00:00.000' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ContactUsMessageID], [FullName], [eMailAddress], [MobileNumber], [MessageContent], [IsRead], [IsDeleted], [CreatedDate]) VALUES (6, N'mohameddddddd', N'medo@gmail.com', N'01067636963', N' سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا سوف تقوم بفعل هذا', 1, 0, CAST(N'2019-06-06 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ContactUsMessages] OFF
SET IDENTITY_INSERT [dbo].[FileStore] ON 

INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (33, 2, 83, N'file_2_83_Screenshot_1.png', N'file_2_83_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-07 23:51:50.270' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (40, 3, 2, N'Products_3_2_Screenshot_1.png', N'Products_3_2_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-08 21:56:44.240' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (41, 3, 2, N'http://localhost/eShoppingAPI/Uploads/Products/Products_3_2_Screenshot_1.png', N'Products_3_2_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-08 21:56:44.240' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (42, 3, 2, N'Products_3_2_Screenshot_1.png', N'Products_3_2_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-08 21:59:57.490' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (43, 3, 2, N'http://localhost/eShoppingAPI/Uploads/Products/Products_3_2_Screenshot_1.png', N'Products_3_2_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-08 21:56:44.240' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (44, 2, 83, N'http://localhost/eShoppingAPI/Uploads/Categories/file_2_83_Screenshot_1.png', N'file_2_83_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-07 23:51:50.270' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (45, 2, 85, N'Categories_2_85_Screenshot_1.png', N'Categories_2_85_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-08 22:27:21.377' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (46, 3, 3, N'Products_3_3_Screenshot_1.png', N'Products_3_3_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-08 22:28:51.990' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (47, 3, 4, N'Products_3_4_Screenshot_1.png', N'Products_3_4_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-08 22:33:45.647' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (48, 3, 5, N'Products_3_5_Screenshot_1.png', N'Products_3_5_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-08 22:35:47.457' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (49, 3, 5, N'http://localhost/eShoppingAPI/Uploads/Products/Products_3_5_Screenshot_1.png', N'Products_3_5_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-08 22:35:47.457' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (50, 3, 6, N'Products_3_6_Screenshot_1.png', N'Products_3_6_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-08 22:40:37.433' AS DateTime))
INSERT [dbo].[FileStore] ([FileStoreID], [FileType], [TypeID], [FilePath], [FileName], [FileExtension], [IsActive], [CreatedDate]) VALUES (51, 3, 7, N'Products_3_7_Screenshot_1.png', N'Products_3_7_Screenshot_1.png', N'image/png', 1, CAST(N'2019-07-08 22:43:36.987' AS DateTime))
SET IDENTITY_INSERT [dbo].[FileStore] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductTypeID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [Price], [Qty], [IsHighlighted], [IsActive], [CreatedDate], [CategoryID]) VALUES (2, NULL, N'تليفزيون توشيبا 43 بوصة', N'تليفزيون توشيبا 43 بوصة', N'تليفزيون توشيبا 43 بوصة', N'تليفزيون توشيبا 43 بوصة', 6000, 6, 1, 1, NULL, 83)
INSERT [dbo].[Product] ([ProductID], [ProductTypeID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [Price], [Qty], [IsHighlighted], [IsActive], [CreatedDate], [CategoryID]) VALUES (3, NULL, N'حفار x320 ', N'حفار x320 ', N'حفار x320 ', N'حفار x320 ', 700000, 2, 0, 1, CAST(N'2019-07-08 22:28:51.967' AS DateTime), 85)
INSERT [dbo].[Product] ([ProductID], [ProductTypeID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [Price], [Qty], [IsHighlighted], [IsActive], [CreatedDate], [CategoryID]) VALUES (4, NULL, N'جرار زراعى', N'جرار زراعى', N'جرار زراعى', N'جرار زراعى', 640000, 8, 0, 1, CAST(N'2019-07-08 22:33:45.647' AS DateTime), 85)
INSERT [dbo].[Product] ([ProductID], [ProductTypeID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [Price], [Qty], [IsHighlighted], [IsActive], [CreatedDate], [CategoryID]) VALUES (5, NULL, N'ثلاجة  كريازى 14 قدم', N'ثلاجة  كريازى 14 قدم', N'ثلاجة  كريازى 14 قدم', N'ثلاجة  كريازى 14 قدم', 8000, 15, 0, 1, NULL, 83)
INSERT [dbo].[Product] ([ProductID], [ProductTypeID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [Price], [Qty], [IsHighlighted], [IsActive], [CreatedDate], [CategoryID]) VALUES (6, NULL, N'غسالة يونيفرسال', N'غسالة يونيفرسال', N'غسالة يونيفرسال', N'غسالة يونيفرسال', 6330, 75, 1, 1, CAST(N'2019-07-08 22:40:37.430' AS DateTime), 83)
INSERT [dbo].[Product] ([ProductID], [ProductTypeID], [Name_AR], [Name_EN], [Description_AR], [Description_EN], [Price], [Qty], [IsHighlighted], [IsActive], [CreatedDate], [CategoryID]) VALUES (7, NULL, N'كيتشن ماشين', N'كيتشن ماشين', N'كيتشن ماشين', N'كيتشن ماشين', 3500, 65, 1, 1, CAST(N'2019-07-08 22:43:36.987' AS DateTime), 83)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Product.Requests] ON 

INSERT [dbo].[Product.Requests] ([ProductRequestID], [ProductID], [FullName], [MobileNumber], [eMailAddress], [Address], [Qty], [Price], [TotalPrice], [RequestNotes], [CreatedDate], [IsDone]) VALUES (1, 2, N'عمر أحمد', N'01007330161', N'x@x.com', N'15 شارع 4 حى الزهور', 1, 6000, 6000, N'ممكن توصيل المنتج للعنوان المطلوب ؟', NULL, 1)
INSERT [dbo].[Product.Requests] ([ProductRequestID], [ProductID], [FullName], [MobileNumber], [eMailAddress], [Address], [Qty], [Price], [TotalPrice], [RequestNotes], [CreatedDate], [IsDone]) VALUES (2, 2, N'توفيق عبد العزيز', N'01005588888', N'y@y.com', N'حى القومية', 2, 6000, 12000, N'ممكن توصيل المنتج للعنوان المطلوب ؟', NULL, 1)
SET IDENTITY_INSERT [dbo].[Product.Requests] OFF
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeID], [Name_AR], [Name_EN], [IsActive], [IsDeleted], [CreatedDate]) VALUES (1, N'أجهزة كهربائية', N'أجهزة كهربائية', 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [Password], [eMailAddress], [MobileNumber], [AboutHim], [GroupID], [CreatedDate], [ShowInfoToUsers], [IsActive], [IsDeleted], [LastLogin]) VALUES (1, N'Behery', N'Omar@123', N'mohamd.behery@yahoo.com', NULL, NULL, N'Admin', NULL, 1, 1, 0, NULL)
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
