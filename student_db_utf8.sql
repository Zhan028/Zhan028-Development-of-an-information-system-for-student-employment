--
-- PostgreSQL database dump
--

\restrict mbAy63xxTn6MfNgmanf27iTV4e1QKqUKJiUZdOPYEkfLhRGzz9b2axM8x3lnFkp

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
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    type character varying(50) NOT NULL,
    file_name character varying(255) NOT NULL,
    file_size bigint NOT NULL,
    mime_type character varying(100),
    status character varying(20) DEFAULT 'pending'::character varying,
    verified_by uuid,
    verified_at timestamp with time zone,
    comment text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    storage_key character varying(500) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    type character varying(50) NOT NULL,
    title character varying(255) NOT NULL,
    body text,
    related_id character varying(255),
    is_read boolean DEFAULT false,
    created_at timestamp with time zone
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: push_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.push_tokens (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    token character varying(500) NOT NULL,
    platform character varying(20) DEFAULT 'ios'::character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.push_tokens OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    iin character varying(12) NOT NULL,
    university_id uuid,
    skills text[],
    gpa numeric DEFAULT 0,
    specialization character varying(200),
    graduation_year bigint DEFAULT 0,
    bio text,
    phone character varying(50),
    location_city character varying(200),
    github_url character varying(500),
    diploma_verified boolean DEFAULT false,
    diploma_verified_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (id, user_id, type, file_name, file_size, mime_type, status, verified_by, verified_at, comment, created_at, updated_at, storage_key) FROM stdin;
d1d9e9e3-62f3-4874-829d-a1c1d2a4f93d	43b3a982-da41-4cd4-b941-fdd34c04e24f	diploma	Отчёт по студентам.pdf	96848	application/pdf	verified	64c975be-ccd4-40c0-bf6e-37775e603be4	2026-05-11 11:10:30.732122+00		2026-05-11 11:00:01.243478+00	2026-05-11 11:10:30.732397+00	
ee4c39d3-30b0-48c0-90f5-8ae45658db60	6646fd1a-78ca-444b-b412-50248259e1d3	diploma	Отчёт по студентам.pdf	96848	application/pdf	rejected	64c975be-ccd4-40c0-bf6e-37775e603be4	2026-05-11 11:17:59.024925+00	не тот документ\n	2026-05-11 11:17:34.564872+00	2026-05-11 11:17:59.025209+00	
01219682-47bf-42ec-b899-b78f9ec032f9	43b3a982-da41-4cd4-b941-fdd34c04e24f	certificate	%D0%9A%D0%B0%D0%BB%D0%BB%D0%B5%D0%BD%20%D0%BF%D0%BB%D0%B0%D0%BD2.docx	15362	application/vnd.openxmlformats-officedocument.wordprocessingml.document	pending	\N	\N		2026-05-14 06:23:28.003378+00	2026-05-14 06:23:28.003378+00	
7568653e-9d4d-4886-a150-bd03c5d6f656	43b3a982-da41-4cd4-b941-fdd34c04e24f	cv	%D0%A0%D0%B5%D0%B7%D1%8E%D0%BC%D0%B5_Frontend_%D1%80%D0%B0%D0%B7%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%87%D0%B8%D0%BA_%D0%96%D0%B0%D0%BD%D0%B1%D0%B0%D1%82%D1%8B%D1%80_%D0%9C%D0%BE%D0%BB%D0%B4%D0%B0%D0%B1%D0%B5%D0%BA_%D0%BE%D1%82_16_10_2025_17_33.pdf	308738	application/pdf	pending	\N	\N		2026-05-15 08:24:59.526098+00	2026-05-15 08:24:59.526098+00	documents/43b3a982-da41-4cd4-b941-fdd34c04e24f/84c747ec-9bf5-43cc-8b5b-d97de8b16dce
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, type, title, body, related_id, is_read, created_at) FROM stdin;
47122838-0c8c-4e96-91ff-9828472bb972	43b3a982-da41-4cd4-b941-fdd34c04e24f	interview_scheduled	Вас приглашают на собеседование 📅	Дата: 13.05.2026 11:00, Место: Астана	aff5f05b-967f-4741-b862-240a2f681063	t	2026-05-11 11:11:57.423475+00
e3e5af99-7a5a-488d-86f7-3fdbdbd9879f	43b3a982-da41-4cd4-b941-fdd34c04e24f	application_status	Вас приглашают на интервью 🎯	Работодатель изменил статус вашей заявки на «interview».	c243c3f0-5fa4-42f7-b41b-dd00427fe983|interview	t	2026-05-11 11:11:38.639922+00
4658455c-9577-4a7f-819d-0bc13a15e068	43b3a982-da41-4cd4-b941-fdd34c04e24f	application_submitted	Заявка подана ✅	Ваша заявка успешно отправлена. Match Score: 100%	c243c3f0-5fa4-42f7-b41b-dd00427fe983	t	2026-05-11 11:11:02.617103+00
53219a40-0fcb-48d5-9557-3d344a983106	43b3a982-da41-4cd4-b941-fdd34c04e24f	document_verified	Документ верифицирован ✅	Ваш документ «diploma» был подтверждён университетом.	d1d9e9e3-62f3-4874-829d-a1c1d2a4f93d	t	2026-05-11 11:10:30.735777+00
a5c756d7-7fb2-44e5-84ad-8ec0d0777ce8	6646fd1a-78ca-444b-b412-50248259e1d3	document_rejected	Документ отклонён ❌	Ваш документ «diploma» был отклонён. Комментарий: не тот документ\n	ee4c39d3-30b0-48c0-90f5-8ae45658db60	t	2026-05-11 11:17:59.027984+00
51479d36-bafe-44e0-9b45-75502cbebd17	59506da9-fd63-4058-9085-071db1a10dcf	chat_message	💬 Новое сообщение	Студент ответил на ваше сообщение	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-13 13:45:53.460935+00
dcbb21d4-f067-47bd-8c40-10d57e96aa9b	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	Работодатель написал вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-13 13:46:23.639586+00
01afde85-9d04-473e-8fa5-851a84fe823f	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	Работодатель написал вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-14 06:34:35.039626+00
6bec2fa6-11d6-47c5-b9a2-9ce8c647820a	59506da9-fd63-4058-9085-071db1a10dcf	chat_message	💬 Новое сообщение	Студент ответил на ваше сообщение	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-14 13:27:28.105688+00
64b2d3a6-9046-4266-8933-cb450977a04f	59506da9-fd63-4058-9085-071db1a10dcf	chat_message	💬 Новое сообщение	Студент ответил на ваше сообщение	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-18 11:39:59.301679+00
1ad9c5ec-029c-43e0-a782-1aa443ba003e	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	Работодатель написал вам в чате	9aa432a1-ee3d-4900-b060-0b0fa7063390:15cb88f2-cc00-4b40-84e3-9d11f57c9d4e	t	2026-05-22 13:33:00.65411+00
8967065d-0575-4ad1-b76b-5d742222b276	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	Работодатель написал вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-12 06:50:04.841666+00
16c5ed4d-1dae-47e1-a1b7-c0a5095a8e38	43b3a982-da41-4cd4-b941-fdd34c04e24f	application_status	Вам предложена работа! 🎉	Работодатель изменил статус вашей заявки на «offered».	c243c3f0-5fa4-42f7-b41b-dd00427fe983|offered	t	2026-05-11 11:12:34.742601+00
27ba79be-e542-4024-8517-49ff2c1d11bd	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	Работодатель написал вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-18 12:00:17.646247+00
a38c5565-3888-4429-a7dc-0267a0fde0e9	3cb2b77a-3056-465c-a53a-9377c32e8256	chat_message	💬 Новое сообщение	Студент ответил на ваше сообщение	9aa432a1-ee3d-4900-b060-0b0fa7063390:15cb88f2-cc00-4b40-84e3-9d11f57c9d4e	t	2026-05-22 13:24:28.70429+00
bac6eee4-5578-48d8-8c82-b2408d90e553	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	Работодатель написал вам в чате	9aa432a1-ee3d-4900-b060-0b0fa7063390:15cb88f2-cc00-4b40-84e3-9d11f57c9d4e	t	2026-05-22 13:26:19.746014+00
0b7bccf3-c433-40be-bd14-02ee0b5950fa	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	Работодатель написал вам в чате	9aa432a1-ee3d-4900-b060-0b0fa7063390:15cb88f2-cc00-4b40-84e3-9d11f57c9d4e	t	2026-05-22 13:32:49.632133+00
611fb9ae-9345-40b3-b325-ec8279a1a51a	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 08:03:59.166633+00
0c7b8b4c-0973-48da-8c50-b53ebbeacd93	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 07:58:32.261183+00
a0379dc0-85e9-4e08-9bb3-deda7f1c1980	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 08:06:59.354627+00
aa1a493f-4a53-4660-ac78-1e682af93578	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 08:20:20.392601+00
47eb462e-5b49-412b-aefb-d645f074e683	6646fd1a-78ca-444b-b412-50248259e1d3	application_status	Ваша заявка отклонена	Работодатель изменил статус вашей заявки на «rejected».	901cb9ee-5d58-4500-9d46-b4d55e5d9b84|rejected	t	2026-05-28 07:48:16.069737+00
ee1ce30f-9e8f-4ed0-85a3-a863a64a7494	6646fd1a-78ca-444b-b412-50248259e1d3	chat_message	💬 Новое сообщение	Chocofood написал(а) вам в чате	901cb9ee-5d58-4500-9d46-b4d55e5d9b84:c298d4d1-be60-4452-85c7-8b42d8a0791e	t	2026-05-28 07:47:20.045823+00
d6d4e2a8-222a-4c0f-a648-1dfad779d0ae	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 11:53:32.351289+00
7fa62445-5d42-4815-9fb7-ac9d2b9c4ff6	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 11:54:05.271778+00
8f96e72f-b818-4589-87f9-e031c7dac3eb	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 11:54:35.80396+00
1e51b07d-bf37-464c-9df4-451b10296f1f	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 11:55:02.206465+00
22ec6fc9-b0da-4808-8779-1c75365c69ac	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 11:58:44.446378+00
77cff74f-f1c5-4f8d-bbff-4bade6e39ea1	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 11:59:15.030653+00
0f7a26a0-6e56-44cf-a297-53479081a620	3cb2b77a-3056-465c-a53a-9377c32e8256	chat_message	💬 Новое сообщение	Студент ответил на ваше сообщение	9aa432a1-ee3d-4900-b060-0b0fa7063390:15cb88f2-cc00-4b40-84e3-9d11f57c9d4e	t	2026-05-22 13:34:05.673934+00
4cdaaca2-4dae-4e78-b3ac-c6765a48ff18	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 12:19:43.380351+00
f6ec55c3-b45c-4865-899c-85ddd6f6d53b	59506da9-fd63-4058-9085-071db1a10dcf	chat_message	💬 Новое сообщение	Аскар Аскаров написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 12:19:59.497602+00
6ca9660b-4617-4500-87bf-53218123c26f	59506da9-fd63-4058-9085-071db1a10dcf	chat_message	💬 Новое сообщение	Аскар Аскаров написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 12:20:13.354246+00
59ae2b17-d2e9-4790-96af-83af979210b3	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 12:20:27.350547+00
590aa15c-de4e-4805-b31b-26818324e7b8	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 12:20:24.382776+00
5339fc13-a5ab-45c2-b34b-51758c547dbf	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	💬 Новое сообщение	AO "Kaspi.kz" написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 12:20:18.726756+00
6f1be98e-3ad4-4507-8b06-9242ae61ceea	59506da9-fd63-4058-9085-071db1a10dcf	chat_message	💬 Новое сообщение	Аскар Аскаров написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 12:22:00.592672+00
a7df8dd7-9ad9-4db2-ba1e-c8751f141cd3	59506da9-fd63-4058-9085-071db1a10dcf	chat_message	💬 Новое сообщение	Аскар Аскаров написал(а) вам в чате	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-05-28 12:21:50.704669+00
2d91a3d2-0cbf-4d7e-8551-bfea392dcce9	43b3a982-da41-4cd4-b941-fdd34c04e24f	application_status	Вас приглашают на интервью 🎯	Работодатель изменил статус вашей заявки на «interview».	c243c3f0-5fa4-42f7-b41b-dd00427fe983|interview	t	2026-05-28 12:44:43.49296+00
ddc6b606-fc85-45c1-a241-45d01907032b	43b3a982-da41-4cd4-b941-fdd34c04e24f	application_status	Вам предложена работа! 🎉	Работодатель изменил статус вашей заявки на «offered».	c243c3f0-5fa4-42f7-b41b-dd00427fe983|offered	t	2026-05-28 12:44:50.717689+00
89d0546b-f0f4-46d5-948f-80d1ca2fe70a	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	chat_message	AO "Kaspi.kz"	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-06-02 14:24:48.01267+00
39a7bdb6-ebdb-4e7d-9550-2f91c699c942	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	chat_message	AO "Kaspi.kz"	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-06-02 14:25:06.931052+00
11b08d31-8472-4a23-bb59-099609b21dff	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	chat_message	AO "Kaspi.kz"	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-06-02 14:25:14.535392+00
0bdb28eb-5353-4bfc-b117-6d6d750135e7	59506da9-fd63-4058-9085-071db1a10dcf	chat_message	chat_message	Аскар Аскаров	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-06-02 14:25:33.773814+00
088723c2-8482-4125-8446-08012528cb62	59506da9-fd63-4058-9085-071db1a10dcf	chat_message	chat_message	Аскар Аскаров	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-06-02 14:25:03.682293+00
f8667a58-06cb-4a14-863c-2ae08ecec888	59506da9-fd63-4058-9085-071db1a10dcf	chat_message	chat_message	Аскар Аскаров	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-06-02 14:33:41.653463+00
b3e56b6f-f948-4ec1-97ec-900a0780b0b0	78b690ac-fd00-410d-94a2-dd13d9c0916e	chat_message	chat_message	AO "Kaspi.kz"	de68fb12-24a5-4e47-889a-5437e32585b1:67712e51-6576-42f5-982c-5b41ceecc53e	f	2026-06-02 14:34:10.344878+00
3d79b4ea-6ac3-4157-b4d8-45b05011c101	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	chat_message	AO "Kaspi.kz"	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-06-02 14:43:28.149598+00
65efa7b4-8969-4307-9625-fa9b00514046	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	chat_message	AO "Kaspi.kz"	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-06-02 14:34:32.615251+00
4e53491f-4cb1-4a2c-b996-703b3e67afc7	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	chat_message	AO "Kaspi.kz"	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-06-02 14:25:41.929515+00
5c74c4f7-5b40-409e-a32b-f67e7aabf59e	43b3a982-da41-4cd4-b941-fdd34c04e24f	chat_message	chat_message	AO "Kaspi.kz"	c243c3f0-5fa4-42f7-b41b-dd00427fe983:67712e51-6576-42f5-982c-5b41ceecc53e	t	2026-06-02 14:33:34.432028+00
1e2d4816-9c88-47c2-9216-69c8e3d84c03	78b690ac-fd00-410d-94a2-dd13d9c0916e	application_status	Ваша заявка отклонена	Работодатель изменил статус вашей заявки на «rejected».	de68fb12-24a5-4e47-889a-5437e32585b1|rejected	f	2026-06-02 14:44:15.29202+00
7237a80f-9a87-4a9c-873e-8b159c623595	43b3a982-da41-4cd4-b941-fdd34c04e24f	application_status	Ваша заявка отклонена	Работодатель изменил статус вашей заявки на «rejected».	9aa432a1-ee3d-4900-b060-0b0fa7063390|rejected	t	2026-06-10 14:48:50.446616+00
4b4a3629-8179-4f94-a5c1-1a47ca28ee4e	c3354c75-3e62-42d4-8656-05e7c0fa9f1a	application_status	Ваша заявка отклонена	Работодатель изменил статус вашей заявки на «rejected».	ea602be9-2eb7-405b-a5da-b19414ec962d|rejected	f	2026-06-10 15:07:12.571431+00
1f4532b0-6abd-4e02-85c0-af6c7f8f56d7	c3354c75-3e62-42d4-8656-05e7c0fa9f1a	application_status	Вам предложена работа! 🎉	Работодатель изменил статус вашей заявки на «offered».	ea602be9-2eb7-405b-a5da-b19414ec962d|offered	f	2026-06-10 15:07:13.301872+00
da8d81ce-405b-4ba0-bc27-c73b0559d0c2	43b3a982-da41-4cd4-b941-fdd34c04e24f	application_status	Вам предложена работа! 🎉	Работодатель изменил статус вашей заявки на «offered».	9aa432a1-ee3d-4900-b060-0b0fa7063390|offered	t	2026-06-10 15:20:31.405357+00
c8ad9d27-8f10-4e39-8bf4-ee3d125d7f6a	43b3a982-da41-4cd4-b941-fdd34c04e24f	application_status	Ваша заявка отклонена	Работодатель изменил статус вашей заявки на «rejected».	9aa432a1-ee3d-4900-b060-0b0fa7063390|rejected	t	2026-06-10 15:25:22.931767+00
b7e95281-b60b-4462-815e-d325bcc03aa8	6646fd1a-78ca-444b-b412-50248259e1d3	compliance_at_risk	Риск по обязательству гранта ⚠️	Прошло более 3 месяцев после выпуска без подходящего трудоустройства. Найдите квалифицирующую работу до дедлайна — иначе по статье 47 возможен возврат стоимости обучения.	6646fd1a-78ca-444b-b412-50248259e1d3	t	2026-06-10 15:05:49.514564+00
\.


