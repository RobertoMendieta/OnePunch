/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 15.0 		*/
/*  Created On : 04-oct.-2022 17:41:56 				*/
/*  DBMS       : SQL Server 2012 						*/
/* ---------------------------------------------------- */

/* Drop Foreign Key Constraints */

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Usuario_carrito_usuario_producto]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Usuario] DROP CONSTRAINT [FK_Usuario_carrito_usuario_producto]
GO

/* Drop Tables */

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Carrito]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Carrito]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[carrito_usuario_producto]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [carrito_usuario_producto]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Categoria]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Categoria]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Persona]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Persona]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Producto]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Producto]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Usuario]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Usuario]
GO

/* Create Tables */

CREATE TABLE [Carrito]
(
	[id] varchar(50) NOT NULL,
	[fecha] smalldatetime NOT NULL
)
GO

CREATE TABLE [carrito_usuario_producto]
(
	[id] varchar(50) NOT NULL,
	[fecha] varchar(50) NOT NULL,
	[idusuario] varchar(50) NOT NULL,
	[idproducto] varchar(50) NULL,
	[idcarrito] varchar(50) NULL
)
GO

CREATE TABLE [Categoria]
(
	[id] varchar(50) NOT NULL,
	[nombre] varchar(50) NOT NULL,
	[descripcion] varchar(50) NULL
)
GO

CREATE TABLE [Persona]
(
	[id] varchar(50) NOT NULL,
	[nombre] varchar(50) NOT NULL,
	[Apellidos] varchar(50) NOT NULL,
	[fecha_nacimiento] smalldatetime NOT NULL,
	[direccion] varchar(250) NULL,
	[correo] varchar(50) NULL,
	[telefono] varchar(50) NULL
)
GO

CREATE TABLE [Producto]
(
	[id] varchar(50) NOT NULL,
	[nombre] varchar(50) NOT NULL,
	[Descripcion] varchar(50) NOT NULL
)
GO

CREATE TABLE [Usuario]
(
	[id] varchar(50) NOT NULL,
	[Nombre] varchar(50) NOT NULL,
	[Contrasena] varchar(50) NOT NULL,
	[Direccion] varchar(250) NOT NULL,
	[idusuario] varchar(50) NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [Carrito] 
 ADD CONSTRAINT [PK_Carrito]
	PRIMARY KEY CLUSTERED ([id] ASC)
GO

ALTER TABLE [carrito_usuario_producto] 
 ADD CONSTRAINT [PK_carrito_usuario_producto]
	PRIMARY KEY CLUSTERED ([id] ASC)
GO

ALTER TABLE [carrito_usuario_producto] 
 ADD CONSTRAINT [idusuario] UNIQUE NONCLUSTERED ([idusuario] ASC)
GO

ALTER TABLE [carrito_usuario_producto] 
 ADD CONSTRAINT [idproducto] UNIQUE NONCLUSTERED ([idproducto] ASC)
GO

ALTER TABLE [carrito_usuario_producto] 
 ADD CONSTRAINT [idcarrito] UNIQUE NONCLUSTERED ([idcarrito] ASC)
GO

ALTER TABLE [Categoria] 
 ADD CONSTRAINT [PK_Categoria]
	PRIMARY KEY CLUSTERED ([id] ASC)
GO

ALTER TABLE [Persona] 
 ADD CONSTRAINT [PK_Persona]
	PRIMARY KEY CLUSTERED ([id] ASC)
GO

ALTER TABLE [Producto] 
 ADD CONSTRAINT [PK_Producto]
	PRIMARY KEY CLUSTERED ([id] ASC)
GO

ALTER TABLE [Usuario] 
 ADD CONSTRAINT [PK_Usuario]
	PRIMARY KEY CLUSTERED ([id] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Usuario_carrito_usuario_producto] 
 ON [Usuario] ([id] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [Usuario] ADD CONSTRAINT [FK_Usuario_carrito_usuario_producto]
	FOREIGN KEY ([id]) REFERENCES [carrito_usuario_producto] ([idusuario]) ON DELETE No Action ON UPDATE No Action
GO