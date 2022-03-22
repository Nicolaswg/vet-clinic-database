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
  date_of_birth BETWEEN '2016-01-01'
  AND '2019-01-01';

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