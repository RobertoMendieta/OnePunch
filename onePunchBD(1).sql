
create database onePunch

use onePunch

CREATE TABLE Persona(

idPersona int primary key identity (1,1)	NOT NULL,
	nombres nvarchar(100)  NOT NULL,
	apellidos nvarchar (100) NOT NULL,
	direccion nvarchar(200) NOT NULL,
	email nvarchar(50) NOT NULL,
	fechaNacimiento date NOT NULL,
	telefono nvarchar(11) NOT NULL
)

	
CREATE TABLE Usuario(
	idUsuario int primary key identity (1,1) NOT NULL,
	nombreUsuario nvarchar(50) NOT NULL,
	pwUsuario varbinary(50) NOT NULL,
	idPersona int FOREIGN KEY REFERENCES persona(idPersona)
) 

CREATE TABLE Categoria(
categoriaID int primary key identity (1,1) NOT NULL,
CategoriaPR nvarchar(50),
descripcion nvarchar (100),
image bit
)

CREATE TABLE Producto(
productoID int primary key identity (1,1) NOT NULL,
existencias int,
descripcion nvarchar(50),
image bit,
nombrePr nvarchar(50),
categoriaID int foreign key references Categoria(categoriaID)
)

CREATE TABLE productoSelect(
cantidad int,
precio numeric (18,2),
size nvarchar(10),
productoID INT FOREIGN KEY REFERENCES Producto(productoID)
)

CREATE TABLE CarritoDeCompras(
prodAdded datetime,
productoID INT FOREIGN KEY REFERENCES Producto(productoID)
)

CREATE TABLE tipoCuenta(
idCuenta INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
tipoCuenta nvarchar(50),
estadoCuenta nvarchar(50),
idUsuario int foreign key  references usuario(idUsuario)
)

CREATE TABLE orden (
idOrden int primary key identity (1,1) NOT NULL,
estadoOrden nvarchar(50),
)


CREATE TABLE Factura(
idFactura INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
diaDeEntrega DATE,
diaOrdenado datetime,
fechapago date,
total numeric (18,2),
idOrden int foreign key references orden(idOrden)
)

CREATE TABLE Pago(
idPago int primary key identity (1,1) not null,
cvv nchar(6),
expiredMonth int,
expiredYear int,
numtarjeta nvarchar(20),
idOrden int foreign key references orden(idOrden)
)