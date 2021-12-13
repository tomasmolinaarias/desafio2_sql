-- Crear una base de datos llamada películas. (1 Punto)

create table peliculas(
	id_peliculas serial,
	pelicula varchar(225),
	anos_estreno varchar (50),
	director varchar (50),
	primary key (id_peliculas)
);
-- Cargar ambos archivos a su tabla correspondiente. (1 Punto)

COPY peliculas (id_peliculas,pelicula,anos_estreno,director) 
FROM '/Users/victortomasmolinaarias/Desktop/importaciones/ApoyoDesafío-Top100/peliculas.csv'
DELIMITER ','
CSV HEADER;


-- Obtener el ID de la película “Titanic”. (1 Punto)
--busque primero el nombre titanic

select * from peliculas
where pelicula = 'Titanic'

-- despues lo llame con el id

select * from peliculas
where id_peliculas = 2

-- Listar a todos los actores que aparecen en la película "Titanic". (1 Puntos)

create table actores (
	id_peliculas_fk int,
	actores varchar(225),
foreign key (id_peliculas_fk) references peliculas (id_peliculas)
);

COPY actores (id_peliculas_fk,actores) 
FROM '/Users/victortomasmolinaarias/Desktop/importaciones/ApoyoDesafío-Top100/reparto.csv'
DELIMITER ','
CSV HEADER;

-- me di cuenta que el id de la pelicula es el mismo que el de los actores entonces llame los actores con el id

select * from actores
where id_peliculas_fk = 2

-- Consultar en cuántas películas del top 100 participa Harrison Ford. (2 Puntos)

select * from actores
where actores = 'Harrison Ford'

-- consulta solo el numeros de las peliculas que salio Harrison Ford

select
	count (actores) as "harrison ford"
from actores
where actores = 'Harrison Ford'


-- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente. (1 punto)

select * from peliculas
where anos_estreno between '1990' and '1999'
-------------------------------------------------
-- ordenado
select
	anos_estreno as "años"
from peliculas
group by anos_estreno
order by "años" ;

-- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”. (1 punto)

select 
	pelicula as longitud_titulo
from peliculas;

-- Consultar cual es la longitud más grande entre todos los títulos de las películas. (2 punto)
select 
length (pelicula) as longitud_titulo
from peliculas
group by pelicula
order by "longitud_titulo" desc;