
---- 0) alter session set "_ORACLE_SCRIPT"= true;
alter session set "_ORACLE_SCRIPT"= true;

--- 1) Creación de 2 tablespa
create tablespace Practica_itm datafile 'itm_01.dbf' size 100M;
create tablespace Practica_finance datafile 'finance_01.dbf' size 50M;

--- 2) Creación de usuarios con su contraseña, la quota, el Tablespace asignado,
----   y en que Tablespace se le asigna esa cuota    
create user Practica_user1 identified by user1
default tablespace Practica_itm quota 50M on Practica_itm; 

create user Practica_user2 identified by user2
default Tablespace Practica_finance quota 25M on Practica_finance;

--- 3) despues de crear el usuario se le debe de dar como mínimo el 
---    privilegio de crear o iniciar sesión para que se pueda conectar
grant create session to Practica_user1;
grant create session to Practica_user2; 

--- 4) creamos un Rol full_access, luego a ése rol full_access le asignamos 
--     todos los privilegios que tiene el rol DBA más el privilegio de crear sesión
create role full_access;
grant dba,create session to full_access; 
REVOKE create session from Practica_user1; -- eliminamos el privilegio anteriormente dado al usuario Practica_user1
grant full_access to Practica_user1; -- le asignamos el rol creado (full_access) al usuario Practica_user1
select *from dba_users WHERE DEFAULT_TABLESPACE IN ('PRACTICA_ITM','PRACTICA_FINANCE');


