--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    orbit_period numeric,
    size numeric,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    number_of_stars integer,
    type character varying(50),
    distance numeric
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric,
    has_atmosphere boolean,
    distance_from_planet numeric
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    distance_from_star numeric,
    has_life boolean,
    mass numeric,
    description text
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    size numeric,
    is_main_sequence boolean NOT NULL,
    luminosity integer,
    description text
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 76, 11, 'Famous short-period comet');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2530, 40, 'Bright comet visible to the naked eye');
INSERT INTO public.comet VALUES (3, 'Encke', 3.3, 4.5, 'Shortest orbital period of any known comet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 200000000, 'Spiral', 27000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 100000000, 'Spiral', 2500000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 50000000, 'Spiral', 3000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 60000, 30000000, 'Spiral', 23000000);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 14000, 5000000, 'Irregular', 160000);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 7000, 3000000, 'Irregular', 200000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, 9377);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, 23460);
INSERT INTO public.moon VALUES (4, 'Io', 4, 3643, true, 421800);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 3121, true, 671034);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 5268, true, 1070400);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 4821, true, 1882700);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 5150, true, 1221870);
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 1527, false, 527040);
INSERT INTO public.moon VALUES (10, 'Iapetus', 5, 1469, false, 3561300);
INSERT INTO public.moon VALUES (11, 'Mimas', 5, 396, false, 185539);
INSERT INTO public.moon VALUES (12, 'Enceladus', 5, 504, true, 238040);
INSERT INTO public.moon VALUES (13, 'Miranda', 6, 471.6, false, 129000);
INSERT INTO public.moon VALUES (14, 'Ariel', 6, 1167.6, false, 191020);
INSERT INTO public.moon VALUES (15, 'Umbriel', 6, 1169.4, false, 266000);
INSERT INTO public.moon VALUES (16, 'Titania', 6, 1577.6, false, 435000);
INSERT INTO public.moon VALUES (17, 'Oberon', 6, 1522.8, false, 583520);
INSERT INTO public.moon VALUES (18, 'Triton', 6, 2706.8, true, 354760);
INSERT INTO public.moon VALUES (19, 'Nereid', 6, 340.0, false, 1176470);
INSERT INTO public.moon VALUES (24, 'Janus', 5, 179, false, 192000);
INSERT INTO public.moon VALUES (25, 'Epimetheus', 5, 116, false, 150000);
INSERT INTO public.moon VALUES (26, 'Hyperion', 5, 266, false, 1480000);
INSERT INTO public.moon VALUES (27, 'Phoebe', 5, 213, false, 1270000);
INSERT INTO public.moon VALUES (28, 'Aegaeon', 5, 0.3, false, 274500);
INSERT INTO public.moon VALUES (29, 'Pandora', 5, 81, false, 141700);
INSERT INTO public.moon VALUES (30, 'Prometheus', 5, 86, false, 139400);
INSERT INTO public.moon VALUES (31, 'Atlas', 5, 30, false, 137600);
INSERT INTO public.moon VALUES (32, 'Dione', 5, 1122, false, 377400);
INSERT INTO public.moon VALUES (33, 'Tethys', 5, 1060, false, 294660);
INSERT INTO public.moon VALUES (34, 'Calypso', 5, 23, false, 294660);
INSERT INTO public.moon VALUES (35, 'Telesto', 5, 12, false, 294660);
INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, true, 384400);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, true, 1.00, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2, false, 0.11, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 0.7, false, 0.81, NULL);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 5, false, 317.8, NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 9, false, 95.2, NULL);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 30, false, 17.1, NULL);
INSERT INTO public.planet VALUES (7, 'Proxima b', 7, 0.05, NULL, 1.3, NULL);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 2, 1.1, NULL, 1.1, NULL);
INSERT INTO public.planet VALUES (9, 'Gliese 581g', 4, 0.15, NULL, 3.1, NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 5, 1.04, NULL, 5.0, NULL);
INSERT INTO public.planet VALUES (11, '55 Cancri e', 2, 0.01, false, 8.63, NULL);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 4, 0.047, false, 0.69, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.00, true, 1, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 2, 1.10, true, 2, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 1.20, false, 1, NULL);
INSERT INTO public.star VALUES (4, 'Sirius A', 2, 1.00, true, 1, NULL);
INSERT INTO public.star VALUES (5, 'Vega', 3, 0.90, true, 2, NULL);
INSERT INTO public.star VALUES (6, 'Polaris', 3, 1.20, false, 1, NULL);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 2, 0.20, true, 0, NULL);
INSERT INTO public.star VALUES (8, 'Aldebaran', 1, 1.40, false, 1, NULL);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 19, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

