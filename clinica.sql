USE [CentroSaludFamilia]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 16/1/2024 09:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[IDCita] [int] NOT NULL,
	[IDPaciente] [int] NULL,
	[IDMédico] [int] NULL,
	[FechaHoraCita] [datetime] NULL,
	[Motivo] [varchar](255) NULL,
	[EstadoCita] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 16/1/2024 09:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[IDFactura] [int] NOT NULL,
	[IDCita] [int] NULL,
	[FechaEmision] [date] NULL,
	[MontoTotal] [decimal](10, 2) NULL,
	[EstadoPago] [varchar](20) NULL,
	[MetodoPago] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialesMedicos]    Script Date: 16/1/2024 09:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialesMedicos](
	[IDHistorial] [int] NOT NULL,
	[IDPaciente] [int] NULL,
	[IDMédico] [int] NULL,
	[FechaVisita] [date] NULL,
	[Diagnostico] [text] NULL,
	[Tratamiento] [text] NULL,
	[Prescripciones] [text] NULL,
	[ResultadosPruebasMedicas] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 16/1/2024 09:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[IDMédico] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Especialidad] [varchar](50) NULL,
	[Telefono] [varchar](20) NULL,
	[CorreoElectronico] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDMédico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 16/1/2024 09:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[IDPaciente] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[FechaNacimiento] [date] NULL,
	[Genero] [varchar](20) NULL,
	[Direccion] [varchar](255) NULL,
	[Telefono] [varchar](20) NULL,
	[CorreoElectronico] [varchar](100) NULL,
	[SeguroMedico] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recetas]    Script Date: 16/1/2024 09:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recetas](
	[IDReceta] [int] NOT NULL,
	[IDHistorial] [int] NULL,
	[Medicamento] [varchar](50) NULL,
	[Dosificación] [varchar](50) NULL,
	[Instrucciones] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiciosMedicos]    Script Date: 16/1/2024 09:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiciosMedicos](
	[IDServicio] [int] NOT NULL,
	[IDCita] [int] NULL,
	[DescripcionServicio] [text] NULL,
	[Costo] [decimal](10, 2) NULL,
	[ResultadosPruebasMedicas] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD FOREIGN KEY([IDMédico])
REFERENCES [dbo].[Medicos] ([IDMédico])
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD FOREIGN KEY([IDPaciente])
REFERENCES [dbo].[Pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([IDCita])
REFERENCES [dbo].[Citas] ([IDCita])
GO
ALTER TABLE [dbo].[HistorialesMedicos]  WITH CHECK ADD FOREIGN KEY([IDMédico])
REFERENCES [dbo].[Medicos] ([IDMédico])
GO
ALTER TABLE [dbo].[HistorialesMedicos]  WITH CHECK ADD FOREIGN KEY([IDPaciente])
REFERENCES [dbo].[Pacientes] ([IDPaciente])
GO
ALTER TABLE [dbo].[Recetas]  WITH CHECK ADD FOREIGN KEY([IDHistorial])
REFERENCES [dbo].[HistorialesMedicos] ([IDHistorial])
GO
ALTER TABLE [dbo].[ServiciosMedicos]  WITH CHECK ADD FOREIGN KEY([IDCita])
REFERENCES [dbo].[Citas] ([IDCita])
GO
