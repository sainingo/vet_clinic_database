/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' || 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * from animals WHERE neutered = 'true';

SELECT * from animals WHERE name = 'Gabumon';

SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = NULL;
DELETE FROM animals;

ROLLBACK BeforeDelete;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
-- SAVE POINT

-- UPDATE ALL ANIMALS WEIGHT BY MULTIPLY BY -1
UPDATE animals SET weight_kg = (weight_kg * (-1));

ROLLBACK SAVEPOINT;

-- UPDATE ALL ANIMALS WEIGHTS WHICH ARE NEGATIVE AFTER WEIGHT MULTIPLIED BY -1
UPDATE animals SET weight_kg = (weight_kg * -1)  WHERE weight_kg < 0;

COMMIT;

-- HOW MANY ANIMALS ARE THERE?
SELECT COUNT(*) FROM animals;

-- ANIMALS WHO HAVE NEVER TRIED TO ESCAPE
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;