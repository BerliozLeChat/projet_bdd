/* Base de Données 2
 * Gestion d'un cinéma
 *
 * Alexis Giraudet 
 * François Hallereau 
 * Valery Morozov
 */

-- Vérification du nombre de places restantes avant la réservation
create or replace trigger before_row_insert_achat_place
before insert on Achat for each row
declare
    places_occupes number;
    max_places number;
    reserv_error exception;
begin
    select count(*) into places_occupes from Achat
        where id_seance = :new.id_seance;
    select capacite into max_places from Salle where id_salle = (select id_salle  from  Seance
        where id_seance=:new.id_seance);
    if places_occupes >= max_places then
        raise reserv_error;
    end if;
exception
    when reserv_error then
        raise_application_error(-20002,'Error: salle pleine');
end;
