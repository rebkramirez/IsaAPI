USE [master]
GO
/****** Object:  Database [ISAControles]    Script Date: 3/22/2025 11:09:33 PM ******/
CREATE DATABASE [ISAControles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ISAControles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ISAControles.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ISAControles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ISAControles_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ISAControles] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ISAControles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ISAControles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ISAControles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ISAControles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ISAControles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ISAControles] SET ARITHABORT OFF 
GO
ALTER DATABASE [ISAControles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ISAControles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ISAControles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ISAControles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ISAControles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ISAControles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ISAControles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ISAControles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ISAControles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ISAControles] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ISAControles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ISAControles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ISAControles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ISAControles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ISAControles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ISAControles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ISAControles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ISAControles] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ISAControles] SET  MULTI_USER 
GO
ALTER DATABASE [ISAControles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ISAControles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ISAControles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ISAControles] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ISAControles] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ISAControles] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ISAControles] SET QUERY_STORE = OFF
GO
USE [ISAControles]
GO
/****** Object:  User [ISAControles]    Script Date: 3/22/2025 11:09:33 PM ******/
CREATE USER [ISAControles] FOR LOGIN [ISAControles] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ISAControles]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 3/22/2025 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[NombreCliente] [varchar](100) NOT NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 3/22/2025 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[ComentarioId] [int] IDENTITY(1,1) NOT NULL,
	[Contenido] [varchar](max) NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[UsuarioId] [int] NULL,
	[ProyectoId] [int] NULL,
	[RespuestaA] [varchar](50) NULL,
	[ArchivoAdjunto] [varchar](255) NULL,
	[FechaModificacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ComentarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 3/22/2025 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[EmpleadoId] [int] IDENTITY(1,1) NOT NULL,
	[NombreEmpleado] [varchar](100) NOT NULL,
	[Cargo] [varchar](50) NOT NULL,
	[Telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpleadosProyectos]    Script Date: 3/22/2025 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadosProyectos](
	[EmpleadoId] [int] NOT NULL,
	[ProyectoId] [int] NOT NULL,
	[RolProyecto] [varchar](50) NULL,
 CONSTRAINT [PK_EmpleadosProyectos] PRIMARY KEY CLUSTERED 
(
	[EmpleadoId] ASC,
	[ProyectoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndicadoresProyecto]    Script Date: 3/22/2025 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndicadoresProyecto](
	[IndicadorId] [int] IDENTITY(1,1) NOT NULL,
	[TiempoEjecutado] [int] NOT NULL,
	[CostoEjecutado] [decimal](10, 2) NOT NULL,
	[ProyectoId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IndicadorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proyectos]    Script Date: 3/22/2025 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyectos](
	[ProyectoId] [int] IDENTITY(1,1) NOT NULL,
	[NombreProyecto] [varchar](100) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NULL,
	[EstadoProyecto] [varchar](50) NOT NULL,
	[ClienteId] [int] NULL,
	[EncargadoId] [int] NULL,
	[TipoProyectoId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProyectoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/22/2025 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolId] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[NombreRol] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tareas]    Script Date: 3/22/2025 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tareas](
	[TareaId] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionTarea] [varchar](100) NOT NULL,
	[EstadoTarea] [varchar](50) NOT NULL,
	[FechaInicioTarea] [date] NOT NULL,
	[FechaFinTarea] [date] NULL,
	[ProyectoId] [int] NULL,
	[EmpleadoId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TareaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposProyectos]    Script Date: 3/22/2025 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposProyectos](
	[TipoProyectoId] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TipoProyectoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 3/22/2025 11:09:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[RolId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Proyectos] FOREIGN KEY([ProyectoId])
REFERENCES [dbo].[Proyectos] ([ProyectoId])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_Proyectos]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([UserId])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_Usuarios]
GO
ALTER TABLE [dbo].[EmpleadosProyectos]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadosProyectos_Empleados] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[Empleados] ([EmpleadoId])
GO
ALTER TABLE [dbo].[EmpleadosProyectos] CHECK CONSTRAINT [FK_EmpleadosProyectos_Empleados]
GO
ALTER TABLE [dbo].[EmpleadosProyectos]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadosProyectos_Proyectos] FOREIGN KEY([ProyectoId])
REFERENCES [dbo].[Proyectos] ([ProyectoId])
GO
ALTER TABLE [dbo].[EmpleadosProyectos] CHECK CONSTRAINT [FK_EmpleadosProyectos_Proyectos]
GO
ALTER TABLE [dbo].[IndicadoresProyecto]  WITH CHECK ADD  CONSTRAINT [FK_IndicadoresProyecto_Proyectos] FOREIGN KEY([ProyectoId])
REFERENCES [dbo].[Proyectos] ([ProyectoId])
GO
ALTER TABLE [dbo].[IndicadoresProyecto] CHECK CONSTRAINT [FK_IndicadoresProyecto_Proyectos]
GO
ALTER TABLE [dbo].[Proyectos]  WITH CHECK ADD  CONSTRAINT [FK_Proyectos_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[Proyectos] CHECK CONSTRAINT [FK_Proyectos_Clientes]
GO
ALTER TABLE [dbo].[Proyectos]  WITH CHECK ADD  CONSTRAINT [FK_Proyectos_Empleados] FOREIGN KEY([EncargadoId])
REFERENCES [dbo].[Empleados] ([EmpleadoId])
GO
ALTER TABLE [dbo].[Proyectos] CHECK CONSTRAINT [FK_Proyectos_Empleados]
GO
ALTER TABLE [dbo].[Proyectos]  WITH CHECK ADD  CONSTRAINT [FK_Proyectos_TiposProyectos] FOREIGN KEY([TipoProyectoId])
REFERENCES [dbo].[TiposProyectos] ([TipoProyectoId])
GO
ALTER TABLE [dbo].[Proyectos] CHECK CONSTRAINT [FK_Proyectos_TiposProyectos]
GO
ALTER TABLE [dbo].[Tareas]  WITH CHECK ADD  CONSTRAINT [FK_Tareas_Empleados] FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[Empleados] ([EmpleadoId])
GO
ALTER TABLE [dbo].[Tareas] CHECK CONSTRAINT [FK_Tareas_Empleados]
GO
ALTER TABLE [dbo].[Tareas]  WITH CHECK ADD  CONSTRAINT [FK_Tareas_Proyectos] FOREIGN KEY([ProyectoId])
REFERENCES [dbo].[Proyectos] ([ProyectoId])
GO
ALTER TABLE [dbo].[Tareas] CHECK CONSTRAINT [FK_Tareas_Proyectos]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Roles] FOREIGN KEY([RolId])
REFERENCES [dbo].[Roles] ([RolId])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Roles]
GO
USE [master]
GO
ALTER DATABASE [ISAControles] SET  READ_WRITE 
GO
