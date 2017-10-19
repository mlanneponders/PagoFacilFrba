USE [GD2C2017]
GO
/****** Object:  Table [gd_esquema].[Clientes]    Script Date: 18/10/2017 23:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Clientes](
	[CLIE_ID] [int] IDENTITY(1,1) NOT NULL,
	[CLIE_NOMBRE] [nvarchar](255) NOT NULL,
	[CLIE_APELLIDO] [nvarchar](255) NOT NULL,
	[CLIE_FECHA_NACIMIENTO] [datetime] NOT NULL,
	[CLIE_DIR_ID] [int] NOT NULL,
	[CLIE_DNI] [char](8) NOT NULL,
	[CLIE_MAIL] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[CLIE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Devoluciones]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Devoluciones](
	[DEV_FACTURA] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DEV_DESCRIPCION] [varchar](255) NOT NULL,
	[DEV_USER_ID] [int] NOT NULL,
	[DEV_CLIE_ID] [int] NOT NULL,
	[DEV_TIPO] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Devoluciones] PRIMARY KEY CLUSTERED 
(
	[DEV_FACTURA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Direcciones]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Direcciones](
	[DIR_ID] [int] IDENTITY(1,1) NOT NULL,
	[DIR_DIRECCION] [nvarchar](255) NOT NULL,
	[DIR_CODIGO_POSTAL] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Direcciones] PRIMARY KEY CLUSTERED 
(
	[DIR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Empresas]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Empresas](
	[EMP_ID] [int] IDENTITY(1,1) NOT NULL,
	[EMP_CUIT] [nvarchar](50) NOT NULL,
	[EMP_NOMBRE] [nvarchar](255) NOT NULL,
	[EMP_DIR_ID] [int] NOT NULL,
	[EMP_RUB_ID] [int] NOT NULL,
	[EMP_ACTIVA] [bit] NOT NULL,
 CONSTRAINT [PK_Empresas] PRIMARY KEY CLUSTERED 
(
	[EMP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Facturas]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Facturas](
	[FACT_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[FACT_CLIE_ID] [int] NOT NULL,
	[FACT_VENCIMIENTO] [datetime] NOT NULL,
	[FACT_ALTA] [datetime] NOT NULL,
	[FACT_REND_ID] [numeric](18, 0) NULL,
	[FACT_PAGO_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[FACT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Funcionalidades]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Funcionalidades](
	[FUNC_ID] [int] IDENTITY(1,1) NOT NULL,
	[FUNC_DESCRIPCION] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Funcionalidades] PRIMARY KEY CLUSTERED 
(
	[FUNC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Items]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Items](
	[ITEM_ID] [int] IDENTITY(1,1) NOT NULL,
	[ITEM_CANTIDAD] [numeric](18, 0) NOT NULL,
	[ITEM_MONTO] [numeric](18, 2) NOT NULL,
	[ITEM_FACT_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ITEM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Pagos]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Pagos](
	[PAGO_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[PAGO_FECHA_PAGO] [datetime] NOT NULL,
	[PAGO_CLIE_ID] [int] NOT NULL,
	[PAGO_USER_ID] [int] NOT NULL,
	[PAGO_SUC_ID] [int] NOT NULL,
	[PAGO_TOTAL] [numeric](18, 2) NOT NULL,
	[PAGO_FORMA_PAGO] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[PAGO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Rendiciones]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Rendiciones](
	[REND_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[REND_EMP_ID] [int] NOT NULL,
	[REND_TOTAL_RENDICION] [numeric](18, 2) NOT NULL,
	[REND_PORCENTAJE_COMISION] [tinyint] NOT NULL,
	[REND_FECHA] [datetime] NOT NULL,
 CONSTRAINT [PK_Rendiciones] PRIMARY KEY CLUSTERED 
(
	[REND_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Rol_X_Funcionalidad]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Rol_X_Funcionalidad](
	[FUNCX_ID] [int] NOT NULL,
	[ROLX_ID] [int] NOT NULL,
 CONSTRAINT [PK_Rol_X_Funcionalidad] PRIMARY KEY CLUSTERED 
(
	[FUNCX_ID] ASC,
	[ROLX_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Roles]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Roles](
	[ROL_ID] [int] IDENTITY(1,1) NOT NULL,
	[ROL_NOMBRE] [varchar](50) NOT NULL,
	[ROL_ACTIVO] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ROL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Rubros]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Rubros](
	[RUB_ID] [int] IDENTITY(1,1) NOT NULL,
	[RUB_DESCRIPCION] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rubros] PRIMARY KEY CLUSTERED 
(
	[RUB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Sucursales]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Sucursales](
	[SUC_ID] [int] IDENTITY(1,1) NOT NULL,
	[SUC_DIR_ID] [int] NOT NULL,
	[SUC_NOMBRE] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sucursales] PRIMARY KEY CLUSTERED 
(
	[SUC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Usuario_X_Rol]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Usuario_X_Rol](
	[USERX_ID] [int] NOT NULL,
	[ROLX_ID] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_X_Rol] PRIMARY KEY CLUSTERED 
(
	[USERX_ID] ASC,
	[ROLX_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Usuario_X_Sucursal]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Usuario_X_Sucursal](
	[USERX_ID] [int] NOT NULL,
	[SUCX_ID] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_X_Sucursal] PRIMARY KEY CLUSTERED 
(
	[USERX_ID] ASC,
	[SUCX_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gd_esquema].[Usuarios]    Script Date: 18/10/2017 23:56:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Usuarios](
	[USER_ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_USUARIO] [varchar](50) NOT NULL,
	[USER_PASSWORD] [varchar](50) NOT NULL,
	[USER_ACTIVO] [bit] NOT NULL,
	[USER_INTENTOS] [tinyint] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [gd_esquema].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Direcciones] FOREIGN KEY([CLIE_DIR_ID])
REFERENCES [gd_esquema].[Direcciones] ([DIR_ID])
GO
ALTER TABLE [gd_esquema].[Clientes] CHECK CONSTRAINT [FK_Clientes_Direcciones]
GO
ALTER TABLE [gd_esquema].[Devoluciones]  WITH CHECK ADD  CONSTRAINT [FK_Devoluciones_Clientes] FOREIGN KEY([DEV_CLIE_ID])
REFERENCES [gd_esquema].[Clientes] ([CLIE_ID])
GO
ALTER TABLE [gd_esquema].[Devoluciones] CHECK CONSTRAINT [FK_Devoluciones_Clientes]
GO
ALTER TABLE [gd_esquema].[Devoluciones]  WITH CHECK ADD  CONSTRAINT [FK_Devoluciones_Facturas] FOREIGN KEY([DEV_FACTURA])
REFERENCES [gd_esquema].[Facturas] ([FACT_ID])
GO
ALTER TABLE [gd_esquema].[Devoluciones] CHECK CONSTRAINT [FK_Devoluciones_Facturas]
GO
ALTER TABLE [gd_esquema].[Devoluciones]  WITH CHECK ADD  CONSTRAINT [FK_Devoluciones_Usuarios] FOREIGN KEY([DEV_USER_ID])
REFERENCES [gd_esquema].[Usuarios] ([USER_ID])
GO
ALTER TABLE [gd_esquema].[Devoluciones] CHECK CONSTRAINT [FK_Devoluciones_Usuarios]
GO
ALTER TABLE [gd_esquema].[Empresas]  WITH CHECK ADD  CONSTRAINT [FK_Empresas_Direcciones] FOREIGN KEY([EMP_DIR_ID])
REFERENCES [gd_esquema].[Direcciones] ([DIR_ID])
GO
ALTER TABLE [gd_esquema].[Empresas] CHECK CONSTRAINT [FK_Empresas_Direcciones]
GO
ALTER TABLE [gd_esquema].[Empresas]  WITH CHECK ADD  CONSTRAINT [FK_Empresas_Rubros] FOREIGN KEY([EMP_RUB_ID])
REFERENCES [gd_esquema].[Rubros] ([RUB_ID])
GO
ALTER TABLE [gd_esquema].[Empresas] CHECK CONSTRAINT [FK_Empresas_Rubros]
GO
ALTER TABLE [gd_esquema].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Clientes] FOREIGN KEY([FACT_CLIE_ID])
REFERENCES [gd_esquema].[Clientes] ([CLIE_ID])
GO
ALTER TABLE [gd_esquema].[Facturas] CHECK CONSTRAINT [FK_Facturas_Clientes]
GO
ALTER TABLE [gd_esquema].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Pagos] FOREIGN KEY([FACT_PAGO_ID])
REFERENCES [gd_esquema].[Pagos] ([PAGO_ID])
GO
ALTER TABLE [gd_esquema].[Facturas] CHECK CONSTRAINT [FK_Facturas_Pagos]
GO
ALTER TABLE [gd_esquema].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Rendiciones] FOREIGN KEY([FACT_REND_ID])
REFERENCES [gd_esquema].[Rendiciones] ([REND_ID])
GO
ALTER TABLE [gd_esquema].[Facturas] CHECK CONSTRAINT [FK_Facturas_Rendiciones]
GO
ALTER TABLE [gd_esquema].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Facturas] FOREIGN KEY([ITEM_FACT_ID])
REFERENCES [gd_esquema].[Facturas] ([FACT_ID])
GO
ALTER TABLE [gd_esquema].[Items] CHECK CONSTRAINT [FK_Items_Facturas]
GO
ALTER TABLE [gd_esquema].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Clientes] FOREIGN KEY([PAGO_CLIE_ID])
REFERENCES [gd_esquema].[Clientes] ([CLIE_ID])
GO
ALTER TABLE [gd_esquema].[Pagos] CHECK CONSTRAINT [FK_Pagos_Clientes]
GO
ALTER TABLE [gd_esquema].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Sucursales] FOREIGN KEY([PAGO_SUC_ID])
REFERENCES [gd_esquema].[Sucursales] ([SUC_ID])
GO
ALTER TABLE [gd_esquema].[Pagos] CHECK CONSTRAINT [FK_Pagos_Sucursales]
GO
ALTER TABLE [gd_esquema].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Usuarios] FOREIGN KEY([PAGO_USER_ID])
REFERENCES [gd_esquema].[Usuarios] ([USER_ID])
GO
ALTER TABLE [gd_esquema].[Pagos] CHECK CONSTRAINT [FK_Pagos_Usuarios]
GO
ALTER TABLE [gd_esquema].[Rendiciones]  WITH CHECK ADD  CONSTRAINT [FK_Rendiciones_Empresas] FOREIGN KEY([REND_EMP_ID])
REFERENCES [gd_esquema].[Empresas] ([EMP_ID])
GO
ALTER TABLE [gd_esquema].[Rendiciones] CHECK CONSTRAINT [FK_Rendiciones_Empresas]
GO
ALTER TABLE [gd_esquema].[Rol_X_Funcionalidad]  WITH CHECK ADD  CONSTRAINT [FK_Rol_X_Funcionalidad_Funcionalidades] FOREIGN KEY([ROLX_ID])
REFERENCES [gd_esquema].[Funcionalidades] ([FUNC_ID])
GO
ALTER TABLE [gd_esquema].[Rol_X_Funcionalidad] CHECK CONSTRAINT [FK_Rol_X_Funcionalidad_Funcionalidades]
GO
ALTER TABLE [gd_esquema].[Rol_X_Funcionalidad]  WITH CHECK ADD  CONSTRAINT [FK_Rol_X_Funcionalidad_Roles] FOREIGN KEY([FUNCX_ID])
REFERENCES [gd_esquema].[Roles] ([ROL_ID])
GO
ALTER TABLE [gd_esquema].[Rol_X_Funcionalidad] CHECK CONSTRAINT [FK_Rol_X_Funcionalidad_Roles]
GO
ALTER TABLE [gd_esquema].[Sucursales]  WITH CHECK ADD  CONSTRAINT [FK_Sucursales_Direcciones] FOREIGN KEY([SUC_DIR_ID])
REFERENCES [gd_esquema].[Direcciones] ([DIR_ID])
GO
ALTER TABLE [gd_esquema].[Sucursales] CHECK CONSTRAINT [FK_Sucursales_Direcciones]
GO
ALTER TABLE [gd_esquema].[Usuario_X_Rol]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_X_Rol_Roles] FOREIGN KEY([ROLX_ID])
REFERENCES [gd_esquema].[Roles] ([ROL_ID])
GO
ALTER TABLE [gd_esquema].[Usuario_X_Rol] CHECK CONSTRAINT [FK_Usuario_X_Rol_Roles]
GO
ALTER TABLE [gd_esquema].[Usuario_X_Rol]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_X_Rol_Usuarios] FOREIGN KEY([USERX_ID])
REFERENCES [gd_esquema].[Usuarios] ([USER_ID])
GO
ALTER TABLE [gd_esquema].[Usuario_X_Rol] CHECK CONSTRAINT [FK_Usuario_X_Rol_Usuarios]
GO
ALTER TABLE [gd_esquema].[Usuario_X_Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_X_Sucursal_Sucursales] FOREIGN KEY([SUCX_ID])
REFERENCES [gd_esquema].[Sucursales] ([SUC_ID])
GO
ALTER TABLE [gd_esquema].[Usuario_X_Sucursal] CHECK CONSTRAINT [FK_Usuario_X_Sucursal_Sucursales]
GO
ALTER TABLE [gd_esquema].[Usuario_X_Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_X_Sucursal_Usuarios] FOREIGN KEY([USERX_ID])
REFERENCES [gd_esquema].[Usuarios] ([USER_ID])
GO
ALTER TABLE [gd_esquema].[Usuario_X_Sucursal] CHECK CONSTRAINT [FK_Usuario_X_Sucursal_Usuarios]
GO
