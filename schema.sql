/* Database schema to keep the structure of entire database. */ 

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
   id INT PRIMARY KEY NOT NULL,
   name varchar(100) NOT NULL,
   date_of_birth  DATE ,
   escape_attempts INT,
   neutered BOOLEAN,
   weight_kg DECIMAL
);

ALTER TABLE animals 
ADD species varchar(200);

-- New Tables

CREATE TABLE owners (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name varchar(250),
  age INT
);

CREATE TABLE species (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(150)
   
);


ALTER TABLE animals
 DROP COLUMN id;
ALTER TABLE animals ADD COLUMN
 id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY;

ALTER TABLE animals
 DROP COLUMN species;

ALTER TABLE animals
 ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species 
FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals 
 ADD COLUMN owner_id INT; 
ALTER TABLE animals ADD CONSTRAINT fk_owners 
FOREIGN KEY(owner_id) REFERENCES owners(id);
