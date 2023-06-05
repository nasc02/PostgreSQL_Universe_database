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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    number_of_stars numeric(20,2),
    description text,
    shape character varying(30),
    size_in_light_years_across numeric(15,2)
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer,
    distance_in_km integer
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
    name character varying(60) NOT NULL,
    size_in_km bigint,
    distance_in_light_year integer,
    description text,
    has_moons boolean,
    star_id integer NOT NULL
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
    name character varying(60) NOT NULL,
    distance_in_light_year integer,
    is_supernova boolean,
    galaxy_id integer,
    size_in_km bigint
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagitarius A', 'It is a supermassive black hole located ate the center of the Milky Way galaxy. It has a mass of approximately 4 million times of the sun.', 1);
INSERT INTO public.black_hole VALUES (2, 'Andromeda central black hole', 'With a mass of approximately 100 million solar masses, influences the galactic dynamics and is a key component of Andromeda structure', 2);
INSERT INTO public.black_hole VALUES (3, 'Triangulum central black hole', 'specifc information is not now, but it is a supermassive black hole in the center of Triangulum', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000000.00, 'The andromeda galaxy is the closest spiral galaxy to the milky way and is on colision course with it.', 'Spiral Galaxy', 220000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000000000.00, 'The Triangulum Galaxy is the third-largest member of the local group of galaxies, which includes the Milky Way and Andromeda', 'Spiral Galaxy', 60000.00);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 1000000000.00, 'It is notable for its prominent dust lane and large central bulge, giving it the appearance of a wide-brimmed hat.', 'Spiral Galaxy', 50000.00);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 1000000000.00, 'It is famous for its prominent gravitationally, creating a brigde of gas and dust connecting two galaxies', 'Spiral Galaxy', 60000.00);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 1000000000.00, 'It is a radio galaxy, characterized by its strong radio emissions. It has a distinct dust lane across its center and is belivied to be the result of a merger between a spiral galaxy and an eliptical galaxy', 'Eliptical Galaxy', 60000.00);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000000000.00, 'the milky way is barred spiral galaxy that is home to our solar system, it has a prominent central bar and spiral arms', 'Spiral Galaxy', 100000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 4, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 5, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 5, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 6, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', 6, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Lo', 6, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Europa', 6, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 7, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 7, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Rhea', 7, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Titania', 8, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Oberon', 8, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Miranda', 8, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Triton', 9, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Proteus', 9, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Charon', 9, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Nereid', 9, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Dione', 7, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Tethys', 7, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Hyperion', 7, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 74800000, NULL, 'Mercury is the closest planet to the sun in our solar system', false, 1);
INSERT INTO public.planet VALUES (4, 'Earth', 510000000, NULL, 'Earth is the third planet from the sun and it is our home', true, 1);
INSERT INTO public.planet VALUES (2, 'Alpha Centauri b', 119000000, 4, 'is an exoplanet that is orbiting Alpha centauri', false, 5);
INSERT INTO public.planet VALUES (3, 'Venus', 460000000, NULL, 'Venus is the second planet from the sun and its known for its thick atmosphere', false, 1);
INSERT INTO public.planet VALUES (5, 'Mars', 144000000, NULL, 'Mars is the fourth planet from the sun ans id often called the Red planet', true, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 61000000000, NULL, 'Jupiter is the largest planet of the solar system', true, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 42000000000, NULL, 'Saturn is another gas giant in our solar system, recognizable for its prominent ring system made up of icy particles', true, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 8000000000, NULL, 'Uranus is a ice giant and the seventh planet from the sun', true, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 7000000000, NULL, 'Neptune is the eighth and farthest know planet from the sun, it is also an ice giante and has a deep blue coloration', true, 1);
INSERT INTO public.planet VALUES (10, 'Trianguli 22b', 2000000000, 8, 'Unknow', true, 3);
INSERT INTO public.planet VALUES (11, 'Trianguli 22d', 4000000000, 7, 'Unknow', false, 3);
INSERT INTO public.planet VALUES (12, 'Canum 3456E', 8000000000, 200, 'Unknow', true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, false, 1, 1400000);
INSERT INTO public.star VALUES (2, 'Alpheratz', 97, false, 2, 3300000);
INSERT INTO public.star VALUES (3, 'Beta Trianguli', 63, false, 3, 3100000);
INSERT INTO public.star VALUES (4, 'Sigma Sagittarii', 1100, false, 4, 3500000);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 5, false, 5, 1700000);
INSERT INTO public.star VALUES (6, 'Canum Venaticorum', 218, false, 6, 3100000);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole unique_id_black_hole; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT unique_id_black_hole UNIQUE (black_hole_id);


--
-- Name: galaxy unique_id_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_id_galaxy UNIQUE (galaxy_id);


--
-- Name: moon unique_id_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_id_moon UNIQUE (moon_id);


--
-- Name: planet unique_id_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_id_planet UNIQUE (planet_id);


--
-- Name: star unique_id_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_id_star UNIQUE (star_id);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

