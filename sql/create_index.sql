/* Base de Données 2
 * Gestion d'un cinéma
 *
 * Alexis Giraudet 
 * François Hallereau 
 * Valery Morozov
 */

-- Suppression des index

drop index index_film_version;
drop index index_film_genre;
drop index index_film_restriction;
drop index index_seance_film;
drop index index_seance_salle;
drop index index_achat_seance;
drop index index_achat_tarif;

-- Création des index

create index index_seance_film on Seance(id_film);
create index index_seance_salle on Seance(id_salle);
create index index_achat_seance on Achat(id_seance);
