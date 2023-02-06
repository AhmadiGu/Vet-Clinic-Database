/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT * FROM animals WHERE neutered IS true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered IS true;

SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
-- New Queries T1
BEGIN; 
UPDATE animals SET  species = 'unspecified'; 
SELECT species FROM animals;
ROLLBACK;

SELECT species FROM animals;

-- T2
BEGIN; 
UPDATE animals SET  species = 'digimon' 
WHERE name LIKE '%mon%'; 

UPDATE animals SET  species = 'pokemon' 
WHERE species is null ;
SELECT species FROM animals; 
COMMIT; 

SELECT species FROM animals;

--T3
SELECT * FROM animals; 
BEGIN;  
DELETE from animals;
ROLLBACK;  
SELECT * FROM animals;

--T4

BEGIN; 

DELETE from animals 
WHERE date_of_birth > '2022-01-01';

SAVEPOINT birth;

UPDATE animals
SET weight_kg = -weight_kg;
ROLLBACK TO birth; 

UPDATE animals
SET weight_kg = -weight_kg
WHERE  weight_kg <0;

COMMIT; 
 
SELECT * FROM animals;

-- The calculate
 
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg)
 FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE
 date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
SELECT species, CAST(AVG(escape_attempts) AS DECIMAL(10)) FROM animals 
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- multiple tables join

SELECT full_name, name FROM animals INNER JOIN owners
ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
 
SELECT animals.name, species.name FROM animals INNER JOIN species
ON animals.species_id = species.id WHERE species.name = 'Pokemon'; 

SELECT full_name, name FROM animals RIGHT JOIN owners
ON animals.owner_id = owners.id;

SELECT COUNT(animals.name), species.name FROM animals INNER JOIN species
ON animals.species_id = species.id GROUP BY species.name;

SELECT animals.name, owners.full_name, species.name FROM animals
INNER JOIN owners ON animals.owner_id = owners.id 
INNER JOIN species ON animals.species_id = species.id 
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT full_name, name, escape_attempts FROM animals INNER JOIN owners
ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT full_name, COUNT(*) FROM animals INNER JOIN owners
ON animals.owner_id = owners.id 
GROUP BY full_name ORDER BY count DESC LIMIT 1;

-- NEW QUERIES 

SELECT animals.name, vets.name, visits.date_of_visit FROM vets INNER JOIN visits ON
vets.id = visits.vets_id INNER JOIN animals ON visits.animals_id = animals.id
 WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;

SELECT COUNT(animals.name), vets.name  FROM vets INNER JOIN visits ON
vets.id = visits.vets_id INNER JOIN animals ON visits.animals_id = animals.id
 WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;

SELECT  vets.name, species.name FROM vets  FULL OUTER JOIN specializations ON
vets.id = specializations.vets_id   FULL OUTER JOIN 
 species ON species.id = specializations.species_id;

SELECT animals.name,visits.date_of_visit FROM animals INNER JOIN visits ON 
visits.animals_id = animals.id 
WHERE visits.vets_id =(SELECT id FROM vets WHERE vets.name ='Stephanie Mendez')
AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(*) FROM animals INNER JOIN visits 
ON visits.animals_id = animals.id 
GROUP BY animals.name
ORDER BY count DESC
LIMIT 1;


SELECT animals.name AS "Animal Name" FROM visits INNER JOIN vets
  ON visits.vets_id = vets.id INNER JOIN animals
  ON visits.animals_id = animals.id WHERE vets.name = 'Maisy Smith'
  ORDER BY visits.date_of_visit ASC LIMIT 1;

SELECT * FROM visits INNER JOIN vets
    ON visits.vets_id = vets.id INNER JOIN animals
    ON visits.animals_id = animals.id  WHERE vets.name = 'Maisy Smith'
    ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(*), vets.name FROM visits 
  INNER JOIN vets ON visits.vets_id = vets.id 
  FULL OUTER JOIN specializations ON vets.id = specializations.vets_id
  WHERE specializations.species_id IS NULL GROUP BY vets.name;

SELECT COUNT(*), species.name FROM visits 
  INNER JOIN vets ON visits.vets_id = vets.id
  INNER JOIN animals ON visits.animals_id = animals.id
  INNER JOIN species ON species.id = animals.species_id
  WHERE vets.name = 'Maisy Smith'
  GROUP BY species.name
  ORDER BY count LIMIT 1;

-- NEW QUERIES
SELECT COUNT(*) FROM visits where animals_id = 4;
CREATE INDEX visits_animals_id ON visits(animals_id);

SELECT * FROM visits where vets_id = 2;
CREATE INDEX visits_vets_id ON visits(vets_id);

SELECT * FROM owners where email = 'owner_18327@mail.com';
CREATE INDEX owners_email ON owners(email);

--explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';