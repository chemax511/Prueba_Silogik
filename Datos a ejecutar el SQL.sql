create database Prueba

use Prueba

create table Usuarios(
Id_Usuario int identity(1,1),
Tipo varchar(200),
Seccion int,
Nombres varchar(200),
Apellidos varchar(200),
Horas varchar(200),
Importe money,
Activo int

)


create procedure sp_load_usuarios
as begin
select * from Usuarios where Activo = 1
End

--CRUD: CREATE, READ, UPDATE, DELETE

create procedure sp_create_usuarios
@Tipo varchar(200),
@Seccion int,
@Nombres varchar(200),
@Apellidos varchar(200),
@Horas varchar(200),
@Importe money
as begin
insert into Usuarios(Tipo,Seccion,Nombres,Apellidos,Horas,Importe,Activo) values(@Tipo, @Seccion, @Nombres, @Apellidos,@Horas,@Importe,1)
end

create procedure sp_read_usuarios
@Id int
as begin
select * from Usuarios where Id_Usuario=@Id
end

create procedure sp_update_usuarios
@Id int,
@Tipo varchar(200),
@Seccion int,
@Nombres varchar(200),
@Apellidos varchar(200),
@Horas varchar(200),
@Importe money
as begin
update Usuarios set Tipo=@Tipo, Seccion = @Seccion, Nombres=@Nombres, Apellidos = @Apellidos, Horas = @Horas, Importe = @Importe
where Id_Usuario=@Id
end

create procedure sp_delete_usuarios
@Id int
as begin
update Usuarios set Activo = 0 where Id_Usuario=@Id
end

select * from Usuarios