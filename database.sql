USE [master]
GO
/****** Object:  Database [TeddySneaker]    Script Date: 11/30/2024 12:39:08 AM ******/
CREATE DATABASE [TeddySneaker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeddySneaker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TeddySneaker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TeddySneaker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TeddySneaker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TeddySneaker] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeddySneaker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeddySneaker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeddySneaker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeddySneaker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeddySneaker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeddySneaker] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeddySneaker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TeddySneaker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeddySneaker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeddySneaker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeddySneaker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeddySneaker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeddySneaker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeddySneaker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeddySneaker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeddySneaker] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TeddySneaker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeddySneaker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeddySneaker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeddySneaker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeddySneaker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeddySneaker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeddySneaker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeddySneaker] SET RECOVERY FULL 
GO
ALTER DATABASE [TeddySneaker] SET  MULTI_USER 
GO
ALTER DATABASE [TeddySneaker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeddySneaker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeddySneaker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeddySneaker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TeddySneaker] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TeddySneaker] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TeddySneaker', N'ON'
GO
ALTER DATABASE [TeddySneaker] SET QUERY_STORE = ON
GO
ALTER DATABASE [TeddySneaker] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TeddySneaker]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 11/30/2024 12:39:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime] NULL,
	[description] [nvarchar](255) NULL,
	[modified_at] [datetime] NULL,
	[name] [nvarchar](255) NOT NULL,
	[status] [bit] NULL,
	[thumbnail] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11/30/2024 12:39:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[name] [nvarchar](255) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 11/30/2024 12:39:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[post_id] [int] NULL,
	[product_id] [varchar](255) NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 11/30/2024 12:39:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[link] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[size] [bigint] NULL,
	[type] [varchar](255) NULL,
	[created_by] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/30/2024 12:39:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[note] [nvarchar](255) NULL,
	[price] [bigint] NULL,
	[promotion] [varchar](max) NULL,
	[quantity] [int] NULL,
	[receiver_address] [nvarchar](255) NULL,
	[receiver_name] [nvarchar](255) NULL,
	[receiver_phone] [nvarchar](255) NULL,
	[size] [int] NULL,
	[status] [int] NULL,
	[total_price] [bigint] NULL,
	[buyer] [int] NULL,
	[created_by] [int] NULL,
	[modified_by] [int] NULL,
	[product_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 11/30/2024 12:39:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[description] [nvarchar](max) NULL,
	[modified_at] [datetime] NULL,
	[published_at] [datetime] NULL,
	[slug] [varchar](max) NULL,
	[status] [int] NULL,
	[thumbnail] [nvarchar](255) NULL,
	[title] [nvarchar](255) NOT NULL,
	[created_by] [int] NULL,
	[modified_by] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/30/2024 12:39:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[description] [nvarchar](max) NULL,
	[image_feedback] [varchar](max) NULL,
	[images] [varchar](max) NULL,
	[modified_at] [datetime] NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [bigint] NULL,
	[sale_price] [bigint] NULL,
	[slug] [varchar](255) NOT NULL,
	[status] [bit] NULL,
	[total_sold] [bigint] NULL,
	[product_view] [int] NULL,
	[brand_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_category]    Script Date: 11/30/2024 12:39:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_category](
	[product_id] [varchar](255) NULL,
	[category_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_size]    Script Date: 11/30/2024 12:39:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_size](
	[product_id] [varchar](255) NOT NULL,
	[size] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 11/30/2024 12:39:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[coupon_code] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[discount_type] [int] NULL,
	[discount_value] [bigint] NULL,
	[expired_at] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_public] [bit] NULL,
	[maximum_discount_value] [bigint] NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statistic]    Script Date: 11/30/2024 12:39:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statistic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime] NULL,
	[profit] [bigint] NULL,
	[quantity] [int] NULL,
	[sales] [bigint] NULL,
	[order_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/30/2024 12:39:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[avatar] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[email] [varchar](200) NOT NULL,
	[full_name] [nvarchar](255) NULL,
	[modified_at] [datetime] NULL,
	[password] [varchar](255) NOT NULL,
	[phone] [varchar](255) NULL,
	[roles] [varchar](255) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([id], [created_at], [description], [modified_at], [name], [status], [thumbnail]) VALUES (1, CAST(N'2024-11-10T23:36:23.307' AS DateTime), NULL, NULL, N'Adidas', 1, N'/media/static/52387f54-881d-458e-97f9-dcf530e3dfd9.png')
INSERT [dbo].[brand] ([id], [created_at], [description], [modified_at], [name], [status], [thumbnail]) VALUES (2, CAST(N'2024-11-10T23:36:45.697' AS DateTime), NULL, NULL, N'Converse', 1, N'/media/static/6d33b39e-3471-460c-8572-e0902b2406d5.png')
INSERT [dbo].[brand] ([id], [created_at], [description], [modified_at], [name], [status], [thumbnail]) VALUES (3, CAST(N'2024-11-10T23:41:32.847' AS DateTime), NULL, NULL, N'Li-Ning', 1, N'/media/static/1458d5a0-5c09-4e89-9d9b-d795b9ffb062.jpg')
INSERT [dbo].[brand] ([id], [created_at], [description], [modified_at], [name], [status], [thumbnail]) VALUES (4, CAST(N'2024-11-18T15:11:36.797' AS DateTime), NULL, NULL, N'Vans', 1, N'/media/static/d8256c48-7eff-4847-9993-153a40642491.png')
INSERT [dbo].[brand] ([id], [created_at], [description], [modified_at], [name], [status], [thumbnail]) VALUES (5, CAST(N'2024-11-18T15:47:54.573' AS DateTime), NULL, NULL, N'Nike', 1, N'/media/static/46932f41-7ef4-496d-9b85-625f0564b188.png')
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [created_at], [modified_at], [name], [slug], [status]) VALUES (1, CAST(N'2024-11-10T23:38:20.263' AS DateTime), NULL, N'Giày chạy bộ', N'giay-chay-bo', 1)
INSERT [dbo].[category] ([id], [created_at], [modified_at], [name], [slug], [status]) VALUES (2, CAST(N'2024-11-10T23:39:43.483' AS DateTime), NULL, N'Giày thời trang', N'giay-thoi-trang', 1)
INSERT [dbo].[category] ([id], [created_at], [modified_at], [name], [slug], [status]) VALUES (3, CAST(N'2024-11-10T23:40:09.237' AS DateTime), NULL, N'Giày bóng rổ', N'giay-bong-ro', 1)
INSERT [dbo].[category] ([id], [created_at], [modified_at], [name], [slug], [status]) VALUES (4, CAST(N'2024-11-18T15:05:59.137' AS DateTime), NULL, N'Giày Golf', N'giay-golf', 1)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'0ef8c29c-ebfb-487f-90cb-53986982624f', CAST(N'2024-11-18T15:38:02.570' AS DateTime), N'/media/static/0ef8c29c-ebfb-487f-90cb-53986982624f.jpg', N'file', 66538, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'110e76d4-14ff-494f-8a1a-a425701e02e1', CAST(N'2024-11-11T00:00:00.280' AS DateTime), N'/media/static/110e76d4-14ff-494f-8a1a-a425701e02e1.jpg', N'file', 124137, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'1458d5a0-5c09-4e89-9d9b-d795b9ffb062', CAST(N'2024-11-10T23:41:28.800' AS DateTime), N'/media/static/1458d5a0-5c09-4e89-9d9b-d795b9ffb062.jpg', N'file', 65008, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'19ffbeeb-6a0a-4eed-a47c-373ded995ce3', CAST(N'2024-11-18T15:38:09.233' AS DateTime), N'/media/static/19ffbeeb-6a0a-4eed-a47c-373ded995ce3.jpg', N'file', 27443, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'2171eba0-b8f9-4c86-abf6-d469aee194a6', CAST(N'2024-11-18T15:53:04.153' AS DateTime), N'/media/static/2171eba0-b8f9-4c86-abf6-d469aee194a6.jpg', N'file', 172072, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'264c91be-6527-41c8-80b6-751a0d7a81d9', CAST(N'2024-11-18T15:21:46.000' AS DateTime), N'/media/static/264c91be-6527-41c8-80b6-751a0d7a81d9.jpg', N'file', 117629, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'2fab65f9-d283-4320-9610-9cad1141e0a2', CAST(N'2024-11-10T23:49:16.840' AS DateTime), N'/media/static/2fab65f9-d283-4320-9610-9cad1141e0a2.jpg', N'file', 129005, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'355f4498-0e77-4a09-8006-ea37a34763df', CAST(N'2024-11-12T23:58:38.570' AS DateTime), N'/media/static/355f4498-0e77-4a09-8006-ea37a34763df.jpg', N'file', 167712, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'360de7a9-03d0-4ce3-9400-51aa86649d34', CAST(N'2024-11-18T15:38:17.150' AS DateTime), N'/media/static/360de7a9-03d0-4ce3-9400-51aa86649d34.jpg', N'file', 143173, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'46932f41-7ef4-496d-9b85-625f0564b188', CAST(N'2024-11-18T15:47:50.267' AS DateTime), N'/media/static/46932f41-7ef4-496d-9b85-625f0564b188.png', N'file', 3685, N'png', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'52387f54-881d-458e-97f9-dcf530e3dfd9', CAST(N'2024-11-10T23:36:17.273' AS DateTime), N'/media/static/52387f54-881d-458e-97f9-dcf530e3dfd9.png', N'file', 3831, N'png', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'63a2e3a4-67a9-4205-bc8b-13e1b09a9ae8', CAST(N'2024-11-19T22:49:22.573' AS DateTime), N'/media/static/63a2e3a4-67a9-4205-bc8b-13e1b09a9ae8.jpg', N'file', 591855, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'695a4e53-c390-4864-833a-001451f12ed2', CAST(N'2024-11-18T15:38:22.970' AS DateTime), N'/media/static/695a4e53-c390-4864-833a-001451f12ed2.jpg', N'file', 268324, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'6d33b39e-3471-460c-8572-e0902b2406d5', CAST(N'2024-11-10T23:36:40.320' AS DateTime), N'/media/static/6d33b39e-3471-460c-8572-e0902b2406d5.png', N'file', 2689, N'png', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'79577391-e505-4196-a09b-5f5dc465ab09', CAST(N'2024-11-19T22:49:18.893' AS DateTime), N'/media/static/79577391-e505-4196-a09b-5f5dc465ab09.jpg', N'file', 355957, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'7cdc078c-c47c-4ab5-9a8a-065a29ec1f52', CAST(N'2024-11-18T15:21:40.227' AS DateTime), N'/media/static/7cdc078c-c47c-4ab5-9a8a-065a29ec1f52.jpg', N'file', 158089, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'8e430a5f-d84f-4c5f-b223-13bd79e07a36', CAST(N'2024-11-10T23:49:08.673' AS DateTime), N'/media/static/8e430a5f-d84f-4c5f-b223-13bd79e07a36.jpg', N'file', 96727, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'8ea15e82-180e-46e8-af31-73c9faf8d51d', CAST(N'2024-11-18T15:53:00.923' AS DateTime), N'/media/static/8ea15e82-180e-46e8-af31-73c9faf8d51d.jpg', N'file', 160743, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'9cae2742-edd3-4d6a-aa44-70ced2504311', CAST(N'2024-11-10T23:59:46.190' AS DateTime), N'/media/static/9cae2742-edd3-4d6a-aa44-70ced2504311.jpg', N'file', 32726, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'b5cf803a-9f59-4898-bb25-9c0154034028', CAST(N'2024-11-18T15:21:33.920' AS DateTime), N'/media/static/b5cf803a-9f59-4898-bb25-9c0154034028.jpg', N'file', 224628, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'c58dc5ed-50af-40c8-b914-855b675a7783', CAST(N'2024-11-10T23:59:50.383' AS DateTime), N'/media/static/c58dc5ed-50af-40c8-b914-855b675a7783.jpg', N'file', 160929, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'ca95fa50-faa4-4f20-a867-7cf49ab69c89', CAST(N'2024-11-10T23:59:39.773' AS DateTime), N'/media/static/ca95fa50-faa4-4f20-a867-7cf49ab69c89.jpg', N'file', 105502, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'cc09f886-e279-4306-ac3d-2a1061b31dc5', CAST(N'2024-11-18T15:52:50.073' AS DateTime), N'/media/static/cc09f886-e279-4306-ac3d-2a1061b31dc5.jpg', N'file', 43154, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'cdf26373-640b-4cc9-9688-2cb3c8c9a1a7', CAST(N'2024-11-18T15:21:50.670' AS DateTime), N'/media/static/cdf26373-640b-4cc9-9688-2cb3c8c9a1a7.jpg', N'file', 150935, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'ce2eee12-95d6-4bee-9df3-06dae6fad726', CAST(N'2024-11-18T15:52:57.007' AS DateTime), N'/media/static/ce2eee12-95d6-4bee-9df3-06dae6fad726.jpg', N'file', 161749, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'd763511f-cca0-4c9d-8f6d-7a5c286db9d1', CAST(N'2024-11-10T23:49:44.437' AS DateTime), N'/media/static/d763511f-cca0-4c9d-8f6d-7a5c286db9d1.jpg', N'file', 100900, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'd8256c48-7eff-4847-9993-153a40642491', CAST(N'2024-11-18T15:11:32.440' AS DateTime), N'/media/static/d8256c48-7eff-4847-9993-153a40642491.png', N'file', 4614, N'png', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'dbb90bdf-c4c5-4698-a7fe-b71edc2d31c2', CAST(N'2024-11-10T23:49:02.090' AS DateTime), N'/media/static/dbb90bdf-c4c5-4698-a7fe-b71edc2d31c2.jpg', N'file', 49880, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'e7840b08-ae24-4378-884b-5b31cceb402f', CAST(N'2024-11-18T15:21:48.247' AS DateTime), N'/media/static/e7840b08-ae24-4378-884b-5b31cceb402f.jpg', N'file', 165080, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'ee1c78b0-f9c3-4f4f-855e-af73e6daf900', CAST(N'2024-11-19T22:54:07.013' AS DateTime), N'/media/static/ee1c78b0-f9c3-4f4f-855e-af73e6daf900.jpg', N'file', 161749, N'jpg', 2)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'f0be828b-d0e4-4fc6-9bd6-86a21ba49007', CAST(N'2024-11-19T22:49:15.133' AS DateTime), N'/media/static/f0be828b-d0e4-4fc6-9bd6-86a21ba49007.jpg', N'file', 301976, N'jpg', 2)
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (1, CAST(N'2024-11-11T00:05:10.080' AS DateTime), CAST(N'2024-11-16T22:17:19.760' AS DateTime), N'asdasd', 1500000, NULL, 1, N'asdasd', N'Đức', N'0345239051', 40, 4, 1400000, 1, 1, 2, N'9655JA')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (2, CAST(N'2024-11-11T23:55:31.463' AS DateTime), NULL, N'asdasdsa', 1500000, NULL, 1, N'asdasd', N'Đức', N'0345239051', 37, 5, 1400000, 1, 1, NULL, N'9655JA')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (3, CAST(N'2024-11-12T00:00:09.587' AS DateTime), NULL, N'jhgjhg', 1500000, NULL, 1, N'jkkjh', N'Đức', N'0345239051', 38, 5, 1400000, 1, 1, NULL, N'9655JA')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (4, CAST(N'2024-11-15T17:35:12.200' AS DateTime), NULL, N'', 1500000, NULL, 1, N'sádasdasd', N'Đức', N'0345239051', 37, 5, 1500000, 1, 1, NULL, N'9655JA')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (5, CAST(N'2024-11-16T22:08:44.270' AS DateTime), CAST(N'2024-11-18T15:54:20.417' AS DateTime), N'', 1500000, NULL, 1, N'xzczxc', N'Đức', N'0345678912', 37, 3, 1500000, 5, 5, 2, N'9655JA')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (6, CAST(N'2024-11-16T22:19:18.397' AS DateTime), CAST(N'2024-11-16T22:19:39.003' AS DateTime), N'', 1500000, NULL, 1, N'sasdasd', N'Admin', N'0345678912', 38, 3, 1500000, 2, 2, 2, N'9655JA')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (7, CAST(N'2024-11-16T22:20:28.757' AS DateTime), CAST(N'2024-11-28T21:45:36.970' AS DateTime), N'', 1500000, NULL, 1, N'sasdasd', N'Admin', N'0345678912', 37, 3, 1500000, 2, 2, 2, N'9655JA')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (8, CAST(N'2024-11-18T14:39:16.900' AS DateTime), CAST(N'2024-11-18T15:54:10.480' AS DateTime), N'', 1500000, NULL, 1, N'asdasd', N'User', N'0987654321', 37, 3, 1500000, 6, 6, 2, N'9655JA')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (10, CAST(N'2024-11-19T22:56:35.377' AS DateTime), CAST(N'2024-11-19T22:57:21.510' AS DateTime), N'asdasd', 1490000, NULL, 1, N'asdasdas', N'sadsaas', N'0345239051', 39, 3, 1460000, 2, 2, 2, N'KeaYXM')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (11, CAST(N'2024-11-19T22:58:19.647' AS DateTime), NULL, N'', 2200000, NULL, 1, N'sasdasd', N'Admin', N'0345678912', 37, 5, 2170000, 2, 2, NULL, N'5UIkXm')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (12, CAST(N'2024-11-21T17:57:25.970' AS DateTime), CAST(N'2024-11-28T22:42:30.547' AS DateTime), N'kjhioh', 2200000, N'{"couponCode":"KM01","discountType":1,"discountValue":12,"maximumDiscountValue":30000}', 1, N'sasdasd', N'Admin', N'0345678912', 35, 3, 2170000, 2, 2, 2, N'5UIkXm')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (13, CAST(N'2024-11-22T14:41:27.747' AS DateTime), CAST(N'2024-11-23T22:42:37.410' AS DateTime), N'ffsdfs', 2200000, N'{"couponCode":"KM01","discountType":1,"discountValue":12,"maximumDiscountValue":30000}', 1, N'dsfdsf', N'esdf', N'0345123456', 35, 5, 2170000, 2, 2, 2, N'5UIkXm')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (14, CAST(N'2024-11-28T21:53:11.903' AS DateTime), CAST(N'2024-11-28T21:53:17.783' AS DateTime), N'', 2200000, NULL, 1, N'Test
', N'Test', N'0987654321', 35, 5, 2200000, 2, 2, 2, N'5UIkXm')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (15, CAST(N'2024-11-28T21:54:48.207' AS DateTime), CAST(N'2024-11-28T21:55:24.757' AS DateTime), N'', 2200000, NULL, 1, N'Test', N'Test', N'0987654321', 35, 5, 2200000, 2, 2, 2, N'5UIkXm')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (16, CAST(N'2024-11-28T22:03:24.730' AS DateTime), CAST(N'2024-11-29T22:05:42.513' AS DateTime), N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 2200000, N'{"couponCode":"KM02","discountType":1,"discountValue":20,"maximumDiscountValue":300000}', 1, N'lkjkljkljl', N'Test', N'aa', 39, 1, 1900000, 2, 2, 2, N'5UIkXm')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (17, CAST(N'2024-11-29T23:26:07.610' AS DateTime), NULL, N'', 2200000, NULL, 1, N'Tesst', N'Test', N'0987654321', 43, 1, 2200000, 2, 2, NULL, N'5UIkXm')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([id], [content], [created_at], [description], [modified_at], [published_at], [slug], [status], [thumbnail], [title], [created_by], [modified_by]) VALUES (1, N'<p>Đây là bài viết test</p>', CAST(N'2024-11-12T23:58:44.397' AS DateTime), N'<p>Đây là bài viết test</p>', NULL, CAST(N'2024-11-12T23:58:44.397' AS DateTime), N'bai-viet-test', 1, N'/media/static/355f4498-0e77-4a09-8006-ea37a34763df.jpg', N'Bài viết test', 1, NULL)
INSERT [dbo].[post] ([id], [content], [created_at], [description], [modified_at], [published_at], [slug], [status], [thumbnail], [title], [created_by], [modified_by]) VALUES (4, N'<p>san pham moi</p>', CAST(N'2024-11-19T22:54:22.090' AS DateTime), N'<p><br></p>', CAST(N'2024-11-19T22:55:31.023' AS DateTime), CAST(N'2024-11-19T22:54:22.090' AS DateTime), N'adidas', 1, N'/media/static/ee1c78b0-f9c3-4f4f-855e-af73e6daf900.jpg', N'adidas', 2, 2)
SET IDENTITY_INSERT [dbo].[post] OFF
GO
INSERT [dbo].[product] ([id], [created_at], [description], [image_feedback], [images], [modified_at], [name], [price], [sale_price], [slug], [status], [total_sold], [product_view], [brand_id]) VALUES (N'5UIkXm', CAST(N'2024-11-18T15:53:16.280' AS DateTime), N'<p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Giới thiệu đôi giày thể thao nữ mạnh mẽ nhất –&nbsp;&nbsp;(WMNS) Nike Pegasus 40 Premium ‘Pink Acid Wash’. Được thiết kế để giúp bạn chinh phục những đỉnh cao mới, đôi giày thể thao tuyệt vời này mang đến sự thoải mái, phong cách và hiệu suất tối ưu. Hãy sẵn sàng cách mạng hóa cuộc tập luyện với mỗi bước chạy!</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Được chế tác với sự tinh tế và chính xác, Nike Pegasus 40 Premium có thiết kế tinh tế sẽ thu hút ánh nhìn trong những chạy tiếp theo của bạn. Với màu hồng ngọc trai/hồng san hô năng động kết hợp với những đường nét nổi bật trắng và xanh đậm, đôi giày thể thao này tỏa ra sự tự tin và thanh lịch.</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Với công nghệ Zoom đột phá của Nike, Pegasus 40 Premium cung cấp đệm êm tối ưu và hỗ trợ vượt trội. Nó giúp bạn chấm dứt sự không thoải mái và mang đến cuộc chạy nhẹ nhàng, phản ứng nhanh giúp bạn tiếp tục chạy một dặm sau một dặm. Phần trên bằng lưới nhẹ nâng cao sự thoáng khí, đảm bảo đôi chân luôn khô ráo và mát mẻ ngay cả trong những buổi tập luyện căng thẳng nhất.</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Đôi giày thể thao tuyệt vời này được thiết kế để chinh phục những chặng đường dài nhất và những buổi tập luyện khó nhất của bạn. Nó cung cấp độ bám đường tốt hơn với đế cao su bền, đảm bảo bám vững chắc trên mọi địa hình. Hãy cột dây và trải nghiệm hiệu suất chạy tới tầm cao mới.</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Vậy tại sao bạn lại chờ đợi? Nâng tầm hiệu suất chạy của bạn với Nike Pegasus 40 Premium và khai phá tiềm năng thật sự của mình. Đặt hàng của bạn ngay hôm nay và chinh phục đường đua như chưa bao giờ có trước đây!</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Điểm nổi bật:</p><ul style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; margin-left: 0.7em; padding-left: 1.3em; list-style: none; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><li style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;">Công nghệ Zoom của Nike cho đệm êm tối ưu</li><li style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;">Phần trên lưới nhẹ giúp thoáng khí</li><li style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;">Đế cao su bền giúp tăng cường độ bám đường</li><li style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;">Kết hợp màu hồng ngọc trai/hồng san hô/trắng/xanh đậm nổi bật</li></ul>', NULL, N'["/media/static/cc09f886-e279-4306-ac3d-2a1061b31dc5.jpg","/media/static/ce2eee12-95d6-4bee-9df3-06dae6fad726.jpg","/media/static/8ea15e82-180e-46e8-af31-73c9faf8d51d.jpg","/media/static/2171eba0-b8f9-4c86-abf6-d469aee194a6.jpg"]', NULL, N'Giày (WMNS) Nike Pegasus 40 Premium ‘Pink Acid Wash’', 1500000, 2200000, N'giay-wmns-nike-pegasus-40-premium-pink-acid-wash', 1, 1, 24, 5)
INSERT [dbo].[product] ([id], [created_at], [description], [image_feedback], [images], [modified_at], [name], [price], [sale_price], [slug], [status], [total_sold], [product_view], [brand_id]) VALUES (N'947mfL', CAST(N'2024-11-18T15:22:18.887' AS DateTime), N'<div style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Giày Giày Li-Ning thời trang Nam: Phong cách, năng động, thoải mái<p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px;"></p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px;">Đặc điểm nổi bật:</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px;">Thiết kế thời trang:&nbsp;Kiểu dáng hiện đại, phối màu trẻ trung, dễ phối đồ.<br style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Chất liệu cao cấp: Thân giày bằng da tổng hợp cao cấp, mềm mại, bền đẹp.<br style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Lót trong bằng vải dệt thoáng khí, tạo cảm giác êm ái.<br style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Đế ngoài bằng cao su tổng hợp, chống trơn trượt, tăng độ bám.<br style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Công nghệ tiên tiến:Đệm Li-Ning Cloud: Mang lại cảm giác êm ái, nhẹ nhàng, hỗ trợ tối ưu cho từng bước di chuyển.<br style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Công nghệ TUFF RB: Tăng độ bền, chống mài mòn cho đế giày.<br style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Thoải mái và linh hoạt:&nbsp;Giúp di chuyển nhẹ nhàng, linh hoạt trong mọi hoạt động.<br style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Ưu điểm:</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 0px;">Thiết kế thời trang, dễ phối đồ.<br style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Chất liệu cao cấp, bền đẹp, tạo cảm giác êm ái.<br style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Công nghệ tiên tiến, hỗ trợ di chuyển thoải mái.<br style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Giá thành hợp lý.</p></div><div style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Hướng dẫn bảo quản:<p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px;"></p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 0px;">Lau hoặc giặt nhẹ với nước<br style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Không sử dụng chất tẩy<br style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Tránh phơi trực tiếp dưới ánh nắng gắt</p></div>', NULL, N'["/media/static/b5cf803a-9f59-4898-bb25-9c0154034028.jpg","/media/static/7cdc078c-c47c-4ab5-9a8a-065a29ec1f52.jpg","/media/static/264c91be-6527-41c8-80b6-751a0d7a81d9.jpg","/media/static/e7840b08-ae24-4378-884b-5b31cceb402f.jpg","/media/static/cdf26373-640b-4cc9-9688-2cb3c8c9a1a7.jpg"]', NULL, N'Giày Li-Ning thời trang Nam', 1500000, 1800000, N'giay-li-ning-thoi-trang-nam', 1, 0, 0, 3)
INSERT [dbo].[product] ([id], [created_at], [description], [image_feedback], [images], [modified_at], [name], [price], [sale_price], [slug], [status], [total_sold], [product_view], [brand_id]) VALUES (N'9655JA', CAST(N'2024-11-11T00:00:12.130' AS DateTime), N'<p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-family: &quot;times new roman&quot;, times; font-size: 14pt;">Giày nam Adidas Runfalcon ‘Dark Blue’&nbsp;đã được bày bán trên Sneaker Daily Shop, đừng bỏ lỡ cơ hội sở hữu cho mình một đôi ngay trước khi sold out nhé!</span></p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-family: &quot;times new roman&quot;, times; font-size: 14pt;">Cập nhật nhanh nhất lịch ra mắt của các mẫu giày mới nhất bằng cách theo dõi&nbsp;<span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Sneaker Daily</span>&nbsp;trên&nbsp;Facebook&nbsp;hoặc&nbsp;Instagram.</span></p><h3 style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-top: 1em; margin-bottom: 1em; line-height: 1.4; font-size: 1.56em; color: rgb(40, 40, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;"><span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-family: &quot;times new roman&quot;, times; font-size: 14pt;">Thông tin phát hành adidas Runfalcon ‘Dark Blue’</span></h3><p><divclass="gtx-body" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"></divclass="gtx-body"></p><div style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;"><divclass="product-footer__details" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;"><p class="product-footer__item-title" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-top: 0px; margin-bottom: 28px;"><span style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-family: &quot;times new roman&quot;, times; font-size: 14pt;"><strong style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Thương hiệu:</strong><span>&nbsp;</span>adidas</span></p><p class="product-footer__item-title" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-top: 0px; margin-bottom: 28px;"><span style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-family: &quot;times new roman&quot;, times; font-size: 14pt;"><strong style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Thiết kế:<span>&nbsp;</span></strong><a href="https://sneakerdaily.vn/danh-muc-san-pham/adidas-falcon/" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(40, 40, 40); text-decoration: none; background-color: transparent; outline: 0px; position: relative; display: inline-block; padding: 0.1em 0px; backface-visibility: hidden;">Runfalcon</a></span></p><divclass="product-footer__item" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;"><p class="product-footer__item-title" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-top: 0px; margin-bottom: 28px;"><span style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-family: &quot;times new roman&quot;, times; font-size: 14pt;"><strong style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Mã sản phẩm:</strong><span>&nbsp;</span>F36201</span></p><p style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-top: 0px; margin-bottom: 0px;"><strong style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Xuất xứ:<span>&nbsp;</span></strong>Đức</p></divclass="product-footer__item"></divclass="product-footer__details"></div>', NULL, N'["/media/static/ca95fa50-faa4-4f20-a867-7cf49ab69c89.jpg","/media/static/9cae2742-edd3-4d6a-aa44-70ced2504311.jpg","/media/static/c58dc5ed-50af-40c8-b914-855b675a7783.jpg","/media/static/110e76d4-14ff-494f-8a1a-a425701e02e1.jpg"]', NULL, N'Giày nam Adidas Runfalcon ‘Dark Blue’', 1000000, 1500000, N'giay-nam-adidas-runfalcon-dark-blue', 1, 4, 76, 1)
INSERT [dbo].[product] ([id], [created_at], [description], [image_feedback], [images], [modified_at], [name], [price], [sale_price], [slug], [status], [total_sold], [product_view], [brand_id]) VALUES (N'KeaYXM', CAST(N'2024-11-11T00:00:12.130' AS DateTime), N'<p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span style="color: rgb(104, 104, 104);">Giày </span><font color="#282828">Li-Ning bóng rổ nam</font><font color="#686868">&nbsp;là một đôi giày chuyên dụng được thiết kế đặc biệt cho các vận động viên nam chơi bóng rổ. Đôi giày này thuộc vào dòng sản phẩm cao cấp của thương hiệu Li-Ning, nổi tiếng với chất lượng và hiệu suất của sản phẩm thể thao.</font></p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Giày có một thiết kế thể thao và mạnh mẽ, mang đến sự tự tin và phong cách cho người mang. Chúng được làm từ chất liệu tổng hợp chất lượng cao, kết hợp với lớp lưới thoáng khí, giúp tăng cường sự thoải mái và đảm bảo sự thông thoáng cho chân trong quá trình chơi bóng rổ.</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Một trong những điểm nổi bật của giày Li-Ning là hệ thống đệm tiên tiến. Giày được trang bị công nghệ đệm chất lượng cao, giúp giảm sốc và tăng cường sự thoải mái khi nhảy lên và đạp xuống sàn bóng. Điều này giúp bảo vệ xương và khớp chân, và giúp người chơi có thể di chuyển linh hoạt và thực hiện các động tác nhảy cao, chuyền bóng và cắt giữa trận đấu.</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Đế giày được thiết kế để cung cấp độ bám đất tốt và ổn định. Họa tiết và cấu trúc đế giày được tối ưu hóa để cung cấp sự bám dính và độ linh hoạt khi chuyển động nhanh trên sân bóng rổ. Điều này giúp người chơi có sự kiểm soát tốt hơn khi di chuyển và thực hiện các động tác quan trọng trong trận đấu.</p><h3 33:1-33:277"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-top: 1em; margin-bottom: 1em; line-height: 1.4; font-size: 1.56em; color: rgb(40, 40, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;">Thông tin sản phẩm Giày Li-Ning bóng rổ nam</h3><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Thương hiệu:</span>&nbsp;Li-Ning</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Thiết kế:&nbsp;</span>Li-Ning</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 0px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Xuất xứ:</span>&nbsp;Trung Quốc</p>', NULL, N'["/media/static/dbb90bdf-c4c5-4698-a7fe-b71edc2d31c2.jpg","/media/static/8e430a5f-d84f-4c5f-b223-13bd79e07a36.jpg","/media/static/2fab65f9-d283-4320-9610-9cad1141e0a2.jpg","/media/static/d763511f-cca0-4c9d-8f6d-7a5c286db9d1.jpg"]', CAST(N'2024-11-18T15:23:06.480' AS DateTime), N'Giày Li-Ning bóng rổ nam', 1000000, 1490000, N'giay-li-ning-bong-ro-nam', 1, 1, 1, 3)
INSERT [dbo].[product] ([id], [created_at], [description], [image_feedback], [images], [modified_at], [name], [price], [sale_price], [slug], [status], [total_sold], [product_view], [brand_id]) VALUES (N'X0jrLi', CAST(N'2024-11-18T15:38:32.847' AS DateTime), N'<p 1:1-1:301"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Giày bóng rổ&nbsp;Adidas Pro Bounce 2018 Basketball Shoes ‘White Black’&nbsp;là một đôi giày được thiết kế cho các cầu thủ bóng rổ đang tìm kiếm sự thoải mái,<span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">&nbsp;hiệu suất và phong cách.</span><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">&nbsp;Nó có thiết kế màu trắng và đen thanh lịch với các điểm nhấn màu xám,</span><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">&nbsp;và được làm từ các vật liệu cao cấp cho độ hỗ trợ và độ bền tối đa.</span></p><p 3:1-3:19"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Phần thân trên:</span></p><ul 5:1-5:10"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; margin-left: 0.7em; padding-left: 1.3em; list-style: none; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><li animating"="" 5:1-5:10"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Được làm từ vải lưới thoáng khí với các sợi cước đan ngang dọc để giữ cho đôi chân của bạn mát mẻ và khô ráo trong suốt trận đấu</span></li><li animating"="" 6:1-6:65"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Có cổ áo đệm dày để hỗ trợ mắt cá chân và ngăn ngừa chấn thương</span></li><li animating"="" 7:1-8:0"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Khóa buộc dây để tạo sự vừa vặn chắc chắn</span></li></ul><p 9:1-9:12"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Đế giữa:</span></p><ul 11:1-13:0"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; margin-left: 0.7em; padding-left: 1.3em; list-style: none; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><li animating"="" 11:1-11:102"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Được trang bị đệm Bounce toàn bộ của Adidas cho khả năng hấp thụ sốc và trả lại năng lượng tuyệt vời</span></li><li animating"="" 12:1-13:0"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Có mô hình gai giày đồng tâm giúp bạn duy trì độ bám trên sân</span></li></ul><p 14:1-14:13"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Đế ngoài:</span></p><ul 16:1-17:50"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; margin-left: 0.7em; padding-left: 1.3em; list-style: none; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><li animating"="" 16:1-16:81"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Được làm từ cao su bền với các đường vân tròn đồng tâm để tăng độ bám và độ bền</span></li><li animating"="" 17:1-17:50"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Có điểm trục xoay ở bàn chân trước giúp bạn thực hiện các động tác cắt và chuyển hướng nhanh chóng</span></li></ul><p 19:1-19:213"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Giày bóng rổ Adidas Pro Bounce 2018 ‘White Black’ là một lựa chọn tuyệt vời cho các cầu thủ bóng rổ ở mọi cấp độ đang tìm kiếm một đôi giày thời trang và thoải mái có thể giúp họ nâng tầm trò chơi của mình.</span></p><p 21:1-21:31"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Thông tin chi tiết bổ sung:</span></p><ul 23:1-28:0"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; margin-left: 0.7em; padding-left: 1.3em; list-style: none; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><li animating"="" 23:1-23:22"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Vừa vặn thông thường</span></li><li animating"="" 24:1-24:37"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Phần trên bằng vải lưới và sợi cước</span></li><li animating"="" 25:1-25:21"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Đế giữa bằng Bounce</span></li><li animating"="" 26:1-26:22"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Đế ngoài bằng cao su</span></li></ul><p 29:1-29:12"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Ưu điểm:</span></p><ul 31:1-36:0"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; margin-left: 0.7em; padding-left: 1.3em; list-style: none; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><li animating"="" 31:1-31:35"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Thiết kế thời trang và thanh lịch</span></li><li animating"="" 32:1-32:51"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Chất liệu cao cấp mang lại sự thoải mái và hỗ trợ</span></li><li animating"="" 33:1-33:75"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Đệm Bounce toàn bộ mang lại khả năng đệm và phản hồi năng lượng tuyệt vời</span></li><li animating"="" 34:1-34:39"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Mô hình gai giày đồng tâm tăng độ bám</span></li><li animating"="" 35:1-36:0"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Điểm trục xoay ở bàn chân trước giúp thực hiện các động tác cắt và chuyển hướng nhanh chóng</span></li></ul><p 37:1-37:15"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Nhược điểm:</span></p><ul 39:1-40:48"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; margin-left: 0.7em; padding-left: 1.3em; list-style: none; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><li animating"="" 39:1-39:48"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Có thể hơi nặng so với một số thương hiệu khác</span></li><li animating"="" 40:1-40:48"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 5px;"><span animating"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;">Không phù hợp cho các cầu thủ có bàn chân rộng</span></li></ul>', NULL, N'["/media/static/19ffbeeb-6a0a-4eed-a47c-373ded995ce3.jpg","/media/static/0ef8c29c-ebfb-487f-90cb-53986982624f.jpg","/media/static/360de7a9-03d0-4ce3-9400-51aa86649d34.jpg","/media/static/695a4e53-c390-4864-833a-001451f12ed2.jpg"]', NULL, N'Giày Adidas Pro Bounce 2018 Basketball Shoes ‘White Black’', 1000000, 1400000, N'giay-adidas-pro-bounce-2018-basketball-shoes-white-black', 1, 0, 10, 1)
GO
INSERT [dbo].[product_category] ([product_id], [category_id]) VALUES (N'KeaYXM', 3)
INSERT [dbo].[product_category] ([product_id], [category_id]) VALUES (N'9655JA', 1)
INSERT [dbo].[product_category] ([product_id], [category_id]) VALUES (N'947mfL', 2)
INSERT [dbo].[product_category] ([product_id], [category_id]) VALUES (N'X0jrLi', 3)
INSERT [dbo].[product_category] ([product_id], [category_id]) VALUES (N'5UIkXm', 1)
GO
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'5UIkXm', 35, 1)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'5UIkXm', 36, 3)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'5UIkXm', 37, 2)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'5UIkXm', 39, 1)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'5UIkXm', 43, 2)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'947mfL', 37, 2)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'947mfL', 39, 1)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'947mfL', 41, 1)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'947mfL', 42, 3)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'9655JA', 35, 2)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'9655JA', 36, 3)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'9655JA', 37, 1)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'9655JA', 38, 0)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'9655JA', 40, 2)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'9655JA', 42, 2)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'KeaYXM', 35, 1)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'KeaYXM', 36, 3)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'KeaYXM', 39, 1)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'KeaYXM', 41, 2)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'X0jrLi', 38, 1)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'X0jrLi', 40, 2)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'X0jrLi', 41, 3)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'X0jrLi', 42, 4)
GO
SET IDENTITY_INSERT [dbo].[promotion] ON 

