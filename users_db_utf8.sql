--
-- PostgreSQL database dump
--

\restrict jee2RoyXZm0GdVtKgi7qdaNwbZCsZlomzeTuoylK0FAQo7ok6Z2vMkAe9cHDDg1

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


--
-- Name: user_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_role AS ENUM (
    'student',
    'employer',
    'university',
    'admin'
);


ALTER TYPE public.user_role OWNER TO postgres;

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
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    role public.user_role DEFAULT 'student'::public.user_role NOT NULL,
    university_id uuid,
    is_active boolean DEFAULT true,
    is_email_verified boolean DEFAULT false,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: verification_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verification_codes (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    email character varying(255) NOT NULL,
    code character varying(10) NOT NULL,
    type character varying(50) NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    is_used boolean DEFAULT false,
    created_at timestamp with time zone
);


ALTER TABLE public.verification_codes OWNER TO postgres;

--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version, dirty) FROM stdin;
1	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password_hash, role, university_id, is_active, is_email_verified, created_at, updated_at) FROM stdin;
1b6362c0-7fb0-4fb4-8820-2ab8d400bca0	admin@system.kz	$2b$10$mRRAbnbp0Wrz0EXQtp7ZduABMnui8BTPICwodzvs0NCAl7PUSxxr.	admin	\N	t	t	2026-05-21 10:08:05.911691+00	2026-05-21 10:08:05.911691+00
64c975be-ccd4-40c0-bf6e-37775e603be4	astanaituni@gmail.com	$2a$10$0nMJKkxgtWxCuJ81TxPyE.XOnIX1qpTrlfRXkIr/KWmSkEhxCOtPm	university	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-11 11:09:58.058024+00	2026-05-11 11:10:22.562138+00
59506da9-fd63-4058-9085-071db1a10dcf	hr_kaspi@gmail.com	$2a$10$4pjOBC7MjXn7oyemKPrqjOXtFWjvZIGYNV.AvFMUCprekUBxpauJe	employer	\N	t	t	2026-05-11 11:07:06.564201+00	2026-05-11 11:07:28.808087+00
6646fd1a-78ca-444b-b412-50248259e1d3	230425@astanait.edu.kz	$2a$10$UquQr2aXH45q/VVB38bfsusrzZpLdX2jHFzHckOKES.meyluI6A2.	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-11 11:14:24.765571+00	2026-05-11 11:15:07.165991+00
43b3a982-da41-4cd4-b941-fdd34c04e24f	cctrfsh@gmail.com	$2a$10$W4agHPdjibrn/S3vfPKv4.15GY8uBbhRYz8VbXmsLXWcvX32cmdtW	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-11 10:51:17.794085+00	2026-05-13 13:32:33.09675+00
836196ba-a326-40b4-8f53-4063540020f2	student001@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
9dfe9a6d-b941-4506-9b65-9ab14ddb1e39	student002@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
b274610f-e66d-4d6e-8f7f-f526b81b36da	student003@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
32b79e0e-3f5f-412f-b75d-ade1404839c5	employer01@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:10.198437+00	2026-06-09 13:00:21.081498+00
e8dc6d21-534c-4195-be5b-c6e251386212	employer02@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:10.513968+00	2026-05-19 13:55:10.513968+00
ec9a0078-269b-4423-a4b5-52c334365c7b	employer03@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:10.823594+00	2026-05-19 13:55:10.823594+00
2cfbcd39-a5a6-4fa2-af31-a2687c765bda	employer04@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:11.143254+00	2026-05-19 13:55:11.143254+00
3acaf606-75ed-47d5-9436-bd8f5364db81	employer05@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:11.506175+00	2026-05-19 13:55:11.506175+00
b763f6ac-9498-4e22-a9ea-1e3ddc5e6c72	employer06@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:11.79867+00	2026-05-19 13:55:11.79867+00
c7e10a4d-f643-4a18-baf6-947679563524	employer07@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:12.095212+00	2026-05-19 13:55:12.095212+00
47dd9318-1143-4055-9f9b-1574fc67e1cf	employer08@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:12.400322+00	2026-05-19 13:55:12.400322+00
6e842079-a38a-407a-b687-697d763ab5e6	employer09@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:12.742676+00	2026-05-19 13:55:12.742676+00
3cb2b77a-3056-465c-a53a-9377c32e8256	employer10@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:13.05863+00	2026-05-19 13:55:13.05863+00
aadae95c-1a55-4d77-864f-bbef91e21aad	employer11@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:13.373478+00	2026-05-19 13:55:13.373478+00
0e432780-3061-45ba-ab76-f0f10c35aa80	employer12@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:13.685096+00	2026-05-19 13:55:13.685096+00
b63d82a3-4053-417a-8c67-c9a1f9089cdb	employer13@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:13.969391+00	2026-05-19 13:55:13.969391+00
5813ca01-4f06-4b0c-b51d-b7388f323b3b	employer14@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	employer	\N	t	t	2026-05-19 13:55:14.281516+00	2026-05-19 13:55:14.281516+00
15f945c6-f64e-4ec9-9617-6f0c392ad579	student004@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
704af84a-9915-47c6-a4d7-b2c253c9ece1	student005@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
da54fbc7-2bb0-4568-94f1-b708edafa33b	student006@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
54d64067-a67a-4f57-b27d-2e09f310a5a9	student007@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
d7674181-3a4c-4603-bd77-12cb45ca88e9	student008@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
bbb9f11f-0c50-4a14-9f57-d3aa81049293	student009@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
20446ca6-25c5-4113-95fc-3fa4004d292c	student010@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
8230948e-d5d1-47a1-8ab1-9ca434eb4ec0	student011@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
f73c8a03-ae61-4daa-9421-7b18a3290617	student012@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
a118212f-9e1e-467c-8512-6d04235252d1	student013@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
a8e63c99-329b-4c34-a52c-6849ca20620c	student014@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
30fd24a2-1747-4bd7-815c-175a1d687590	student015@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
0f72a145-b759-4104-87fd-81352c7b7157	student016@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
28b9a569-4e9a-4589-a577-1c4732d5cf48	student017@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
c3354c75-3e62-42d4-8656-05e7c0fa9f1a	student018@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
d74b73d3-c093-4a4f-bb68-12b13ce9b118	student019@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
1ef27472-70f3-4ff5-a158-6827d306621b	student020@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:05.709272+00	2026-05-19 13:55:05.709272+00
e889fc7a-f05c-4778-9610-e62117ad1d16	student021@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
bdd8b685-2e38-481d-bbd4-0b205635aabb	student022@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
ac7d5c76-2a55-4b79-b59b-2280659545fe	student023@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
9a7a56bc-644d-4ecd-9901-158445107516	student024@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
6ee49edb-32aa-4a44-b1e0-00cb6358fe76	student025@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
eec2afa3-8468-4b09-b70d-3c212ea2ce84	student026@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
ed6ff96f-1c00-4481-9cf5-760dd0315606	student027@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
fcc68feb-4639-4de4-941e-712e50e5da69	student028@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
4bc5366c-326c-431d-afba-5355a7ed0ec7	student029@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
430ebfd7-ffbc-4bc0-bf9f-d41fd24c6e8e	student030@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
c2a39530-0337-466f-8b7f-553a828c3f5c	student031@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
e6c6e6e9-784b-4452-97e8-6c87059b90aa	student032@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
86b009bf-cb18-40b5-871e-97f72e2d9d3f	student033@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
4ea344f9-f4ee-46ba-b76c-9ebcac9113d4	student034@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
0ac51df5-ac9a-48ba-afc5-a2b368dd6557	student035@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
0f91193f-4188-4eb7-bfc2-9cf887ffb216	student036@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
e1c4b776-599d-4123-920f-3f7b08d2a993	student037@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
a0e03e7c-483a-4b2f-b5e8-dd2e498c7b36	student038@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
d0fef482-e36c-4a79-9df6-c4790864fa1c	student039@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
501d5b8d-7d28-4f7e-ba3b-ce061a9b0416	student040@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.280834+00	2026-05-19 13:55:06.280834+00
54c2e1a8-3eea-4db0-bd43-7f270f1ac6d6	student041@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
4dec54f7-5638-4877-b27b-efb62381261f	student042@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
7e532e35-b6d7-4a6e-a1f7-ff1e7282faa5	student043@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
ee473cc8-8343-4283-a010-ba0dd0d1930c	student044@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
3c3ed922-0c33-414e-907b-db196f6b420d	student045@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
dbb1f4c5-71db-46ee-b27c-b4ea34c06ad1	student046@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
df78a500-08c7-4f64-8a86-cc34e7e65944	student047@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
4455fb2f-0eb9-44ed-8f55-e00497448814	student048@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
5a455151-3a79-46bf-b2cd-cd31a282ee87	student049@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
0312e85d-6ec4-4736-98f7-b814b67ab0c7	student050@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
5d4db895-6b64-44d8-b5e6-8ed981092474	student051@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
81ee735e-de6c-456a-92db-6daecbcf758c	student052@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
c0ff8960-e25d-4637-b8c6-0dbbbd543dc7	student053@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
4ea04ed5-bdf0-4e95-b20d-bb6c9dc6ea36	student054@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
f069ea22-22e9-433d-8047-c0510b67a142	student055@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
3e618ca5-09d0-446a-abf4-b4a536cd43ed	student056@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
d2930572-8d82-40a9-aacc-45ae413d4537	student057@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
f398462e-e116-4fc3-9e95-693b3b05f6de	student058@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
e8deabcd-e333-446c-9acb-d996338f85a6	student059@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
1a1e0e5c-4df5-45e6-969b-822c11c3a4d3	student060@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:06.874085+00	2026-05-19 13:55:06.874085+00
6bf043aa-4d57-4491-a628-ce3917f52c77	student061@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
cee4243d-d2f3-4daf-831f-fe87fd68ecc3	student062@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
60849c91-6ca7-480e-aa56-83116307d970	student063@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
a7a08458-aeb8-4087-a2b1-29779848ffb3	student064@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
460bc768-4c7c-43d8-bf6a-31c478028a6f	student065@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
1c2216c7-3e5a-48bd-af2a-4feec3f6f0b5	student066@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
414f4a01-bdac-40cc-9169-78ec94274b6b	student067@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
9baa88ae-a422-4e75-8e4c-f146183b2b23	student068@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
e01ae0f1-f096-4869-ae92-5347fad0deb6	student069@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
ce1f6a0c-006e-48e7-8051-b3a76b38603e	student070@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
215ac9ba-e818-4460-bfe8-67db6f4237d0	student071@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
b9ea2dde-43d8-4f36-ae27-f7a51bb805d7	student072@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
fa121fa8-8458-420d-bbc9-604b02825377	student073@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
fad6a2d3-cd7f-4ac1-ab2e-70b6d62ef140	student074@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
dbe48761-6ad0-4af0-a7ec-5092fd965b93	student075@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
f72ecafa-c240-46af-97e6-fd19fa96e89f	student076@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
3a58360c-640f-4e4a-bbf8-52d0f2a8cbcd	student077@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
413abf52-0f4e-4c1c-8db8-7e524cd9fa48	student078@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
cc53a16f-1357-40e8-b40f-614a9ed4e406	student079@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
6a2e1af2-b8e1-4f79-b7c9-11539e9ff26d	student080@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:07.458091+00	2026-05-19 13:55:07.458091+00
7752bc47-57d3-49b1-b671-d708854f3df5	student081@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
127eaed6-72e1-41fb-9702-4a330da0706a	student082@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
9a3ba427-98e3-4e31-9041-0dbac5c13cd3	student083@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
f5c59071-c8c1-4ced-953e-1063db0bfa8f	student084@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
2dc7eace-bac3-434f-8a64-da93b7e087cf	student085@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
5015003a-4bab-4298-b0f3-7ccd6382561a	student086@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
9cecbf98-4618-4026-907a-7b2569d7780f	student087@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
78b690ac-fd00-410d-94a2-dd13d9c0916e	student088@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
67fa1abf-4413-4160-a6b6-6f0d9868eccb	student089@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
4cf67c69-2c38-4aec-a2d1-6241f495fcfb	student090@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
8a0ad5e0-5424-46b7-bc60-962f1fcc9e00	student091@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
7e8e5d6d-a992-42fd-a9e8-6e847077786e	student092@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
f57960d8-67d3-4901-bbf5-ad0ed1735213	student093@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
4612017d-0f7e-489c-9028-f3e1e7c68397	student094@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
bf2ace9c-5daf-4e4c-bd5b-d5d6148751f4	student095@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
10cfa91d-805e-4b43-9443-36149b6b584d	student096@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
99c81e97-6679-44af-a752-155304500a2a	student097@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
5fbb9ee5-a4ab-463f-bedc-5069e7b2d18d	student098@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
5386ce0a-8809-44bc-a41e-1fe9c037cdd4	student099@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
46637634-6de6-4c2c-b97c-c800fe5985d9	student100@test.kz	$2a$10$.inThsoOMeQrOx7zR/ssMOFPveq1BrLLyqsS5dJ7Jj6J878U1f/Ry	student	4071763f-6bb2-4bd8-9403-4c5da0709695	t	t	2026-05-19 13:55:08.017195+00	2026-05-19 13:55:08.017195+00
\.


--
-- Data for Name: verification_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.verification_codes (id, email, code, type, expires_at, is_used, created_at) FROM stdin;
\.


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: verification_codes verification_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_codes
    ADD CONSTRAINT verification_codes_pkey PRIMARY KEY (id);


--
-- Name: idx_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_users_email ON public.users USING btree (email);


--
-- Name: idx_verification_codes_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_verification_codes_email ON public.verification_codes USING btree (email);


--
-- PostgreSQL database dump complete
--

\unrestrict jee2RoyXZm0GdVtKgi7qdaNwbZCsZlomzeTuoylK0FAQo7ok6Z2vMkAe9cHDDg1

