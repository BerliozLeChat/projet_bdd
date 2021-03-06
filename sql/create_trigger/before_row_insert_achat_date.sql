/* Base de Données 2
 * Gestion d'un cinéma
 *
 * Alexis Giraudet 
 * François Hallereau 
 * Valery Morozov
 */

-- Vérification de l'heure de la séance: si la séance a commencé on ne peut plus acheter de place pour celle ci.
create or replace trigger before_row_insert_achat_date
before insert on Achat for each row
declare
    date_seance timestamp;
    date_error exception;
begin
    select date_seance into date_seance from Seance where id_seance = :new.id_seance;
    if :new.date_achat > date_seance then
        raise date_error;
    end if;
exception
    when date_error then
        raise_application_error(-20003,'Error: seance plus disponible');
end;
