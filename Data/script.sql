USE [master]
GO
/****** Object:  Database [KhachSan]    Script Date: 06/11/2019 11:07:20 ******/
CREATE DATABASE [KhachSan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KhachSan', FILENAME = N'D:\Study\SourceCodde\Nhom2_BaiTapLon_QuanLyKhachSan\Data\KhachSan.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KhachSan_log', FILENAME = N'D:\Study\SourceCodde\Nhom2_BaiTapLon_QuanLyKhachSan\Data\KhachSan_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KhachSan] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KhachSan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KhachSan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KhachSan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KhachSan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KhachSan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KhachSan] SET ARITHABORT OFF 
GO
ALTER DATABASE [KhachSan] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KhachSan] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [KhachSan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KhachSan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KhachSan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KhachSan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KhachSan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KhachSan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KhachSan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KhachSan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KhachSan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KhachSan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KhachSan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KhachSan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KhachSan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KhachSan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KhachSan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KhachSan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KhachSan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KhachSan] SET  MULTI_USER 
GO
ALTER DATABASE [KhachSan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KhachSan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KhachSan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KhachSan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [KhachSan]
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDDV]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDDV]()
RETURNS NVARCHAR(8)
AS
BEGIN
	DECLARE @ID NVARCHAR(8)
	DECLARE @length int
	IF (SELECT COUNT(maDV) FROM DichVu) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = convert(int,MAX(right(maDV,6))) FROM DichVu
		set @length=len(@ID)
		 select @ID= case
				when @length=1 and @ID<9 then 'DV00000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9 then 'DV0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9 and @length=2) and (@length=2 and @ID<99) then 'DV0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=99 then 'DV000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99 and @length=3) and (@length=3 and @ID<999) then 'KH000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=999 then 'DV00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>999 and @length=4) and(@length=4 and @ID<9999) then 'DV00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9999 then 'DV0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9999 and @length=5) and (@length=5 and @ID<99999) then 'DV0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99999 and @length=6) and (@length=6 and @ID<999999) then 'DV' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)

			end
	RETURN @ID
END

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDKH]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDKH]()
RETURNS NVARCHAR(8)
AS
BEGIN
	DECLARE @ID NVARCHAR(8)
	DECLARE @length int
	IF (SELECT COUNT(MAKH) FROM KHACHHANG) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = convert(int,MAX(right(MaKH,6))) FROM KHACHHANG
		set @length=len(@ID)
		 select @ID= case
				when @length=1 and @ID<9 then 'KH00000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9 then 'KH0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9 and @length=2) and (@length=2 and @ID<99) then 'KH0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=99 then 'KH000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99 and @length=3) and (@length=3 and @ID<999) then 'KH000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=999 then 'KH00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>999 and @length=4) and(@length=4 and @ID<9999) then 'KH00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9999 then 'KH0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9999 and @length=5) and (@length=5 and @ID<99999) then 'KH0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99999 and @length=6) and (@length=6 and @ID<999999) then 'KH' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)

			end
	RETURN @ID
END

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDLP]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDLP]()
RETURNS NVARCHAR(8)
AS
BEGIN
	DECLARE @ID NVARCHAR(8)
	DECLARE @length int
	IF (SELECT COUNT(maLoaiPhong) FROM LoaiPhong) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = convert(int,MAX(right(maLoaiPhong,6))) FROM LoaiPhong
		set @length=len(@ID)
		 select @ID= case
				when @length=1 and @ID<9 then 'LP00000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9 then 'LP0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9 and @length=2) and (@length=2 and @ID<99) then 'LP0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=99 then 'LP000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99 and @length=3) and (@length=3 and @ID<999) then 'LP000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=999 then 'LP00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>999 and @length=4) and(@length=4 and @ID<9999) then 'LP00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9999 then 'LP0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9999 and @length=5) and (@length=5 and @ID<99999) then 'LP0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99999 and @length=6) and (@length=6 and @ID<999999) then 'LP' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)

			end
	RETURN @ID
END

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDNV]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDNV]()
RETURNS NVARCHAR(8)
AS
BEGIN
	DECLARE @ID NVARCHAR(8)
	DECLARE @length int
	IF (SELECT COUNT(maNV) FROM NhanVien) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = convert(int,MAX(right(maNV,6))) FROM NhanVien
		set @length=len(@ID)
		 select @ID= case
				when @length=1 and @ID<9 then 'NV00000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9 then 'NV0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9 and @length=2) and (@length=2 and @ID<99) then 'KH0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=99 then 'NV000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99 and @length=3) and (@length=3 and @ID<999) then 'KH000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=999 then 'NV00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>999 and @length=4) and(@length=4 and @ID<9999) then 'NV00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9999 then 'NV0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9999 and @length=5) and (@length=5 and @ID<99999) then 'NV0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99999 and @length=6) and (@length=6 and @ID<999999) then 'NV' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)

			end
	RETURN @ID
