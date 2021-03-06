USE [master]
GO
/****** Object:  Database [QLBH]    Script Date: 09/06/2017 3:35:15 PM ******/
CREATE DATABASE [QLBH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.QUOCLE\MSSQL\DATA\QLBH.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.QUOCLE\MSSQL\DATA\QLBH_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLBH] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBH] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBH] SET  MULTI_USER 
GO
ALTER DATABASE [QLBH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLBH] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLBH]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 09/06/2017 3:35:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 09/06/2017 3:35:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Amount] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 09/06/2017 3:35:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[Total] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 09/06/2017 3:35:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProID] [int] IDENTITY(1,1) NOT NULL,
	[ProName] [nvarchar](40) NOT NULL,
	[TinyDes] [nvarchar](80) NOT NULL,
	[FullDes] [ntext] NOT NULL,
	[Price] [money] NOT NULL,
	[CatID] [int] NOT NULL,
	[DateTime] [datetime] NULL,
 CONSTRAINT [PK__Products__620295F0F7F8D3EF] PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/06/2017 3:35:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[f_ID] [int] IDENTITY(1,1) NOT NULL,
	[f_Username] [nvarchar](50) NOT NULL,
	[f_Password] [nvarchar](255) NOT NULL,
	[f_Name] [nvarchar](50) NOT NULL,
	[f_Email] [nvarchar](50) NOT NULL,
	[f_DOB] [datetime] NOT NULL,
	[f_Permission] [int] NOT NULL CONSTRAINT [DF__Users__f_Permiss__15502E78]  DEFAULT ((0)),
	[f_Money] [money] NOT NULL,
 CONSTRAINT [PK__Users__2910CFA5571740E6] PRIMARY KEY CLUSTERED 
