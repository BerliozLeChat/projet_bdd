SET ECHO OFF

prompt Mise en place de la base de données...

-- Suppression des tables (si) présentes dans la base avant création
DROP TABLE Genre CASCADE CONSTRAINTS PURGE;
DROP TABLE Restriction CASCADE CONSTRAINTS PURGE;
DROP TABLE Salle CASCADE CONSTRAINTS PURGE;
DROP TABLE Tarif CASCADE CONSTRAINTS PURGE;
DROP TABLE Version CASCADE CONSTRAINTS PURGE;
DROP TABLE Film CASCADE CONSTRAINTS PURGE;
DROP TABLE Seance CASCADE CONSTRAINTS PURGE;
DROP TABLE Achat CASCADE CONSTRAINTS PURGE;

-- Création de la base de données
CREATE TABLE Genre
(id_genre NUMBER(4) PRIMARY KEY NOT NULL,
lib_genre VARCHAR2(40));

CREATE TABLE Restriction
(id_restriction NUMBER(4) PRIMARY KEY NOT NULL,
lib_restriction VARCHAR2(40));

CREATE TABLE Salle
(id_salle NUMBER(3) PRIMARY KEY NOT NULL,
capacite NUMBER(5));

CREATE TABLE Tarif
(type_tarif NUMBER(4) PRIMARY KEY NOT NULL,
lib_tarif VARCHAR2(40),
prix NUMBER(2,2));

CREATE TABLE Version
(id_version NUMBER(4) PRIMARY KEY NOT NULL,
lib_version VARCHAR2(40));

CREATE TABLE Film
(id_film NUMBER(4) PRIMARY KEY NOT NULL,
tarif NUMBER(4),
date_deb DATE,
date_fin DATE,
duree NUMBER(3),
id_version NUMBER(4) REFERENCES Version(id_version),
id_genre NUMBER(4) REFERENCES Genre(id_genre),
id_restriction NUMBER(4) REFERENCES Restriction(id_restriction));

CREATE TABLE Seance
(date_seance DATE PRIMARY KEY NOT NULL,
id_film NUMBER(4) REFERENCES Film(id_film) NOT NULL,
id_salle NUMBER(3) REFERENCES Salle(id_salle) NOT NULL);

CREATE TABLE Achat
(id_achat NUMBER(8) PRIMARY KEY NOT NULL,
date_achat DATE NOT NULL,
date_seance DATE REFERENCES Seance(date_seance) NOT NULL,
type_tarif NUMBER(4) REFERENCES Tarif(type_tarif) NOT NULL);

prompt Base de données en place.

SET ECHO ON