END

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDPH]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDPH]()
RETURNS NVARCHAR(8)
AS
BEGIN
	DECLARE @ID NVARCHAR(8)
	DECLARE @length int
	IF (SELECT COUNT(maPhong) FROM Phong) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = convert(int,MAX(right(maPhong,6))) FROM Phong
		set @length=len(@ID)
		 select @ID= case
				when @length=1 and @ID<9 then 'PH00000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9 then 'PH0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9 and @length=2) and (@length=2 and @ID<99) then 'PH0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=99 then 'PH000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99 and @length=3) and (@length=3 and @ID<999) then 'PH000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=999 then 'PH00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>999 and @length=4) and(@length=4 and @ID<9999) then 'PH00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9999 then 'PH0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9999 and @length=5) and (@length=5 and @ID<99999) then 'PH0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99999 and @length=6) and (@length=6 and @ID<999999) then 'PH' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)

			end
	RETURN @ID
END

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDTP]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDTP]()
RETURNS NVARCHAR(8)
AS
BEGIN
	DECLARE @ID NVARCHAR(8)
	DECLARE @length int
	IF (SELECT COUNT(maThue) FROM ThuePhong) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = convert(int,MAX(right(maThue,6))) FROM ThuePhong
		set @length=len(@ID)
		 select @ID= case
				when @length=1 and @ID<9 then 'TP00000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9 then 'TP0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9 and @length=2) and (@length=2 and @ID<99) then 'TP0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=99 then 'TP000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99 and @length=3) and (@length=3 and @ID<999) then 'TP000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=999 then 'TP00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>999 and @length=4) and(@length=4 and @ID<9999) then 'TP00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9999 then 'TP0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9999 and @length=5) and (@length=5 and @ID<99999) then 'TP0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99999 and @length=6) and (@length=6 and @ID<999999) then 'TP' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)

			end
	RETURN @ID
END

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDTT]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDTT]()
RETURNS NVARCHAR(8)
AS
BEGIN
	DECLARE @ID NVARCHAR(8)
	DECLARE @length int
	IF (SELECT COUNT(maHD) FROM ThanhToan) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = convert(int,MAX(right(maHD,6))) FROM ThanhToan
		set @length=len(@ID)
		 select @ID= case
				when @length=1 and @ID<9 then 'TT00000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9 then 'TT0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9 and @length=2) and (@length=2 and @ID<99) then 'TT0000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=99 then 'TT000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99 and @length=3) and (@length=3 and @ID<999) then 'TT000' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=999 then 'TT00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>999 and @length=4) and(@length=4 and @ID<9999) then 'TT00' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when @ID=9999 then 'TT0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>9999 and @length=5) and (@length=5 and @ID<99999) then 'TT0' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)
				when (@ID>99999 and @length=6) and (@length=6 and @ID<999999) then 'TT' +CONVERT(NVARCHAR(8), CONVERT(INT, @ID) + 1)

			end
	RETURN @ID
END

GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[maDV] [nvarchar](8) NOT NULL CONSTRAINT [DF_DV]  DEFAULT ([dbo].[AUTO_IDDV]()),
	[tenDichVu] [nvarchar](50) NULL,
	[donGia] [money] NULL,
	[soLuongDV] [int] NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[maDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKH] [nvarchar](8) NOT NULL CONSTRAINT [DF_KH]  DEFAULT ([dbo].[AUTO_IDKH]()),
	[tenKh] [nvarchar](50) NOT NULL,
	[soCMND] [nchar](20) NOT NULL,
	[gioiTinh] [tinyint] NOT NULL,
	[soDT] [nchar](11) NULL,
	[maDoan] [nchar](10) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[maLoaiPhong] [nvarchar](8) NOT NULL,
	[tenLoaiPhong] [nvarchar](50) NULL,
	[donGia] [money] NULL,
	[soNguoiToiDa] [int] NULL,
 CONSTRAINT [PK_LoaiPhong] PRIMARY KEY CLUSTERED 
