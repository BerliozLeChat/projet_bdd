/* Base de Données 2
 * Gestion d'un cinéma
 *
 * Alexis Giraudet 
 * François Hallereau 
 * Valery Morozov
 */

-- -- Insertion de tuples de test dans les tables
INSERT INTO TARIF VALUES(1, 'Tarif reduit Jeunes', 4.50);
INSERT INTO TARIF VALUES(2, 'Tarif normal Adulte', 8.00);
INSERT INTO TARIF VALUES(3, 'Tarif reduit Senior', 6.50);
INSERT INTO TARIF VALUES(4, 'Tarif reduit Groupe 10+', 40.00);
INSERT INTO TARIF VALUES(5, 'Tarif reduit Groupe 20+', 75.00);

INSERT INTO SALLE VALUES(1, 500);
INSERT INTO SALLE VALUES(2, 300);
INSERT INTO SALLE VALUES(3, 300);
INSERT INTO SALLE VALUES(4, 250);
INSERT INTO SALLE VALUES(5, 100);
INSERT INTO SALLE VALUES(6, 120);
INSERT INTO SALLE VALUES(7, 150);
INSERT INTO SALLE VALUES(8, 200);
INSERT INTO SALLE VALUES(9, 1500);
INSERT INTO SALLE VALUES(10, 1200);
INSERT INTO SALLE VALUES(11, 2);

INSERT INTO RESTRICTION VALUES(1, 'Tout public');
INSERT INTO RESTRICTION VALUES(2, 'Interdit aux moins de 10 ans');
INSERT INTO RESTRICTION VALUES(3, 'Interdit aux moins de 12 ans');
INSERT INTO RESTRICTION VALUES(4, 'Interdit aux moins de 16 ans');
INSERT INTO RESTRICTION VALUES(5, 'Interdit aux moins de 18 ans');

INSERT INTO VERSION VALUES(1, 'Version francaise');
INSERT INTO VERSION VALUES(2, 'Version originale sous-titree');
INSERT INTO VERSION VALUES(3, 'Version francaise malentendants');
INSERT INTO VERSION VALUES(4, 'Version originale sous-titree malentendants');

INSERT INTO GENRE VALUES(1, 'Americana');
INSERT INTO GENRE VALUES(2, 'Buddy movie');
INSERT INTO GENRE VALUES(3, 'Chanbara');
INSERT INTO GENRE VALUES(4, 'Chronique');
INSERT INTO GENRE VALUES(5, 'Cinema de montagne');
INSERT INTO GENRE VALUES(6, 'Comedie');
INSERT INTO GENRE VALUES(7, 'Conte');
INSERT INTO GENRE VALUES(8, 'Documentaire');
INSERT INTO GENRE VALUES(9, 'Drame');
INSERT INTO GENRE VALUES(0, 'Film a sketches');
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

INSERT INTO FILM VALUES(1, 'Le bon, la brute et le truand', date '2014-12-03', date '2016-01-03', 161, 2, 34, 1);
INSERT INTO FILM VALUES(2, 'Chappie', date '2015-03-11', date '2016-04-08', 120, 2, 31, 4);
INSERT INTO FILM VALUES(3, 'Indiana Jones et le Temple maudit', date '2015-01-07', date '2016-02-07', 118, 1, 13, 1);
INSERT INTO FILM VALUES(4, 'Fenêtre sur cour', date '2015-02-04', date '2016-04-15', 150, 1, 11, 1);
INSERT INTO FILM VALUES(5, 'Destination Finale', date '2015-01-07', date '2016-02-07', 98, 3, 23, 4);
INSERT INTO FILM VALUES(6, 'La Cité de la peur', date '2014-12-03', date '2015-01-03', 99, 3, 6, 1);

INSERT INTO SEANCE VALUES(1, to_date('2015-03-16 19:45:00', 'yyyy-mm-dd hh24:mi:ss'), 1, 11);
INSERT INTO SEANCE VALUES(13, to_date('2015-03-16 20:15:00', 'yyyy-mm-dd hh24:mi:ss'), 1, 11); --erreur salle est occupé

INSERT INTO SEANCE VALUES(2, to_date('2015-03-19 22:45:00', 'yyyy-mm-dd hh24:mi:ss'), 1, 11);
INSERT INTO SEANCE VALUES(3, to_date('2015-03-18 16:30:00', 'yyyy-mm-dd hh24:mi:ss'), 2, 1);
INSERT INTO SEANCE VALUES(4, to_date('2015-03-18 18:45:00', 'yyyy-mm-dd hh24:mi:ss'), 2, 1);
INSERT INTO SEANCE VALUES(5, to_date('2015-03-19 19:00:00', 'yyyy-mm-dd hh24:mi:ss'), 3, 1);
INSERT INTO SEANCE VALUES(6, to_date('2015-03-19 21:30:00', 'yyyy-mm-dd hh24:mi:ss'), 3, 1);
INSERT INTO SEANCE VALUES(7, to_date('2015-03-20 21:00:00', 'yyyy-mm-dd hh24:mi:ss'), 4, 5);
INSERT INTO SEANCE VALUES(10, to_date('2015-03-20 22:00:00', 'yyyy-mm-dd hh24:mi:ss'), 5, 4);
INSERT INTO SEANCE VALUES(11, to_date('2015-03-21 18:30:00', 'yyyy-mm-dd hh24:mi:ss'), 6, 11);
INSERT INTO SEANCE VALUES(12, to_date('2015-03-21 21:00:00', 'yyyy-mm-dd hh24:mi:ss'), 6, 11);

ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'yyyy-mm-dd hh24:mi:ss';
INSERT INTO ACHAT VALUES(1,current_timestamp, 12, 2);--ok
INSERT INTO ACHAT VALUES(2,current_timestamp, 12, 2);--ok
INSERT INTO ACHAT VALUES(3, current_timestamp, 12, 2);--la salle est pleine
INSERT INTO ACHAT VALUES(4, current_timestamp, 1, 2); --la séance est terminé
