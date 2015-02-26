SET ECHO OFF

prompt Mise en place de la base de données...

-- Suppression des tables (si) présentes dans la base avant création
DROP TABLE ACHAT;
DROP TABLE SEANCE;
DROP TABLE FILM;
DROP TABLE VERSION;
DROP TABLE GENRE;
DROP TABLE RESTRICTION;
DROP TABLE SALLE;
DROP TABLE TARIF;

-- Création de la base de données
CREATE TABLE FILM
(id_film NUMBER(4) NOT NULL,
tarif NUMBER(4),
date_deb DATE,
date_fin DATE,
duree NUMBER(3),
id_version NUMBER(4),
id_genre NUMBER(4),
id_restriction NUMBER(4),
CONSTRAINT PK_FILM PRIMARY KEY (id_film));

CREATE TABLE VERSION
(id_version NUMBER(4) NOT NULL,
lib_version VARCHAR2(40),
CONSTRAINT PK_VERSION PRIMARY KEY (id_version));

CREATE TABLE GENRE
(id_genre NUMBER(4) NOT NULL,
lib_genre VARCHAR2(40),
CONSTRAINT PK_GENRE PRIMARY KEY (id_genre));

CREATE TABLE RESTRICTION
(id_restriction NUMBER(4) NOT NULL,
lib_restriction VARCHAR2(40),
CONSTRAINT PK_RESTRICTION PRIMARY KEY (id_restriction));

CREATE TABLE SEANCE
(date_seance DATE NOT NULL,
id_film NUMBER(4) NOT NULL,
id_salle NUMBER(3) NOT NULL,
CONSTRAINT PK_SEANCE PRIMARY KEY (date_seance));

CREATE TABLE SALLE
(id_salle NUMBER(3) NOT NULL,
capacite NUMBER(5),
CONSTRAINT PK_SALLE PRIMARY KEY (id_salle));

CREATE TABLE ACHAT
(id_achat NUMBER(8) NOT NULL,
date_achat DATE NOT NULL,
date_seance DATE NOT NULL,
type_tarif NUMBER(4) NOT NULL,
CONSTRAINT PK_ACHAT PRIMARY KEY (id_achat));

CREATE TABLE TARIF
(type_tarif NUMBER(4) NOT NULL,
lib_tarif VARCHAR2(40),
prix NUMBER(2,2),
CONSTRAINT PK_TARIF PRIMARY KEY (type_tarif));

-- Ajout des contraintes portant sur les clés étrangères des tables
ALTER TABLE FILM ADD CONSTRAINT FK_FILM_id_version
FOREIGN KEY (id_version) REFERENCES VERSION(id_version);

ALTER TABLE FILM ADD CONSTRAINT FK_FILM_id_genre
FOREIGN KEY (id_genre) REFERENCES GENRE(id_genre);

ALTER TABLE FILM ADD CONSTRAINT FK_FILM_id_restriction
FOREIGN KEY (id_restriction) REFERENCES RESTRICTION(id_restriction);

ALTER TABLE SEANCE ADD CONSTRAINT FK_SEANCE_id_film
FOREIGN KEY (id_film) REFERENCES FILM(id_film);

ALTER TABLE SEANCE ADD CONSTRAINT FK_SEANCE_id_salle
FOREIGN KEY (id_salle) REFERENCES SALLE(id_salle);

ALTER TABLE ACHAT ADD CONSTRAINT FK_ACHAT_date_seance
FOREIGN KEY (date_seance) REFERENCES SEANCE(date_seance);

ALTER TABLE ACHAT ADD CONSTRAINT FK_ACHAT_type_tarif
FOREIGN KEY (type_tarif) REFERENCES TARIF(type_tarif);

prompt Base de données en place.

SET ECHO ON
