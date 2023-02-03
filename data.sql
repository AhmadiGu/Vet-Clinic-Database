 
/* New data */

INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5,'Charmander', 'Feb 08, 2020', 0, false, -11);

INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6,'Plantmon', 'Nov 15, 2021', 2, true, -5.7);

INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7,'Squirtle', 'Apr 02, 1993', 3, false, -12.13);

INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8,'Angemon', 'Jun 12, 2005', 1, true, -45);

INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9,'Boarmon', 'Jun 07, 2005', 7, true, 20.4);

INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10,'Blossom', 'Oct 13, 1998', 3, true, 17);

INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11,'Ditto', 'May 14, 2022', 4, true, 22);

-- New DATA
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age) VALUES ('Bob', 45);

INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');

INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET  species_id = 2 
WHERE name LIKE '%mon%'; 

UPDATE animals SET  species_id = 1 
WHERE species_id is null ;

UPDATE animals SET
owner_id =(SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals SET
owner_id =(SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN('Gabumon','Pikachu') ;

UPDATE animals SET
owner_id =(SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon' ,'Plantmon');

UPDATE animals SET
owner_id =(SELECT id FROM owners WHERE full_name = 'Melody Pond ')
WHERE name IN ('Charmander', 'Squirtle','Blossom');

UPDATE animals SET
owner_id =(SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon','Boarmon');

-- New DATA 
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, 'Apr 23, 2000');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, 'Jan 17, 2019');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, 'May 4, 1981');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, 'Jun 8, 2008');

INSERT INTO specializations (vets_id, species_id) VALUES ( (SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon'));

INSERT INTO specializations (vets_id, species_id) VALUES ( (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon'));

INSERT INTO specializations (vets_id, species_id) VALUES ( (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO specializations (vets_id, species_id) VALUES ( (SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));


INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES ( (SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM animals WHERE name = 'Agumon'), 'May 24, 2020');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES ( (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Agumon'), 'Jul 22, 2020');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES ( (SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Gabumon'), 'Feb 2, 2021');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES ( (SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Pikachu'), 'Jan 5, 2020');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES ( (SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Pikachu'), 'Mar 8, 2020');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES ( (SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Pikachu'), 'May 14, 2020');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES ( (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Devimon'), 'May 4, 2021');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES ( (SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Charmander'), ' Feb 24, 2021');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES ( (SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Plantmon'), ' Dec 21, 2019');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES ( (SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM animals WHERE name = 'Plantmon'), 'Aug 10, 2020');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES ( (SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Plantmon'), 'Apr 7, 2021');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES ( (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Squirtle'), 'Sep 29, 2019');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES( (SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Angemon'), 'Oct 03, 2020');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES( (SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Angemon'), 'Nov 04, 2020');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES( (SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), 'Jan 24, 2019');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES( (SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), 'May 15, 2019');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES( (SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), 'Feb 27, 2020');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES( (SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), 'Aug 03, 2020');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES( (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Blossom'), 'May 24, 2020');

INSERT INTO visits (vets_id, animals_id, date_of_visit) VALUES( (SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM animals WHERE name = 'Blossom'), 'Jan 11, 2021');
