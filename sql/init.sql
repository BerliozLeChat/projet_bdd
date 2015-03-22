/* Base de Données 2
 * Gestion d'un cinéma
 * Alexis Giraudet 
 * François Hallereau 
 * Valery Morozov
 */

prompt START Création des tables
@create_table.sql
prompt END   Création des tables

prompt START Création des index
@create_index.sql
prompt END   Création des index

prompt START Création des triggers
@create_trigger/before_row_insert_achat_date.sql
@create_trigger/before_row_insert_achat_place.sql
@create_trigger/seance_bef_row_insert_update.sql
prompt END   Création des triggers

prompt START Création des rôles
@create_role.sql
prompt END   Création des rôles

prompt START Création des vues
@create_view.sql
prompt END   Création des vues

prompt START Insertion des tuples de test
@insert_test.sql
prompt END   Insertion des tuples de test
