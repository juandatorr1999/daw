/*LAB 15 Etan Imanol Castro Aldrete*/

SELECT * FROM Materiales;
/*Salen todos los materiales (44)
Clave	Descripcion	Costo
1000	Varilla 3/16                                      	100.00
1010	Varilla 4/32                                      	115.00
1020	Varilla 3/17                                      	130.00
 */
SELECT * FROM Materiales WHERE Clave=1000;
/* Sale sólo un Material 
Clave	Descripcion	Costo
1000	Varilla 3/16                                      	100.00
*/
SELECT clave,rfc,fecha FROM Entregan;
/* Sale 132 proyecciones de Entregan
clave	rfc	fecha
1000	AAAA800101   	1998-07-08 00:00:00.000
1010	BBBB800101   	2000-05-03 00:00:00.000
1020	CCCC800101   	2001-07-29 00:00:00.000
*/
SELECT * FROM Materiales,Entregan WHERE Materiales.Clave=Entregan.Clave;
/* 132 rows
Clave	Descripcion	Costo	Clave	RFC	Numero	Fecha	Cantidad
1000	Varilla 3/16                                      	100.00	1000	AAAA800101   	5000	1998-07-08 00:00:00.000	165.00
1000	Varilla 3/16                                      	100.00	1000	AAAA800101   	5019	1999-08-08 00:00:00.000	254.00
¿Aparecería en el resultado si algún resultado no se ha entregado? NO
*/
SELECT * FROM Entregan,Proyectos WHERE Entregan.Numero<=Proyectos.Numero;
/*1188 rows
Clave	RFC	Numero	Fecha	Cantidad	Numero	Denominacion
1000	AAAA800101   	5000	1998-07-08 00:00:00.000	165.00	5000	Vamos Mexico                                      
1200	EEEE800101   	5000	2000-03-05 00:00:00.000	177.00	5000	Vamos Mexico                                      
1400	AAAA800101   	5000	2002-03-12 00:00:00.000	382.00	5000	Vamos Mexico                                      
*/

(SELECT * FROM Entregan WHERE Clave=1450)
union 
(SELECT * FROM Entregan WHERE Clave=1300);
/*3 rows 
Clave	RFC	Numero	Fecha	Cantidad
1300	GGGG800101   	5005	2002-06-10 00:00:00.000	521.00
1300	GGGG800101   	5005	2003-02-02 00:00:00.000	457.00
1300	GGGG800101   	5010	2003-01-08 00:00:00.000	119.00
*/
/* La consulta sin usar UNION sería usando un OR*/
SELECT * FROM Entregan WHERE Clave=1300 OR Clave=1450;

(SELECT Clave FROM Entregan WHERE Numero=5001)
intersect 
(SELECT Clave FROM Entregan WHERE Numero=5018);
/* Muestra la Clave 1010*/

/*Consulta  DIFERENCIA MINUS */
SELECT * FROM Entregan WHERE CLAVE!=1000;

SELECT * FROM Entregan, Materiales;
/*Salen 44x132 rows ya que es la multiplicación de las cardinalidades de los registros*/


SELECT Descripcion FROM Entregan, Materiales WHERE Entregan.Clave=Materiales.Clave AND YEAR(Entregan.Fecha)='2000';
/*Salen 28 que son repetidas ya que cumplen con el criterio del where
Descripcion
Varilla 4/32                                      
Varilla 4/34                                      
Varilla 3/19                                      
*/
SELECT DISTINCT Descripcion FROM Entregan, Materiales WHERE Entregan.Clave=Materiales.Clave AND YEAR(Entregan.Fecha)='2000';
/*
Obtengo valores único y ordenados
Descripcion
Arena                                             
Block                                             
Cantera rosa                                      
*/
SELECT Proyectos.Numero, Denominacion, Cantidad, Fecha FROM Proyectos, Entregan WHERE Proyectos.Numero=Entregan.Numero ORDER BY Proyectos.Numero, Fecha DESC;
/*
Numero	Denominacion	Cantidad	Fecha
5000	Vamos Mexico                                      	382.00	2002-03-12 00:00:00.000
5000	Vamos Mexico                                      	177.00	2000-03-05 00:00:00.000
5000	Vamos Mexico                                      	165.00	1998-07-08 00:00:00.000
*/
SELECT * FROM Materiales WHERE Descripcion LIKE 'Si%';
/* Se obtiene 3 rows con Si en Descripcion
Clave	Descripcion	Costo
1120	Sillar rosa                                       	100.00
1130	Sillar gris                                       	110.00
Es como una expresión regular para comparar diferentes valores 
*/
SELECT * FROM Materiales WHERE Descripcion LIKE 'Si';
/* Busca la palabra Si pero ya que no es expr regular pues lo busca literal
*/


