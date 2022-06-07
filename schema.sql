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

ALTER TABLE animals ADD species character
