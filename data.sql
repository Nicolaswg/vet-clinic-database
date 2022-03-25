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
BEGIN WORK;

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

/* MILESTONE--4 */
/* SQL tables relationships */
/* Insert data into vets--specialities--visits tables */
INSERT INTO
  vets(name, age, data_of_gradutation)
VALUES
  ('William Thatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-14'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

INSERT INTO
  specializations
VALUES
  (1, 1),
  (3, 1),
  (3, 2),
  (4, 2);

INSERT INTO
  visits
VALUES
  (12, 1, '2020-05-24'),
  (12, 3, '2020-07-22'),
  (2, 4, '2021-02-02'),
  (3, 2, '2020-01-05'),
  (3, 2, '2020-03-08'),
  (3, 2, '2020-05-14'),
  (4, 3, '2021-05-04'),
  (5, 4, '2021-02-24'),
  (6, 2, '2019-12-21'),
  (6, 1, '2020-08-10'),
  (6, 2, '2021-04-07'),
  (7, 3, '2019-09-29'),
  (8, 4, '2020-10-03'),
  (8, 4, '2020-11-04'),
  (9, 2, '2019-01-24'),
  (9, 2, '2019-05-15'),
  (9, 2, '2020-02-27'),
  (9, 2, '2020-08-03'),
  (10, 3, '2020-05-24'),
  (10, 1, '2021-01-11');