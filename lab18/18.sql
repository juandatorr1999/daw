SELECT  SUM(Cantidad) as 'Total'  FROM Entregan, Materiales WHERE Entregan.Clave=Materiales.Clave AND YEAR(Entregan.Fecha)=1997;


SELECT Count(e.RFC) as Num_entregas, p.RazonSocial, SUM(e.Cantidad*(1+m.PorcentajeImpuesto)*m.Costo) as Importe
FROM Entregan e, Materiales m, Proveedores p
WHERE e.RFC=p.RFC AND e.Clave=m.Clave
GROUP BY e.RFC, p.RazonSocial;


SELECT Materiales.Clave, Descripcion,  SUM(Cantidad) as 'Cantidad total', MAX(Cantidad) as 'Mayor Entrega',MIN(Cantidad) as 'Menos Entrega'  FROM Materiales, Entregan  WHERE Materiales.Clave=Entregan.Clave  GROUP BY Materiales.Clave, Descripcion;

SELECT Proveedores.RazonSocial, AVG(Cantidad) as 'Promedio', Materiales.Clave, Descripcion FROM Proveedores, Entregan, Materiales WHERE Materiales.Clave=Entregan.Clave AND Proveedores.RFC=Entregan.RFC GROUP BY  Proveedores.RazonSocial, Materiales.Clave, Descripcion HAVING  AVG(Cantidad)<500

SELECT Proveedores.RazonSocial, AVG(Cantidad) as 'Promedio', Materiales.Clave, Descripcion FROM Proveedores, Entregan, Materiales WHERE Materiales.Clave=Entregan.Clave AND Proveedores.RFC=Entregan.RFC GROUP BY  Proveedores.RazonSocial, Materiales.Clave, Descripcion HAVING  NOT AVG(Cantidad) BETWEEN 350 AND 450;

INSERT INTO Materiales VALUES(1500,'Cable AWG5',10,2);
INSERT INTO Materiales VALUES(1510,'Cable AWG6',10,2);
INSERT INTO Materiales VALUES(1520,'Cable AWG7',10,2);
INSERT INTO Materiales VALUES(1530,'Cable AWG8',10,2);
INSERT INTO Materiales VALUES(1540,'Cable AWG9',10,2);

SELECT Clave, Descripcion FROM Materiales WHERE Clave NOT IN (SELECT Clave FROM Entregan)

SELECT RazonSocial FROM Proveedores, Entregan, Proyectos WHERE Proveedores.RFC=Entregan.RFC AND Entregan.Numero=Proyectos.Numero AND Proyectos.Denominacion LIKE 'Vamos Mexico'
intersect
SELECT RazonSocial FROM Proveedores, Entregan, Proyectos WHERE Proveedores.RFC=Entregan.RFC AND Entregan.Numero=Proyectos.Numero AND Proyectos.Denominacion LIKE 'Queretaro Limpio'

SELECT DISTINCT Descripcion FROM Entregan,Materiales WHERE Entregan.Clave=Materiales.Clave AND Entregan.Clave NOT IN (SELECT Entregan.Clave FROM Entregan,Proyectos WHERE Entregan.Numero=Proyectos.Numero AND Proyectos.Denominacion LIKE 'CIT Yucatan' )

SELECT Proveedores.RazonSocial, AVG(Cantidad) as 'Promedio' FROM Proveedores, Entregan, Materiales WHERE Materiales.Clave=Entregan.Clave AND Proveedores.RFC=Entregan.RFC GROUP BY  Proveedores.RazonSocial HAVING  AVG(Cantidad)>(SELECT AVG(Cantidad) as 'Promedio' FROM  Entregan WHERE Entregan.RFC LIKE 'VAGO780901' GROUP BY  RFC)

SELECT Proveedores.RFC RazonSocial, SUM(Cantidad) FROM Proveedores,Entregan, Proyectos, Materiales WHERE  Materiales.Clave=Entregan.Clave AND Proveedores.RFC=Entregan.RFC AND Proyectos.Denominacion = 'Infonavit Durango' having SUM(Cantidad)>(SELECT  SUM(Cantidad) as 'Total'  FROM Entregan, Materiales WHERE Entregan.Clave=Materiales.Clave AND YEAR(Entregan.Fecha)=2001);
