CREATE TABLE Insignia (

id INTEGER AUTO_INCREMENT,

descripcion VARCHAR(50) NOT NULL,

CONSTRAINT PK_Insignia PRIMARY KEY (id),

CONSTRAINT UQ_Insignia_Descrip UNIQUE KEY (descripcion)

);



CREATE TABLE Usuario (

id INTEGER AUTO_INCREMENT,

nombre VARCHAR(30) NOT NULL,

edad INTEGER,

tutor INTEGER,

insignia INTEGER,

CONSTRAINT PK_Usuario PRIMARY KEY (id),

CONSTRAINT UQ_Usuario_Nombre UNIQUE KEY (nombre),

CONSTRAINT FK_Usuario_Tutor FOREIGN KEY (tutor)

REFERENCES Usuario (id),

CONSTRAINT FK_Usuario_Insignia FOREIGN KEY (insignia)

REFERENCES Insignia (id)

);


CREATE TABLE Tipo_Accion (

id INTEGER ZEROFILL AUTO_INCREMENT,

descripcion VARCHAR(30) NOT NULL,

CONSTRAINT PK_Tipo_Accion PRIMARY KEY (id)

);



CREATE TABLE Accion (

id INTEGER ZEROFILL AUTO_INCREMENT,

dia DATE,

CONSTRAINT FK_Accion_Id FOREIGN KEY (id)

REFERENCES Tipo_Accion (id),

CONSTRAINT PK_Accion PRIMARY KEY (id, dia)

);


CREATE TABLE Objetivo (

nombre VARCHAR(20),

CONSTRAINT PK_Objetivo PRIMARY KEY (nombre)

);


CREATE TABLE Hacer (

usuario INTEGER NULL,

tipo_a INTEGER ZEROFILL,

dia_a DATE,

objetivo VARCHAR(20),

CONSTRAINT FK_Hacer_Usuario FOREIGN KEY (usuario)

REFERENCES Usuario (id),

CONSTRAINT FK_Hacer_Accion FOREIGN KEY (tipo_a, dia_a)

REFERENCES Accion (id, dia),

CONSTRAINT PK_Hacer PRIMARY KEY (tipo_a, dia_a, objetivo)

);




CREATE TABLE Exito (

objetivo VARCHAR(20),

tipo_a INTEGER ZEROFILL,

dia_a DATE,

dia_fin DATE,

CONSTRAINT FK_Exito_Hacer FOREIGN KEY (tipo_a, dia_a, objetivo)

REFERENCES Hacer (tipo_a, dia_a, objetivo),

CONSTRAINT PK_Exito PRIMARY KEY (objetivo, tipo_a, dia_a)

);



CREATE TABLE Fracaso (

objetivo VARCHAR(20),

tipo_a INTEGER ZEROFILL,

dia_a DATE,

dia_fin DATE,

CONSTRAINT FK_Fracaso_Hacer FOREIGN KEY (tipo_a, dia_a, objetivo)

REFERENCES Hacer (tipo_a, dia_a, objetivo),

CONSTRAINT PK_Fracaso PRIMARY KEY (objetivo, tipo_a, dia_a)

);
