create table Estudio (
id int auto_increment primary key,
nombre varchar(30) not null
);
/* 13p = 5 + 2 + 0 + 4 + 2*/

create table Curso (
curso varchar(5) primary key
);
/* 6p = 3 + 2 + 0 + 0 + 1*/

create table Modulo (
id int auto_increment primary key,
nombre varchar(30) not null,
horas_sem int not null default 6
);
/* 20p = 7 + 2 + 0 + 8 + 3*/

create table Asignatura (
id int,
est int,
curso varchar(5),
primary key (id,est,curso),
foreign key (id) references Modulo (id) on delete restrict on update cascade,
foreign key (est) references Estudio (id) on update cascade,
foreign key (curso) references Curso (curso) on delete cascade
);
/* 33p = 7 + 6 + 9 + 8 + 3*/
create table Alumno (
id int (5) zerofill primary key ,
nombre varchar(30) not null,
dni varchar(9) not null unique,
fechanac date default "1970-01-01"
);
/* 25p = 9 + 4 + 0 + 8 + 4*/
create table Asiste (
alumno int(5) zerofill,
asignatura int,
estudio int,
curso varchar(5),
primary key (alumno, asignatura, estudio, curso),
foreign key (alumno) references Alumno (id) on delete cascade on update cascade,
foreign key (asignatura, estudio, curso) references Asignatura(id,est,curso) on delete restrict
);
/* 43p = 9 + 10 + 12 + 8 + 4*/


/*Con estos inserts*/
insert into estudio values (1,"DAM");
insert into curso values ("19-20");
insert into modulo values (1,"BD",5);

insert into curso values ("18-19");
insert into modulo values (2,"GBD",5);
insert into alumno values (2,"Rocio","234","2000-2-2");
insert into asignatura values (1,1,"19-20");
insert into alumno values (1,"Pepe", "123", "2000-1-1");
insert into estudio values (2,"ASIR");



/*No debe aceptar estos:*/
insert into asiste values (1,1,2,"18-19");
insert into asiste values (2,1,2,"18-19");

/*Añadiendo algunos cambios al repositorio*/



