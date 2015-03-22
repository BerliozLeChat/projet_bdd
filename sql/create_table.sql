/* Base de Données 2
 * Gestion d'un cinéma
 *
 * Alexis Giraudet 
 * François Hallereau 
 * Valery Morozov
 */

-- Suppression des tables

drop table Genre cascade constraints purge;
drop table Restriction cascade constraints purge;
drop table Salle cascade constraints purge;
drop table Tarif cascade constraints purge;
drop table Version cascade constraints purge;
drop table Film cascade constraints purge;
drop table Seance cascade constraints purge;
drop table Achat cascade constraints purge;

-- Création des tables

create table Genre
(id_genre number(4) primary key not null,
lib_genre varchar2(64) not null);

create table Restriction
(id_restriction number(4) primary key not null,
lib_restriction varchar2(64) not null);

create table Salle
(id_salle number(3) primary key not null,
capacite number(4) not null);

create table Tarif
(id_tarif number(4) primary key not null,
lib_tarif varchar2(64) not null,
prix number(4,2) not null);

create table Version
(id_version number(4) primary key not null,
lib_version varchar2(64) not null);

create table Film
(id_film number(4) primary key not null,
titre varchar2(64) not null,
date_deb date not null,
date_fin date not null,
duree number(3) not null,
id_version number(4) references Version(id_version) on delete set null,
id_genre number(4) references Genre(id_genre) on delete set null,
id_restriction number(4) references Restriction(id_restriction) on delete set null);

create table Seance
(id_seance number(4) primary key not null,
date_seance timestamp not null,
id_film number(4) references Film(id_film) on delete cascade not null,
id_salle number(3) references Salle(id_salle) on delete cascade not null);

create table Achat
(id_achat number(8) primary key not null,
date_achat timestamp not null,
id_seance number(4) references Seance(id_seance) on delete cascade not null,
id_tarif number(4) references Tarif(id_tarif) on delete cascade not NULL);
