/* Populate database with sample data. */
INSERT INTO
  animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    wigth_kg
  )
VALUES
  ('Agumon', '2022-02-03', 0, true, 10.23),
  ('Gabumon', '2018-11-15', 2, true, 8),
  ('Pikachu', '2021-1-7', 1, false, 15.04),
  ('Devimon', '2017-5-12', 5, true, 11);
  