INSERT [dbo].[promotion] ([id], [coupon_code], [created_at], [discount_type], [discount_value], [expired_at], [is_active], [is_public], [maximum_discount_value], [name]) VALUES (10, N'KM02', CAST(N'2024-11-28T10:42:53.010' AS DateTime), 1, 20, CAST(N'2024-11-30T07:00:00.000' AS DateTime), 1, 0, 300000, N'BB01')
INSERT [dbo].[promotion] ([id], [coupon_code], [created_at], [discount_type], [discount_value], [expired_at], [is_active], [is_public], [maximum_discount_value], [name]) VALUES (12, N'KM03', CAST(N'2024-11-29T22:32:33.510' AS DateTime), 1, 12, CAST(N'2024-11-30T07:00:00.000' AS DateTime), 1, 0, 12334, N'asda')
SET IDENTITY_INSERT [dbo].[promotion] OFF
GO
SET IDENTITY_INSERT [dbo].[statistic] ON 

INSERT [dbo].[statistic] ([id], [created_at], [profit], [quantity], [sales], [order_id]) VALUES (1, CAST(N'2024-11-12T23:52:42.827' AS DateTime), 400000, 1, 1400000, 1)
INSERT [dbo].[statistic] ([id], [created_at], [profit], [quantity], [sales], [order_id]) VALUES (2, CAST(N'2024-11-16T22:19:38.997' AS DateTime), 500000, 1, 1500000, 6)
INSERT [dbo].[statistic] ([id], [created_at], [profit], [quantity], [sales], [order_id]) VALUES (3, CAST(N'2024-11-18T15:54:10.470' AS DateTime), 1000000, 2, 3000000, 5)
INSERT [dbo].[statistic] ([id], [created_at], [profit], [quantity], [sales], [order_id]) VALUES (4, CAST(N'2024-11-19T22:57:21.507' AS DateTime), 460000, 1, 1460000, 10)
INSERT [dbo].[statistic] ([id], [created_at], [profit], [quantity], [sales], [order_id]) VALUES (5, CAST(N'2024-11-21T18:09:17.583' AS DateTime), 670000, 1, 2170000, 12)
INSERT [dbo].[statistic] ([id], [created_at], [profit], [quantity], [sales], [order_id]) VALUES (6, CAST(N'2024-11-28T21:45:36.927' AS DateTime), 500000, 1, 1500000, 7)
SET IDENTITY_INSERT [dbo].[statistic] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [address], [avatar], [created_at], [email], [full_name], [modified_at], [password], [phone], [roles], [status]) VALUES (1, N'sádasdasd', NULL, CAST(N'2024-11-10T15:17:24.117' AS DateTime), N'ducphamminh1206@gmail.com', N'P.Đức', NULL, N'$2a$12$R03KAwFYiPcSdJgDdKo4L.LEBziDl79h7IHgXceZ4tZl/u.kpdZry', N'0345239051', N'["ADMIN"]', 1)
INSERT [dbo].[users] ([id], [address], [avatar], [created_at], [email], [full_name], [modified_at], [password], [phone], [roles], [status]) VALUES (2, N'sasdasd', NULL, CAST(N'2024-11-11T00:03:14.153' AS DateTime), N'admin@gmail.com', N'Admin', NULL, N'$2a$12$R03KAwFYiPcSdJgDdKo4L.LEBziDl79h7IHgXceZ4tZl/u.kpdZry', N'0345678912', N'["ADMIN"]', 1)
INSERT [dbo].[users] ([id], [address], [avatar], [created_at], [email], [full_name], [modified_at], [password], [phone], [roles], [status]) VALUES (5, NULL, NULL, CAST(N'2024-11-16T22:08:32.680' AS DateTime), N'ducpmph34277@fpt.edu.vn', N'Đức', NULL, N'$2a$12$Zw6nZqf5RAEz9kQzaHGlCuyGqx9ZkyoHZAmUuHuRt5d.F7GIfA6py', N'0345678912', N'["USER"]', 1)
INSERT [dbo].[users] ([id], [address], [avatar], [created_at], [email], [full_name], [modified_at], [password], [phone], [roles], [status]) VALUES (6, N'sadasd', NULL, CAST(N'2024-11-18T14:39:03.883' AS DateTime), N'user@gmail.com', N'User', NULL, N'$2a$12$dtfDlhmioCtNh1mf83uJZOC407ttU1PCwQjzH4ZMM3MqukwmxNRq2', N'0987654321', N'["USER"]', 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__images__A2692381A2DAD3EB]    Script Date: 11/30/2024 12:39:08 AM ******/
ALTER TABLE [dbo].[images] ADD UNIQUE NONCLUSTERED 
(
	[link] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__promotio__ADE5CBB7638D544B]    Script Date: 11/30/2024 12:39:08 AM ******/
ALTER TABLE [dbo].[promotion] ADD UNIQUE NONCLUSTERED 
(
	[coupon_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([id])
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD FOREIGN KEY([created_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([buyer])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([created_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([modified_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([created_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([modified_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[product_category]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product_category]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[statistic]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
USE [master]
GO
ALTER DATABASE [TeddySneaker] SET  READ_WRITE 
GO
