CREATE DATABASE universe;
\c universe

-- GALAXY TABLE
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    age_in_millions INT NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    distance_from_earth NUMERIC
);

-- STAR TABLE
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    temperature INT NOT NULL,
    is_main_sequence BOOLEAN NOT NULL,
    spectral_type VARCHAR(10)
);

-- PLANET TABLE
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    star_id INT REFERENCES star(star_id) NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    has_life BOOLEAN NOT NULL,
    planet_order INT NOT NULL,
    mass_index INT
);

-- MOON TABLE
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    planet_id INT REFERENCES planet(planet_id) NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    is_tidally_locked BOOLEAN NOT NULL,
    radius_km INT NOT NULL,
    discovery_year INT
);

-- FIFTH TABLE (CONSTELLATION)
CREATE TABLE constellation (
    constellation_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    visible_season VARCHAR(20) NOT NULL
);

-- Populate Galaxy (6 rows)
INSERT INTO galaxy (name, age_in_millions, is_spherical, distance_from_earth) VALUES
('Milky Way', 13600, false, 0),
('Andromeda', 10000, false, 2.5),
('Sombrero', 13000, true, 29),
('Triangulum', 12000, false, 3),
('Centaurus A', 13000, true, 11),
('Whirlpool', 400, false, 23);

-- Populate Star (6 rows)
INSERT INTO star (galaxy_id, name, temperature, is_main_sequence) VALUES
(1, 'Sun', 5778, true),
(1, 'Alpha Centauri', 5790, true),
(1, 'Sirius', 9940, true),
(2, 'Andromeda Alpha', 10000, true),
(2, 'Mirach', 3800, false),
(3, 'Sombrero Prime', 12000, true);

-- Populate Planet (12 rows)
INSERT INTO planet (star_id, name, has_life, planet_order) VALUES
(1, 'Mercury', false, 1), (1, 'Venus', false, 2), (1, 'Earth', true, 3), (1, 'Mars', false, 4),
(1, 'Jupiter', false, 5), (1, 'Saturn', false, 6), (2, 'Centauri B1', false, 1), (2, 'Centauri B2', false, 2),
(3, 'Sirius Prime', false, 1), (4, 'Andro A1', false, 1), (5, 'Mirach B1', false, 1), (6, 'Somb Alpha', false, 1);

-- Populate Moon (20 rows)
INSERT INTO moon (planet_id, name, is_tidally_locked, radius_km) VALUES
(3, 'Moon', true, 1737), (5, 'Io', true, 1821), (5, 'Europa', true, 1560), (5, 'Ganymede', true, 2634),
(5, 'Callisto', true, 2410), (6, 'Titan', true, 2574), (6, 'Enceladus', true, 252), (6, 'Mimas', true, 198),
(6, 'Dione', true, 561), (6, 'Rhea', true, 763), (4, 'Phobos', true, 11), (4, 'Deimos', true, 6),
(5, 'Adrastea', true, 8), (5, 'Amalthea', true, 83), (5, 'Thebe', true, 49), (6, 'Hyperion', false, 135),
(6, 'Iapetus', true, 734), (6, 'Phoebe', false, 106), (7, 'Centauri Moon A', true, 500), (8, 'Centauri Moon B', true, 400);

-- Populate Constellation (3 rows)
INSERT INTO constellation (name, visible_season) VALUES
('Orion', 'Winter'), ('Leo', 'Spring'), ('Scorpius', 'Summer');