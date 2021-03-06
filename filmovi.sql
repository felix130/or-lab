--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    id integer NOT NULL,
    actorname character varying(40) NOT NULL,
    actorsurname character varying(40) NOT NULL
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- Name: casting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.casting (
    actorid integer NOT NULL,
    movieid integer NOT NULL
);


ALTER TABLE public.casting OWNER TO postgres;

--
-- Name: director; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.director (
    id integer NOT NULL,
    directorname character varying(40) NOT NULL,
    directorsurname character varying(40) NOT NULL
);


ALTER TABLE public.director OWNER TO postgres;

--
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    country character varying(40) NOT NULL,
    year integer NOT NULL,
    duration_min integer NOT NULL,
    genre1 character varying(20) NOT NULL,
    genre2 character varying(20) NOT NULL,
    directorid integer NOT NULL,
    mparating character varying(10) NOT NULL,
    "budget_$" integer NOT NULL,
    "gross_$" integer NOT NULL,
    ratingimdb numeric(3,1) NOT NULL
);


ALTER TABLE public.movie OWNER TO postgres;

--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actor (id, actorname, actorsurname) FROM stdin;
1	Timothee	Chalamet
2	Rebecca	Ferguson
3	John	Travolta
4	Uma	Thurman
5	Jack	Nicholson
6	Shelley	Duvall
7	Christian	Bale
8	Heath	Ledger
9	Graham	Chapman
10	John	Cleese
11	Kang-ho	Sung
12	Sun-kyun	Lee
13	Bruce	Willis
14	Haley Joel	Osment
15	Jim	Carrey
16	Ed	Harris
17	Ewan	McGregor
18	Ewen	Bremner
19	Malcolm	McDowell
20	Patrick	Magee
21	Anna	Faris
22	Jon	Abrahams
\.


--
-- Data for Name: casting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.casting (actorid, movieid) FROM stdin;
1	1
2	1
3	2
4	2
5	3
6	3
7	4
8	4
9	5
9	6
10	5
10	6
11	7
12	7
13	8
14	8
15	9
16	9
17	10
18	10
19	11
20	11
21	12
22	12
\.


--
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.director (id, directorname, directorsurname) FROM stdin;
1	Denis	Villeneuve
2	Quentin	Tarantino
3	Stanley	Kubrick
4	Jonathan	Nolan
5	Terry	Gilliam
6	Terry	Jones
7	Bong	Joon-ho
8	M. Night	Shyamalan
9	Peter	Weir
10	Danny	Boyle
12	Keenen Ivory	Wayans
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie (id, name, country, year, duration_min, genre1, genre2, directorid, mparating, "budget_$", "gross_$", ratingimdb) FROM stdin;
1	Dune	United States	2021	155	Action	Adventure	1	PG-13	165000000	223211174	8.3
2	Pulp Fiction	United States	2021	154	Crime	Drama	2	R	8000000	213928762	8.9
3	The Shining	United States	1980	146	Drama	Horror	3	R	19000000	46998772	8.4
4	The Dark Knight	United States	2008	152	Action	Crime	4	PG-13	185000000	1005973645	9.0
5	Monty Python and the Holy Grail	United Kingdom	1975	91	Adventure	Comedy	5	PG	315780	1940906	8.2
6	Monty Python's Life of Brian	United Kingdom	1979	94	Comedy	Satire	6	R	4000000	20742852	8.1
7	Parasite	South Korea	2019	132	Comedy	Drama	7	R	11400000	258668626	8.6
8	The Sixth Sense	United States	1999	107	Drama	Mystery	8	PG-13	40000000	672806432	8.1
9	The Truman Show	United States	1998	103	Comedy	Drama	9	PG	60000000	264118201	8.1
10	Trainspotting	United Kingdom	1996	93	Drama	Comedy	10	R	2062320	16771303	8.1
11	A Clockwork Orange	United Kingdom	1971	136	Crime	Drama	3	R	2200000	26904636	8.3
12	Scary Movie	United States	2000	88	Comedy	Horror	12	R	19000000	278019771	6.2
\.


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);


--
-- Name: casting casting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casting
    ADD CONSTRAINT casting_pkey PRIMARY KEY (actorid, movieid);


--
-- Name: director director_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_pkey PRIMARY KEY (id);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


--
-- Name: casting casting_actorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casting
    ADD CONSTRAINT casting_actorid_fkey FOREIGN KEY (actorid) REFERENCES public.actor(id);


--
-- Name: casting casting_movieid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casting
    ADD CONSTRAINT casting_movieid_fkey FOREIGN KEY (movieid) REFERENCES public.movie(id);


--
-- Name: movie movie_directorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_directorid_fkey FOREIGN KEY (directorid) REFERENCES public.director(id);


--
-- PostgreSQL database dump complete
--

