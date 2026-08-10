--
-- PostgreSQL database dump
--

\restrict NwBPIM0bMCarGEPaI0m1ItV5MEYKsFYWnitCpJFgowtLpzeLeRbYkEMxmscoEYj

-- Dumped from database version 17.9
-- Dumped by pg_dump version 17.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: universities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universities (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    city character varying(100),
    country character varying(100),
    website character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.universities OWNER TO postgres;

--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version, dirty) FROM stdin;
1	f
\.


--
-- Data for Name: universities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.universities (id, name, city, country, website, created_at, updated_at) FROM stdin;
103c58df-11a2-4aa9-9471-4bc79396e4eb	Назарбаев Университет	Астана	Казахстан	https://nu.edu.kz	2026-05-11 10:40:14.151153+00	2026-05-11 10:40:14.151153+00
139ad992-843e-482f-a51a-271eb8dec6b7	Евразийский национальный университет им. Л.Н. Гумилёва	Астана	Казахстан	https://enu.kz	2026-05-11 10:40:14.153755+00	2026-05-11 10:40:14.153755+00
2c2e0491-ba92-45a1-8fc0-123c68482132	Казахский агротехнический университет им. С. Сейфуллина	Астана	Казахстан	https://kaznau.kz	2026-05-11 10:40:14.155313+00	2026-05-11 10:40:14.155313+00
0c9c8093-59db-49c2-9f9c-b1d3b01f0d25	Казахский национальный университет им. аль-Фараби	Алматы	Казахстан	https://kaznu.kz	2026-05-11 10:40:14.156926+00	2026-05-11 10:40:14.156926+00
a53d0bc6-fe3d-4c27-a3b1-684e58b09222	Казахстанско-Британский технический университет	Алматы	Казахстан	https://kbtu.kz	2026-05-11 10:40:14.158493+00	2026-05-11 10:40:14.158493+00
0b431712-c7da-4f4b-ba7d-355b9172aa81	Международный университет информационных технологий	Алматы	Казахстан	https://iitu.edu.kz	2026-05-11 10:40:14.159929+00	2026-05-11 10:40:14.159929+00
e2b8a6ce-f1cb-4664-b427-3af3ebc68838	Сатпаев Университет	Алматы	Казахстан	https://satbayev.university	2026-05-11 10:40:14.161468+00	2026-05-11 10:40:14.161468+00
4613c623-aed6-4055-843e-946b8efb1032	Университет КИМЭП	Алматы	Казахстан	https://kimep.kz	2026-05-11 10:40:14.162923+00	2026-05-11 10:40:14.162923+00
ec9589a7-de43-45af-8130-2ae5996ea0a0	Университет Туран	Алматы	Казахстан	https://turan-edu.kz	2026-05-11 10:40:14.164294+00	2026-05-11 10:40:14.164294+00
8f62d21e-7255-46bc-83eb-aec9a45c26d8	Карагандинский технический университет им. А. Сагинова	Караганда	Казахстан	https://kstu.kz	2026-05-11 10:40:14.165713+00	2026-05-11 10:40:14.165713+00
4071763f-6bb2-4bd8-9403-4c5da0709695	Astana IT University	Астана	Казахстан	https://astanait.edu.kz	2026-05-11 10:50:47.218933+00	2026-05-11 10:50:47.218933+00
\.


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: universities universities_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_name_key UNIQUE (name);


--
-- Name: universities universities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict NwBPIM0bMCarGEPaI0m1ItV5MEYKsFYWnitCpJFgowtLpzeLeRbYkEMxmscoEYj

