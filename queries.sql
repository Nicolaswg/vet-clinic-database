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

/* MILESTONE--2 */
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

/* Aswering questions with queries */
/*question-1*/
SELECT
  COUNT(*)
FROM
  animals;

/*question-2*/
SELECT
  COUNT (*)
FROM
  animals
WHERE
  escape_attempts = 0;

/*question-3*/
SELECT
  AVG(weight_kg)
FROM
  animals;

/*question-4*/
SELECT
  neutered,
  COUNT(escape_attempts) AS escape_attempts
FROM
  animals
GROUP BY
  neutered;

/*question-5*/
SELECT
  species,
  MAX(weight_kg) AS max_weigth_by_species,
  MIN(weight_kg) as min_weigth_by_species
FROM
  animals
GROUP BY
  species;

/*question-6*/
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

/* MILESTONE--3 */
/*Aswering queries questions using JOIN */
/* Question-1 */
SELECT
  name AS Animal,
  full_name AS Owner
FROM
  owners O
  JOIN animals A ON O.id = A.owner_id
WHERE
  O.full_name = 'Melody Pond';

/* Question-2 */
SELECT
  A.name,
  S.name as species
FROM
  species S
  JOIN animals A ON S.id = A.species_id
WHERE
  S.name = 'Pokemon';

/* Question-3 */
SELECT
  full_name AS Owner,
  name AS Animals
FROM
  animals A
  RIGHT JOIN owners on A.owner_id = owners.id;

/* Question-4 */
SELECT
  COUNT(A.name),
  S.name AS Species
FROM
  species S
  JOIN animals A ON S.id = A.species_id
GROUP BY
  S.name;

/* Question-5 */
SELECT
  A.name AS Animal,
  full_name AS Owner,
  S.name as Species
FROM
  animals A
  JOIN owners O ON A.owner_id = O.id
  JOIN sp ecies S ON A.species_id = S.id
WHERE
  S.name = 'Digimon'
  AND full_name = 'Jennifer Orwell';

/* Question-6 */
SELECT
  A.name AS Animals,
  full_name AS Owner,
  escape_attempts
FROM
  animals A
  JOIN owners O ON A.owner_id = O.id
WHERE
  esc ape_attempts = 0
  AND full_name = 'Dean Winchester';

/* Question-7 */
SELECT
  COUNT(*),
  full_name AS Owner
FROM
  animals A
  JOIN owners O ON A.owner_id = O.id
GROUP BY
  Owner
ORDER BY
  COUNT(*) DE SC
LIMIT
  1;

/* MILESTONE--4 */
/* SQL tables relationships queries */
/* QUESTION-1 */
SELECT
  A.name as Animal,
  Ve.name as Vet,
  Vi.visit_date
FROM
  visits as Vi
  JOIN animals A ON Vi.animal_id = A.id
  JOIN vets Ve ON Vi.vet_id = Ve.id
WHERE
  Ve.name = 'William Thatcher'
ORDER BY
  Vi.visit_date DESC
LIMIT
  1;

/* QUESTION-2 */
SELECT
  COUNT(DISTINCT A.name)
FROM
  visits Vi
  JOIN animals A ON Vi.animal_id = A.id
  JOIN vets Ve ON Vi.vet_id = Ve.id
WHERE
  Ve.name = 'Stephanie Mendez';

/* QUESTION-3 */
SELECT
  Ve.name AS Vets,
  S.name AS Speciality
FROM
  vets Ve
  LEFT JOIN specializations Spe ON Ve.id = Spe.vet_id
  LEFT JOIN species S ON S.id = Spe.species_id;

/* QUESTION-4 */
SELECT
  A.name AS Animals,
  Vi.visit_date AS Date,
  Ve.name as Vet
FROM
  animals A
  JOIN visits Vi ON Vi.animal_id = A.id
  JOIN vets Ve ON Vi.vet_id = Ve.id
WHERE
  Ve.name = 'Stephanie Mendez'
  AND Vi.visit_date BETWEEN '2020-04-01'
  AND '2020-08-30';

/* QUESTION-5 */
SELECT
  A.name AS Animals,
  COUNT(A.name) AS Most_Viewed
FROM
  animals A
  JOIN visits Vi ON Vi.animal_id = A.id JO IN vets Ve ON Vi.vet_id = Ve.id
GROUP BY
  A.name
ORDER BY
  Most_Viewed DESC
LIMIT
  1;

/* QUESTION-6 */
SELECT
  Ve.name AS Vest,
  A.name AS Animal,
  visit_date AS Date
FROM
  visits Vi
  JOIN vets Ve ON Vi.vet_id = Ve.id
  JOIN animals A ON Vi.animal_id = A.id
WHERE
  Ve.name = 'Maisy Smith'
ORDER BY
  Date
LIMIT
  1;

/* QUESTION-7 */
SELECT
  A.name AS Animals,
  A.date_of_birth AS "Date of Birth",
  A.escape_attempts AS Escapes,
  A.neutered AS Neutered,
  A.weight_kg AS Weigth,
  S.name AS species,
  Ve.name AS "Vet name",
  Ve.age AS "Vet age",
  Ve.date_of_graduation AS "Date of vet graduation",
  visit_date
FROM
  visits Vi
  JOIN vets Ve ON Vi.vet_id = Ve.id
  JOIN animals A ON Vi.animal_id = A.id
  JOIN species S ON A.species_id = S.id
ORDER BY
  visit_date DESC
LIMIT
  1;

/* QUESTION-8 */
SELECT
  vet_specs.species_name,
  vet_specs.name,
  animals.name as "Animal Name"
FROM
  visits
  JOIN (
    SELECT
      vets.name,
      vets.id as vet_id,
      species.name as species_name,
      species.id as species_id
    FROM
      specializations
      JOIN vets on specializations.vet_id = vets.id
      JOIN species on specializations.species_id = species.id
  ) as vet_specs on visits.vet_id = vet_specs.vet_id
  JOIN animals on visits.animal_id = animals.id
WHERE
  animals.species_id != vet_specs.species_id
  AND vet_specs.name != 'Stephanie Mendez';

/* QUESTION-9 */
SELECT
  specs.species_name,
  COUNT(specs.species_name)
FROM
  visits
  JOIN (
    SELECT
      animals.name,
      animals.id as animal_id,
      species.name as species_name,
      species.id as species_id
    FROM
      animals
      JOIN species on animals.species_id = species.id
  ) as specs on visits.animal_id = specs.animal_id
  JOIN vets on visits.vet_id = vets.id
WHERE
  vets.name = 'Maisy Smith'
GROUP BY
  specs.species_name
ORDER BY
  COUNT(specs.species_name) desc
LIMIT
  1;