--
-- PostgreSQL database dump
--

\restrict UcVycNISETmoycXbp6N5dIvJyW5STGfOwRZgtecZe5kDptFrx1wKZOzTBtQx97R

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
-- Name: employer_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employer_profiles (
    employer_id uuid NOT NULL,
    company_name text NOT NULL,
    company_description text,
    industry text,
    company_size text,
    website text,
    location text,
    contact_email text,
    contact_phone text,
    bin character varying(12),
    bin_status character varying(20) DEFAULT 'pending'::character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.employer_profiles OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: vacancies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacancies (
    id uuid NOT NULL,
    employer_id uuid NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    location text,
    salary_min bigint,
    salary_max bigint,
    job_type text DEFAULT 'Full-time'::text NOT NULL,
    skills text[],
    status text DEFAULT 'active'::text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.vacancies OWNER TO postgres;

--
-- Data for Name: employer_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employer_profiles (employer_id, company_name, company_description, industry, company_size, website, location, contact_email, contact_phone, bin, bin_status, created_at, updated_at) FROM stdin;
59506da9-fd63-4058-9085-071db1a10dcf	AO "Kaspi.kz"	банк	Финансы	500+	https://kaspi.kz/	Астана, Казахстан	hr_kaspi@gmail.com	+77007777777	081040010463	verified	2026-05-11 11:08:25.349026+00	2026-05-13 13:02:15.943013+00
e8dc6d21-534c-4195-be5b-c6e251386212	Halyk Bank	\N	Finance	\N	\N	Алматы	employer02@test.kz	\N	800000000002	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
ec9a0078-269b-4423-a4b5-52c334365c7b	Kolesa Group	\N	IT	\N	\N	Алматы	employer03@test.kz	\N	800000000003	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
2cfbcd39-a5a6-4fa2-af31-a2687c765bda	OLX Kazakhstan	\N	E-commerce	\N	\N	Алматы	employer04@test.kz	\N	800000000004	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
3acaf606-75ed-47d5-9436-bd8f5364db81	BTS Digital	\N	IT	\N	\N	Астана	employer05@test.kz	\N	800000000005	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
b763f6ac-9498-4e22-a9ea-1e3ddc5e6c72	EPAM Kazakhstan	\N	IT	\N	\N	Алматы	employer06@test.kz	\N	800000000006	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
c7e10a4d-f643-4a18-baf6-947679563524	Chocofood	\N	Food Tech	\N	\N	Алматы	employer07@test.kz	\N	800000000007	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
47dd9318-1143-4055-9f9b-1574fc67e1cf	Arbuz.kz	\N	E-commerce	\N	\N	Алматы	employer08@test.kz	\N	800000000008	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
6e842079-a38a-407a-b687-697d763ab5e6	Beeline Kazakhstan	\N	Telecommunications	\N	\N	Алматы	employer09@test.kz	\N	800000000009	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
3cb2b77a-3056-465c-a53a-9377c32e8256	Kcell	\N	Telecommunications	\N	\N	Астана	employer10@test.kz	\N	800000000010	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
aadae95c-1a55-4d77-864f-bbef91e21aad	ForteBank	\N	Finance	\N	\N	Алматы	employer11@test.kz	\N	800000000011	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
0e432780-3061-45ba-ab76-f0f10c35aa80	Freedom Finance	\N	Fintech	\N	\N	Алматы	employer12@test.kz	\N	800000000012	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
b63d82a3-4053-417a-8c67-c9a1f9089cdb	DAR	\N	IT	\N	\N	Астана	employer13@test.kz	\N	800000000013	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
5813ca01-4f06-4b0c-b51d-b7388f323b3b	Technodom	\N	Retail	\N	\N	Алматы	employer14@test.kz	\N	800000000014	verified	2026-05-19 13:34:50.758901+00	2026-05-19 13:34:50.758901+00
32b79e0e-3f5f-412f-b75d-ade1404839c5	Jusan Bank		Finance			Астана	employer01@test.kz		800000000001	verified	2026-05-19 13:34:50.758901+00	2026-05-21 07:13:59.631948+00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version, dirty) FROM stdin;
2	f
\.


--
-- Data for Name: vacancies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacancies (id, employer_id, title, description, location, salary_min, salary_max, job_type, skills, status, created_at, updated_at) FROM stdin;
67712e51-6576-42f5-982c-5b41ceecc53e	59506da9-fd63-4058-9085-071db1a10dcf	Frontend Разработчик	frintend	Астана, Казахстан	300000	500000	Full-time	{React," TypeScript"," Git"," Docker"}	active	2026-05-11 11:09:20.448145+00	2026-05-11 11:09:20.448145+00
ceefb2e4-c26e-4c61-a73a-2f9a6c80ecdc	32b79e0e-3f5f-412f-b75d-ade1404839c5	iOS Developer	Разработка iOS приложений на Swift.	Шымкент	200000	400000	Full-time	{Swift,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
40813963-4a5b-43be-9904-be5da20b07f9	32b79e0e-3f5f-412f-b75d-ade1404839c5	System Analyst	Анализ бизнес-требований, проектирование архитектуры информационных систем.	Алматы	200000	400000	Internship	{SQL,Python,PostgreSQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
a6310586-550c-40c3-a0c3-4df1cbbc1afd	32b79e0e-3f5f-412f-b75d-ade1404839c5	QA Engineer	Тестирование программного обеспечения, написание автотестов.	Павлодар	300000	500000	Contract	{Python,SQL,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
1b3b2c77-ab7b-4f2f-94fe-5f459e2f2d55	32b79e0e-3f5f-412f-b75d-ade1404839c5	GraphQL Developer	Разработка API с использованием GraphQL.	Алматы	200000	300000	Part-time	{GraphQL,Node.js,TypeScript,React}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
bfbccaf9-436f-4b9a-a2ba-1cc438b0759b	32b79e0e-3f5f-412f-b75d-ade1404839c5	Backend Developer	Разработка серверной части приложений на Go/Python. Работа с микросервисной архитектурой.	Тараз	200000	350000	Full-time	{Go,PostgreSQL,Docker,Redis}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
d0de25e3-88ac-4670-b455-e02a6d943be2	e8dc6d21-534c-4195-be5b-c6e251386212	QA Engineer	Тестирование программного обеспечения, написание автотестов.	Тараз	200000	300000	Part-time	{Python,SQL,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
6e3420e1-ea0c-43f7-98ae-5166c3103ca9	e8dc6d21-534c-4195-be5b-c6e251386212	DevOps Engineer	Настройка CI/CD пайплайнов, управление инфраструктурой в облаке.	Астана	300000	400000	Part-time	{Docker,Kubernetes,Go,PostgreSQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
7bb85c2f-57bf-48a1-8841-62db69e90afc	e8dc6d21-534c-4195-be5b-c6e251386212	Backend Developer	Разработка серверной части приложений на Go/Python. Работа с микросервисной архитектурой.	Тараз	150000	350000	Contract	{Go,PostgreSQL,Docker,Redis}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
88fef3ff-de6e-436b-8813-95e28841225c	e8dc6d21-534c-4195-be5b-c6e251386212	GraphQL Developer	Разработка API с использованием GraphQL.	Астана	200000	400000	Full-time	{GraphQL,Node.js,TypeScript,React}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
497c11fd-f21f-491c-8ced-9e57a59302e6	e8dc6d21-534c-4195-be5b-c6e251386212	ML Engineer	Разработка и деплой моделей машинного обучения в production.	Алматы	350000	500000	Full-time	{Python,"Machine Learning",Docker,Kubernetes}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
569ffdd6-ca5d-48e8-88f9-a7e834570079	ec9a0078-269b-4423-a4b5-52c334365c7b	Cloud Engineer	Проектирование и поддержка облачной инфраструктуры.	Алматы	150000	200000	Part-time	{Docker,Kubernetes,Go,Python}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
3f79d274-e334-40af-a335-25298ef87764	ec9a0078-269b-4423-a4b5-52c334365c7b	QA Engineer	Тестирование программного обеспечения, написание автотестов.	Актобе	300000	500000	Full-time	{Python,SQL,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
2d1f11df-adde-40bc-b62a-eba5150a1e4a	ec9a0078-269b-4423-a4b5-52c334365c7b	Android Developer	Разработка Android приложений на Kotlin.	Тараз	250000	400000	Internship	{Kotlin,Java,SQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
334e7a0c-6949-4928-a48c-488df906920e	ec9a0078-269b-4423-a4b5-52c334365c7b	Data Scientist	Анализ данных, построение ML моделей, работа с большими данными.	Шымкент	150000	250000	Contract	{Python,"Machine Learning",SQL,MongoDB}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
640b5cfc-615c-45c5-9812-f885c985239b	ec9a0078-269b-4423-a4b5-52c334365c7b	Security Engineer	Обеспечение информационной безопасности, пентестинг, анализ уязвимостей.	Павлодар	200000	400000	Full-time	{Python,Go,SQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
ae67509e-629b-4f05-bd6b-703962160dc2	2cfbcd39-a5a6-4fa2-af31-a2687c765bda	System Analyst	Анализ бизнес-требований, проектирование архитектуры информационных систем.	Шымкент	200000	250000	Part-time	{SQL,Python,PostgreSQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
4e8a3a17-e1c9-4325-a211-d691b1e11b31	2cfbcd39-a5a6-4fa2-af31-a2687c765bda	Security Engineer	Обеспечение информационной безопасности, пентестинг, анализ уязвимостей.	Актобе	350000	550000	Part-time	{Python,Go,SQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
94118313-b7b9-42e4-9ac2-66b867fc2e08	2cfbcd39-a5a6-4fa2-af31-a2687c765bda	QA Engineer	Тестирование программного обеспечения, написание автотестов.	Астана	350000	550000	Part-time	{Python,SQL,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
84b6bba6-3b1b-4d93-9c76-9c72cbf28560	2cfbcd39-a5a6-4fa2-af31-a2687c765bda	iOS Developer	Разработка iOS приложений на Swift.	Тараз	200000	350000	Full-time	{Swift,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
b7469680-e5ed-4e96-8d25-e39c9fb8ee89	2cfbcd39-a5a6-4fa2-af31-a2687c765bda	Backend Developer	Разработка серверной части приложений на Go/Python. Работа с микросервисной архитектурой.	Астана	350000	500000	Full-time	{Go,PostgreSQL,Docker,Redis}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
553d3d26-6425-46b2-a130-fe0baabb5d5e	3acaf606-75ed-47d5-9436-bd8f5364db81	Mobile Developer	Разработка мобильных приложений под iOS и Android.	Тараз	350000	400000	Part-time	{Kotlin,Swift,React,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
de944b77-05d9-4971-95f7-4acc439f661f	3acaf606-75ed-47d5-9436-bd8f5364db81	GraphQL Developer	Разработка API с использованием GraphQL.	Астана	350000	450000	Full-time	{GraphQL,Node.js,TypeScript,React}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
e58575cb-3c14-45d6-b1cc-fea8335b9d53	3acaf606-75ed-47d5-9436-bd8f5364db81	System Analyst	Анализ бизнес-требований, проектирование архитектуры информационных систем.	Тараз	150000	350000	Contract	{SQL,Python,PostgreSQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
4dc48060-d304-4c72-8605-45c53823e21d	3acaf606-75ed-47d5-9436-bd8f5364db81	iOS Developer	Разработка iOS приложений на Swift.	Алматы	300000	450000	Full-time	{Swift,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
59a0add4-5b9b-4c4f-93c6-b68fb9de478c	3acaf606-75ed-47d5-9436-bd8f5364db81	QA Engineer	Тестирование программного обеспечения, написание автотестов.	Алматы	350000	500000	Full-time	{Python,SQL,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
e0971c2e-b9ee-4664-b16c-191df95389c3	b763f6ac-9498-4e22-a9ea-1e3ddc5e6c72	iOS Developer	Разработка iOS приложений на Swift.	Павлодар	350000	400000	Full-time	{Swift,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
339681b5-3f25-46f2-b012-ed26bd2d409d	b763f6ac-9498-4e22-a9ea-1e3ddc5e6c72	ML Engineer	Разработка и деплой моделей машинного обучения в production.	Актобе	300000	450000	Full-time	{Python,"Machine Learning",Docker,Kubernetes}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
85b2805f-c5f4-4364-a1a9-c5afa0cae8ea	b763f6ac-9498-4e22-a9ea-1e3ddc5e6c72	System Analyst	Анализ бизнес-требований, проектирование архитектуры информационных систем.	Тараз	200000	300000	Internship	{SQL,Python,PostgreSQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
54413ca8-facf-4ae1-a337-6ecd2f20e791	b763f6ac-9498-4e22-a9ea-1e3ddc5e6c72	Frontend Developer	Разработка пользовательских интерфейсов на React/TypeScript.	Актобе	200000	300000	Internship	{React,TypeScript,JavaScript,Vue.js}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
fb986de9-8f0f-47bd-bb91-56b4a0690c3a	b763f6ac-9498-4e22-a9ea-1e3ddc5e6c72	Database Administrator	Администрирование баз данных PostgreSQL/MongoDB, оптимизация запросов.	Шымкент	300000	350000	Full-time	{PostgreSQL,MongoDB,SQL,Redis}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
beb01521-174d-430a-82ac-f97828aceb63	c7e10a4d-f643-4a18-baf6-947679563524	Full Stack Developer	Разработка полного цикла: backend на Node.js, frontend на React.	Алматы	300000	350000	Contract	{Node.js,React,TypeScript,PostgreSQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
771df2fa-0bf6-4e0b-ae2f-fe0414787fad	c7e10a4d-f643-4a18-baf6-947679563524	ML Engineer	Разработка и деплой моделей машинного обучения в production.	Павлодар	250000	400000	Contract	{Python,"Machine Learning",Docker,Kubernetes}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
c298d4d1-be60-4452-85c7-8b42d8a0791e	c7e10a4d-f643-4a18-baf6-947679563524	System Analyst	Анализ бизнес-требований, проектирование архитектуры информационных систем.	Алматы	150000	250000	Part-time	{SQL,Python,PostgreSQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
7715b533-03ed-48e5-8e33-79a67b6e600e	c7e10a4d-f643-4a18-baf6-947679563524	Security Engineer	Обеспечение информационной безопасности, пентестинг, анализ уязвимостей.	Тараз	150000	300000	Contract	{Python,Go,SQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
56f339a7-ffe7-44da-8eb2-a340b903622f	c7e10a4d-f643-4a18-baf6-947679563524	Backend Developer	Разработка серверной части приложений на Go/Python. Работа с микросервисной архитектурой.	Астана	250000	300000	Internship	{Go,PostgreSQL,Docker,Redis}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
edcd1df3-ad78-42d9-8c43-ed107db3d0e3	47dd9318-1143-4055-9f9b-1574fc67e1cf	DevOps Engineer	Настройка CI/CD пайплайнов, управление инфраструктурой в облаке.	Шымкент	300000	500000	Part-time	{Docker,Kubernetes,Go,PostgreSQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
5f6f7b5f-9820-4d51-9c60-faf8a108c0f4	47dd9318-1143-4055-9f9b-1574fc67e1cf	QA Engineer	Тестирование программного обеспечения, написание автотестов.	Павлодар	300000	500000	Internship	{Python,SQL,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
c0fcf6f4-b931-4a72-a179-90e7b3c80030	47dd9318-1143-4055-9f9b-1574fc67e1cf	Cloud Engineer	Проектирование и поддержка облачной инфраструктуры.	Павлодар	250000	450000	Internship	{Docker,Kubernetes,Go,Python}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
c6cc7842-7fba-4613-b336-470db434fb20	47dd9318-1143-4055-9f9b-1574fc67e1cf	Android Developer	Разработка Android приложений на Kotlin.	Шымкент	150000	250000	Internship	{Kotlin,Java,SQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
963c9edf-1dd2-4173-a1a6-512017b4c0f6	47dd9318-1143-4055-9f9b-1574fc67e1cf	GraphQL Developer	Разработка API с использованием GraphQL.	Павлодар	200000	400000	Internship	{GraphQL,Node.js,TypeScript,React}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
0cbc4c0f-6243-45f5-a7af-00a36ae2d5e9	6e842079-a38a-407a-b687-697d763ab5e6	QA Engineer	Тестирование программного обеспечения, написание автотестов.	Алматы	150000	300000	Contract	{Python,SQL,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
d5680007-d028-44f1-9f17-533a17cf9dfa	6e842079-a38a-407a-b687-697d763ab5e6	Data Scientist	Анализ данных, построение ML моделей, работа с большими данными.	Алматы	350000	400000	Part-time	{Python,"Machine Learning",SQL,MongoDB}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
842c58d0-53a2-42e9-ab59-750835d7efe7	6e842079-a38a-407a-b687-697d763ab5e6	Security Engineer	Обеспечение информационной безопасности, пентестинг, анализ уязвимостей.	Павлодар	300000	350000	Full-time	{Python,Go,SQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
7921c69e-0a53-45cd-9e8e-9f38120479f2	6e842079-a38a-407a-b687-697d763ab5e6	System Analyst	Анализ бизнес-требований, проектирование архитектуры информационных систем.	Шымкент	300000	450000	Contract	{SQL,Python,PostgreSQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
2ecda75f-bfbd-43bf-92c0-1b225a7ff3f5	6e842079-a38a-407a-b687-697d763ab5e6	Full Stack Developer	Разработка полного цикла: backend на Node.js, frontend на React.	Алматы	200000	400000	Contract	{Node.js,React,TypeScript,PostgreSQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
03fe1070-1f5a-4c1b-958c-3becc5e8f8f3	3cb2b77a-3056-465c-a53a-9377c32e8256	Android Developer	Разработка Android приложений на Kotlin.	Алматы	250000	300000	Internship	{Kotlin,Java,SQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
55342d42-f638-4a83-ba88-10f69008eb6c	3cb2b77a-3056-465c-a53a-9377c32e8256	Data Scientist	Анализ данных, построение ML моделей, работа с большими данными.	Алматы	300000	350000	Part-time	{Python,"Machine Learning",SQL,MongoDB}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
15cb88f2-cc00-4b40-84e3-9d11f57c9d4e	3cb2b77a-3056-465c-a53a-9377c32e8256	ML Engineer	Разработка и деплой моделей машинного обучения в production.	Актобе	350000	500000	Full-time	{Python,"Machine Learning",Docker,Kubernetes}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
bf5c2ebf-ef57-4ea3-92e3-e4cd51368930	3cb2b77a-3056-465c-a53a-9377c32e8256	Security Engineer	Обеспечение информационной безопасности, пентестинг, анализ уязвимостей.	Тараз	150000	250000	Contract	{Python,Go,SQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
d95c22cc-c6cc-419d-a415-8cf9d92648cf	3cb2b77a-3056-465c-a53a-9377c32e8256	Frontend Developer	Разработка пользовательских интерфейсов на React/TypeScript.	Актобе	250000	350000	Full-time	{React,TypeScript,JavaScript,Vue.js}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
5a9f9f4a-446a-4296-9c6a-f3529d093198	aadae95c-1a55-4d77-864f-bbef91e21aad	Mobile Developer	Разработка мобильных приложений под iOS и Android.	Тараз	150000	300000	Full-time	{Kotlin,Swift,React,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
d4367710-5ea3-4cac-9b2c-2310258aed43	aadae95c-1a55-4d77-864f-bbef91e21aad	Database Administrator	Администрирование баз данных PostgreSQL/MongoDB, оптимизация запросов.	Алматы	350000	450000	Full-time	{PostgreSQL,MongoDB,SQL,Redis}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
472f7c58-c974-4fbb-92b3-92340b2075da	aadae95c-1a55-4d77-864f-bbef91e21aad	Android Developer	Разработка Android приложений на Kotlin.	Павлодар	350000	500000	Part-time	{Kotlin,Java,SQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
e122c4fb-b4e9-4235-bf65-73f008d8a716	aadae95c-1a55-4d77-864f-bbef91e21aad	GraphQL Developer	Разработка API с использованием GraphQL.	Астана	300000	400000	Contract	{GraphQL,Node.js,TypeScript,React}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
bdc7f160-add0-4452-b873-584fbfcabbee	aadae95c-1a55-4d77-864f-bbef91e21aad	Cloud Engineer	Проектирование и поддержка облачной инфраструктуры.	Астана	350000	450000	Part-time	{Docker,Kubernetes,Go,Python}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
dd5ad325-b742-453f-a159-67baf5c34803	0e432780-3061-45ba-ab76-f0f10c35aa80	Security Engineer	Обеспечение информационной безопасности, пентестинг, анализ уязвимостей.	Астана	250000	400000	Full-time	{Python,Go,SQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
b65c5f07-216e-4b69-be98-9abc07578913	0e432780-3061-45ba-ab76-f0f10c35aa80	QA Engineer	Тестирование программного обеспечения, написание автотестов.	Шымкент	250000	350000	Full-time	{Python,SQL,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
46e496a7-e550-4aae-9955-cdb91efd16f1	0e432780-3061-45ba-ab76-f0f10c35aa80	Mobile Developer	Разработка мобильных приложений под iOS и Android.	Алматы	350000	550000	Full-time	{Kotlin,Swift,React,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
e7a1957c-c83d-4a27-8952-3b0089b8047d	0e432780-3061-45ba-ab76-f0f10c35aa80	Cloud Engineer	Проектирование и поддержка облачной инфраструктуры.	Алматы	250000	450000	Full-time	{Docker,Kubernetes,Go,Python}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
6e1cd283-99f0-41a0-a720-2fb263287f94	0e432780-3061-45ba-ab76-f0f10c35aa80	Backend Developer	Разработка серверной части приложений на Go/Python. Работа с микросервисной архитектурой.	Алматы	150000	200000	Full-time	{Go,PostgreSQL,Docker,Redis}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
1f06a866-6064-4c8e-a705-5ff4381a924b	b63d82a3-4053-417a-8c67-c9a1f9089cdb	Android Developer	Разработка Android приложений на Kotlin.	Шымкент	350000	450000	Part-time	{Kotlin,Java,SQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
24f69ee8-2413-44dd-9a44-618389b8fb47	b63d82a3-4053-417a-8c67-c9a1f9089cdb	Database Administrator	Администрирование баз данных PostgreSQL/MongoDB, оптимизация запросов.	Алматы	300000	500000	Full-time	{PostgreSQL,MongoDB,SQL,Redis}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
69402dcb-0a3c-4d62-a990-c99d7f60250b	b63d82a3-4053-417a-8c67-c9a1f9089cdb	Security Engineer	Обеспечение информационной безопасности, пентестинг, анализ уязвимостей.	Тараз	350000	500000	Part-time	{Python,Go,SQL}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
06f29aec-154e-4b64-9f4b-091518b316eb	b63d82a3-4053-417a-8c67-c9a1f9089cdb	Data Scientist	Анализ данных, построение ML моделей, работа с большими данными.	Алматы	350000	400000	Part-time	{Python,"Machine Learning",SQL,MongoDB}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
ae5010dd-2eed-41f6-b9f0-93b4d2ef1443	b63d82a3-4053-417a-8c67-c9a1f9089cdb	Frontend Developer	Разработка пользовательских интерфейсов на React/TypeScript.	Шымкент	250000	350000	Part-time	{React,TypeScript,JavaScript,Vue.js}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
d5c946d9-33a7-4d57-a6cb-6f6a927a635d	5813ca01-4f06-4b0c-b51d-b7388f323b3b	QA Engineer	Тестирование программного обеспечения, написание автотестов.	Павлодар	250000	300000	Full-time	{Python,SQL,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
f8321d0e-d8af-40b0-ae9c-7d9bcff92e83	5813ca01-4f06-4b0c-b51d-b7388f323b3b	Backend Developer	Разработка серверной части приложений на Go/Python. Работа с микросервисной архитектурой.	Павлодар	300000	400000	Full-time	{Go,PostgreSQL,Docker,Redis}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
cd8dc5c8-44c8-44b2-9dc5-4d2af0d70361	5813ca01-4f06-4b0c-b51d-b7388f323b3b	iOS Developer	Разработка iOS приложений на Swift.	Актобе	150000	350000	Contract	{Swift,JavaScript}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
c779d588-5f2a-4026-b93f-5ab307c4da48	5813ca01-4f06-4b0c-b51d-b7388f323b3b	Frontend Developer	Разработка пользовательских интерфейсов на React/TypeScript.	Шымкент	150000	250000	Part-time	{React,TypeScript,JavaScript,Vue.js}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
21d42929-70c8-49bf-8cc2-3f1db4a975ed	5813ca01-4f06-4b0c-b51d-b7388f323b3b	ML Engineer	Разработка и деплой моделей машинного обучения в production.	Актобе	300000	450000	Full-time	{Python,"Machine Learning",Docker,Kubernetes}	active	2026-05-19 13:39:44.073659+00	2026-05-19 13:39:44.073659+00
\.


--
-- Name: employer_profiles employer_profiles_bin_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_profiles
    ADD CONSTRAINT employer_profiles_bin_key UNIQUE (bin);


--
-- Name: employer_profiles employer_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_profiles
    ADD CONSTRAINT employer_profiles_pkey PRIMARY KEY (employer_id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: vacancies vacancies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_pkey PRIMARY KEY (id);


--
-- Name: idx_vacancies_employer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_vacancies_employer_id ON public.vacancies USING btree (employer_id);


--
-- PostgreSQL database dump complete
--

\unrestrict UcVycNISETmoycXbp6N5dIvJyW5STGfOwRZgtecZe5kDptFrx1wKZOzTBtQx97R

