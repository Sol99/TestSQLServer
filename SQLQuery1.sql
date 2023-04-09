--En este caso, abordé la solución a través de SQL Server Managment Studio,
--creando el diagrama y las relaciones desde la misma Query. Al no tener la posibilidad de contar con Seeders
--opté por hacer una población manual con datos ficticios. 
--Como extra a la solución, decidí implementar un Stored Procedure para el ejercicio 3.

--Creo la base de datos 
CREATE DATABASE servicio_poda

--Creo la tabla llamada Localidad y la poblo (coloqué el codigo postal como varchar ya que hay codigos postales con letras y numeros)
create table Localidad 
(CodigoPostal varchar(10) primary key not null,
nombreL varchar(20) not null,
descripcion varchar(150),
habitantes int not null);


insert into Localidad (CodigoPostal, nombreL, descripcion, habitantes) values ('1925', 'alberti', 'su partido es alberti', '7493');
insert into Localidad (CodigoPostal, nombreL, descripcion, habitantes) values ('A192', 'alejandro Korn', 'su partido es San Vicente', '23821');
insert into Localidad (CodigoPostal, nombreL, descripcion, habitantes) values ('B124', 'América', 'su partido es Rivadavia', '10361');
insert into Localidad (CodigoPostal, nombreL, descripcion, habitantes) values ('C432', 'Arrecifes', 'su partido es Arrecifes', '24336');
insert into Localidad (CodigoPostal, nombreL, descripcion, habitantes) values ('1934', 'Avellaneda', 'su partido es Avellaneda', '53054');
insert into Localidad (CodigoPostal, nombreL, descripcion, habitantes) values ('1933', 'Ayacucho', 'su partido es Ayacucho', '16444');
insert into Localidad (CodigoPostal, nombreL, descripcion, habitantes) values ('1922', 'Azul', 'su partido es Azul', '70053');

--Creo la tabla llamada Arbol y la poblo 
create table Arbol
(nroArbol int primary key not null,
especie varchar(20) not null,
años int not null,
calle varchar(30) not null,
nro int not null,
CodigoPostal varchar(10),
FOREIGN KEY (CodigoPostal) REFERENCES LOCALIDAD(CodigoPostal)
)

insert into Arbol (nroArbol, especie, años, calle, nro, CodigoPostal) values ('1', 'Álamo blanco', '120', '140 y 63', '1', '1922');
insert into Arbol (nroArbol, especie, años, calle, nro, CodigoPostal) values ('2', 'Álamo negro', '300', '7 y 48', '2', 'B124');
insert into Arbol (nroArbol, especie, años, calle, nro, CodigoPostal) values ('3', 'Encina', '450', '140 y 63', '1', '1922');
insert into Arbol (nroArbol, especie, años, calle, nro, CodigoPostal) values ('4', 'Olmo', '500', 'Holanda y Castelli', '140', '1925');
insert into Arbol (nroArbol, especie, años, calle, nro, CodigoPostal) values ('5', 'Pino resideño', '700', '140 y 63', '400', '1934');
insert into Arbol (nroArbol, especie, años, calle, nro, CodigoPostal) values ('6', 'Sauce', '900', '40 y 57', '2', 'C432');
insert into Arbol (nroArbol, especie, años, calle, nro, CodigoPostal) values ('8', 'Sauce lloron', '900', '77 y 45', '3', 'C432');
insert into Arbol (nroArbol, especie, años, calle, nro, CodigoPostal) values ('10', 'Sauce lloron', '900', '77 y 45', '80', 'C432');
insert into Arbol (nroArbol, especie, años, calle, nro, CodigoPostal) values ('13', 'Olmo', '900', '77 y 45', '9', 'C432');
insert into Arbol (nroArbol, especie, años, calle, nro, CodigoPostal) values ('12', 'Olmo', '900', '77 y 45', '5', 'C432');
insert into Arbol (nroArbol, especie, años, calle, nro, CodigoPostal) values ('14', 'Pino piñonero', '1500', '144 y 65', '6', 'C432');

--Creo la tabla llamda podador y la poblo
create table Podador
(dni int primary key not null,
nombre varchar(10) not null,
apellido varchar(10) not null,
telefono int not null,
fnac date not null,
codigoPostalVive varchar(10) not null,
)

insert into Podador (dni, nombre, apellido, telefono, fnac, CodigoPostalVive) values ('42412456', 'Enzo', 'Perez', '22143565', '1999-01-15', '1925');
insert into Podador (dni, nombre, apellido, telefono, fnac, CodigoPostalVive) values ('42412234', 'Belen', 'Martinez', '22156755', '1998-06-25', 'E324');
insert into Podador (dni, nombre, apellido, telefono, fnac, CodigoPostalVive) values ('42412657', 'Ailen', 'Gomez', '22143563', '1997-05-02', 'A234');
insert into Podador (dni, nombre, apellido, telefono, fnac, CodigoPostalVive) values ('42412855', 'Fidel', 'Aranguren', '22143565', '1999-02-14', '2234');
insert into Podador (dni, nombre, apellido, telefono, fnac, CodigoPostalVive) values ('42412123', 'Agustin', 'Salinas', '22143565', '2000-12-25', 'G124');
insert into Podador (dni, nombre, apellido, telefono, fnac, CodigoPostalVive) values ('42412666', 'Agustin', 'Zapata', '22143565', '2000-12-25', 'G124');
insert into Podador (dni, nombre, apellido, telefono, fnac, CodigoPostalVive) values ('42412999', 'Agustin', 'Sabata', '22143565', '2000-12-25', 'G124');