DECLARE @foo varchar(40);
DECLARE @bar varchar(40);
SET @foo = '¿Que resultado';
SET @bar = '¿¿¿???';
SET @foo += 'obtienes?';
PRINT @foo + @bar;
/*Se obtiene ¿Que resultadoobtienes?¿¿¿??? 
 DECLARE se usa para definir variables
 SET para asignar valores
 @foo lo usamos para concatenar
*/
SELECT rfc FROM Entregan WHERE RFC LIKE '[A-D]%';
/*Creo que define que debe existir una letra mayúscula de prefijo
rfc
AAAA800101   
BBBB800101   
CCCC800101   
*/
SELECT rfc FROM Entregan WHERE RFC LIKE '[^A]%';
/*Creo que define que debe no existir "A" de prefijo
rfc
BBBB800101   
CCCC800101   
DDDD800101     
*/
SELECT numero FROM Entregan WHERE Numero LIKE '___6';
/* todos los Numeros que terminen en 6
numero
5006
5016
5006
*/

SELECT Clave,RFC,Numero,Fecha,Cantidad FROM Entregan WHERE YEAR(Fecha) Between 1999 and 2000;
/*
Clave	RFC	Numero	Fecha	Cantidad
1010	BBBB800101   	5001	2000-05-03 00:00:00.000	528.00
1040	EEEE800101   	5004	1999-12-11 00:00:00.000	263.00
1050	FFFF800101   	5005	2000-10-14 00:00:00.000	503.00
*/


SELECT RFC, Cantidad, Fecha, Numero FROM Entregan WHERE Numero Between 5000 and 5010 AND Exists(SELECT RFC FROM Proveedores WHERE RazonSocial LIKE 'La%' and Entregan.RFC=Proveedores.RFC);
/*16 ROWs
RFC	Cantidad	Fecha	Numero
AAAA800101   	165.00	1998-07-08 00:00:00.000	5000
CCCC800101   	582.00	2001-07-29 00:00:00.000	5002
AAAA800101   	86.00	1999-01-12 00:00:00.000	5008

Checa las entregas entre los números 5000 y 5010 que los proveedores comiencen con "La"
El parentésis sirve para definir que es una subconsulta
*/
SELECT RFC, Cantidad, Fecha, Numero FROM Entregan WHERE Numero Between 5000 and 5010 AND RFC  IN (SELECT RFC FROM Proveedores WHERE RazonSocial LIKE 'La%' and Entregan.RFC=Proveedores.RFC);

SELECT RFC, Cantidad, Fecha, Numero FROM Entregan WHERE Numero Between 5000 and 5010 AND RFC  NOT IN (SELECT RFC FROM Proveedores WHERE RazonSocial NOT LIKE 'La%' and Entregan.RFC=Proveedores.RFC);

SELECT RFC, Cantidad, Fecha, Numero FROM Entregan WHERE Numero=All(SELECT Numero FROM Proveedores  WHERE RazonSocial LIKE 'La%')

SELECT TOP 2 * FROM Proyectos;

