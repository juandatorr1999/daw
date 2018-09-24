IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Materiales')
DROP TABLE Materiales
CREATE TABLE Materiales(
Clave numeric(5) not null,
Descripcion char(50),
Costo numeric(8,2)
)

IF EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Proveedores')
DROP TABLE Proveedores
CREATE TABLE Proveedores(
RFC char(13) not null,
RazonSocial char(50)
)

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Proyectos')
DROP TABLE Proyectos
CREATE TABLE Proyectos
(
	Numero numeric(5) not null,
	Denominacion char(50)
)

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Entregan')
DROP TABLE Entregan
CREATE TABLE Entregan(
	Clave numeric(5) not null,
	RFC char(13) not null,
	Numero numeric(5) not null,
	Fecha DateTime not null,
	Cantidad numeric(8,2)
)