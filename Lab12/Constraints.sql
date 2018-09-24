INSERT INTO Materiales values(1000,'xxx',1000)
DELETE FROM Materiales WHERE Clave=1000 AND Costo=1000
ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY(Clave)
sp_helpconstraint materiales

ALTER TABLE Proveedores add constraint llaveRFC PRIMARY KEY(RFC)
ALTER TABLE Proyectos add constraint llaveNumero PRIMARY KEY(Numero)
ALTER TABLE Entregan add constraint llaveEntrega PRIMARY KEY(Clave,FRC,Numero,Fecha)

SELECT * FROM Materiales
SELECT * FROM Proyectos
SELECT * FROM Proveedores
SELECT * FROM Entregan

INSERT INTO entregan values(0,'xxx',0,'1-jan-02',0);
DELETE FROM Entregan where Clave = 0

ALTER TABLE entregan add constraint cfentreganclave FOREIGN KEY(clave) references materiales(clave)

INSERT INTO entregan values(1000, 'Afas', 5000,GETDATE(),0);
ALTER TABLE entregan add constraint cantidad check (cantidad>0);

sp_helpconstraint entregan
