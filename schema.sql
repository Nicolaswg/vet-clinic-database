/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL
);


/*Created new tables*/
CREATE TABLE species (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  PRIMARY KEY (id)
);


CREATE TABLE owners (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(100),
  age INTEGER,
  PRIMARY KEY (id)
);

/* Transaction for refatoring animal table */
BEGIN WORK;

/* Add new columns to animals table*/
ALTER TABLE
  animals
ADD
  species_id INTEGER;


ALTER TABLE
  animals
ADD
  owner_id INTEGER;

SAVEPOINT SP1;

/* Add FOREING KEY to animals table */
ALTER TABLE
  animals
ADD
  CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id);


ALTER TABLE
  animals
ADD
  CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners (id);

COMMIT;