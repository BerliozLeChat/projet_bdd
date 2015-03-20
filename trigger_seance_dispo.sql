create or replace trigger seance_bef_row_insert_update
before insert or update
on Seance
for each row
declare
	cursor seance_cursor is select date_seance, id_film from Seance where :new.id_salle = id_salle;
        duree_film number;
	seance_excep exception;
begin
	for seance_record in seance_cursor loop
	        duree_film := select duree from Film where id_film = seance_record.id_film;
		if (:new.date_seance < (seance_record.date_seance + numtodsinterval(duree_film, 'minute'))) then
			raise seance_excep;
		end if;
	end loop;
exception
	when seance_excep then
		raise_application_error(-200010, 'Erreur: Seance');
end;
