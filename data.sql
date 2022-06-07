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

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (5, 'Charmander', '2020-02-08', 0, 'false', 11.0, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (6, 'Plantmon', '2021-11-15', 2, 'true', 5.7, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (7, 'Squirtle', '1993-04-02', 3, 'false', 12.13, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (8, 'Angemon', '2005-06-12', 1, 'true', 45.0, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (9, 'Boarmon', '2005-06-07', 7, 'true', 20.4, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (10, 'Blossom', '1998-10-13', 3, 'true', 17.0, '' );
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg,species) VALUES (11, 'Ditto', '2022-05-14', 4, 'true', 22.0, '' );