--
-- Data for Name: push_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.push_tokens (id, user_id, token, platform, created_at, updated_at) FROM stdin;
c93812d4-e5c8-4191-9c33-2ff66d53a3f4	64c975be-ccd4-40c0-bf6e-37775e603be4	ExponentPushToken[UYNfFGChjrh4Kx4jSFWZT3]	android	2026-06-08 11:25:42.108018+00	2026-06-08 11:25:42.108018+00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version, dirty) FROM stdin;
3	f
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, user_id, first_name, last_name, iin, university_id, skills, gpa, specialization, graduation_year, bio, phone, location_city, github_url, diploma_verified, diploma_verified_at, created_at, updated_at) FROM stdin;
a0918bac-6a0c-4413-a873-aa819113d196	6646fd1a-78ca-444b-b412-50248259e1d3	Аслан	Асланов	020315500019	4071763f-6bb2-4bd8-9403-4c5da0709695	{Dokcer," WireShark"," Cisco"," CryptoGraphy"}	3.1	Cybersecurity	2025	CyberSecurity	+77007719574	Астана		f	\N	2026-05-11 11:17:27.766142+00	2026-05-11 11:17:27.766142+00
8e2abb22-51ff-45ae-afb9-d4abd5d034b8	da54fbc7-2bb0-4568-94f1-b708edafa33b	Асель	Касымова	900000000006	4071763f-6bb2-4bd8-9403-4c5da0709695	{Go,MongoDB,React,GraphQL}	3.91	Mobile Development	2026	\N	+77070000006	Атырау	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
2e638af7-6d4a-41f8-9dcb-d3aa29f66515	54d64067-a67a-4f57-b27d-2e09f310a5a9	Санжар	Жумабеков	900000000007	4071763f-6bb2-4bd8-9403-4c5da0709695	{React,MongoDB,SQL,Java}	3.19	Data Science	2024	\N	+77070000007	Алматы	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
1401826f-5950-4957-a89a-25d94112b57b	d7674181-3a4c-4603-bd77-12cb45ca88e9	Санжар	Қожахметов	900000000008	4071763f-6bb2-4bd8-9403-4c5da0709695	{Angular,SQL,Swift,PostgreSQL}	3.08	Web Development	2025	\N	+77070000008	Астана	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
48c835ed-9210-4e4e-b3aa-40cbc9457026	bbb9f11f-0c50-4a14-9f57-d3aa81049293	Серік	Қожахметов	900000000009	4071763f-6bb2-4bd8-9403-4c5da0709695	{Kubernetes,JavaScript,React,MongoDB}	3.96	Computer Science	2026	\N	+77070000009	Шымкент	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
af2e59f2-8e44-4ef8-8cf7-800ef5fb251b	20446ca6-25c5-4113-95fc-3fa4004d292c	Асель	Темірбекова	900000000010	4071763f-6bb2-4bd8-9403-4c5da0709695	{Kotlin,Swift,C++,SQL,Java,Kubernetes}	3.56	Information Systems	2026	\N	+77070000010	Павлодар	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
847e9b1d-94fc-4675-a598-0ebd82293204	8230948e-d5d1-47a1-8ab1-9ca434eb4ec0	Болат	Сейткали	900000000011	4071763f-6bb2-4bd8-9403-4c5da0709695	{Python,TypeScript,"Machine Learning",C++,Kotlin}	3.57	Software Engineering	2025	\N	+77070000011	Алматы	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
4b42a5e5-e6f4-4390-9e92-78903c35eceb	f73c8a03-ae61-4daa-9421-7b18a3290617	Нурлан	Ахметов	900000000012	4071763f-6bb2-4bd8-9403-4c5da0709695	{Swift,Angular,Go}	2.94	Information Systems	2025	\N	+77070000012	Актобе	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
247e1cba-043d-4006-b362-d8a69df590d0	a118212f-9e1e-467c-8512-6d04235252d1	Болат	Ержанов	900000000013	4071763f-6bb2-4bd8-9403-4c5da0709695	{SQL,MongoDB,Kubernetes,Docker,Java,Vue.js}	2.51	Mobile Development	2026	\N	+77070000013	Тараз	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
c15708d3-d6f6-4f91-a576-d8b8e9e358a0	a8e63c99-329b-4c34-a52c-6849ca20620c	Камила	Ахметова	900000000014	4071763f-6bb2-4bd8-9403-4c5da0709695	{TypeScript,Swift,Angular,Redis,Kotlin,Node.js}	2.82	Applied Mathematics	2026	\N	+77070000014	Астана	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
c1a26d64-4c13-4eaf-88a7-5704db8f9afd	30fd24a2-1747-4bd7-815c-175a1d687590	Данияр	Ержанов	900000000015	4071763f-6bb2-4bd8-9403-4c5da0709695	{"Machine Learning",React,TypeScript,Angular,SQL}	3.89	Software Engineering	2026	\N	+77070000015	Астана	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
724cdcaa-eb1e-4a1c-8d5e-f466a3f18020	0f72a145-b759-4104-87fd-81352c7b7157	Ботакөз	Муратова	900000000016	4071763f-6bb2-4bd8-9403-4c5da0709695	{React,Kotlin,Redis,Swift}	3.62	Information Systems	2025	\N	+77070000016	Астана	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
a1877edc-73ac-494c-8f69-1e5bc104d538	28b9a569-4e9a-4589-a577-1c4732d5cf48	Жандос	Муратов	900000000017	4071763f-6bb2-4bd8-9403-4c5da0709695	{C++,React,PostgreSQL,Kotlin}	2.99	Computer Engineering	2026	\N	+77070000017	Алматы	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
e7650a71-43be-4335-ae23-bda3ee860078	c3354c75-3e62-42d4-8656-05e7c0fa9f1a	Молдір	Сейткалиа	900000000018	4071763f-6bb2-4bd8-9403-4c5da0709695	{Kubernetes,PostgreSQL,C++,React,Kotlin,Docker}	3.86	Cybersecurity	2025	\N	+77070000018	Усть-Каменогорск	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
341ebd49-cca8-45fd-a965-2581d056990d	d74b73d3-c093-4a4f-bb68-12b13ce9b118	Данияр	Темірбеков	900000000019	4071763f-6bb2-4bd8-9403-4c5da0709695	{Node.js,React,MongoDB,Docker}	3.89	Computer Science	2026	\N	+77070000019	Астана	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
dad932bb-8488-4213-a7d9-e810c3028aa8	1ef27472-70f3-4ff5-a158-6827d306621b	Арайлым	Ахметова	900000000020	4071763f-6bb2-4bd8-9403-4c5da0709695	{GraphQL,Node.js,"Machine Learning",Go,React,Python}	2.96	Computer Engineering	2026	\N	+77070000020	Актобе	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
2b8fc110-6562-45fc-9975-fd4475d4bf57	e889fc7a-f05c-4778-9610-e62117ad1d16	Сауле	Байжанова	900000000021	4071763f-6bb2-4bd8-9403-4c5da0709695	{"Machine Learning",Go,JavaScript,Java,TypeScript,Node.js}	3.29	Data Science	2025	\N	+77070000021	Тараз	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
8af683d9-4aad-4589-9ccd-c6dc7bd76855	bdd8b685-2e38-481d-bbd4-0b205635aabb	Руслан	Ахметов	900000000022	4071763f-6bb2-4bd8-9403-4c5da0709695	{Angular,JavaScript,PostgreSQL,Swift,Docker,Go}	3.72	Data Science	2024	\N	+77070000022	Астана	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
97c26439-5065-450f-a303-7b744b56022e	ac7d5c76-2a55-4b79-b59b-2280659545fe	Алия	Дюсенова	900000000023	4071763f-6bb2-4bd8-9403-4c5da0709695	{React,SQL,Java,"Machine Learning",Angular,MongoDB}	3.11	Computer Engineering	2025	\N	+77070000023	Атырау	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
68a2730a-2a86-47f2-9763-36a180d9b19a	9a7a56bc-644d-4ecd-9901-158445107516	Ержан	Касымов	900000000024	4071763f-6bb2-4bd8-9403-4c5da0709695	{MongoDB,Java,"Machine Learning"}	3.29	Information Systems	2026	\N	+77070000024	Шымкент	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
1e1df1ba-f66a-4bfb-8917-788abe65f838	6ee49edb-32aa-4a44-b1e0-00cb6358fe76	Назерке	Ержанова	900000000025	4071763f-6bb2-4bd8-9403-4c5da0709695	{GraphQL,C++,Node.js,Java,React,Swift}	3.05	Computer Engineering	2025	\N	+77070000025	Шымкент	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
330a648e-ee16-4323-bb40-fb54880febf6	eec2afa3-8468-4b09-b70d-3c212ea2ce84	Назерке	Исмаилова	900000000026	4071763f-6bb2-4bd8-9403-4c5da0709695	{"Machine Learning",MongoDB,SQL}	3.58	Data Science	2024	\N	+77070000026	Алматы	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
0cf0dd54-8473-4bcb-9a56-0e389ce6f403	ed6ff96f-1c00-4481-9cf5-760dd0315606	Індіра	Жумабекова	900000000027	4071763f-6bb2-4bd8-9403-4c5da0709695	{Go,React,Python,TypeScript,Swift,MongoDB}	2.54	Information Systems	2026	\N	+77070000027	Шымкент	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
b4f7831a-1c36-4f54-99f9-ee351adb79fd	fcc68feb-4639-4de4-941e-712e50e5da69	Серік	Касымов	900000000028	4071763f-6bb2-4bd8-9403-4c5da0709695	{"Machine Learning",JavaScript,TypeScript}	3.62	Data Science	2025	\N	+77070000028	Астана	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
7d28a9ad-765f-4072-bf8c-2310f9076aa5	9dfe9a6d-b941-4506-9b65-9ab14ddb1e39	Індіра	Қожахметова	900000000002	4071763f-6bb2-4bd8-9403-4c5da0709695	{JavaScript,TypeScript,Vue.js,Angular,MongoDB,Java}	3.29	Software Engineering	2024		+77070000002	Актобе		f	\N	2026-05-19 13:55:08.848697+00	2026-05-20 14:03:49.259596+00
071a6524-155e-4e1a-b83a-6652e556ca3b	4bc5366c-326c-431d-afba-5355a7ed0ec7	Нурия	Жумабекова	900000000029	4071763f-6bb2-4bd8-9403-4c5da0709695	{C++,SQL,"Machine Learning"}	2.66	Computer Science	2026	\N	+77070000029	Усть-Каменогорск	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
062b790a-5956-4adf-b2ff-732646043dfa	430ebfd7-ffbc-4bc0-bf9f-d41fd24c6e8e	Азамат	Қожахметов	900000000030	4071763f-6bb2-4bd8-9403-4c5da0709695	{Redis,MongoDB,Swift,PostgreSQL}	2.99	Cybersecurity	2025	\N	+77070000030	Тараз	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
bade66be-b7c1-4356-8baa-eecb330aaec2	c2a39530-0337-466f-8b7f-553a828c3f5c	Айдос	Байжанов	900000000031	4071763f-6bb2-4bd8-9403-4c5da0709695	{Vue.js,Go,SQL}	3.76	Data Science	2025	\N	+77070000031	Актобе	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
1cc2b994-4db3-42d0-aab6-2d4342d2cd0b	e6c6e6e9-784b-4452-97e8-6c87059b90aa	Дариға	Байжанова	900000000032	4071763f-6bb2-4bd8-9403-4c5da0709695	{MongoDB,Python,Redis,GraphQL,Angular}	3.36	Applied Mathematics	2026	\N	+77070000032	Актобе	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
af21c516-0744-47d1-8014-95ef96b87af6	86b009bf-cb18-40b5-871e-97f72e2d9d3f	Мадина	Дюсенова	900000000033	4071763f-6bb2-4bd8-9403-4c5da0709695	{PostgreSQL,React,"Machine Learning",C++,Go,Vue.js}	3.73	Data Science	2024	\N	+77070000033	Атырау	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
eb8658d5-3e56-4aa0-8fe4-ff390792e0ea	4ea344f9-f4ee-46ba-b76c-9ebcac9113d4	Айнур	Ержанова	900000000034	4071763f-6bb2-4bd8-9403-4c5da0709695	{Node.js,Swift,GraphQL}	2.57	Cybersecurity	2025	\N	+77070000034	Тараз	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
172e96eb-b9eb-46cc-8a8c-80701a9587b7	0ac51df5-ac9a-48ba-afc5-a2b368dd6557	Нурлан	Нурмагамбетов	900000000035	4071763f-6bb2-4bd8-9403-4c5da0709695	{MongoDB,C++,Kotlin,SQL,Node.js}	2.82	Mobile Development	2024	\N	+77070000035	Алматы	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
ec0fdda2-db89-4a62-b42d-aa6f8c10925f	0f91193f-4188-4eb7-bfc2-9cf887ffb216	Руслан	Сарсенов	900000000036	4071763f-6bb2-4bd8-9403-4c5da0709695	{C++,PostgreSQL,Angular,React,MongoDB}	2.68	Information Systems	2025	\N	+77070000036	Актобе	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
aa6514cd-64de-458b-8851-b16d25d3eac9	e1c4b776-599d-4123-920f-3f7b08d2a993	Азамат	Байжанов	900000000037	4071763f-6bb2-4bd8-9403-4c5da0709695	{Swift,Vue.js,Python,JavaScript}	2.56	Artificial Intelligence	2025	\N	+77070000037	Павлодар	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
dd1623ec-3e80-4235-85d2-c0db38242c5d	a0e03e7c-483a-4b2f-b5e8-dd2e498c7b36	Асель	Нурмагамбетова	900000000038	4071763f-6bb2-4bd8-9403-4c5da0709695	{Docker,Go,Angular}	3.12	Web Development	2026	\N	+77070000038	Астана	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
cd1ffb3e-390e-48b1-9f16-987c20be279c	d0fef482-e36c-4a79-9df6-c4790864fa1c	Жансая	Абенова	900000000039	4071763f-6bb2-4bd8-9403-4c5da0709695	{C++,TypeScript,SQL,GraphQL,Vue.js}	3.09	Cybersecurity	2024	\N	+77070000039	Алматы	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
c3c507f4-96e6-41e4-af09-fcdb562c78cc	501d5b8d-7d28-4f7e-ba3b-ce061a9b0416	Берик	Қожахметов	900000000040	4071763f-6bb2-4bd8-9403-4c5da0709695	{"Machine Learning",SQL,Node.js}	3.93	Information Systems	2025	\N	+77070000040	Атырау	\N	f	\N	2026-05-19 13:55:09.710666+00	2026-05-19 13:55:09.710666+00
b207e3dd-1a92-4178-a9af-1378c60f0d53	54c2e1a8-3eea-4db0-bd43-7f270f1ac6d6	Алия	Тулеугалиа	900000000041	4071763f-6bb2-4bd8-9403-4c5da0709695	{Docker,Swift,Node.js,GraphQL,JavaScript,Kubernetes}	3.47	Applied Mathematics	2025	\N	+77070000041	Павлодар	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
9baca303-cd4d-47ce-a822-b13fec92eb8b	4dec54f7-5638-4877-b27b-efb62381261f	Марат	Сейткали	900000000042	4071763f-6bb2-4bd8-9403-4c5da0709695	{GraphQL,Python,Kotlin,Angular,Vue.js}	3.95	Computer Science	2024	\N	+77070000042	Астана	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
9ac25c45-f9c7-4b62-a64d-4737e6b187c3	7e532e35-b6d7-4a6e-a1f7-ff1e7282faa5	Азамат	Байжанов	900000000043	4071763f-6bb2-4bd8-9403-4c5da0709695	{Python,Node.js,Kotlin}	2.64	Information Systems	2025	\N	+77070000043	Шымкент	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
e3540c2d-f736-437b-9bc8-9833859511a6	ee473cc8-8343-4283-a010-ba0dd0d1930c	Зарина	Тулеугалиа	900000000044	4071763f-6bb2-4bd8-9403-4c5da0709695	{PostgreSQL,Vue.js,C++}	2.79	Computer Science	2026	\N	+77070000044	Астана	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
93bcc187-de66-4e3b-9a1d-7d57cabf6afa	3c3ed922-0c33-414e-907b-db196f6b420d	Санжар	Ержанов	900000000045	4071763f-6bb2-4bd8-9403-4c5da0709695	{JavaScript,Docker,Java,Vue.js,PostgreSQL}	3.23	Information Systems	2025	\N	+77070000045	Шымкент	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
5c455afe-3ba9-4d1a-8d51-95c58817719e	dbb1f4c5-71db-46ee-b27c-b4ea34c06ad1	Арайлым	Муратова	900000000046	4071763f-6bb2-4bd8-9403-4c5da0709695	{"Machine Learning",Swift,Node.js,Angular}	3.22	Computer Engineering	2025	\N	+77070000046	Павлодар	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
8a3fca81-e0ee-4616-be7e-867259dcad01	df78a500-08c7-4f64-8a86-cc34e7e65944	Асхат	Муратов	900000000047	4071763f-6bb2-4bd8-9403-4c5da0709695	{Kubernetes,Go,Vue.js}	2.7	Cybersecurity	2026	\N	+77070000047	Атырау	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
d3ff6c6b-7ee2-4a80-aa0e-0229cd5ce4a1	4455fb2f-0eb9-44ed-8f55-e00497448814	Арман	Ахметов	900000000048	4071763f-6bb2-4bd8-9403-4c5da0709695	{C++,Kubernetes,PostgreSQL,React,Docker,JavaScript}	3.72	Artificial Intelligence	2024	\N	+77070000048	Усть-Каменогорск	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
793ae294-91ab-4c2c-b9e9-74b5b39a76e8	5a455151-3a79-46bf-b2cd-cd31a282ee87	Арайлым	Муратова	900000000049	4071763f-6bb2-4bd8-9403-4c5da0709695	{Swift,Kubernetes,JavaScript,Docker,Go}	3.17	Web Development	2026	\N	+77070000049	Астана	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
dd5d4658-c598-49c5-ba45-40002385ebaf	0312e85d-6ec4-4736-98f7-b814b67ab0c7	Азамат	Абенов	900000000050	4071763f-6bb2-4bd8-9403-4c5da0709695	{Java,Kubernetes,React,PostgreSQL,GraphQL}	2.75	Web Development	2024	\N	+77070000050	Актобе	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
bec2483d-51f6-4a66-a454-6344b81651d6	5d4db895-6b64-44d8-b5e6-8ed981092474	Жансая	Касымова	900000000051	4071763f-6bb2-4bd8-9403-4c5da0709695	{React,Kotlin,JavaScript,Redis}	3.2	Web Development	2025	\N	+77070000051	Тараз	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
1b61405e-dfc7-45b4-8c52-51b492995db4	81ee735e-de6c-456a-92db-6daecbcf758c	Досым	Ержанов	900000000052	4071763f-6bb2-4bd8-9403-4c5da0709695	{MongoDB,Swift,JavaScript,Go,Node.js,"Machine Learning"}	3.56	Computer Science	2026	\N	+77070000052	Астана	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
32bff8ba-d81a-4190-9f45-21bee776673a	c0ff8960-e25d-4637-b8c6-0dbbbd543dc7	Молдір	Байжанова	900000000053	4071763f-6bb2-4bd8-9403-4c5da0709695	{Redis,React,SQL,GraphQL,JavaScript,"Machine Learning"}	3.95	Data Science	2024	\N	+77070000053	Усть-Каменогорск	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
1a8614c1-dfab-409a-8248-b2a0715a5128	4ea04ed5-bdf0-4e95-b20d-bb6c9dc6ea36	Ержан	Касымов	900000000054	4071763f-6bb2-4bd8-9403-4c5da0709695	{Kubernetes,React,Vue.js,Python}	3.84	Applied Mathematics	2025	\N	+77070000054	Алматы	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
21077fe5-6993-473b-bf59-0dfdad7ceaf3	f069ea22-22e9-433d-8047-c0510b67a142	Асель	Касымова	900000000055	4071763f-6bb2-4bd8-9403-4c5da0709695	{Docker,C++,Python,SQL}	3.42	Mobile Development	2024	\N	+77070000055	Актобе	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
a867d46c-e9ba-4088-8723-ecd4572023a5	3e618ca5-09d0-446a-abf4-b4a536cd43ed	Берик	Исмаилов	900000000056	4071763f-6bb2-4bd8-9403-4c5da0709695	{JavaScript,Vue.js,GraphQL,Node.js,PostgreSQL,TypeScript}	3.55	Information Systems	2026	\N	+77070000056	Атырау	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
554b3f8c-70cc-4801-b4b8-796d07fddc85	5015003a-4bab-4298-b0f3-7ccd6382561a	Жансая	Сарсенова	900000000086	4071763f-6bb2-4bd8-9403-4c5da0709695	{Redis,Java,Swift,Python}	3.83	Computer Science	2026	\N	+77070000086	Атырау	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
02354bc6-67cb-4e6d-874c-8e5efde980e7	d2930572-8d82-40a9-aacc-45ae413d4537	Арман	Сарсенов	900000000057	4071763f-6bb2-4bd8-9403-4c5da0709695	{Java,Node.js,TypeScript,JavaScript,"Machine Learning",C++}	2.82	Data Science	2024	\N	+77070000057	Тараз	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
158b5d87-12bc-4d86-b554-cb1f2e27f16a	f398462e-e116-4fc3-9e95-693b3b05f6de	Зарина	Нурмагамбетова	900000000058	4071763f-6bb2-4bd8-9403-4c5da0709695	{PostgreSQL,GraphQL,Java}	2.95	Web Development	2026	\N	+77070000058	Тараз	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
774bcc87-fb89-4afd-b09b-8f6262a09f5f	e8deabcd-e333-446c-9acb-d996338f85a6	Арман	Темірбеков	900000000059	4071763f-6bb2-4bd8-9403-4c5da0709695	{Kubernetes,Java,Kotlin}	2.51	Computer Engineering	2024	\N	+77070000059	Алматы	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
b3347bf2-d58f-42b2-b9a9-c977ead72f3e	1a1e0e5c-4df5-45e6-969b-822c11c3a4d3	Марат	Сейткали	900000000060	4071763f-6bb2-4bd8-9403-4c5da0709695	{Redis,Kotlin,Angular,PostgreSQL,Node.js,Go}	3.85	Mobile Development	2026	\N	+77070000060	Тараз	\N	f	\N	2026-05-19 13:55:10.754082+00	2026-05-19 13:55:10.754082+00
bb5df335-2378-449e-8c1c-4f85d5d5862c	cee4243d-d2f3-4daf-831f-fe87fd68ecc3	Тоқтар	Қожахметов	900000000062	4071763f-6bb2-4bd8-9403-4c5da0709695	{Angular,Java,Kubernetes}	2.79	Cybersecurity	2024	\N	+77070000062	Усть-Каменогорск	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
1d2c062a-4c13-469f-9acc-f8743dceee8b	60849c91-6ca7-480e-aa56-83116307d970	Нурлан	Жумабеков	900000000063	4071763f-6bb2-4bd8-9403-4c5da0709695	{Vue.js,MongoDB,TypeScript,JavaScript,Redis}	2.52	Data Science	2024	\N	+77070000063	Шымкент	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
dad52dcc-f1d7-424d-96dd-8cb56d276dae	a7a08458-aeb8-4087-a2b1-29779848ffb3	Нурлан	Сарсенов	900000000064	4071763f-6bb2-4bd8-9403-4c5da0709695	{SQL,Angular,React,"Machine Learning",Docker}	3.86	Data Science	2026	\N	+77070000064	Усть-Каменогорск	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
c6c4a9f3-c460-40aa-984a-434d556f480e	460bc768-4c7c-43d8-bf6a-31c478028a6f	Алибек	Исмаилов	900000000065	4071763f-6bb2-4bd8-9403-4c5da0709695	{Go,Python,Kotlin,React,SQL}	2.77	Web Development	2026	\N	+77070000065	Шымкент	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
49d11b83-7b3e-4e6e-9f29-a5ce02e3754a	1c2216c7-3e5a-48bd-af2a-4feec3f6f0b5	Марат	Абенов	900000000066	4071763f-6bb2-4bd8-9403-4c5da0709695	{PostgreSQL,"Machine Learning",Kubernetes}	2.61	Mobile Development	2026	\N	+77070000066	Усть-Каменогорск	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
b2fc95ab-96db-4323-bfc9-04f69970e388	414f4a01-bdac-40cc-9169-78ec94274b6b	Тоқтар	Тулеугали	900000000067	4071763f-6bb2-4bd8-9403-4c5da0709695	{"Machine Learning",SQL,C++}	2.58	Computer Science	2024	\N	+77070000067	Атырау	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
632b5d68-94a7-4b64-907e-f882de549a4e	9baa88ae-a422-4e75-8e4c-f146183b2b23	Азамат	Дюсенов	900000000068	4071763f-6bb2-4bd8-9403-4c5da0709695	{Node.js,Kubernetes,PostgreSQL,SQL}	3.33	Software Engineering	2026	\N	+77070000068	Шымкент	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
92f96b3a-4591-4fe6-8e70-529d1159ff8a	e01ae0f1-f096-4869-ae92-5347fad0deb6	Арайлым	Нурмагамбетова	900000000069	4071763f-6bb2-4bd8-9403-4c5da0709695	{Kubernetes,Docker,SQL}	2.87	Mobile Development	2025	\N	+77070000069	Шымкент	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
9efc0948-e744-4c14-9305-06100446e834	ce1f6a0c-006e-48e7-8051-b3a76b38603e	Меруерт	Тулеугалиа	900000000070	4071763f-6bb2-4bd8-9403-4c5da0709695	{MongoDB,Node.js,JavaScript,Angular,Vue.js}	3.36	Data Science	2025	\N	+77070000070	Астана	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
2b2583d2-5d48-4370-88b4-3bb7b9390eec	215ac9ba-e818-4460-bfe8-67db6f4237d0	Динара	Сарсенова	900000000071	4071763f-6bb2-4bd8-9403-4c5da0709695	{PostgreSQL,Redis,Java,Angular}	3.55	Information Systems	2024	\N	+77070000071	Атырау	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
365d9a5a-5976-447f-9261-abe6fabbd5be	b9ea2dde-43d8-4f36-ae27-f7a51bb805d7	Динара	Ахметова	900000000072	4071763f-6bb2-4bd8-9403-4c5da0709695	{PostgreSQL,Java,React,C++,Kotlin,GraphQL}	2.7	Mobile Development	2024	\N	+77070000072	Алматы	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
796c6156-bdc3-4763-beda-6b45d7d7710f	fa121fa8-8458-420d-bbc9-604b02825377	Ержан	Ержанов	900000000073	4071763f-6bb2-4bd8-9403-4c5da0709695	{Node.js,Kubernetes,GraphQL}	2.59	Artificial Intelligence	2025	\N	+77070000073	Шымкент	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
6c06012c-135a-48ca-a9d0-9661e150d110	fad6a2d3-cd7f-4ac1-ab2e-70b6d62ef140	Жулдыз	Муратова	900000000074	4071763f-6bb2-4bd8-9403-4c5da0709695	{Docker,GraphQL,Java,React,MongoDB,TypeScript}	3.38	Artificial Intelligence	2025	\N	+77070000074	Астана	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
29936c9f-318a-4006-8d41-a1a6cb5225fa	dbe48761-6ad0-4af0-a7ec-5092fd965b93	Нурлан	Муратов	900000000075	4071763f-6bb2-4bd8-9403-4c5da0709695	{Vue.js,Kotlin,Docker,Python,TypeScript}	3.59	Information Systems	2025	\N	+77070000075	Алматы	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
887629a1-8a6a-4b36-8800-30a1c3efe937	f72ecafa-c240-46af-97e6-fd19fa96e89f	Жандос	Исмаилов	900000000076	4071763f-6bb2-4bd8-9403-4c5da0709695	{GraphQL,Redis,Kubernetes}	2.93	Data Science	2024	\N	+77070000076	Атырау	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
7e089128-4d23-4603-933e-d95505e960e7	3a58360c-640f-4e4a-bbf8-52d0f2a8cbcd	Жулдыз	Сейткалиа	900000000077	4071763f-6bb2-4bd8-9403-4c5da0709695	{Kotlin,SQL,Node.js,Kubernetes,GraphQL,C++}	3.9	Computer Science	2024	\N	+77070000077	Алматы	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
68878cb0-ffdd-431e-97b5-8478193a7738	413abf52-0f4e-4c1c-8db8-7e524cd9fa48	Алибек	Муратов	900000000078	4071763f-6bb2-4bd8-9403-4c5da0709695	{Kotlin,Docker,JavaScript,Angular,Python}	3.49	Data Science	2025	\N	+77070000078	Тараз	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
01173475-7f99-4461-95d8-0eb76d9422d0	cc53a16f-1357-40e8-b40f-614a9ed4e406	Камила	Абенова	900000000079	4071763f-6bb2-4bd8-9403-4c5da0709695	{MongoDB,"Machine Learning",PostgreSQL,JavaScript,Python,GraphQL}	2.82	Software Engineering	2026	\N	+77070000079	Астана	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
8c698ef0-ac34-42b3-a25a-c52ecc67fcc9	6a2e1af2-b8e1-4f79-b7c9-11539e9ff26d	Індіра	Касымова	900000000080	4071763f-6bb2-4bd8-9403-4c5da0709695	{GraphQL,Node.js,Angular}	3.35	Software Engineering	2024	\N	+77070000080	Актобе	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
75e769e8-b2b0-428e-ae18-9adb78223054	7752bc47-57d3-49b1-b671-d708854f3df5	Динара	Темірбекова	900000000081	4071763f-6bb2-4bd8-9403-4c5da0709695	{PostgreSQL,SQL,Kotlin,Docker,C++}	3.91	Computer Science	2025	\N	+77070000081	Шымкент	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
1f667486-adaf-4932-b794-c149f849b94c	127eaed6-72e1-41fb-9702-4a330da0706a	Зарина	Касымова	900000000082	4071763f-6bb2-4bd8-9403-4c5da0709695	{C++,Python,SQL,Redis,Docker}	3.64	Data Science	2026	\N	+77070000082	Тараз	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
feb49e7e-b623-4496-912a-c475fc140f03	9a3ba427-98e3-4e31-9041-0dbac5c13cd3	Індіра	Темірбекова	900000000083	4071763f-6bb2-4bd8-9403-4c5da0709695	{Docker,GraphQL,Node.js,Vue.js}	3.17	Artificial Intelligence	2026	\N	+77070000083	Алматы	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
4c9208b7-bf3a-490d-80a2-daf3aaa44b4d	f5c59071-c8c1-4ced-953e-1063db0bfa8f	Тимур	Сейткали	900000000084	4071763f-6bb2-4bd8-9403-4c5da0709695	{JavaScript,Kotlin,PostgreSQL,Redis}	3.81	Data Science	2024	\N	+77070000084	Шымкент	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
f03436ea-024e-4b9d-99c9-5deb3256ae79	9cecbf98-4618-4026-907a-7b2569d7780f	Арман	Касымов	900000000087	4071763f-6bb2-4bd8-9403-4c5da0709695	{PostgreSQL,C++,SQL,Python,Redis}	3.82	Information Systems	2026	\N	+77070000087	Шымкент	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
d10c4071-dd6e-41ee-bec9-7ce375bac2fe	78b690ac-fd00-410d-94a2-dd13d9c0916e	Ерлан	Қожахметов	900000000088	4071763f-6bb2-4bd8-9403-4c5da0709695	{MongoDB,Java,TypeScript,C++,"Machine Learning",Docker}	2.54	Information Systems	2026	\N	+77070000088	Усть-Каменогорск	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
7247a327-ee65-42ba-9431-f8dedce68ffa	67fa1abf-4413-4160-a6b6-6f0d9868eccb	Меруерт	Дюсенова	900000000089	4071763f-6bb2-4bd8-9403-4c5da0709695	{Go,React,Redis,Kubernetes}	3.72	Software Engineering	2025	\N	+77070000089	Актобе	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
c2a14853-b763-4013-bfa9-9c34a479c356	15f945c6-f64e-4ec9-9617-6f0c392ad579	Динара	Темірбекова	900000000004	4071763f-6bb2-4bd8-9403-4c5da0709695	{Swift,Kotlin,Angular,Kubernetes}	2.53	Computer Science	2026	\N	+77070000004	Атырау	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
75cbe398-d697-4927-8165-6dfb1ec80086	704af84a-9915-47c6-a4d7-b2c253c9ece1	Динара	Сейткалиа	900000000005	4071763f-6bb2-4bd8-9403-4c5da0709695	{TypeScript,Swift,"Machine Learning",Java}	3.74	Software Engineering	2026	\N	+77070000005	Атырау	\N	f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 13:55:08.848697+00
43a314da-dd8f-4c8e-ab34-49d2ce4a6d24	4cf67c69-2c38-4aec-a2d1-6241f495fcfb	Молдір	Сарсенова	900000000090	4071763f-6bb2-4bd8-9403-4c5da0709695	{JavaScript,Go,Kubernetes,TypeScript,Kotlin,React}	3.45	Artificial Intelligence	2026	\N	+77070000090	Атырау	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
fc3f7121-9c4a-43a7-9080-e74f1028e949	8a0ad5e0-5424-46b7-bc60-962f1fcc9e00	Алибек	Нурмагамбетов	900000000091	4071763f-6bb2-4bd8-9403-4c5da0709695	{SQL,TypeScript,JavaScript,Go,GraphQL,Angular}	3.63	Mobile Development	2025	\N	+77070000091	Усть-Каменогорск	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
3c0c68d0-cade-4152-87d1-d7d431df2b20	7e8e5d6d-a992-42fd-a9e8-6e847077786e	Меруерт	Темірбекова	900000000092	4071763f-6bb2-4bd8-9403-4c5da0709695	{React,PostgreSQL,MongoDB,JavaScript,Python}	3.18	Artificial Intelligence	2026	\N	+77070000092	Атырау	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
f76c90ab-66f6-40bd-98ea-8150fd66dbae	f57960d8-67d3-4901-bbf5-ad0ed1735213	Жансая	Муратова	900000000093	4071763f-6bb2-4bd8-9403-4c5da0709695	{SQL,React,JavaScript}	3.94	Data Science	2024	\N	+77070000093	Алматы	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
e56ee1f2-f679-40ce-900d-77dad203f08e	4612017d-0f7e-489c-9028-f3e1e7c68397	Санжар	Дюсенов	900000000094	4071763f-6bb2-4bd8-9403-4c5da0709695	{Vue.js,TypeScript,Node.js,Docker,JavaScript}	2.57	Artificial Intelligence	2026	\N	+77070000094	Астана	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
2a281efc-ad88-4556-bd0f-3b665a893363	2dc7eace-bac3-434f-8a64-da93b7e087cf	Тимур	Нурмагамбетов	900000000085	4071763f-6bb2-4bd8-9403-4c5da0709695	{Go,GraphQL,C++,SQL}	2.82	Applied Mathematics	2024	\N	+77070000085	Усть-Каменогорск	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
536448d5-6921-4612-b4c3-61b1d786b0c7	bf2ace9c-5daf-4e4c-bd5b-d5d6148751f4	Алибек	Жумабеков	900000000095	4071763f-6bb2-4bd8-9403-4c5da0709695	{"Machine Learning",TypeScript,Docker,PostgreSQL,MongoDB,React}	3.0	Mobile Development	2026	\N	+77070000095	Алматы	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
210f9743-bbc7-4b47-8dac-7f7e9d160d22	b274610f-e66d-4d6e-8f7f-f526b81b36da	Динара	Абенова	900000000003	4071763f-6bb2-4bd8-9403-4c5da0709695	{GraphQL,PostgreSQL,React,Node.js,Swift}	3.7	Data Science	2024		+77070000003	Астана		f	\N	2026-05-19 13:55:08.848697+00	2026-05-20 14:04:19.345413+00
3b5a4257-58d0-4b5c-b4a4-75cfd22a621b	10cfa91d-805e-4b43-9443-36149b6b584d	Алия	Касымова	900000000096	4071763f-6bb2-4bd8-9403-4c5da0709695	{Java,SQL,TypeScript,Vue.js}	3.0	Cybersecurity	2024	\N	+77070000096	Шымкент	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
450fa6d8-f042-428c-babc-43a46a8be8b9	6bf043aa-4d57-4491-a628-ce3917f52c77	Болат	Ахметов	900000000061	4071763f-6bb2-4bd8-9403-4c5da0709695	{Docker,SQL,React,"Machine Learning",Kubernetes,C++}	2.67	Mobile Development	2025	\N	+77070000061	Шымкент	\N	f	\N	2026-05-19 13:55:09.239595+00	2026-05-19 13:55:09.239595+00
35f0b3c3-d89a-42f0-96d0-b2c6694188ae	99c81e97-6679-44af-a752-155304500a2a	Азамат	Касымов	900000000097	4071763f-6bb2-4bd8-9403-4c5da0709695	{"Machine Learning",Kotlin,Redis,PostgreSQL,Go,React}	3.47	Computer Engineering	2026	\N	+77070000097	Алматы	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
81dd06b1-4ccc-4920-9c05-68d35161c608	5fbb9ee5-a4ab-463f-bedc-5069e7b2d18d	Азамат	Байжанов	900000000098	4071763f-6bb2-4bd8-9403-4c5da0709695	{Java,PostgreSQL,MongoDB,Node.js,Redis,SQL}	3.59	Applied Mathematics	2025	\N	+77070000098	Астана	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
fccca695-cb40-4cf2-abb3-6ab8ee9bd13d	5386ce0a-8809-44bc-a41e-1fe9c037cdd4	Зарина	Исмаилова	900000000099	4071763f-6bb2-4bd8-9403-4c5da0709695	{Angular,TypeScript,"Machine Learning"}	3.68	Computer Engineering	2026	\N	+77070000099	Павлодар	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
6f38d922-219d-4621-a306-c6ce52453f04	46637634-6de6-4c2c-b97c-c800fe5985d9	Тимур	Сейткали	900000000100	4071763f-6bb2-4bd8-9403-4c5da0709695	{Docker,Java,Python}	3.37	Artificial Intelligence	2024	\N	+77070000100	Усть-Каменогорск	\N	f	\N	2026-05-19 13:55:10.049569+00	2026-05-19 13:55:10.049569+00
907edfea-4ede-4706-9f91-1f293808662d	836196ba-a326-40b4-8f53-4063540020f2	Ботакөз	Тулеугалиа	900000000001	4071763f-6bb2-4bd8-9403-4c5da0709695	{Redis,Python,React,Docker}	2.8	Web Development	2025		+77070000001	Шымкент		f	\N	2026-05-19 13:55:08.848697+00	2026-05-19 14:19:25.463322+00
5f79c310-e17d-4133-b75d-bf201726cb11	43b3a982-da41-4cd4-b941-fdd34c04e24f	Аскар	Аскаров	060728533444	4071763f-6bb2-4bd8-9403-4c5da0709695	{Typescript,React,Git,Docker}	3.4	Software Engineering	2025	Frontend	+7 (700) 771-85-85	Астана	https://github.com/Zhan028	t	2026-05-11 10:55:13.452603+00	2026-05-11 10:55:13.453406+00	2026-05-20 14:04:53.250593+00
\.


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: push_tokens push_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_tokens
    ADD CONSTRAINT push_tokens_pkey PRIMARY KEY (id);


--
-- Name: push_tokens push_tokens_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_tokens
    ADD CONSTRAINT push_tokens_user_id_key UNIQUE (user_id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: students uni_students_iin; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT uni_students_iin UNIQUE (iin);


--
-- Name: students uni_students_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT uni_students_user_id UNIQUE (user_id);


--
-- Name: idx_documents_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_documents_user_id ON public.documents USING btree (user_id);


--
-- Name: idx_notifications_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_notifications_user_id ON public.notifications USING btree (user_id);


--
-- Name: idx_push_tokens_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_push_tokens_user_id ON public.push_tokens USING btree (user_id);


--
-- PostgreSQL database dump complete
--

\unrestrict mbAy63xxTn6MfNgmanf27iTV4e1QKqUKJiUZdOPYEkfLhRGzz9b2axM8x3lnFkp

