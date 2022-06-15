/* Database schema to keep the structure of entire database. */

CREATE TABLE public.animals
(
    id integer NOT NULL,
    name character varying NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg double precision NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE animals ADD species character(255);


-- Create a table named owners with the following columns
create table owners(id serial primary key, full_name varchar(255), age int );

-- Create a table named species with the following columns:
create table species(id serial primary key, name varchar(255) );

-- Modify animals table:
-- first step: 
 alter table animals drop column id;

-- Make sure that id is set as autoincremented PRIMARY KEY
 alter table animals add column id serial primary key;

-- Remove column species
 alter table animals drop column species;

--  Add column species_id which is a foreign key referencing species table

-- Add column species_id which is a foreign key referencing species table
alter table animals add column species_id int references species(id);

-- Add column owner_id which is a foreign key referencing the owners table
alter table animals add column owner_id int references owners(id);


-- Database perfomance and audit

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Any changes you made to your database schema USED indexes to reduce the querying time.
CREATE INDEX index_animals_id ON visits(animals_id);
create index idx_all on visits(vets_id) where vets_id = 1;

create index idx_2 on visits(vets_id) where vets_id = 2;
anaylyze;