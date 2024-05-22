use world;

#creamos un query completo

select * from city where Name = "Peking";
select * from city where CountryCode='CHN';
select * from city where CountryCode='CHN' and Population > 2243000;

# creacion de una indexacion

create index idx_cityName on city(Name);

#revisar indexaciones creadas

show keys from city; #forma 1
show index from city; #forma 2

#hacer un estudio de rendimiento de index

explain analyze select * from city where Name ='Bogota';