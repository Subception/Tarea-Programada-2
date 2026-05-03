CREATE TABLE dbo.Puesto
(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Nombre VARCHAR(128) NOT NULL,
	SalarioxHora MONEY NOT NULL
);

CREATE TABLE dbo.Empleado
(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	IdPuesto INT FOREIGN KEY REFERENCES dbo.Puesto(Id),
	ValorDocumentoIdentidad INT NOT NULL,
	Nombre VARCHAR(128) NOT NULL,
	FechaContratacion DATE NOT NULL,
	SaldoVacaciones MONEY NOT NULL,
	EsActivo VARCHAR(2) NOT NULL,
);

CREATE TABLE dbo.TipoMovimiento
(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Nombre VARCHAR(128) NOT NULL,
	TipoAccion VARCHAR(128) NOT NULL,
);

CREATE TABLE dbo.Usuario
(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Username VARCHAR(128) NOT NULL,
	Contrasena VARCHAR(128) NOT NULL,
);

CREATE TABLE dbo.Movimiento
(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	IdEmpleado INT FOREIGN KEY REFERENCES dbo.Empleado(Id),
	IdTipoMovimiento INT FOREIGN KEY REFERENCES dbo.TipoMovimiento(Id),
	Fecha DATE NOT NULL,
	Monto MONEY NOT NULL,
	NuevoSaldo MONEY NOT NULL,
	IdPostByUser INT FOREIGN KEY REFERENCES dbo.Usuario(Id),
	PostInIP VARCHAR(128) NOT NULL,
	PostTime DATETIME2 DEFAULT GETDATE(),
);

CREATE TABLE dbo.TipoEvento
(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Nombre VARCHAR(128) NOT NULL,
);

CREATE TABLE dbo.BitacoraEvento
(
	Id INT IDENTITY (1, 1) PRIMARY KEY, 
	idTipoEvento INT FOREIGN KEY REFERENCES dbo.TipoEvento(Id),
	Descripcion VARCHAR(128) NOT NULL,
	IdPostByUser INT FOREIGN KEY REFERENCES dbo.Usuario(Id),
	PostInIP VARCHAR(128) NOT NULL,
	PostTime DATETIME2 DEFAULT GETDATE(),
);

CREATE TABLE dbo.DBError
(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	UserName VARCHAR(128),
	Number INT,
	Estado INT,
	Severity INT,
	Line INT,
	Procedimiento VARCHAR(128) NULL,
	Mensaje VARCHAR(128),
	HoraFecha DATETIME2 DEFAULT GETDATE(),
);

CREATE TABLE dbo.Error
(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Codigo INT NOT NULL,
	Descripcion VARCHAR(128) NOT NULL,
);