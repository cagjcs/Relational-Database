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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_form_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    length_in_light_years integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_form; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_form (
    galaxy_form_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_form OWNER TO freecodecamp;

--
-- Name: galaxy_form_galaxy_form_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_form_galaxy_form_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_form_galaxy_form_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_form_galaxy_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_form_galaxy_form_id_seq OWNED BY public.galaxy_form.galaxy_form_id;


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
    name character varying(30) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    diameter numeric(15,2),
    age integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    star_id integer NOT NULL,
    has_moon boolean,
    number_of_moons integer,
    planet_int boolean,
    age integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    distance_light_yrs numeric(6,2),
    constellation character varying(50)
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_form galaxy_form_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_form ALTER COLUMN galaxy_form_id SET DEFAULT nextval('public.galaxy_form_galaxy_form_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 'La Vía Láctea (en griego: círculo lácteo) es una galaxia espiral donde se encuentra el sistema solar y a su vez la Tierra', 1, 13, 230);
INSERT INTO public.galaxy VALUES (2, 'Gran Nube de Magallanes', NULL, 1, 40, 35);
INSERT INTO public.galaxy VALUES (3, 'Enana de la Osa Menor', 'es una galaxia satélite de la Vía láctea, cuyo nombre proviene de la constelación en donde se encuentra, la Osa Menor', 2, 13, 12);
INSERT INTO public.galaxy VALUES (4, 'Galaxia de Andrómeda', 'también conocida como Galaxia Espiral M31, Messier 31 o NGC 224', 1, 22, 220);
INSERT INTO public.galaxy VALUES (5, 'Galaxia del Triángulo', 'también conocida como galaxia espiral M33, Objeto Messier 33, Messier 33, M33 o NGC 598', 1, 25, 225);
INSERT INTO public.galaxy VALUES (6, 'Galaxia de Barnard', 'NGC 6822', 3, 27, 16);


--
-- Data for Name: galaxy_form; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_form VALUES (1, 'Espiral', 'Es el tipo de galaxia más frecuente del Universo');
INSERT INTO public.galaxy_form VALUES (2, 'Elíptica', 'Forma esférica alargada, pero no se observa un núcleo claro');
INSERT INTO public.galaxy_form VALUES (3, 'Irregular', 'No tienen ninguna forma bien definida');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'La Luna es el satélite natural de la Tierra', 3, 3474.80, 292);
INSERT INTO public.moon VALUES (2, 'Fobos', 'Fobos (del griego Φóβoς, "miedo") es el más grande de los dos satélites de Marte y el más cercano al planeta', 4, 9376.00, 327);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Deimos (del griego Δείμος, «terror») es el más pequeño y externo de los dos satélites de Marte', 4, 12.40, 483);
INSERT INTO public.moon VALUES (4, 'Io', 'Ío es el satélite galileano más cercano a Júpiter. Es el tercer satélite por su tamaño', 5, 3643.20, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 'Europa es el sexto satélite natural de Júpiter en orden creciente de distancia y el más pequeño de los cuatro', 5, 3121.60, 2);
INSERT INTO public.moon VALUES (6, 'Gaminides', 'Ganimedes (del griego Γανυμήδης) es el satélite natural más grande de Júpiter y del sistema solar', 5, 5268.20, 4);
INSERT INTO public.moon VALUES (7, 'Calisto', 'Es el tercer satélite más grande del sistema solar y el segundo del sistema joviano', 5, 4820.60, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Titán es el mayor de los satélites de Saturno y el segundo del sistema solar tras Ganimedes', 6, 5150.00, 10);
INSERT INTO public.moon VALUES (9, 'Dione', 'Dione es un satélite natural de Saturno descubierto en 1684 por Giovanni Cassini', 6, 1128.80, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 'Mercurio es el planeta del sistema solar más cercano al Sol y el más pequeño', 1, false, 0, true, 22);
INSERT INTO public.planet VALUES (2, 'Venus', 'Venus es el segundo planeta del sistema solar en orden de proximidad al Sol y el tercero más pequeño después de Mercurio y Marte', 1, false, 0, true, 32);
INSERT INTO public.planet VALUES (3, 'Tierra', 'planeta del sistema solar que gira alrededor de su estrella —el Sol— en la tercera órbita más interna', 1, true, 1, true, 4550);
INSERT INTO public.planet VALUES (4, 'Marte', 'Marte es el cuarto planeta en orden de distancia al Sol y el segundo más pequeño del sistema solar, después de Mercurio', 1, true, 2, true, 199);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Júpiter es el planeta más grande del sistema solar y el quinto en orden de lejanía al Sol', 1, true, 4, false, 2494);
INSERT INTO public.planet VALUES (6, 'Saturno', 'Saturno es el sexto planeta del sistema solar contando desde el Sol, el segundo en tamaño y masa', 1, true, 83, false, 73);
INSERT INTO public.planet VALUES (7, 'Urano', 'Urano es el séptimo planeta del sistema solar, el tercero de mayor tamaño, y el cuarto más masivo', 1, true, 5, false, 88);
INSERT INTO public.planet VALUES (8, 'Neptuno', 'Neptuno es el octavo planeta en distancia respecto al Sol y el más lejano del sistema solar', 1, true, 1, false, 38);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Es la estrella central del sistema solar', 1, 0.01, NULL);
INSERT INTO public.star VALUES (2, 'Estrella polar', 'Polaris', 3, 447.60, 'Osa menor');
INSERT INTO public.star VALUES (3, 'Alpheratz', 'Alpha Andromedae', 4, 97.00, 'Pegaso');
INSERT INTO public.star VALUES (4, 'Mirach ', 'Beta Andromedae', 4, 199.00, 'Andrómeda');
INSERT INTO public.star VALUES (5, 'S Doradus', 'S Dor / HD 35343 / CD-69 295', 2, 180.60, 'Dorado');
INSERT INTO public.star VALUES (6, 'Alfa Centauri', 'Alfa Centauri A ', 1, 4.36, 'Centauro');


--
-- Name: galaxy_form_galaxy_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_form_galaxy_form_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 9, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 8, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_form galaxy_form_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_form
    ADD CONSTRAINT galaxy_form_pkey PRIMARY KEY (galaxy_form_id);


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
-- Name: galaxy galaxy_galaxy_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_form_id_fkey FOREIGN KEY (galaxy_form_id) REFERENCES public.galaxy_form(galaxy_form_id);


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
