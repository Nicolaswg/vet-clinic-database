/* Populate database with sample data. */
INSERT INTO
  animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg,
  )
VALUES
  ('Agumon', '2022-02-03', 0, true, 10.23),
  ('Gabumon', '2018-11-15', 2, true, 8),
  ('Pikachu', '2021-1-7', 1, false, 15.04),
  ('Devimon', '2017-5-12', 5, true, 11),
  ('Charmander', '2020-02-08', 0, false, -11),
  ('Plantmon', '2021-11-15', 2, true, -5.7),
  ('Squirtle', '1993-04-02', 3, false, -12.13),
  ('Angemon', '2005-06-12', 1, true, -45),
  ('Boarmon', '2005-06-07', 7, true, 20.4),
  ('Blossom', '1998-10-13', 3, true, 17),
  ('Ditto', '2022-05-14', 4, true, 22);

/* Populate new tables with sample data */
BEGIN WORK;

INSERT INTO
  owners(full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

INSERT INTO
  species(name)
VALUES
  ('Pokemon'),
  ('Digimon');



/* MILESTONE--3 */

/* Add corresponding data to species_id and owner_id column */
BEGIN WORK;

/* species_id data */
UPDATE
  animals
SET
  species_id = 2
WHERE
  name LIKE '%mon%';

SAVEPOINT SP1;

UPDATE
  animals
SET
  species_id = 1
WHERE
  species_id IS NULL;

COMMIT;

/* owner_id data */
BEGIN WORK
UPDATE
  animals
SET
  owner_id = 1
WHERE
  name = 'Agumon';

SAVEPOINT SP1;

UPDATE
  animals
SET
  owner_id = 2
WHERE
  name IN ('Gabumon', 'Pikachu');

SAVEPOINT SP2;

UPDATE
  animals
SET
  owner_id = 3
WHERE
  name IN ('Devimon', 'Plantmon');

SAVEPOINT SP3;

UPDATE
  animals
SET
  owner_id = 4
WHERE
  name IN ('Charmander', 'Squirtle', 'Blossom');

SAVEPOINT SP4;

UPDATE
  animals
SET
  owner_id = 5
WHERE
  name IN ('Angemon', 'Boarmon');

SAVEPOINT SP5;

COMMIT;