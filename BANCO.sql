USE [master]
GO
/****** Object:  Database [HAMBURGUERIA]    Script Date: 21/12/2017 21:34:09 ******/
CREATE DATABASE [HAMBURGUERIA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HAMBURGUERIA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HAMBURGUERIA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HAMBURGUERIA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HAMBURGUERIA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HAMBURGUERIA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HAMBURGUERIA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HAMBURGUERIA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET ARITHABORT OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HAMBURGUERIA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HAMBURGUERIA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HAMBURGUERIA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HAMBURGUERIA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HAMBURGUERIA] SET  MULTI_USER 
GO
ALTER DATABASE [HAMBURGUERIA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HAMBURGUERIA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HAMBURGUERIA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HAMBURGUERIA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HAMBURGUERIA] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HAMBURGUERIA]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 21/12/2017 21:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[CODIGO] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](50) NULL,
	[CPF] [varchar](14) NULL,
	[CEP] [nchar](10) NULL,
	[ENDERECO] [nchar](40) NULL,
	[EMAIL] [nchar](40) NULL,
	[CELULAR] [nchar](14) NULL,
	[SENHA] [nchar](10) NULL,
	[TIPO] [char](1) NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITEM_PEDIDO]    Script Date: 21/12/2017 21:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEM_PEDIDO](
	[PEDIDO] [int] NULL,
	[NRITEM] [int] NULL,
	[PRODUTO] [int] NULL,
	[QTDE] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PEDIDO]    Script Date: 21/12/2017 21:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PEDIDO](
	[COD_PEDIDO] [int] IDENTITY(1,1) NOT NULL,
	[CLIENTE] [int] NULL,
	[DATA] [date] NULL,
	[STATUS] [char](1) NULL,
 CONSTRAINT [PK_PEDIDO] PRIMARY KEY CLUSTERED 
(
	[COD_PEDIDO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRODUTO]    Script Date: 21/12/2017 21:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUTO](
	[COD_PRODUTO] [int] IDENTITY(1,1) NOT NULL,
	[DESC_PRODUTO] [nchar](40) NULL,
	[PRECO] [decimal](4, 2) NULL,
 CONSTRAINT [PK_PRODUTO] PRIMARY KEY CLUSTERED 
(
	[COD_PRODUTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CLIENTE] ON 

INSERT [dbo].[CLIENTE] ([CODIGO], [NOME], [CPF], [CEP], [ENDERECO], [EMAIL], [CELULAR], [SENHA], [TIPO]) VALUES (5, N'PEDRO', N'324.825.818-77', N'1111      ', N'AAAAAAAAA                               ', N'AAAAAAAA                                ', N'222222        ', N'888       ', N'C')
INSERT [dbo].[CLIENTE] ([CODIGO], [NOME], [CPF], [CEP], [ENDERECO], [EMAIL], [CELULAR], [SENHA], [TIPO]) VALUES (8, N'VALBERIELSON', N'222.222.222-22', N'17522-272 ', N'AV MARTIN AFONSO, 87                    ', N'VALBERIELSON@YAHOO.COM.BR               ', N'(14)99646-5820', N'123456    ', N'A')
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
INSERT [dbo].[ITEM_PEDIDO] ([PEDIDO], [NRITEM], [PRODUTO], [QTDE]) VALUES (1, 1, 1, 1)
INSERT [dbo].[ITEM_PEDIDO] ([PEDIDO], [NRITEM], [PRODUTO], [QTDE]) VALUES (1, 2, 2, 2)
INSERT [dbo].[ITEM_PEDIDO] ([PEDIDO], [NRITEM], [PRODUTO], [QTDE]) VALUES (2, 1, 3, 1)
INSERT [dbo].[ITEM_PEDIDO] ([PEDIDO], [NRITEM], [PRODUTO], [QTDE]) VALUES (2, 2, 5, 1)
INSERT [dbo].[ITEM_PEDIDO] ([PEDIDO], [NRITEM], [PRODUTO], [QTDE]) VALUES (3, 1, 6, 1)
INSERT [dbo].[ITEM_PEDIDO] ([PEDIDO], [NRITEM], [PRODUTO], [QTDE]) VALUES (4, 1, 6, 1)
SET IDENTITY_INSERT [dbo].[PEDIDO] ON 

INSERT [dbo].[PEDIDO] ([COD_PEDIDO], [CLIENTE], [DATA], [STATUS]) VALUES (1, 5, CAST(N'2017-12-21' AS Date), N' ')
INSERT [dbo].[PEDIDO] ([COD_PEDIDO], [CLIENTE], [DATA], [STATUS]) VALUES (2, 5, CAST(N'2017-12-21' AS Date), N' ')
INSERT [dbo].[PEDIDO] ([COD_PEDIDO], [CLIENTE], [DATA], [STATUS]) VALUES (3, 5, CAST(N'2017-12-20' AS Date), N' ')
INSERT [dbo].[PEDIDO] ([COD_PEDIDO], [CLIENTE], [DATA], [STATUS]) VALUES (4, 5, CAST(N'2017-12-19' AS Date), N'S')
SET IDENTITY_INSERT [dbo].[PEDIDO] OFF
SET IDENTITY_INSERT [dbo].[PRODUTO] ON 

INSERT [dbo].[PRODUTO] ([COD_PRODUTO], [DESC_PRODUTO], [PRECO]) VALUES (1, N'X-BURGUER                               ', CAST(10.00 AS Decimal(4, 2)))
INSERT [dbo].[PRODUTO] ([COD_PRODUTO], [DESC_PRODUTO], [PRECO]) VALUES (2, N'X-SALADA                                ', CAST(12.00 AS Decimal(4, 2)))
INSERT [dbo].[PRODUTO] ([COD_PRODUTO], [DESC_PRODUTO], [PRECO]) VALUES (3, N'X-BACON                                 ', CAST(11.00 AS Decimal(4, 2)))
INSERT [dbo].[PRODUTO] ([COD_PRODUTO], [DESC_PRODUTO], [PRECO]) VALUES (4, N'REFRIGERANTE 350ML                      ', CAST(5.00 AS Decimal(4, 2)))
INSERT [dbo].[PRODUTO] ([COD_PRODUTO], [DESC_PRODUTO], [PRECO]) VALUES (5, N'SUCO NATURAL                            ', CAST(4.00 AS Decimal(4, 2)))
INSERT [dbo].[PRODUTO] ([COD_PRODUTO], [DESC_PRODUTO], [PRECO]) VALUES (6, N'BATATA FRITA 500G                       ', CAST(6.00 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[PRODUTO] OFF
ALTER TABLE [dbo].[ITEM_PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_PEDIDO_PRODUTO] FOREIGN KEY([PRODUTO])
REFERENCES [dbo].[PRODUTO] ([COD_PRODUTO])
GO
ALTER TABLE [dbo].[ITEM_PEDIDO] CHECK CONSTRAINT [FK_ITEM_PEDIDO_PRODUTO]
GO
USE [master]
GO
ALTER DATABASE [HAMBURGUERIA] SET  READ_WRITE 
GO
