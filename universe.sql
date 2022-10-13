--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    radius_in_km integer NOT NULL,
    orbital_speed_in_km_per_s numeric(5,2),
    has_water boolean,
    has_moons boolean,
    description text,
    star_id integer
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_in_kpc integer,
    size_in_kpc numeric(4,1),
    has_life boolean NOT NULL,
    is_supergiant boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    radius_in_km integer,
    orbital_period_in_days numeric(4,1) NOT NULL,
    has_water boolean,
    is_tidally_locked boolean,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    radius_in_km integer,
    orbital_speed_in_km_per_s numeric(5,2),
    has_life boolean NOT NULL,
    is_terrestrial boolean,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    temperature_in_kelvin integer,
    radius_in_solar_radius numeric(5,1),
    visible_to_naked_eye boolean NOT NULL,
    is_supergiant boolean,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Pluto', 4503, 1854, 4.74, true, true, 'Pluto is a dwarf planet in the Kuiper belt.', 1);
INSERT INTO public.dwarf_planet VALUES (2, 'Ceres', 4503, 470, 17.90, true, false, 'Ceres is a dwarf planet in the asteroid belt between the orbits of Mars and Jupiter.', 1);
INSERT INTO public.dwarf_planet VALUES (3, 'Eris', 4503, 1163, 3.43, true, true, 'Eris is the most massive and second-largest known dwarf planet in the Solar System.', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 12700, 0, 26.8, true, false, 'The Milky Way is the galaxy that includes our Solar System, with the name describing the galaxy''s appearance from Earth.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 770, 46.6, false, false, 'The Andromeda galaxy is a barred spiral galaxy that is the nearest large galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', NULL, 849, 18.7, false, false, 'The Triangulum galaxy is a spiral galaxy that is the third-largest member of the Local group, behind Andromeda and the Milky Way.');
INSERT INTO public.galaxy VALUES (36, 'ESO 444-46', NULL, 195000, 123.3, false, true, 'The ESO 444-46 galaxy is a class E4 supergiant elliptical galaxy in the constellation Centaurus.');
INSERT INTO public.galaxy VALUES (37, 'Pinwheel', NULL, 6400, 51.9, false, false, 'The Pinwheel galaxy is a face-on spiral galaxy located in the constlellation Ursa Major.');
INSERT INTO public.galaxy VALUES (38, 'UGC 12158', NULL, 118000, 40.0, false, false, 'The UGC 12158 galaxy is an Sb-type barred spiral galaxy in the constellaton of Pegasus.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4425, 1737, 27.3, true, true, 'The Moon is Earth''s only natural satellite. The Moon is the fifth largest satellite in the Solar System.', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4503, 11, 0.3, false, false, 'Phobos is the innermost and larger of the two natural satellites of Mars.', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4503, 6, 1.3, false, false, 'Deimos is the smaller and outermost of the two natural satellites of Mars.', 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 4503, 2634, 7.2, true, true, 'Ganymede is the largest and most massive of the Solar System''s moons.', 5);
INSERT INTO public.moon VALUES (5, 'Io', 4503, 1822, 1.8, true, false, 'Io is the innermost and third-largest of the four Galilean moons of the planet Jupiter.', 5);
INSERT INTO public.moon VALUES (38, 'Europa', 4503, 1561, 3.6, true, true, 'Europa is the smallest of the four Galilean moons orbiting Jupiter.', 5);
INSERT INTO public.moon VALUES (39, 'Callisto', 4503, 2410, 16.7, true, true, 'Callisto is the second-largest moon of Jupiter.', 5);
INSERT INTO public.moon VALUES (40, 'Titan', 4503, 2575, 15.9, true, true, 'Titan is the largest moon of Saturn and the second-largest natural satellite in the Solar System.', 6);
INSERT INTO public.moon VALUES (41, 'Rhea', 4503, 764, 4.5, true, false, 'Rhea is the second-largest moon of Saturn and the ninth-largest moon in the Solar System.', 6);
INSERT INTO public.moon VALUES (42, 'Iapetus', 4503, 735, 79.3, true, true, 'Iapetus is the third-largest moon of Saturn.', 6);
INSERT INTO public.moon VALUES (43, 'Dione', 4503, 561, 2.7, true, true, 'Dione is named after the Titaness Dione of Greek mythology.', 6);
INSERT INTO public.moon VALUES (44, 'Tethys', 4503, 531, 1.9, true, false, 'Tethys has the lowest density of all the major moons in the Solar System.', 6);
INSERT INTO public.moon VALUES (45, 'Enceladus', 4503, 252, 1.4, true, false, 'Enceladus is the sixth-largest moon of Saturn.', 6);
INSERT INTO public.moon VALUES (46, 'Mimas', 4503, 198, 0.9, true, false, 'Mimas is the smallest astronomical body that is known to still be rounded in shape because of self-gravitation.', 6);
INSERT INTO public.moon VALUES (47, 'Titania', 4503, 788, 8.7, true, true, 'Titania is the largest of the moons of Uranus and the eighth largest moon in the Solar System.', 7);
INSERT INTO public.moon VALUES (48, 'Oberon', 4503, 761, 13.5, true, true, 'Oberon formed from the accretion disk that surrounded Uranus just after the planet''s formation.', 7);
INSERT INTO public.moon VALUES (49, 'Umbriel', 4503, 585, 4.1, true, true, 'Umbriel consists mainly of ice with a substantial fraction of rock, and may be differentiated into a rocky core and an icy mantle. The surface is the darkest among Uranian moons, and appears to have been shaped primarily by impacts.', 7);
INSERT INTO public.moon VALUES (50, 'Ariel', 4503, 579, 2.5, true, true, 'Ariel orbits and rotates in the equatorial plane of Uranus, which is almost perpendicular to the orbit of Uranus and so has an extreme seasonal cycle.', 7);
INSERT INTO public.moon VALUES (51, 'Miranda', 4503, 236, 1.4, true, true, 'Miranda is the smallest and innermost of Uranus''s five round satellites.', 7);
INSERT INTO public.moon VALUES (52, 'Triton', 4503, 1353, 5.9, true, true, 'Triton is the largest natural satellite of the planet Neptune.', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4503, 2439, 47.36, false, true, 'Mercury is the smallest planet in the Solar System and the closest to the Sun.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4503, 6051, 35.02, false, true, 'Venus is the second planet from the Sun, often called Earth''s sister planet.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4503, 6371, 29.78, true, true, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4503, 3389, 24.07, false, true, 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4565, 69911, 13.07, false, false, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4543, 58232, 9.68, false, false, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System. The planet''s most notable feature is its prominent ring system.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4543, 25362, 6.80, false, false, 'Uranus is the seventh planet from the Sun. Its name is a reference to the Greek god of the sky.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4543, 24622, 5.43, false, false, 'Neptune is the eighth planet from the Sun and the farthest known solar planet.', 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', NULL, 8292, NULL, false, true, 'Proxima Centauri b is an exoplanet orbiting in the habitable zone of the red dwarf star Proxima Centauri.', 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', NULL, 5166, NULL, false, true, 'Proxima Centauri c is a super-Earth or mini-Neptune about 7 times as massive as Earth.', 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', NULL, NULL, NULL, false, NULL, 'Proxima Centauri c is a super-Earth or mini-Neptune about 7 times as massive as Earth.', 2);
INSERT INTO public.planet VALUES (12, 'Epsilon Eridani b', NULL, NULL, NULL, false, true, 'Epsilon Eridani b, also known as AEgir, is an exoplanet approximately 10.5 light-years away orbiting the star Epsilon Eridani.', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 5800, 1.0, true, false, 'The Sun is the star at the center of our Solar System.', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4850, 3000, 0.2, false, false, 'Proxima Centauri is the nearest-known star to the Sun.', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8000, 3600, 764.0, true, true, 'Betelgeuse is a red supergiant star that is one of the largest stars that is visible to the naked eye.', 1);
INSERT INTO public.star VALUES (4, 'Sirius', 242, 9940, 1.7, true, false, 'Sirius is the brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (5, 'Epsilon Eridani', 800, 5084, 0.7, true, false, 'Epsilon Eridani is a star in the southern costellation of Eridanus.', 1);
INSERT INTO public.star VALUES (6, 'Alpheratz ', 60, 13800, 2.7, true, false, 'Alpheratz is one of the two stars on the binary Andromedae system.', 2);


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 38, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 52, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