/*Selecciona los dos primero registros :)*/
SELECT TOP Numero FROM Proyectos;
/*Syntax Error, necesita un numero top*/

ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2);
UPDATE materiales SET PorcentajeImpuesto=2*clave/1000;

SELECT Entregan.Numero,SUM((Materiales.PorcentajeImpuesto/100+1)*Materiales.Costo) FROM Entregan,Materiales WHERE Entregan.Clave=Materiales.Clave GROUP BY Entregan.Numero;

/**/

SELECT Materiales.Clave, Materiales.Descripcion FROM Proyectos,Entregan, Materiales WHERE Proyectos.Denominacion='Mexico sin ti no estamos completos' AND Entregan.Clave=Materiales.Clave AND Entregan.Numero=Proyectos.Numero;
SELECT Materiales.Clave, Materiales.Descripcion FROM Proyectos,Entregan, Materiales, Proveedores WHERE Proveedores.RazonSocial='Acme Tools' AND Entregan.Clave=Materiales.Clave AND Entregan.Numero=Proyectos.Numero;

SELECT Proveedores.RFC, COUNT(Entregan.RFC)  FROM Proveedores,Entregan WHERE Proveedores.RFC=Entregan.RFC AND YEAR(Entregan.Fecha) = 2000 GROUP BY Entregan.RFC,Proveedores.RFC having COUNT(Entregan.RFC)>300;

SELECT Materiales.Descripcion, COUNT(Entregan.Clave) FROM Materiales, Entregan WHERE Materiales.Clave=Entregan.Clave AND YEAR(Entregan.Fecha)=2000 GROUP BY  Materiales.Descripcion;

SELECT TOP 1 Clave  from  pro ORDER BY Ventas DESC ;

SELECT Descripcion FROM Materiales WHERE Descripcion LIKE '%ub%';

SELECT Denominacion, SUM(Materiales.Costo*Entregan.Cantidad*(1+Materiales.Costo)) FROM Materiales, Proyectos, Entregan WHERE Materiales.Clave=Entregan.Clave AND Entregan.Numero=Proyectos.Numero GROUP BY Denominacion;
GO
CREATE VIEW coahuila SELECT Denominacion, Proveedores.RFC, Proveedores.RazonSocial FROM Proyectos, Proveedores, Entregan WHERE Entregan.RFC = Proveedores.RFC AND Entregan.Numero=Proyectos.Numero WHERE Denominación LIKE 'Televisa en acción' AND Denominacion NOT LIKE 'Educando en Coahuila';

SELECT Denominacion, Proveedores.RFC, Proveedores.RazonSocial FROM Proyectos, Proveedores, Entregan WHERE Entregan.RFC = Proveedores.RFC AND Entregan.Numero=Proyectos.Numero WHERE DENOMINACION LIKE 'Televisa en acción' AND Denominacion NOT IN (SELECT Denominacion FROM Proyectos WHERE Denominación LIKE 'Educando en Coahuila');

SELECT Costo, Descripcion FROM Materiales,Proveedores,Proyectos,Entregan WHERE Entregan.Clave=Materiales.Clave AND Entregan.RFC=Proveedores.RFC AND Entregan.Numero = Proyectos.Numero AND Proveedores.RFC IN (SELECT Proveedores.RFC FROM Entregan,Proyectos,Proveedores WHERE Entregan.RFC=Proveedores.FRC AND Entregan.Numero=Proyectos.Numero AND Proyectos.Denominacion='Televisa en acción') intersect (SELECT Proveedores.RFC FROM Entregan,Proyectos,Proveedores WHERE Entregan.RFC=Proveedores.FRC AND Entregan.Numero=Proyectos.Numero AND Proyectos.Denominacion LIKE 'Coahuila');
GO
CREATE VIEW pro(Clave,Ventas) AS SELECT Materiales.Clave, COUNT(Entregan.Fecha) FROM Entregan,Materiales WHERE Entregan.Clave=Materiales.Clave AND YEAR(Entregan.Fecha)=2001 GROUP BY Materiales.Clave;


