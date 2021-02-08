<<<<<<< HEAD
.echo on
.headers on

--Name: Cesar Calva	
--File: family.sql
--Date: January 11, 2021

drop table if exists family;

create table family (
  id int primary key, 
  name text,
  sex int,
  role text,
  weight real
);

insert into family values (1, 'Charles', 1, 'parent' , 205.5);
insert into family values (2, 'Bonnie', 0, 'parent', NULL );
insert into family values (3, 'Casie', 0, 'child', 133.33 );
insert into family values (4, 'Jackson', 1, 'child', 220 );
insert into family values (5, 'Max', 1, 'pet', 7.5);
insert into family values  (6, 'Midnight', 0, 'pet', NULL);

select * from family;

select * from family where role like "pet";

select * from family where weight > 150;

select * from family where sex = 0;


=======
.echo on
.headers on

--Name: Cesar Calva	
--File: family.sql
--Date: January 11, 2021

drop table if exists family;

create table family (
  id int primary key, 
  name text,
  sex int,
  role text,
  weight real
);

insert into family values (1, 'Charles', 1, 'parent' , 205.5);
insert into family values (2, 'Bonnie', 0, 'parent', NULL );
insert into family values (3, 'Casie', 0, 'child', 133.33 );
insert into family values (4, 'Jackson', 1, 'child', 220 );
insert into family values (5, 'Max', 1, 'pet', 7.5);
insert into family values  (6, 'Midnight', 0, 'pet', NULL);

select * from family;

select * from family where role like "pet";

select * from family where weight > 150;

select * from family where sex = 0;


>>>>>>> 88acc1ea9e6a51f0c4f379b32dd58f813782f048
