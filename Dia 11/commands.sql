use mysql;
select * from user;

#crear un usuario
create user 'santipro'@'172.16.101.135' identified by 'santi123';

#mostrar permisos
show GRANTS for 'santipro'@'172.16.101.135';

#dar permisos
grant select, insert, update, delete on *.* to 'santipro'@'172.16.101.135';

GRANT ALL PRIVILEGES ON *.* TO 'santipro'@'172.16.101.135';
show processlist;
flush privileges;