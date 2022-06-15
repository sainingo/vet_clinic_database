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

-- Write queries (using JOIN) to answer the following questions:
-- What animals belong to Melody Pond?
select name, full_name from animals join owners on animals.owner_id = owners.id where owners.id = 4;

-- List of all animals that are pokemon (their type is Pokemon).
select animals.name from animals join species on animals.species_id  = species.id where animals.species_id = 1;

-- List all owners and their animals, remember to include those that don't own any animal.
select full_name, name from owners full outer join animals on owners.id = animals.owner_id;

-- How many animals are there per species?
select count(species_id), (species.name) from animals join species on animals.species_id = species.id group by species.name;

-- List all Digimon owned by Jennifer Orwell.
select (animals.name) as animal_name, (species.name) 
as species_name, full_name from animals join species 
on animals.species_id = species.id join owners 
on animals.owner_id = owners.id where species.id = 2 and owner_id = 2;

-- List all animals owned by Dean Winchester that haven't tried to escape.
select name, full_name from animals full outer join owners 
on animals.owner_id = owners.id where escape_attempts < 1 and owner_id = 5;

-- Who owns the most animals?
select full_name, count(owner_id) from owners join animals on owners.id = animals.owner_id group by full_name order by count(name) desc;


-- Use EXPLAIN ANALYZE on the previous queries to check what is happening. Take screenshots of them - they will be necessary later.
explain analyze SELECT COUNT(*) FROM visits where animals_id = 1;