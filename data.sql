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
