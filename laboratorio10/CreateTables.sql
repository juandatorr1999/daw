CREATE TABLE Materiales(
Clave numeric(5),
Descripcion varchar(50),
Costo numeric(8,2)
)

CREATE TABLE Proveedores(
RFC varchar(13),
RazonSocial varchar(100)
)

CREATE TABLE Proyectos(
Clave numeric(5),
Descripcion varchar(100),
)

CREATE TABLE Entregan(
Clave numeric(5),
RFC varchar(13),
Numero numeric(5),
Fecha datetime,
Cantidad numeric(10)
)

