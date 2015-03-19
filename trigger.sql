-- Triggers de la base de données --

-- Vérification du nombre de places restantes avant la réservation --

create or replace trigger before_insert_achat
before insert on Achat for each row
declare
	places_occupes, max_place number;
	reserv_error exception;
	
begin
	select count(*) into places_occupes from Achat
	where id_seance = new.id_seance and id_salle = new.id_salle;
	select capacite into max_place from Achat natural join Salle
	where new.id_salle = id_salle;
	
	if places_occupes >= max_places then
		raise reserv_error;
	end if
	
	exception when reserv_error then
	raise_application_error(-20001, "il n'y a plus de places disponibles pour cette séance");
end
