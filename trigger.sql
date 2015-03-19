-- Triggers de la base de données --

-- Vérification du nombre de places restantes avant la réservation --
show errors;
create or replace trigger before_insert_achat
before insert on Achat 
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
	
	exception when reserv_error then
	raise_application_error(-20099,'room is full');
end;