--Creo la tabla llamada Poda y la poblo
create table Poda
(codPoda int primary key not null,
fecha date not null,
nroArbol int,
dni int,
FOREIGN KEY (dni) REFERENCES PODADOR(dni),
FOREIGN KEY (nroArbol) REFERENCES ARBOL(nroArbol)
)

insert into Poda (codPoda, fecha, nroArbol, dni) values ('1', '2023-01-23', '6', '42412234');
insert into Poda (codPoda, fecha, nroArbol, dni) values ('2', '2022-04-10', '5', '42412855');
insert into Poda (codPoda, fecha, nroArbol, dni) values ('3', '2021-01-03', '4', '42412456');
insert into Poda (codPoda, fecha, nroArbol, dni) values ('4', '2023-01-23', '1', '42412657');
insert into Poda (codPoda, fecha, nroArbol, dni) values ('5', '2023-04-26', '2', '42412123');
insert into Poda (codPoda, fecha, nroArbol, dni) values ('8', '2017-04-26', '8', '42412123');
insert into Poda (codPoda, fecha, nroArbol, dni) values ('9', '2017-04-26', '10', '42412123');
insert into Poda (codPoda, fecha, nroArbol, dni) values ('10', '2018-04-26', '8', '42412123');
insert into Poda (codPoda, fecha, nroArbol, dni) values ('11', '2018-04-26', '12', '42412666');
insert into Poda (codPoda, fecha, nroArbol, dni) values ('12', '2018-04-26', '13', '42412999');
insert into Poda (codPoda, fecha, nroArbol, dni) values ('13', '2017-04-26', '14', '42412999');
insert into Poda (codPoda, fecha, nroArbol, dni) values ('14', '2018-05-06', '2', '42412999');

--update Poda set fecha= '2017-04-26' where codPoda= '9'


--Ejercicios
--1. Listar especie, años, calle, nro. y localidad de árboles que no fueron podados nunca.

SELECT A.especie, A.años, A.calle, A.nro, L.nombreL
FROM Arbol A 
left join Localidad L on A.CodigoPostal = L.CodigoPostal
left join Poda P on A.nroArbol = P.nroArbol
WHERE P.nroArbol is null



--2. Reportar especie, años, calle, nro. y localidad de árboles que fueron podados
--durante 2017 y no fueron podados durante 2018.

SELECT A.especie, A.años, A.calle,A.nro, L.nombreL
FROM Localidad L
inner join Arbol A on L.CodigoPostal = A.CodigoPostal
inner join Poda P on A.nroArbol = P.nroArbol
WHERE YEAR(P.fecha) = '2017' and P.nroArbol not in (select nroArbol from Poda where YEAR(fecha) = '2018') 



--3.Reportar DNI, nombre, apellido, fnac y localidad donde viven podadores con
--apellido terminado con el string ‘ata’ y que el podador tenga al menos una poda
--durante 2018. Ordenar por apellido y nombre.

SELECT Pod.dni, Pod.nombre, Pod.apellido, Pod.fnac, L.nombreL
FROM Podador Pod
inner join Poda P on Pod.dni = P.dni
inner join Arbol A on P.nroArbol = A.nroArbol
inner join Localidad L on A.codigoPostal = L.codigoPostal
WHERE YEAR(P.fecha) = '2018' and Pod.apellido like '%ata'
ORDER BY Pod.apellido, Pod.nombre



--RESOLUCION DE EJERCICIO 3 CON STORED PROCEDURE A MODO DE EJEMPLO

--Realizo un Stored Procedure a modo de ejemplo (del ejercicio 3). Estos se pueden utilizar como funcion para acceder a la BD. 
--Podemos crear estos procedimientos, almacenarlos y una vez almacenados, ejecutarlos donde sea necesario.
--Pasando el respectivo año (2018) como un entero, podemos ver si el podador realizó podas durante ese año.


CREATE PROCEDURE ejercicio_3
@año int
as
SELECT Pod.dni, Pod.nombre, Pod.apellido, Pod.fnac, L.nombreL
FROM Podador Pod
inner join Poda P on Pod.dni = P.dni
inner join Arbol A on P.nroArbol = A.nroArbol
inner join Localidad L on A.codigoPostal = L.codigoPostal
WHERE YEAR(P.fecha) = @año and YEAR(P.fecha) = '2018' and Pod.apellido like '%ata'
ORDER BY Pod.apellido, Pod.nombre

exec ejercicio_3 '2018'




