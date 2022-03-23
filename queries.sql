/* Queries that provide answers to the questions from all projects. */
/* Select elements that contains mon */
SELECT
  *
FROM
  animals
WHERE
  name LIKE '%mon%';

/* Select elements between 2016 and 2019 */
SELECT
  *
FROM
  animals
WHERE
  EXTRACT(
    year
    FROM
      date_of_birth
  ) BETWEEN 2016
  AND 2019;

/* Select elements that have less than 3 escape attempst and neutered is true */
SELECT
  *
FROM
  animals
WHERE
  escape_attempts < 3
  AND neutered = true;

/* Select date of element name = AGUMON or Pikachu */
SELECT
  date_of_birth
FROM
  animals
WHERE
  name = 'Agumon'
  OR name = '
Pikachu';

/* Select name and escape attempts where weight is greater than 10.5 kg */
SELECT
  name,
  escape_attempts
FROM
  animals
WHERE
  weight_kg > 10.5;

/* Select all neutered element */
SELECT
  *
FROM
  animals
WHERE
  neutered = true;

/* Select elements where name is not equal to Gabumon */
SELECT
  *
FROM
  animals
WHERE
  name != 'Gabumon';

/* Select all elements that are between 10.4kg and 17.3kg  including the range values */
SELECT
  *
FROM
  animals
WHERE
  weight_kg >= 10.4
  AND weight_kg <= 17.3;

/*TRANSACTIONS-1 set species to unspecified */
BEGIN WORK;

UPDATE
  animals
SET
  species = 'unspecified';

SELECT
  *
FROM
  animals;

ROLLBACK WORK;

SELECT
  *
FROM
  animals;

/* TRANSACTIONS-2 set species to correct values*/
BEGIN WORK;

UPDATE
  animals
SET
  species = 'digimon'
WHERE
  name LIKE '%mon%';

UPDATE
  animals
SET
  species = 'pokemon'
WHERE
  species IS NULL;

COMMIT;

SELECT
  *
FROM
  animals;

/* TRANSACTIONS-3 deleted all records */
BEGIN WORK;

DELETE FROM
  animals;

ROLLBACK WORK;

SELECT
  *
FROM
  animals;

/* TRANSACTION-4 multiples control Commands */
BEGIN WORK;

DELETE FROM
  animals
WHERE
  date_of_birth > '2022-01-01';

SELECT
  *
FROM
  animals;

SAVEPOINT SP_DELETE_1;

UPDATE
  animals
SET
  weight_kg = weight_kg * -1;

ROLLBACK TO SP_DELETE_1;

UPDATE
  animals
SET
  weight_kg = weight_kg * -1
WHERE
  weight_kg < 0;

COMMIT;

/* TRANSACTION-5 aswering questions with queries */
SELECT
  COUNT(*)
FROM
  animals;

SELECT
  COUNT (*)
FROM
  animals
WHERE
  escape_attempts = 0;

SELECT
  AVG(weight_kg)
FROM
  animals;

SELECT
  neutered,
  COUNT(escape_attempts) AS escape_attempts
FROM
  animals
GROUP BY
  neutered;

SELECT
  species,
  MAX(weight_kg) AS max_weigth_by_species,
  MIN(weight_kg) as min_weigth_by_species
FROM
  animals
GROUP BY
  species;

SELECT
  species,
  AVG(escape_attempts) AS escape_attempts_average_by_species
FROM
  animals
WHERE
  EXTRACT(
    year
    FROM
      date_of_birth
  ) BETWEEN 1990
  AND 2000
GROUP BY
  species;