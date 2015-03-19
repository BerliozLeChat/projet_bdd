SET ECHO OFF

prompt Ajout de données de test en cours...

alter session set NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH:MI:SS'

-- -- Insertion de tuples de test dans les tables
INSERT INTO TARIF VALUES(01, 'Tarif reduit Jeunes', 4.50);
INSERT INTO TARIF VALUES(02, 'Tarif normal Adulte', 8.00);
INSERT INTO TARIF VALUES(03, 'Tarif reduit Senior', 6.50);
INSERT INTO TARIF VALUES(04, 'Tarif reduit Groupe 10+', 40.00);
INSERT INTO TARIF VALUES(05, 'Tarif reduit Groupe 20+', 75.00);

INSERT INTO SALLE VALUES(001, 500);
INSERT INTO SALLE VALUES(002, 300);
INSERT INTO SALLE VALUES(003, 300);
INSERT INTO SALLE VALUES(004, 250);
INSERT INTO SALLE VALUES(005, 100);
INSERT INTO SALLE VALUES(006, 120);
INSERT INTO SALLE VALUES(007, 150);
INSERT INTO SALLE VALUES(008, 200);
INSERT INTO SALLE VALUES(009, 1500);
INSERT INTO SALLE VALUES(010, 1200);
INSERT INTO SALLE VALUES(011, 2);

INSERT INTO RESTRICTION VALUES(01, 'Tout public');
INSERT INTO RESTRICTION VALUES(02, 'Interdit aux moins de 10 ans');
INSERT INTO RESTRICTION VALUES(03, 'Interdit aux moins de 12 ans');
INSERT INTO RESTRICTION VALUES(04, 'Interdit aux moins de 16 ans');
INSERT INTO RESTRICTION VALUES(05, 'Interdit aux moins de 18 ans');

INSERT INTO VERSION VALUES(01, 'Version francaise');
INSERT INTO VERSION VALUES(02, 'Version originale sous-titree');
INSERT INTO VERSION VALUES(03, 'Version francaise malentendants');
INSERT INTO VERSION VALUES(04, 'Version originale sous-titree malentendants');

INSERT INTO GENRE VALUES(01, 'Americana');
INSERT INTO GENRE VALUES(02, 'Buddy movie');
INSERT INTO GENRE VALUES(03, 'Chanbara');
INSERT INTO GENRE VALUES(04, 'Chronique');
INSERT INTO GENRE VALUES(05, 'Cinema de montagne');
INSERT INTO GENRE VALUES(06, 'Comedie');
INSERT INTO GENRE VALUES(07, 'Conte');
INSERT INTO GENRE VALUES(08, 'Documentaire');
INSERT INTO GENRE VALUES(09, 'Drame');
INSERT INTO GENRE VALUES(10, 'Film a sketches');
INSERT INTO GENRE VALUES(11, 'Film a suspense');
INSERT INTO GENRE VALUES(12, 'Film d''action');
INSERT INTO GENRE VALUES(13, 'Film d''aventure');
INSERT INTO GENRE VALUES(14, 'Film catastrophe');
INSERT INTO GENRE VALUES(15, 'Film erotique');
INSERT INTO GENRE VALUES(16, 'Film d''espionnage');
INSERT INTO GENRE VALUES(17, 'Film d''exploitation');
INSERT INTO GENRE VALUES(18, 'Film fantastique');
INSERT INTO GENRE VALUES(19, 'Film de guerre');
INSERT INTO GENRE VALUES(20, 'Film de guerrilla');
INSERT INTO GENRE VALUES(21, 'Film historique');
INSERT INTO GENRE VALUES(22, 'Film institutionnel');
INSERT INTO GENRE VALUES(23, 'Film d''horreur');
INSERT INTO GENRE VALUES(24, 'Film musical');
INSERT INTO GENRE VALUES(25, 'Film policier');
INSERT INTO GENRE VALUES(26, 'Film pour adolescent');
INSERT INTO GENRE VALUES(27, 'Ken Geki');
INSERT INTO GENRE VALUES(28, 'Masala');
INSERT INTO GENRE VALUES(39, 'Road movie');
INSERT INTO GENRE VALUES(30, 'Film d''amour');
INSERT INTO GENRE VALUES(31, 'Science-fiction');
INSERT INTO GENRE VALUES(32, 'Thriller');
INSERT INTO GENRE VALUES(33, 'Troma');
INSERT INTO GENRE VALUES(34, 'Western');


INSERT INTO FILM VALUES(001,'Le bon, la brute et le truand', date '2014-12-03', date '2016-01-03', 161, 02, 34, 01);
INSERT INTO FILM VALUES(002, 'Chappie', date '2015-03-11', date '2016-04-08', 120, 02, 31, 04);
INSERT INTO FILM VALUES(003, 'Indiana Jones et le Temple maudit', date '2015-01-07', date '2016-02-07', 118, 01, 13, 01);
INSERT INTO FILM VALUES(004, 'Fenêtre sur cour', date '2015-02-04', date '2016-04-15', 150, 01, 11, 01);
INSERT INTO FILM VALUES(005, 'Destination Finale', date '2015-01-07', date '2016-02-07', 98, 03, 23, 04);
INSERT INTO FILM VALUES(006, 'La Cité de la peur', date '2014-12-03', date '2015-01-03', 99, 03, 06, 01);

INSERT INTO SEANCE VALUES(to_date('2015-03-20 21:00:00', 'yyyy-mm-dd hh24:mi:ss'), 001,011);

--INSERT INTO ACHAT VALUES(1,to_date(Current_TimeStamp, 'yyyy-mm-dd hh24:mi:ss'),011,to_date('2015-03-20 21:00:00', 'yyyy-mm-dd hh24:mi:ss'),02);

prompt Insertion de données de test terminé.

SET ECHO ON
