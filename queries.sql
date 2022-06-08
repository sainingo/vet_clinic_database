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

BEGIN;
UPDATE animals SET species = 'pokemon' WHERE species = NULL;
DELETE FROM animals;

ROLLBACK BeforeDelete;


/*Delete all animals born after Jan 1st, 2022.*/
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;

-- UPDATE ALL ANIMALS WEIGHT BY MULTIPLY BY -1
UPDATE animals SET weight_kg = (weight_kg * (-1));

ROLLBACK SP1;

-- UPDATE ALL ANIMALS WEIGHTS WHICH ARE NEGATIVE AFTER WEIGHT MULTIPLIED BY -1
UPDATE animals SET weight_kg = (weight_kg * -1)  WHERE weight_kg < 0;

COMMIT;

-- HOW MANY ANIMALS ARE THERE?
SELECT COUNT(*) FROM animals;

-- ANIMALS WHO HAVE NEVER TRIED TO ESCAPE
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- Averege weight of the Animals
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;