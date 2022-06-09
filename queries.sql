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

-- Who was the last animal seen by William Tatcher?
SELECT (animals.name) AS animalName, (vets.name) AS vetsName, (visits.date_of_visit) AS dateVisited
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
WHERE vets_id = 1
ORDER BY (visits.date_of_visit) DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(visits.vets_id) AS Different_animals_seen, (vets.name) AS vets_name
FROM visits
JOIN vets ON visits.vets_id = vets.id
WHERE vets.id = 3
GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties
SELECT (vets.name) as vets_name, (species.name) as vets_speciality
FROM vets
FULL OUTER JOIN specializations ON vets.id = specializations.vet_id
FULL OUTER JOIN species ON species.id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT (animals.name) AS animals_visited_Stephanie
FROM animals
FULL OUTER JOIN visits ON animals.id = visits.animals_id
FULL OUTER JOIN vets ON vets.id = visits.vets_id
WHERE vets.id = 3 AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT (animals.name) AS animals_name, COUNT(visits.animals_id) AS number_of_visits
FROM animals
FULL OUTER JOIN visits ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY COUNT(visits.animals_id) DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT (animals.name) AS animalName, (vets.name) AS vetsName, (visits.date_of_visit) AS dateVisited
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
WHERE vets_id = 2
ORDER BY (visits.date_of_visit)
LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT (animals.name) AS animal_information, (vets.name) AS vet_information, (visits.date_of_visit) AS date_of_Visit
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
ORDER BY (visits.date_of_visit) DESC;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name AS vetsName, COUNT(vets.name) AS timesVisited FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN visits ON visits.vets_id = specializations.vet_id
WHERE specializations.species_id IS NULL
GROUP BY vets.name, specializations.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT Species.name as speciesName, COUNT(animals.name) AS times_visited FROM animals
FULL OUTER JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
JOIN species  ON Species.id = animals.species_id
WHERE vets.id = 2
GROUP BY Species.name
ORDER BY COUNT(animals.name) DESC
LIMIT 1;
