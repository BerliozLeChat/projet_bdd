set echo off

prompt Mise en place de la base de données...

-- Suppression des tables (si) présentes dans la base avant création
drop table Genre cascade constraints purge;
drop table Restriction cascade constraints purge;
drop table Salle cascade constraints purge;
drop table Tarif cascade constraints purge;
drop table Version cascade constraints purge;
drop table Film cascade constraints purge;
drop table Seance cascade constraints purge;
drop table Achat cascade constraints purge;

-- Création de la base de données
create table Genre
(id_genre number(4) primary key not null,
lib_genre varchar2(64));

create table Restriction
(id_restriction number(4) primary key not null,
lib_restriction varchar2(64));

create table Salle
(id_salle number(3) primary key not null,
capacite number(4));

create table Tarif
(type_tarif number(4) primary key not null,
lib_tarif varchar2(64),
prix number(2,2));

create table Version
(id_version number(4) primary key not null,
lib_version varchar2(64));

create table Film
(id_film number(4) primary key not null,
titre varchar2(64),
tarif number(4),
date_deb date,
date_fin date,
duree number(3),
id_version number(4) references Version(id_version) on delete set null,
id_genre number(4) references Genre(id_genre) on delete set null,
id_restriction number(4) references Restriction(id_restriction) on delete set null);

create table Seance
(date_seance date primary key not null,
id_film number(4) references Film(id_film) on delete cascade not null,
id_salle number(3) references Salle(id_salle) on delete cascade not null);

create table Achat
(id_achat number(8) primary key not null,
date_achat date not null,
id_salle number(4) references Salle(id_salle) on delete cascade not null,
date_seance date references Seance(date_seance) on delete cascade not null,
type_tarif number(4) references Tarif(type_tarif) on delete cascade not NULL);

prompt Base de données en place.

set echo on