(
	[maLoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNV] [nvarchar](8) NOT NULL CONSTRAINT [DF_NV]  DEFAULT ([dbo].[AUTO_IDNV]()),
	[tenNV] [nvarchar](50) NOT NULL,
	[soCMND] [nchar](20) NOT NULL,
	[gioiTinh] [tinyint] NOT NULL,
	[ngaySinh] [datetime] NOT NULL,
	[soDT] [nchar](11) NOT NULL,
	[chucVu] [tinyint] NOT NULL,
	[passWord] [varchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[maNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[maPhong] [nvarchar](8) NOT NULL CONSTRAINT [DF_LP]  DEFAULT ([dbo].[AUTO_IDPH]()),
	[maLoaiPhong] [nvarchar](8) NOT NULL,
	[tenPhong] [nvarchar](50) NOT NULL,
	[tang] [nvarchar](50) NOT NULL,
	[tinhTrang] [bit] NOT NULL,
	[ghiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[maPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SuDungDichVu]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuDungDichVu](
	[maThue] [nvarchar](8) NOT NULL,
	[maDV] [nvarchar](8) NOT NULL,
	[soLuong] [int] NOT NULL,
	[ngaySuDung] [datetime] NOT NULL,
	[gioSuDung] [time](7) NOT NULL,
 CONSTRAINT [PK_SuDungDichVu_1] PRIMARY KEY CLUSTERED 
(
	[maThue] ASC,
	[maDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToan](
	[maHD] [nvarchar](8) NOT NULL CONSTRAINT [DF_TT]  DEFAULT ([dbo].[AUTO_IDTT]()),
	[maThuePhong] [nvarchar](8) NOT NULL,
	[ngayLap] [datetime] NOT NULL,
	[gioLap] [time](7) NOT NULL,
	[thueVAT] [float] NOT NULL,
	[giamGia] [float] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuePhong]    Script Date: 06/11/2019 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuePhong](
	[maThue] [nvarchar](8) NOT NULL CONSTRAINT [DF_TP]  DEFAULT ([dbo].[AUTO_IDTP]()),
	[maPhong] [nvarchar](8) NOT NULL,
	[maKhach] [nvarchar](8) NOT NULL,
	[maNV] [nvarchar](8) NOT NULL,
	[ngayVao] [datetime] NOT NULL,
	[ngayRa] [datetime] NOT NULL,
	[trangThai] [tinyint] NOT NULL,
	[gioVao] [time](7) NOT NULL,
	[gioRa] [time](7) NOT NULL,
 CONSTRAINT [PK_ThuePhong] PRIMARY KEY CLUSTERED 
(
	[maThue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000001', N' Nước lọc', 10000.0000, 1834)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000002', N'Nước ngọt Minrinda', 15000.0000, 1358)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000003', N'Nước trái cây', 20000.0000, 269)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000004', N'Sữa chua', 10000.0000, 407)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000005', N'Bánh Chocopie', 5000.0000, 1561)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000006', N'Bánh quy', 35000.0000, 1958)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000007', N'Ăn trưa', 150000.0000, 287)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000008', N'Giặt ủi', 50000.0000, 1475)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000009', N'Thuê xe hơi', 1500000.0000, 72)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000010', N'Thuê xe máy', 200000.0000, 85)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000011', N'Chuyển hàng', 50000.0000, 72)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000012', N'Spa', 200000.0000, 99)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000013', N'Thuê đồ tắm hồ bơi', 120000.0000, 92)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000014', N'Trông trẻ', 250000.0000, 20)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000015', N'Sân Golf', 750000.0000, 50)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000016', N'Fitnes center', 300000.0000, 100)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000017', N'Bia Huda', 23000.0000, 200)