(
	[f_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (1, N'Sách')
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (2, N'Điện thoại')
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (3, N'Máy chụp hình')
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (4, N'Quần áo - Giày dép')
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (5, N'Máy tính')
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (6, N'Đồ trang sức')
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (7, N'Khác')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (1, 1, 1, 1500000.0000, 3000000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (2, 1, 2, 300000.0000, 600000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (3, 2, 1, 1500000.0000, 1500000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (4, 2, 2, 300000.0000, 300000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (5, 3, 7, 2850000.0000, 2850000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (6, 4, 5, 3200000.0000, 3200000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (7, 4, 7, 3050000.0000, 3050000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (8, 4, 1, 1500000.0000, 1500000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (9, 5, 5, 3200000.0000, 3200000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (10, 5, 6, 180000.0000, 180000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (11, 6, 5, 3200000.0000, 3200000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (12, 7, 4, 42000000.0000, 42000000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (13, 7, 3, 1600000000.0000, 1600000000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (14, 8, 12, 120000.0000, 120000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (15, 9, 7, 3050000.0000, 3050000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (16, 10, 5, 3200000.0000, 3250001.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (17, 11, 5, 3200000.0000, 3250000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (18, 11, 7, 3050000.0000, 3100001.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (19, 12, 5, 3200000.0000, 3250004.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (20, 12, 1, 1500000.0000, 1550000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (21, 12, 2, 300000.0000, 350000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (22, 13, 6, 180000.0000, 230000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (23, 13, 8, 270000.0000, 320000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (24, 13, 10, 2800000.0000, 2850000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (25, 14, 5, 3200000.0000, 3250002.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (26, 15, 5, 3200000.0000, 3250007.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (27, 16, 5, 3200000.0000, 3250000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (28, 17, 5, 3200000.0000, 3250000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Price], [Amount]) VALUES (29, 17, 7, 3050000.0000, 3100000.0000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (1, CAST(N'2014-03-14 00:00:00.000' AS DateTime), 5, 3600000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (2, CAST(N'2014-03-14 00:00:00.000' AS DateTime), 5, 1800000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (3, CAST(N'2017-05-10 16:56:52.830' AS DateTime), 10, 2850000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (4, CAST(N'2017-05-12 22:24:46.677' AS DateTime), 11, 7750000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (5, CAST(N'2017-05-12 22:28:13.080' AS DateTime), 10, 3380000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (6, CAST(N'2017-05-12 22:32:19.477' AS DateTime), 10, 3200000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (7, CAST(N'2017-05-12 22:34:56.497' AS DateTime), 10, 1642000000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (8, CAST(N'2017-05-12 22:37:31.887' AS DateTime), 10, 120000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (9, CAST(N'2017-05-12 22:38:32.967' AS DateTime), 10, 3050000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (10, CAST(N'2017-05-12 22:42:00.417' AS DateTime), 10, 3250001.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (11, CAST(N'2017-05-12 22:45:07.527' AS DateTime), 10, 6350001.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (12, CAST(N'2017-05-12 23:54:44.173' AS DateTime), 11, 5150004.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (13, CAST(N'2017-05-13 00:05:41.173' AS DateTime), 10, 3400000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (14, CAST(N'2017-05-13 00:08:22.640' AS DateTime), 10, 3250002.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (15, CAST(N'2017-05-13 00:08:58.637' AS DateTime), 11, 3250007.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (16, CAST(N'2017-05-13 00:12:20.250' AS DateTime), 11, 3250000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total]) VALUES (17, CAST(N'2017-05-13 21:50:15.007' AS DateTime), 11, 6350000.0000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (1, N'Freshwater Cultured Pearl', N'Freshwater Cultured Pearl, Citrine, Peridot & Amethyst Bracelet, 7.5"', N'<UL>
    <LI>Metal stamp: 14k </LI>
    <LI>Metal: yellow-gold</LI>
    <LI>Material Type: amethyst, citrine, gold, pearl, peridot</LI>
    <LI>Gem Type: citrine, peridot, amethyst</LI>
    <LI>Length: 7.5 inches</LI>
    <LI>Clasp Type: filigree-box</LI>
    <LI>Total metal weight: 0.6 Grams</LI>
</UL>
<STRONG>Pearl Information</STRONG><BR>
<UL>
    <LI>Pearl type: freshwater-cultured</LI>
</UL>
<STRONG>Packaging Information</STRONG><BR>
<UL>
    <LI>Package: Regal Blue Sueded-Cloth Pouch</LI>
</UL>', 1500000.0000, 6, CAST(N'2017-05-30 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (2, N'Pink Sapphire Sterling Silver', N'14 1/2 Carat Created Pink Sapphire Sterling Silver Bracelet w/ Diamond Accents', N'<P><STRONG>Jewelry Information</STRONG></P>
<UL>
    <LI>Loại hàng: Hàng trong nước</LI>
</UL>
', 300000.0000, 6, CAST(N'2017-06-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (3, N'Torrini KC241', N'Nhẫn kim cương - vẻ đẹp kiêu sa', N'<P>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế. Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được.</P>
<UL>
    <LI>Kiểu sản phẩm: Nhẫn nữ</LI>
    <LI>Loại đá: To paz</LI>
    <LI>Chất liệu: kim cương, nguyên liệu và công nghệ Italy...</LI>
    <LI>Đơn giá: 2,110,250 VND / Chiếc</LI>
</UL>
', 1600000000.0000, 6, CAST(N'2017-05-31 12:30:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (4, N'Torrini KC242', N'tinh xảo và sang trọng', N'<P>Để sở hữu một chiếc nhẫn kim cương lấp lánh trên tay, bạn phải là người chịu chi và sành điệu.<BR>
Với sự kết hợp khéo léo và độc đáo giữa kim cương và Saphia, Ruby... những chiếc nhẫn càng trở nên giá trị.</P>
<UL>
    <LI>Kiểu sản phẩm: Nhẫn nam</LI>
    <LI>Loại đá: To paz</LI>
    <LI>Chất liệu: Vàng tây 24K, nguyên liệu và công nghệ Italy...</LI>
</UL>
', 42000000.0000, 6, CAST(N'2017-05-31 12:30:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (5, N'Nokia 7610', N'Độ phân giải cao, màn hình màu, chụp ảnh xuất sắc.', N'<UL>
    <LI>Máy ảnh có độ phân giải 1 megapixel</LI>
    <LI>Màn hình 65.536 màu, rộng 2,1 inch, 176 X 208 pixel với đồ họa sắc nét, độ phân giải cao</LI>
    <LI>Quay phim video lên đến 10 phút với hình ảnh sắc nét hơn</LI>
    <LI>Kinh nghiệm đa phương tiện được tăng cường</LI>
    <LI>Streaming video &amp; âm thanh với RealOne Player (hỗ trợ các dạng thức MP3/AAC).</LI>
    <LI>Nâng cấp cho những đoạn phim cá nhân của bạn bằng các tính năng chỉnh sửa tự động thông minh</LI>
    <LI>In ảnh chất lượng cao từ nhà, văn phòng, kios và qua mạng</LI>
    <LI>Dễ dàng kết nối vớI máy PC để lưu trữ và chia sẻ (bằng cáp USB, PopPort, công nghệ Bluetooth)</LI>
    <LI>48 nhạc chuông đa âm sắc, True tones. Mạng GSM 900 / GSM 1800 / GSM 1900</LI>
    <LI>Kích thước 109 x 53 x 19 mm, 93 cc</LI>
    <LI>Trọng lượng 118 g</LI>
    <LI>Hiển thị: Loại TFT, 65.536 màu</LI>
    <LI>Kích cở: 176 x 208 pixels </LI>
</UL>
', 3200000.0000, 2, CAST(N'2017-05-31 12:30:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (6, N'Áo hồng xinh', N'Màu sắc tươi tắn, kiểu dáng trẻ trung', N'<UL>
    <LI>Loại hàng: Hàng trong nước</LI>
    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>
</UL>
', 180000.0000, 4, CAST(N'2017-05-31 12:30:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (7, N'Simen AP75', N'Thiết kế tinh xảo, hiện đại', N'<UL>
    <LI>Hình ảnh hoàn hảo, rõ nét ở mọi góc màn hình</LI>
    <LI>Giảm thiểu sự phản chiếu ánh sáng</LI>
    <LI>Menu hiển thị tiếng Việt</LI>
    <LI>Hệ thống hình ảnh thông minh</LI>
    <LI>Âm thanh Hifi Stereo mạnh mẽ</LI>
    <LI>Hệ thống âm lượng thông minh</LI>
    <LI>Bộ nhớ 100 chương trình</LI>
    <LI>Chọn kênh ưa thích</LI>
    <LI>Các kiểu sắp đặt sẵn hình ảnh / âm thanh</LI>
    <LI>Kích thước (rộng x cao x dày): 497 x 458 x 487mm</LI>
    <LI>Trọng lượng: 25kg</LI>
    <LI>Màu: vàng, xanh, bạc </LI>
</UL>
', 3050000.0000, 2, CAST(N'2017-05-31 12:30:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (8, N'Áo bé trai', N'Hóm hỉnh dễ thương', N'<UL>
    <LI>Quần áo bé trai</LI>
    <LI>Loại hàng: Hàng trong nước</LI>
    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>
</UL>
', 270000.0000, 4, CAST(N'2017-05-31 12:30:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (9, N'Bông tai nạm hạt rubby', N'Trẻ trung và quý phái', N'<UL>
    <LI>Tên sản phẩm: Bông tai nạm hạt rubby</LI>
    <LI>Đóng nhãn hiệu: Torrini</LI>
    <LI>Nguồn gốc, xuất xứ: Italy</LI>
    <LI>Hình thức thanh toán: L/C T/T M/T CASH</LI>
    <LI>Thời gian giao hàng: trong vòng 3 ngày kể từ ngày mua</LI>
    <LI>Chất lượng/chứng chỉ: good</LI>
</UL>
', 2400000.0000, 6, CAST(N'2017-06-05 23:55:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (10, N'Đầm dạ hội ánh kim', N'Đủ màu sắc - kiểu dáng', N'<UL>
    <LI>Màu sắc: Khuynh hướng ánh kim có thể thể hiện trên vàng, bạc, đỏ tía, xanh biển, vàng tím, trắng và đen.</LI>
    <LI>Một số biến tấu mang tính vui nhộn là vàng chanh, màu hoa vân anh và ngọc lam; trong đó hoàng kim và nhũ bạc khá phổ biến.</LI>
    <LI>Phong cách: Diềm đăng ten, rủ xuống theo chiều thẳng đứng, nhiều lớp, cổ chẻ sâu, eo chít cao tới ngực... được biến tấu tùy theo mỗi nhà thiết kế.</LI>
</UL>
', 2800000.0000, 4, CAST(N'2017-06-05 23:55:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (11, N'Dây chuyền ánh bạc', N'Kiểu dáng mới lạ', N'<UL>
    <LI>Chất liệu chính: Bạc</LI>
    <LI>Màu sắc: Bạc</LI>
    <LI>Chất lượng: Mới</LI>
    <LI>Phí vận chuyển: Liên hệ</LI>
    <LI>Giá bán có thể thay đổi tùy theo trọng lượng và giá vàng của từng thời điểm.</LI>
</UL>
', 250000.0000, 6, CAST(N'2017-06-05 23:55:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (12, N'Đồ bộ bé gái', N'Đủ màu sắc - kiểu dáng', N'<UL>
    <LI>Màu sắc: đỏ tía, xanh biển, vàng tím, trắng và đen.</LI>
    <LI>Xuất xứ: Tp. Hồ Chí Minh</LI>
    <LI>Chất liệu: cotton</LI>
    <LI>Loại hàng: hàng trong nước</LI>
</UL>
', 120000.0000, 4, CAST(N'2017-06-05 23:55:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (13, N'Đầm dạ hội Xinh Xinh', N'Đơn giản nhưng quý phái', N'<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>
<UL>
    <LI>Nét cắt táo bạo ở ngực giúp bạn gái thêm phần quyến rũ, ngay cả khi không có trang&nbsp; sức nào trên người.</LI>
    <LI>Đầm hai dây thật điệu đà với nơ xinh trước ngực nhưng trông bạn vẫn toát lên vẻ tinh nghịch và bụi bặm nhờ thiết kế đầm bí độc đáo cùng sắc màu sẫm.</LI>
    <LI>Hãng sản xuất: NEM</LI>
    <LI>Kích cỡ : Tất cả các kích cỡ</LI>
    <LI>Kiểu dáng : Quây/Ống</LI>
    <LI>Chất liệu : Satin</LI>
    <LI>Màu : đen, đỏ</LI>
    <LI>Xuất xứ : Việt Nam</LI>
</UL>
', 2600000.0000, 4, CAST(N'2017-06-05 23:55:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (14, N'Đầm dạ hội NEM', N'Táo bạo và quyến rũ', N'<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>
<UL>
    <LI>Nét cắt táo bạo ở ngực giúp bạn gái thêm phần quyến rũ, ngay cả khi không có trang&nbsp; sức nào trên người.</LI>
    <LI>Đầm hai dây thật điệu đà với nơ xinh trước ngực nhưng trông bạn vẫn toát lên vẻ tinh nghịch và bụi bặm nhờ thiết kế đầm bí độc đáo cùng sắc màu sẫm.</LI>
    <LI>Hãng sản xuất: NEM</LI>
    <LI>Kích cỡ : Tất cả các kích cỡ</LI>
    <LI>Kiểu dáng : Quây/Ống</LI>
    <LI>Chất liệu : Satin</LI>
    <LI>Màu : đen, đỏ</LI>
    <LI>Xuất xứ : Việt Nam</LI>
</UL>
', 1200000.0000, 4, CAST(N'2017-06-05 23:55:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (15, N'Dây chuyền đá quý', N'Kết hợp vàng trắng và đá quý', N'<UL>
    <LI>Kiểu sản phẩm: Dây chuyền</LI>
    <LI>Chất liệu: Vàng trắng 14K và đá quý, nguyên liệu và công nghệ Italy...</LI>
    <LI>Trọng lượng chất liệu: 1.1 Chỉ </LI>
</UL>
', 1925000.0000, 6, CAST(N'2017-06-05 23:55:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (16, N'Nokia N72', N'Sành điệu cùng N72', N'<UL>
    <LI>Camera mega pixel : 2 mega pixel</LI>
    <LI>Bộ nhớ trong : 16 - 31 mb</LI>
    <LI>Chức năng : quay phim, ghi âm, nghe đài FM</LI>
    <LI>Hỗ trợ: Bluetooth, thẻ nhớ ngoài, nhạc MP3 &lt;br/&gt;</LI>
    <LI>Trọng lượng (g) : 124g</LI>
    <LI>Kích thước (mm) : 109 x 53 x 21.8 mm</LI>
    <LI>Ngôn ngữ : Có tiếng việt</LI>
    <LI>Hệ điều hành: Symbian OS 8.1</LI>
</UL>
', 3205000.0000, 2, CAST(N'2017-06-05 23:55:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (17, N'Mặt dây chuyền Ruby', N'Toả sáng cùng Ruby', N'<UL>
    <LI>Kiểu sản phẩm:&nbsp; Mặt dây</LI>
    <LI>Chất liệu: Vàng trắng 14K, nguyên liệu và công nghệ Italy...</LI>
    <LI>Trọng lượng chất liệu: 0.32 Chỉ</LI>
</UL>
', 1820000.0000, 6, CAST(N'2017-05-15 10:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (18, N'1/2 Carat Pink Sapphire Silver', N'Created Pink Sapphire', N'<UL>
    <LI>Brand Name: Ice.com</LI>
    <LI>Material Type: sterling-silver, created-sapphire, diamond</LI>
    <LI>Gem Type: created-sapphire, Diamond</LI>
    <LI>Minimum total gem weight: 14.47 carats</LI>
    <LI>Total metal weight: 15 Grams</LI>
    <LI>Number of stones: 28</LI>
    <LI>Created-sapphire Information</LI>
    <LI>Minimum color: Not Available</LI>
</UL>
', 3400000.0000, 6, CAST(N'2017-05-15 10:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (19, N'Netaya', N'Dây chuyền vàng trắng', N'<UL>
    <LI>Kiểu sản phẩm:&nbsp; Dây chuyền</LI>
    <LI>Chất liệu: Vàng tây 18K, nguyên liệu và công nghệ Italy...</LI>
    <LI>Trọng lượng chất liệu: 1 Chỉ</LI>
</UL>
', 1820000.0000, 6, CAST(N'2017-05-15 10:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (20, N'Giày nam GN16', N'Êm - đẹp - bền', N'<UL>
    <LI>Loại hàng: Hàng trong nước</LI>
    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>
    <LI>Giá: 300 000 VNĐ</LI>
</UL>
', 540000.0000, 4, CAST(N'2017-05-15 10:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (21, N'G3.370A', N'Đen bóng, sang trọng', N'<UL>
    <LI>Loại hàng: Hàng trong nước</LI>
    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>
</UL>
', 300000.0000, 4, CAST(N'2017-05-15 10:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (22, N'Giày nữ GN1', N'Kiểu dáng thanh thoát', N'<UL>
    <LI>Loại hàng: Hàng trong nước</LI>
    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>
</UL>
', 290000.0000, 4, CAST(N'2017-05-15 10:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (23, N'NV002', N'Kiểu dáng độc đáo', N'<P><STRONG>Thông tin sản phẩm</STRONG></P>
<UL>
    <LI>Mã sản phẩm: NV002</LI>
    <LI>Trọng lượng: 2 chỉ</LI>
    <LI>Vật liệu chính: Vàng 24K</LI>
</UL>
', 3600000.0000, 6, CAST(N'2017-05-25 17:59:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (24, N'NV009', N'Sáng chói - mới lạ', N'<P><STRONG>Thông tin sản phẩm</STRONG></P>
<UL>
    <LI>Mã sản phẩm: NV005</LI>
    <LI>Trọng lượng: 1 cây</LI>
    <LI>Vật liệu chính: Vàng 24K</LI>
</UL>
', 14900000.0000, 6, CAST(N'2017-05-25 17:59:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (25, N'CK010', N'Độc đáo, sang trọng', N'<UL>
    <LI>Kiểu dáng nam tính và độc đáo, những thiết kế dưới đây đáp ứng được mọi yêu cần khó tính nhất của người sở hữu.</LI>
    <LI>Những hạt kim cương sẽ giúp người đeo nó tăng thêm phần sành điệu</LI>
    <LI>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế.</LI>
    <LI>Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được</LI>
</UL>
', 2400000000.0000, 6, CAST(N'2017-05-25 17:59:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (26, N'CK009', N'Nữ tính - đầy quí phái', N'<UL>
    <LI>Để sở hữu một chiếc nhẫn kim cương lấp lánh trên tay, bạn phải là người chịu chi và sành điệu.</LI>
    <LI>Với sự kết hợp khéo léo và độc đáo giữa kim cương và Saphia, Ruby... những chiếc nhẫn càng trở nên giá trị</LI>
    <LI>Nhà sản xuất: Torrini</LI>
</UL>
<P>Cái này rất phù hợp cho bạn khi tặng nàng</P>
', 1850000000.0000, 6, CAST(N'2017-05-25 17:59:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (27, N'CK007', N'Sự kết hợp khéo léo, độc đáo', N'<UL>
    <LI>Để sở hữu một chiếc nhẫn kim cương lấp lánh trên tay, bạn phải là người chịu chi và sành điệu.</LI>
    <LI>Với sự kết hợp khéo léo và độc đáo giữa kim cương và Saphia, Ruby... những chiếc nhẫn càng trở nên giá trị</LI>
    <LI>Nhà sản xuất: Torrini</LI>
</UL>
<P>Cái này rất phù hợp cho bạn khi tặng nàng</P>
', 3100000000.0000, 6, CAST(N'2017-05-25 17:59:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (28, N'CK005', N'Tinh xảo - sang trọng', N'<UL>
    <LI>Kim cương luôn là đồ trang sức thể hiện đẳng cấp của người sử dụng.</LI>
    <LI>Không phải nói nhiều về những kiểu nhẫn dưới đây, chỉ có thể gói gọn trong cụm từ: tinh xảo và sang trọng</LI>
    <LI>Thông tin nhà sản xuất: Torrini</LI>
    <LI>Thông tin chi tiết: Cái này rất phù hợp cho bạn khi tặng nàng</LI>
</UL>
', 1800000000.0000, 6, CAST(N'2017-06-30 23:55:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (29, N'NV01TT', N'Tinh tế đến không ngờ', N'<UL>
    <LI>Tinh xảo và sang trọng</LI>
    <LI>Thông tin nhà sản xuất: Torrini</LI>
    <LI>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế.</LI>
    <LI>Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được</LI>
</UL>
', 500000000.0000, 6, CAST(N'2017-06-30 23:55:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [DateTime]) VALUES (30, N'Motorola W377', N'Nữ tính - trẻ trung', N'<UL>
    <LI>General: 2G Network, GSM 900 / 1800 / 1900</LI>
    <LI>Size:&nbsp; 99 x 45 x 18.6 mm, 73 cc</LI>
    <LI>Weight: 95 g</LI>
    <LI>Display: type TFT, 65K colors</LI>
    <LI>Size: 128 x 160 pixels, 28 x 35 mm</LI>
</UL>
', 2400000.0000, 2, CAST(N'2017-06-30 23:55:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([f_ID], [f_Username], [f_Password], [f_Name], [f_Email], [f_DOB], [f_Permission], [f_Money]) VALUES (5, N'nndkhoa', N'E0308DA5BBE8279ADC296567334D429B', N'Khoa N. D. Ngô', N'nndkhoa@a.c', CAST(N'2014-02-26 00:00:00.000' AS DateTime), 0, 10000000000.0000)
INSERT [dbo].[Users] ([f_ID], [f_Username], [f_Password], [f_Name], [f_Email], [f_DOB], [f_Permission], [f_Money]) VALUES (6, N'tdquang', N'BABA9830D1E5DEAE4954C1364B536D66', N'Trần Duy Quang', N'tdquang@a.c', CAST(N'2014-02-18 00:00:00.000' AS DateTime), 0, 10000000000.0000)
INSERT [dbo].[Users] ([f_ID], [f_Username], [f_Password], [f_Name], [f_Email], [f_DOB], [f_Permission], [f_Money]) VALUES (9, N'admin', N'0192023A7BBD73250516F069DF18B500', N'Admin', N'admin@g.c', CAST(N'2014-03-19 00:00:00.000' AS DateTime), 1, 10000000000.0000)
INSERT [dbo].[Users] ([f_ID], [f_Username], [f_Password], [f_Name], [f_Email], [f_DOB], [f_Permission], [f_Money]) VALUES (10, N'quocle', N'E10ADC3949BA59ABBE56E057F20F883E', N'binh', N'1460130@gmail.com', CAST(N'2017-01-05 00:01:00.000' AS DateTime), 1, 100000000000.0000)
INSERT [dbo].[Users] ([f_ID], [f_Username], [f_Password], [f_Name], [f_Email], [f_DOB], [f_Permission], [f_Money]) VALUES (11, N'lequoc', N'E10ADC3949BA59ABBE56E057F20F883E', N'binh', N'1460130@gmail.com', CAST(N'1996-01-09 00:07:00.000' AS DateTime), 0, 100000000000.0000)
INSERT [dbo].[Users] ([f_ID], [f_Username], [f_Password], [f_Name], [f_Email], [f_DOB], [f_Permission], [f_Money]) VALUES (14, N'votai', N'E10ADC3949BA59ABBE56E057F20F883E', N'vo minh thai', N'vothai@gmail.com', CAST(N'2017-01-06 00:03:00.000' AS DateTime), 0, 10000000.0000)
INSERT [dbo].[Users] ([f_ID], [f_Username], [f_Password], [f_Name], [f_Email], [f_DOB], [f_Permission], [f_Money]) VALUES (15, N'baohien', N'E10ADC3949BA59ABBE56E057F20F883E', N'nguyen ngoc bao hien', N'baohien@gmail.com', CAST(N'2017-01-06 00:16:00.000' AS DateTime), 0, 1000000.0000)
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [QLBH] SET  READ_WRITE 
GO
