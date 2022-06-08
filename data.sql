/* Populate database with sample data. */

-- INSERT INTO animals (name) VALUES ('Luna');
-- INSERT INTO animals (name) VALUES ('Daisy');
-- INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (
name, date_of_birth, weight_kg, neutered, escape_attempts, id) VALUES (
'Augmon', 'Feb 3 2020', '10.23', true, '0', '1');

INSERT INTO animals (
id, name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (
'2', 'Gabumon', 'Nov 15 2018', '8', true, '2');

INSERT INTO animals (
id, name, date_of_birth, weight_kg, escape_attempts, neutered) VALUES (
'3', 'Pikachu', 'Jan 7 2021', '15.04', '1', false);

INSERT INTO animals (
id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
'4', 'Devimon', 'May 12 2017', '5', true, '11');

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (5, 'Charmander', '2020-02-08', 0, 'false', -11.0, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (6, 'Plantmon', '2021-11-15', 2, 'true', -5.7, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (7, 'Squirtle', '1993-04-02', 3, 'false', -12.13, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (8, 'Angemon', '2005-06-12', 1, 'true', -45.0, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (9, 'Boarmon', '2005-06-07', 7, 'true', 20.4, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (10, 'Blossom', '1998-10-13', 3, 'true', 17.0, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (11, 'Ditto', '2022-05-14', 4, 'true', 22.0, '' );


-- Insert the following data into the owners table:
insert into owners(full_name, age) values('Sam Smith', 34);
insert into owners(full_name, age) values('Jennifer Orwell', 19);
insert into owners(full_name, age) values('Bob', 45);
insert into owners(full_name, age) values('Melody Pond', 77);
insert into owners(full_name, age) values('Dean Winchester', 14);
insert into owners(full_name, age) values('Jodie Whittaker', 38);

-- Insert the following data into the species table:
insert into species(name) values('Pokemon');
insert into species(name) values('Digimon');

/* Begin transaction */
BEGIN;

-- If the name ends in "mon" it will be Digimon
update animals set species_id = 2 where name like '%mon';

-- All other animals are Pokemon
update animals set species_id= 1 where name not like '%mon';

COMMIT;

/* Begin transaction */
BEGIN;

-- Sam Smith owns Agumon.
update animals set owner_id = 1 where name like 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu.
update animals set owner_id = 2 where name like 'Gabumon';
update animals set owner_id = 2 where name like 'Pikachu';

-- Bob owns Devimon and Plantmon.
update animals set owner_id = 3 where name like 'Devimon';
update animals set owner_id = 3 where name like 'Plantmon';

-- Melody Pond owns Charmander, Squirtle, and Blossom.
update animals set owner_id = 4 where name like 'Charmander';
update animals set owner_id = 4 where name like 'Squirtle';
update animals set owner_id = 4 where name like 'Blossom';

-- Dean Winchester owns Angemon and Boarmon.
update animals set owner_id = 5 where name like 'Angemon';
update animals set owner_id = 5 where name like 'Boarmon';

COMMIT;