INSERT [dbo].[DichVu] ([maDV], [tenDichVu], [donGia], [soLuongDV]) VALUES (N'DV000018', N'Bánh mì tươi', 7000.0000, 500)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000001', N'Nguyễn Thị Thanh Thảo', N'0272626953          ', 0, N'0379301852 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000002', N'Lê Ánh Dương', N'0296314566          ', 0, N'0369885211 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000003', N'Trịnh Tú Trung', N'0203690932          ', 1, N'0168523221 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000004', N'Nguyễn Minh Phong', N'0175202563          ', 1, N'0963210012 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000005', N'Lê Hoài Thương', N'0236022210          ', 0, N'0369555013 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000006', N'Trần Ngọc Trâm', N'0269330120          ', 0, N'0909362124 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000007', N'Nguyễn Thảo Nguyên', N'0296322012          ', 0, N'0809365221 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000008', N'Nguyễn Xuân Đức', N'0296322147          ', 1, N'0963552142 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000009', N'Lại Minh Tâm', N'0208554123          ', 1, N'0623520017 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000010', N'Phan Gia Thùy Trang', N'0196325212          ', 0, N'0361001450 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000011', N'Mộc Nhĩ Đa', N'0201336452          ', 1, N'0916321521 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000012', N'Trần Bích Phượng', N'0301255200          ', 0, N'0807562152 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000013', N'Nguyễn Trần Minh Anh', N'0240533651          ', 1, N'0856332140 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000014', N'Nguyễn Văn Khương', N'0212500145          ', 1, N'0396258828 ', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKh], [soCMND], [gioiTinh], [soDT], [maDoan]) VALUES (N'KH000015', N'Phan Xuân Bách', N'0190050360          ', 1, N'0896635220 ', NULL)
INSERT [dbo].[LoaiPhong] ([maLoaiPhong], [tenLoaiPhong], [donGia], [soNguoiToiDa]) VALUES (N'LP000001', N'Normal', 350000.0000, 1)
INSERT [dbo].[LoaiPhong] ([maLoaiPhong], [tenLoaiPhong], [donGia], [soNguoiToiDa]) VALUES (N'LP000002', N'Double', 600000.0000, 3)
INSERT [dbo].[LoaiPhong] ([maLoaiPhong], [tenLoaiPhong], [donGia], [soNguoiToiDa]) VALUES (N'LP000003', N'Triple', 700000.0000, 4)
INSERT [dbo].[LoaiPhong] ([maLoaiPhong], [tenLoaiPhong], [donGia], [soNguoiToiDa]) VALUES (N'LP000004', N'Family', 850000.0000, 5)
INSERT [dbo].[LoaiPhong] ([maLoaiPhong], [tenLoaiPhong], [donGia], [soNguoiToiDa]) VALUES (N'LP000005', N'Vip', 1500000.0000, 2)
INSERT [dbo].[LoaiPhong] ([maLoaiPhong], [tenLoaiPhong], [donGia], [soNguoiToiDa]) VALUES (N'LP000006', N'Deluxe', 1700000.0000, 2)
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000001', N'Đỗ Thành Thị Qúy Phi', N'272695530           ', 1, CAST(N'1990-08-08 00:00:00.000' AS DateTime), N'0685220001 ', 0, N'123456@             ', N'admin@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000002', N'Nguyễn Thị Hoa Lan', N'262629637           ', 0, CAST(N'1993-01-12 00:00:00.000' AS DateTime), N'0385523322 ', 0, N'123456', N'admin1@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000003', N'Trương Đan Phong', N'262712100           ', 1, CAST(N'1998-02-02 00:00:00.000' AS DateTime), N'0386236660 ', 0, N'123456              ', N'admin2@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000004', N'Lưu Mễ Như A', N'232425512           ', 0, CAST(N'1995-09-08 00:00:00.000' AS DateTime), N'0362563225 ', 0, N'123456              ', N'admin3@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000005', N'Đỗ Thùy Linh', N'263155212           ', 0, CAST(N'1992-09-03 00:00:00.000' AS DateTime), N'0963001234 ', 0, N'123456              ', N'admin4@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000006', N'Nguyễn Chí Thông', N'125550369           ', 1, CAST(N'1996-03-21 00:00:00.000' AS DateTime), N'0369522210 ', 0, N'123456              ', N'admin5@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000007', N'Hứa Phan Quỳnh My', N'272626968           ', 0, CAST(N'1998-01-05 00:00:00.000' AS DateTime), N'0826601253 ', 0, N'123456              ', N'admin6@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000008', N'Lâm Vỹ Dạ', N'262639965           ', 0, CAST(N'1997-11-03 00:00:00.000' AS DateTime), N'0385022100 ', 0, N'123456              ', N'admin7@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000009', N'Lâm Canh Tân', N'269965123           ', 1, CAST(N'1996-07-21 00:00:00.000' AS DateTime), N'0345562011 ', 0, N'123456              ', N'admin8@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000010', N'Nguyễn Thị Hương Ly', N'270052462           ', 0, CAST(N'1997-06-25 00:00:00.000' AS DateTime), N'0396093369 ', 0, N'123456              ', N'admin9@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000011', N'Lê Viết Huy', N'296544010           ', 1, CAST(N'1996-12-31 00:00:00.000' AS DateTime), N'0262452123 ', 0, N'123456              ', N'admin10@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000012', N'Mai Thị Thanh Thúy', N'203369966           ', 0, CAST(N'1994-11-03 00:00:00.000' AS DateTime), N'0145021360 ', 0, N'123456', N'admin11@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000013', N'Nguyễn Trần Trúc Linh', N'262929633           ', 0, CAST(N'1999-04-01 00:00:00.000' AS DateTime), N'0378501101 ', 0, N'123456', N'admin12@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000014', N'Nguyễn Thị Kim Chi', N'272863500           ', 0, CAST(N'1999-02-03 00:00:00.000' AS DateTime), N'0379301526 ', 0, N'123456', N'admin13@gmail.com')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [soCMND], [gioiTinh], [ngaySinh], [soDT], [chucVu], [passWord], [email]) VALUES (N'NV000015', N'Nguyễn Thị Hoa Lan Rừng B', N'262629639           ', 0, CAST(N'1993-12-01 00:00:00.000' AS DateTime), N'0385523352 ', 0, N'123456', N'admin14@gmail.com')
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000001', N'LP000001', N'Phòng 01', N'1', 0, N'')
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000002', N'LP000001', N'Phòng 02', N'1', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000003', N'LP000001', N'Phòng 03', N'2', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000004', N'LP000004', N'Phòng 04', N'1', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000005', N'LP000004', N'Phòng 05', N'1', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000006', N'LP000004', N'Phòng 06', N'1', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000007', N'LP000001', N'Phòng 07', N'2', 0, N'')
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000008', N'LP000001', N'Phòng 08', N'2', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000009', N'LP000002', N'Phòng 09', N'4', 1, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000010', N'LP000002', N'Phòng 10', N'2', 0, N'Phòng cho gia đình')
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000011', N'LP000003', N'Phòng 11', N'2', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000012', N'LP000001', N'Phòng 12', N'3', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000013', N'LP000001', N'Phòng 13', N'3', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000014', N'LP000002', N'Phòng 14', N'3', 1, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000015', N'LP000002', N'Phòng 15', N'3', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000016', N'LP000003', N'Phòng 16', N'3', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000017', N'LP000005', N'Phòng 17', N'4', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000018', N'LP000005', N'Phòng 18', N'4', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000019', N'LP000006', N'Phòng 19', N'5', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000020', N'LP000005', N'Phòng 20', N'4', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000021', N'LP000006', N'Phòng 21', N'4', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000022', N'LP000005', N'Phòng 22', N'5', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000023', N'LP000005', N'Phòng 23', N'5', 1, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000024', N'LP000006', N'Phòng 24', N'3', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000025', N'LP000003', N'Phòng 25', N'1', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000026', N'LP000006', N'Phòng 26', N'3', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000027', N'LP000001', N'Phòng 27', N'2', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000028', N'LP000004', N'Phòng 28', N'4', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000029', N'LP000005', N'Phòng 29', N'6', 0, NULL)
INSERT [dbo].[Phong] ([maPhong], [maLoaiPhong], [tenPhong], [tang], [tinhTrang], [ghiChu]) VALUES (N'PH000030', N'LP000002', N'Phòng 30', N'6', 0, NULL)
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000001', N'DV000001', 3, CAST(N'2019-08-21 00:00:00.000' AS DateTime), CAST(N'12:12:12' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000002', N'DV000002', 4, CAST(N'2019-11-03 00:00:00.000' AS DateTime), CAST(N'01:30:42' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000002', N'DV000003', 4, CAST(N'2019-11-03 00:00:00.000' AS DateTime), CAST(N'01:30:42' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000003', N'DV000001', 19, CAST(N'2019-11-03 00:00:00.000' AS DateTime), CAST(N'22:18:32' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000003', N'DV000003', 13, CAST(N'2019-11-03 00:00:00.000' AS DateTime), CAST(N'22:18:32' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000005', N'DV000002', 22, CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'16:49:01' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000005', N'DV000004', 21, CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'16:49:01' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000006', N'DV000002', 13, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'16:40:40' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000006', N'DV000005', 22, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'16:40:40' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000007', N'DV000004', 20, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'16:55:29' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000007', N'DV000006', 5, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'16:55:29' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000007', N'DV000008', 20, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'16:55:29' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000010', N'DV000002', 1, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'20:46:19' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000010', N'DV000004', 1, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'20:46:19' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000010', N'DV000011', 1, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'20:46:19' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000012', N'DV000002', 1, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:32:30' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000012', N'DV000003', 1, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:32:30' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000012', N'DV000004', 1, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:32:30' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000012', N'DV000005', 1, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:32:30' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000013', N'DV000002', 10, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:33:34' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000013', N'DV000003', 3, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:33:34' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000013', N'DV000004', 23, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:33:34' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000013', N'DV000005', 16, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:33:34' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000014', N'DV000001', 13, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:35:27' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000014', N'DV000002', 23, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:35:27' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000014', N'DV000005', 8, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:35:27' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000015', N'DV000002', 20, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:43:41' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000015', N'DV000004', 7, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:43:41' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000015', N'DV000006', 14, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:43:41' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000016', N'DV000001', 22, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:48:21' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000016', N'DV000003', 29, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:48:21' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000017', N'DV000001', 5, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:50:34' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000017', N'DV000003', 2, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:50:34' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000018', N'DV000001', 14, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:52:58' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000018', N'DV000003', 15, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:52:58' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000019', N'DV000001', 14, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:54:57' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000019', N'DV000002', 17, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:54:57' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000020', N'DV000002', 25, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:55:43' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000020', N'DV000004', 25, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:55:43' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000021', N'DV000001', 27, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:56:48' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000021', N'DV000002', 24, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:56:48' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000022', N'DV000002', 9, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:58:26' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000022', N'DV000004', 8, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:58:26' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000022', N'DV000007', 10, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:58:26' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000022', N'DV000009', 1, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:58:26' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000023', N'DV000001', 5, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:05:19' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000023', N'DV000003', 7, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:05:19' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000024', N'DV000001', 4, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:07:11' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000025', N'DV000001', 5, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:10:26' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000025', N'DV000003', 19, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:10:26' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000026', N'DV000003', 22, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:12:50' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000026', N'DV000005', 18, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:12:50' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000027', N'DV000002', 6, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:20:07' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000027', N'DV000003', 16, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:20:07' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000028', N'DV000005', 11, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:20:17' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000028', N'DV000006', 15, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:20:17' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000028', N'DV000008', 5, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:20:17' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000029', N'DV000002', 12, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:22:18' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000029', N'DV000003', 10, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:22:18' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000029', N'DV000004', 19, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:22:18' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000030', N'DV000002', 7, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:33:38' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000030', N'DV000003', 21, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:33:38' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000031', N'DV000003', 4, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:34:54' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000031', N'DV000005', 31, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:34:54' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000031', N'DV000007', 3, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:34:54' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000031', N'DV000009', 6, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:34:54' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000031', N'DV000011', 7, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:34:54' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000031', N'DV000013', 8, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:34:54' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000032', N'DV000003', 20, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:36:18' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000032', N'DV000004', 16, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:36:18' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000032', N'DV000005', 21, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:36:18' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000033', N'DV000001', 5, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:41:27' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000033', N'DV000003', 17, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:41:27' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000034', N'DV000002', 5, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:45:05' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000034', N'DV000004', 16, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:45:05' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000035', N'DV000002', 1, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'09:39:28' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000035', N'DV000003', 1, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'09:39:28' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000035', N'DV000004', 1, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'09:39:28' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000036', N'DV000001', 1, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'10:38:10' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000036', N'DV000002', 5, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'10:53:17' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000036', N'DV000003', 1, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'10:38:10' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000036', N'DV000004', 16, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'10:51:04' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000036', N'DV000012', 1, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'10:51:04' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000037', N'DV000003', 21, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'10:39:01' AS Time))
INSERT [dbo].[SuDungDichVu] ([maThue], [maDV], [soLuong], [ngaySuDung], [gioSuDung]) VALUES (N'TP000037', N'DV000005', 5, CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'10:39:01' AS Time))
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000001', N'TP000001', CAST(N'2019-11-03 00:00:00.000' AS DateTime), CAST(N'23:27:08' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000002', N'TP000001', CAST(N'2019-11-03 00:00:00.000' AS DateTime), CAST(N'23:54:44' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000003', N'TP000002', CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'15:41:17' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000004', N'TP000001', CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'15:45:26' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000005', N'TP000002', CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'15:46:51' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000006', N'TP000001', CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'15:50:38' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000007', N'TP000003', CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'15:52:10' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000008', N'TP000001', CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'15:53:19' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000009', N'TP000002', CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'15:54:52' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000010', N'TP000004', CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'16:57:59' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000011', N'TP000005', CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'16:58:04' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000012', N'TP000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'16:49:17' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000013', N'TP000007', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'19:46:34' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000014', N'TP000008', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'19:52:09' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000015', N'TP000002', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'19:59:06' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000016', N'TP000006', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'20:05:07' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000017', N'TP000003', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'20:13:01' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000018', N'TP000009', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'20:20:24' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000019', N'TP000010', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'20:46:39' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000020', N'TP000012', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:32:36' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000021', N'TP000013', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:33:44' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000022', N'TP000014', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:35:31' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000023', N'TP000015', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:43:46' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000024', N'TP000016', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:48:26' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000025', N'TP000017', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:50:38' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000026', N'TP000018', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:53:02' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000027', N'TP000019', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:55:00' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000028', N'TP000020', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:55:46' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000029', N'TP000021', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:56:52' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000030', N'TP000022', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'23:58:30' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000031', N'TP000025', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:11:34' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000032', N'TP000024', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:14:51' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000033', N'TP000023', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:16:14' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000034', N'TP000026', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:19:05' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000035', N'TP000011', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:21:35' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000036', N'TP000029', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:24:24' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000037', N'TP000028', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:28:20' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000038', N'TP000027', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:31:53' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000039', N'TP000030', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:33:41' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000040', N'TP000031', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:35:25' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000041', N'TP000032', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:39:48' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000042', N'TP000033', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'00:41:30' AS Time), 0, 0)
INSERT [dbo].[ThanhToan] ([maHD], [maThuePhong], [ngayLap], [gioLap], [thueVAT], [giamGia]) VALUES (N'TT000043', N'TP000034', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'09:04:48' AS Time), 0, 0)
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000001', N'PH000010', N'KH000006', N'NV000001', CAST(N'2019-11-03 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'01:22:07' AS Time), CAST(N'16:49:17' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000002', N'PH000011', N'KH000006', N'NV000001', CAST(N'2019-11-03 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'01:30:42' AS Time), CAST(N'19:59:06' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000003', N'PH000013', N'KH000007', N'NV000001', CAST(N'2019-11-03 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'22:18:32' AS Time), CAST(N'20:13:01' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000004', N'PH000001', N'KH000014', N'NV000001', CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'2019-11-04 00:00:00.000' AS DateTime), 1, CAST(N'16:11:28' AS Time), CAST(N'16:57:59' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000005', N'PH000003', N'KH000012', N'NV000001', CAST(N'2019-11-04 00:00:00.000' AS DateTime), CAST(N'2019-11-04 00:00:00.000' AS DateTime), 1, CAST(N'16:49:01' AS Time), CAST(N'16:58:04' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000006', N'PH000012', N'KH000009', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'16:40:40' AS Time), CAST(N'20:05:07' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000007', N'PH000010', N'KH000013', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'16:55:29' AS Time), CAST(N'19:46:34' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000008', N'PH000002', N'KH000013', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'16:55:38' AS Time), CAST(N'19:52:09' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000009', N'PH000003', N'KH000007', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'20:18:59' AS Time), CAST(N'20:20:24' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000010', N'PH000003', N'KH000007', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'20:46:19' AS Time), CAST(N'20:46:39' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000011', N'PH000003', N'KH000008', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'23:32:20' AS Time), CAST(N'00:21:35' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000012', N'PH000005', N'KH000008', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'23:32:30' AS Time), CAST(N'23:32:36' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000013', N'PH000004', N'KH000010', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'23:33:34' AS Time), CAST(N'23:33:44' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000014', N'PH000001', N'KH000012', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'23:35:27' AS Time), CAST(N'23:35:31' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000015', N'PH000011', N'KH000014', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'23:43:41' AS Time), CAST(N'23:43:46' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000016', N'PH000006', N'KH000015', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'23:48:21' AS Time), CAST(N'23:48:26' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000017', N'PH000002', N'KH000015', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'23:50:34' AS Time), CAST(N'23:50:38' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000018', N'PH000011', N'KH000015', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'23:52:58' AS Time), CAST(N'23:53:02' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000019', N'PH000004', N'KH000015', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'23:54:57' AS Time), CAST(N'23:55:00' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000020', N'PH000001', N'KH000015', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'23:55:43' AS Time), CAST(N'23:55:46' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000021', N'PH000004', N'KH000015', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'23:56:48' AS Time), CAST(N'23:56:52' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000022', N'PH000001', N'KH000015', N'NV000001', CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2019-11-05 00:00:00.000' AS DateTime), 1, CAST(N'23:58:26' AS Time), CAST(N'23:58:30' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000023', N'PH000004', N'KH000009', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'00:05:19' AS Time), CAST(N'00:16:14' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000024', N'PH000002', N'KH000009', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'00:07:11' AS Time), CAST(N'00:14:51' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000025', N'PH000005', N'KH000009', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'00:10:26' AS Time), CAST(N'00:11:34' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000026', N'PH000010', N'KH000014', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'00:12:50' AS Time), CAST(N'00:19:05' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000027', N'PH000024', N'KH000007', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'00:20:07' AS Time), CAST(N'00:31:53' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000028', N'PH000020', N'KH000007', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'00:20:17' AS Time), CAST(N'00:28:20' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000029', N'PH000005', N'KH000007', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'00:22:18' AS Time), CAST(N'00:24:24' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000030', N'PH000003', N'KH000014', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'00:33:38' AS Time), CAST(N'00:33:41' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000031', N'PH000009', N'KH000015', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'00:34:54' AS Time), CAST(N'00:35:25' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000032', N'PH000018', N'KH000015', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'00:36:18' AS Time), CAST(N'00:39:48' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000033', N'PH000003', N'KH000013', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'00:41:27' AS Time), CAST(N'00:41:30' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000034', N'PH000002', N'KH000015', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 1, CAST(N'00:45:05' AS Time), CAST(N'09:04:48' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000035', N'PH000014', N'KH000006', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 0, CAST(N'09:39:28' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000036', N'PH000009', N'KH000013', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 0, CAST(N'10:38:10' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[ThuePhong] ([maThue], [maPhong], [maKhach], [maNV], [ngayVao], [ngayRa], [trangThai], [gioVao], [gioRa]) VALUES (N'TP000037', N'PH000023', N'KH000013', N'NV000001', CAST(N'2019-11-06 00:00:00.000' AS DateTime), CAST(N'2019-11-06 00:00:00.000' AS DateTime), 0, CAST(N'10:39:01' AS Time), CAST(N'14:00:00' AS Time))
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_LoaiPhong] FOREIGN KEY([maLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([maLoaiPhong])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_LoaiPhong]
GO
ALTER TABLE [dbo].[SuDungDichVu]  WITH CHECK ADD  CONSTRAINT [FK_SuDungDichVu_DichVu] FOREIGN KEY([maDV])
REFERENCES [dbo].[DichVu] ([maDV])
GO
ALTER TABLE [dbo].[SuDungDichVu] CHECK CONSTRAINT [FK_SuDungDichVu_DichVu]
GO
ALTER TABLE [dbo].[SuDungDichVu]  WITH CHECK ADD  CONSTRAINT [FK_SuDungDichVu_ThuePhong1] FOREIGN KEY([maThue])
REFERENCES [dbo].[ThuePhong] ([maThue])
GO
ALTER TABLE [dbo].[SuDungDichVu] CHECK CONSTRAINT [FK_SuDungDichVu_ThuePhong1]
GO
ALTER TABLE [dbo].[ThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_ThanhToan_ThuePhong] FOREIGN KEY([maThuePhong])
REFERENCES [dbo].[ThuePhong] ([maThue])
GO
ALTER TABLE [dbo].[ThanhToan] CHECK CONSTRAINT [FK_ThanhToan_ThuePhong]
GO
ALTER TABLE [dbo].[ThuePhong]  WITH CHECK ADD  CONSTRAINT [FK_ThuePhong_KhachHang] FOREIGN KEY([maKhach])
REFERENCES [dbo].[KhachHang] ([maKH])
GO
ALTER TABLE [dbo].[ThuePhong] CHECK CONSTRAINT [FK_ThuePhong_KhachHang]
GO
ALTER TABLE [dbo].[ThuePhong]  WITH CHECK ADD  CONSTRAINT [FK_ThuePhong_NhanVien] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[ThuePhong] CHECK CONSTRAINT [FK_ThuePhong_NhanVien]
GO
ALTER TABLE [dbo].[ThuePhong]  WITH CHECK ADD  CONSTRAINT [FK_ThuePhong_Phong] FOREIGN KEY([maPhong])
REFERENCES [dbo].[Phong] ([maPhong])
GO
ALTER TABLE [dbo].[ThuePhong] CHECK CONSTRAINT [FK_ThuePhong_Phong]
GO
USE [master]
GO
ALTER DATABASE [KhachSan] SET  READ_WRITE 
GO
