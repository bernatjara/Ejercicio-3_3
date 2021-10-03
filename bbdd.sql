DROP DATABASE IF EXISTS BaseDatos;
CREATE DATABASE BaseDatos;

USE BaseDatos;

CREATE TABLE Jugador(
	ID INT NOT NULL,
	Nombre VARCHAR(60),
	Contraseña VARCHAR(60),
	PRIMARY KEY (ID)
)ENGINE=InnoDB;

CREATE TABLE Partida(
	ID INT NOT NULL,
	Fecha VARCHAR(10),	/*YYYY-MM-DD*/
	Hora VARCHAR(10),	/*HH: MM: SS*/
	Duracion INT,		/*Duración en minutos*/
	Ganador VARCHAR(60),
	PRIMARY KEY (ID)
)ENGINE=InnoDB;

CREATE TABLE Partidas(
	ID_J INT,
	ID_P INT,
	Puntuacion INT,
	FOREIGN KEY (ID_J) REFERENCES Jugador(ID),
	FOREIGN KEY (ID_P) REFERENCES Partida(ID)
)ENGINE=InnoDB;

INSERT INTO Jugador(ID, Nombre, Contraseña) VALUES (1,'Juan','xxxxxxx');
INSERT INTO Jugador(ID, Nombre, Contraseña) VALUES (2,'Maria','asd598op');
INSERT INTO Jugador(ID, Nombre, Contraseña) VALUES (3,'Pedro','12Syj99');
INSERT INTO Jugador(ID, Nombre, Contraseña) VALUES (4,'Eda','zxc6yh0ok');
INSERT INTO Jugador(ID, Nombre, Contraseña) VALUES (5,'Nil','Q36y0ijn');
INSERT INTO Jugador(ID, Nombre, Contraseña) VALUES (6,'Pablo','wer67mn88');
INSERT INTO Jugador(ID, Nombre, Contraseña) VALUES (7,'Aitana','1098pqh5');

INSERT INTO Partida(ID, Fecha, Hora, Duracion, Ganador) VALUES (1,'2008-07-01','00: 01: 59',120,'Eda');
INSERT INTO Partida(ID, Fecha, Hora, Duracion, Ganador) VALUES (2,'2010-08-22','10: 59: 59',60,'Pedro');
INSERT INTO Partida(ID, Fecha, Hora, Duracion, Ganador) VALUES (3,'2005-05-05','22: 30: 15',14,'Maria');
INSERT INTO Partida(ID, Fecha, Hora, Duracion, Ganador) VALUES (4,'2020-07-01','00: 17: 00',40,'Nil');
INSERT INTO Partida(ID, Fecha, Hora, Duracion, Ganador) VALUES (5,'2008-07-15','08: 00: 00',120,'Eda');
INSERT INTO Partida(ID, Fecha, Hora, Duracion, Ganador) VALUES (6,'2009-01-01','20: 00: 00',120,'Juan');

INSERT INTO Partidas(ID_J, ID_P, Puntuacion) VALUES (1,1,11);
INSERT INTO Partidas(ID_J, ID_P, Puntuacion) VALUES (4,1,25);
INSERT INTO Partidas(ID_J, ID_P, Puntuacion) VALUES (3,2,60);
INSERT INTO Partidas(ID_J, ID_P, Puntuacion) VALUES (2,2,59);
INSERT INTO Partidas(ID_J, ID_P, Puntuacion) VALUES (2,3,14);
INSERT INTO Partidas(ID_J, ID_P, Puntuacion) VALUES (1,3,12);
INSERT INTO Partidas(ID_J, ID_P, Puntuacion) VALUES (5,4,40);
INSERT INTO Partidas(ID_J, ID_P, Puntuacion) VALUES (7,4,35);
INSERT INTO Partidas(ID_J, ID_P, Puntuacion) VALUES (7,5,11);
INSERT INTO Partidas(ID_J, ID_P, Puntuacion) VALUES (4,5,12);
INSERT INTO Partidas(ID_J, ID_P, Puntuacion) VALUES (1,6,11);
INSERT INTO Partidas(ID_J, ID_P, Puntuacion) VALUES (6,6,5);