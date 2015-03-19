SET ECHO OFF

-- Suppression des vues si présentes auparavant -> MAJ des vues par
-- rapport à la date du jour
DROP VIEW filmsAffiche;
DROP VIEW seanceDuJour;

prompt Vues supprimées avec succès.

-- Vue contenant l'ensemble des films à l'affiche le jour J
CREATE VIEW filmsAffiche AS
  SELECT f.titre, f.duree, v.lib_version, r.lib_restriction
  FROM FILM f, RESTRICTION r, VERSION v
  WHERE f.id_version = v.id_version
  AND f.id_restriction = r.id_restriction
  AND TRUNC(f.date_fin) > TRUNC(SYSDATE);
  
-- Vue contenant l'ensemble des séances du jour J
CREATE VIEW seanceDuJour AS
  SELECT s.date_seance, f.titre, v.lib_version, r.lib_restriction
  FROM SEANCE s, FILM f, VERSION v, RESTRICTION r
  WHERE s.id_film = f.id_film
  AND f.id_restriction = r.id_restriction
  AND f.id_version = v.id_version
  AND TRUNC(s.date_seance) = TRUNC(SYSDATE);
  
prompt Vues crées/mises à jour avec succès.
  
SET ECHO ON
