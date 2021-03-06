USE [master]
GO
/****** Object:  Database [proyectoV2]    Script Date: 26/10/2015 7:12:46 ******/
CREATE DATABASE [proyectoV2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyectoV2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\proyectoV2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'proyectoV2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\proyectoV2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [proyectoV2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyectoV2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyectoV2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyectoV2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyectoV2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyectoV2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyectoV2] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyectoV2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proyectoV2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyectoV2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyectoV2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyectoV2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyectoV2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyectoV2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyectoV2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyectoV2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyectoV2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [proyectoV2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyectoV2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyectoV2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyectoV2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyectoV2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyectoV2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyectoV2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyectoV2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [proyectoV2] SET  MULTI_USER 
GO
ALTER DATABASE [proyectoV2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyectoV2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyectoV2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyectoV2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [proyectoV2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [proyectoV2]
GO
/****** Object:  Table [dbo].[bitacoras]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacoras](
	[fecha] [date] NOT NULL,
	[hora] [timestamp] NOT NULL,
	[accion] [text] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_prosprecto] [int] NOT NULL,
	[id_reporte] [int] NOT NULL,
	[id_evento] [int] NOT NULL,
	[id_permiso] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[id_rol] [int] NOT NULL,
	[id_seguimiento] [int] NOT NULL,
	[id_sesion] [int] NOT NULL,
	[id_tipo_producto] [int] NOT NULL,
	[id_venta] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[evento_prospectos]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evento_prospectos](
	[id_evento] [int] NOT NULL,
	[id_prospecto] [int] NOT NULL,
 CONSTRAINT [PK_evento_prospectos] PRIMARY KEY CLUSTERED 
(
	[id_evento] ASC,
	[id_prospecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[eventos]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[eventos](
	[id_evento] [int] NOT NULL,
	[lugar] [varchar](100) NOT NULL,
	[prospectos] [int] NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NOT NULL,
 CONSTRAINT [PK_eventos] PRIMARY KEY CLUSTERED 
(
	[id_evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[permisos]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permisos](
	[id_permiso] [int] NOT NULL,
	[id_rol] [int] NOT NULL,
	[nombre] [nchar](100) NOT NULL,
	[descripcion] [ntext] NULL,
 CONSTRAINT [PK_permisos] PRIMARY KEY CLUSTERED 
(
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[productos]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[productos](
	[id_producto] [int] NOT NULL,
	[nombre] [varchar](10) NOT NULL,
	[costo] [money] NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[prospecto_interes]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prospecto_interes](
	[id_prospecto] [int] NOT NULL,
	[id_tipo_producto] [int] NOT NULL,
 CONSTRAINT [PK_prospecto_interes] PRIMARY KEY CLUSTERED 
(
	[id_prospecto] ASC,
	[id_tipo_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[prospectos]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[prospectos](
	[id_prospecto] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellidos] [varchar](100) NOT NULL,
	[edad] [int] NULL,
	[procedencia] [text] NULL,
	[estado] [bit] NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[direccion] [text] NULL,
	[interesado] [bit] NOT NULL,
	[cliente] [bit] NOT NULL,
 CONSTRAINT [PK_prospectos] PRIMARY KEY CLUSTERED 
(
	[id_prospecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reportes]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reportes](
	[id_reporte] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [text] NOT NULL,
 CONSTRAINT [PK_reportes] PRIMARY KEY CLUSTERED 
(
	[id_reporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rol_permiso]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol_permiso](
	[id_permiso] [int] NOT NULL,
	[id_rol] [int] NOT NULL,
 CONSTRAINT [PK_rol_permiso] PRIMARY KEY CLUSTERED 
(
	[id_permiso] ASC,
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rols]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rols](
	[nombre] [nchar](100) NOT NULL,
	[id_rol] [int] NOT NULL,
 CONSTRAINT [PK_rols] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[seguimientos]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seguimientos](
	[id_seguimiento] [int] NOT NULL,
	[id_prospecto] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_seguimientos] PRIMARY KEY CLUSTERED 
(
	[id_seguimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sesion]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sesion](
	[id_sesion] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [timestamp] NOT NULL,
 CONSTRAINT [PK_sesion] PRIMARY KEY CLUSTERED 
(
	[id_sesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipo_producto]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_producto](
	[id_tipo_producto] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [text] NULL,
 CONSTRAINT [PK_tipo_producto] PRIMARY KEY CLUSTERED 
(
	[id_tipo_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario_producto]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_producto](
	[id_usuario] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
 CONSTRAINT [PK_usuario_producto] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] NOT NULL,
	[cedula] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[telefono] [int] NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ventas](
	[id_venta] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[monto] [money] NULL,
	[fecha] [date] NULL,
	[tipo] [varchar](100) NULL,
 CONSTRAINT [PK_ventas] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ventas_producto]    Script Date: 26/10/2015 7:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas_producto](
	[id_venta] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
 CONSTRAINT [PK_ventas_producto] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_eventos] FOREIGN KEY([id_evento])
REFERENCES [dbo].[eventos] ([id_evento])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_eventos]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_permisos] FOREIGN KEY([id_permiso])
REFERENCES [dbo].[permisos] ([id_permiso])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_permisos]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_productos]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_prospectos] FOREIGN KEY([id_prosprecto])
REFERENCES [dbo].[prospectos] ([id_prospecto])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_prospectos]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_reportes] FOREIGN KEY([id_reporte])
REFERENCES [dbo].[reportes] ([id_reporte])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_reportes]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_seguimientos] FOREIGN KEY([id_seguimiento])
REFERENCES [dbo].[seguimientos] ([id_seguimiento])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_seguimientos]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_sesion] FOREIGN KEY([id_sesion])
REFERENCES [dbo].[sesion] ([id_sesion])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_sesion]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_tipo_producto] FOREIGN KEY([id_tipo_producto])
REFERENCES [dbo].[tipo_producto] ([id_tipo_producto])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_tipo_producto]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_usuarios]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_ventas] FOREIGN KEY([id_venta])
REFERENCES [dbo].[ventas] ([id_venta])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_ventas]
GO
ALTER TABLE [dbo].[evento_prospectos]  WITH CHECK ADD  CONSTRAINT [FK_evento_prospectos_eventos] FOREIGN KEY([id_evento])
REFERENCES [dbo].[eventos] ([id_evento])
GO
ALTER TABLE [dbo].[evento_prospectos] CHECK CONSTRAINT [FK_evento_prospectos_eventos]
GO
ALTER TABLE [dbo].[evento_prospectos]  WITH CHECK ADD  CONSTRAINT [FK_evento_prospectos_prospectos] FOREIGN KEY([id_prospecto])
REFERENCES [dbo].[prospectos] ([id_prospecto])
GO
ALTER TABLE [dbo].[evento_prospectos] CHECK CONSTRAINT [FK_evento_prospectos_prospectos]
GO
ALTER TABLE [dbo].[prospecto_interes]  WITH CHECK ADD  CONSTRAINT [FK_prospecto_interes_prospectos] FOREIGN KEY([id_prospecto])
REFERENCES [dbo].[prospectos] ([id_prospecto])
GO
ALTER TABLE [dbo].[prospecto_interes] CHECK CONSTRAINT [FK_prospecto_interes_prospectos]
GO
ALTER TABLE [dbo].[prospecto_interes]  WITH CHECK ADD  CONSTRAINT [FK_prospecto_interes_tipo_producto] FOREIGN KEY([id_tipo_producto])
REFERENCES [dbo].[tipo_producto] ([id_tipo_producto])
GO
ALTER TABLE [dbo].[prospecto_interes] CHECK CONSTRAINT [FK_prospecto_interes_tipo_producto]
GO
ALTER TABLE [dbo].[rol_permiso]  WITH CHECK ADD  CONSTRAINT [FK_rol_permiso_permisos] FOREIGN KEY([id_permiso])
REFERENCES [dbo].[permisos] ([id_permiso])
GO
ALTER TABLE [dbo].[rol_permiso] CHECK CONSTRAINT [FK_rol_permiso_permisos]
GO
ALTER TABLE [dbo].[rol_permiso]  WITH CHECK ADD  CONSTRAINT [FK_rol_permiso_rol_permiso] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rols] ([id_rol])
GO
ALTER TABLE [dbo].[rol_permiso] CHECK CONSTRAINT [FK_rol_permiso_rol_permiso]
GO
ALTER TABLE [dbo].[rols]  WITH CHECK ADD  CONSTRAINT [FK_rols_usuarios] FOREIGN KEY([id_rol])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[rols] CHECK CONSTRAINT [FK_rols_usuarios]
GO
ALTER TABLE [dbo].[usuario_producto]  WITH CHECK ADD  CONSTRAINT [FK_usuario_producto_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[usuario_producto] CHECK CONSTRAINT [FK_usuario_producto_productos]
GO
ALTER TABLE [dbo].[usuario_producto]  WITH CHECK ADD  CONSTRAINT [FK_usuario_producto_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[usuario_producto] CHECK CONSTRAINT [FK_usuario_producto_usuarios]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_usuarios]
GO
ALTER TABLE [dbo].[ventas_producto]  WITH CHECK ADD  CONSTRAINT [FK_ventas_producto_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[ventas_producto] CHECK CONSTRAINT [FK_ventas_producto_productos]
GO
ALTER TABLE [dbo].[ventas_producto]  WITH CHECK ADD  CONSTRAINT [FK_ventas_producto_ventas] FOREIGN KEY([id_venta])
REFERENCES [dbo].[ventas] ([id_venta])
GO
ALTER TABLE [dbo].[ventas_producto] CHECK CONSTRAINT [FK_ventas_producto_ventas]
GO
USE [master]
GO
ALTER DATABASE [proyectoV2] SET  READ_WRITE 
GO
