--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: asisten; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA asisten;


ALTER SCHEMA asisten OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: soal; Type: TABLE; Schema: asisten; Owner: postgres
--

CREATE TABLE asisten.soal (
    user_id integer NOT NULL,
    soal_inggris json NOT NULL,
    soal_teori_program json NOT NULL,
    soal_teori_extra json NOT NULL,
    soal_program text NOT NULL
);


ALTER TABLE asisten.soal OWNER TO postgres;

--
-- Name: soal_user_id_seq; Type: SEQUENCE; Schema: asisten; Owner: postgres
--

CREATE SEQUENCE asisten.soal_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE asisten.soal_user_id_seq OWNER TO postgres;

--
-- Name: soal_user_id_seq; Type: SEQUENCE OWNED BY; Schema: asisten; Owner: postgres
--

ALTER SEQUENCE asisten.soal_user_id_seq OWNED BY asisten.soal.user_id;


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: asisten; Owner: postgres
--

CREATE SEQUENCE asisten.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE asisten.user_id_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: asisten; Owner: postgres
--

CREATE TABLE asisten.users (
    user_id integer DEFAULT nextval('asisten.user_id_seq'::regclass) NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    npm text NOT NULL,
    kelas text NOT NULL,
    handphone text NOT NULL,
    password text NOT NULL
);


ALTER TABLE asisten.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: asisten; Owner: postgres
--

CREATE SEQUENCE asisten.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE asisten.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: asisten; Owner: postgres
--

ALTER SEQUENCE asisten.users_user_id_seq OWNED BY asisten.users.user_id;


--
-- Name: account_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_role (
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    grant_date timestamp with time zone NOT NULL
);


ALTER TABLE public.account_role OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_role_id_seq OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(225) NOT NULL,
    password character varying(225) NOT NULL,
    email character varying(355) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    last_login timestamp without time zone,
    last_modified timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: soal user_id; Type: DEFAULT; Schema: asisten; Owner: postgres
--

ALTER TABLE ONLY asisten.soal ALTER COLUMN user_id SET DEFAULT nextval('asisten.soal_user_id_seq'::regclass);


--
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.role_role_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: soal; Type: TABLE DATA; Schema: asisten; Owner: postgres
--

COPY asisten.soal (user_id, soal_inggris, soal_teori_program, soal_teori_extra, soal_program) FROM stdin;
\.


--
-- Name: soal_user_id_seq; Type: SEQUENCE SET; Schema: asisten; Owner: postgres
--

SELECT pg_catalog.setval('asisten.soal_user_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: asisten; Owner: postgres
--

SELECT pg_catalog.setval('asisten.user_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: asisten; Owner: postgres
--

COPY asisten.users (user_id, username, email, npm, kelas, handphone, password) FROM stdin;
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: asisten; Owner: postgres
--

SELECT pg_catalog.setval('asisten.users_user_id_seq', 1, false);


--
-- Data for Name: account_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_role (user_id, role_id, grant_date) FROM stdin;
414	2	2018-01-31 10:00:41.625+07
423	2	2018-01-31 18:04:44.6+07
421	2	2018-01-31 10:15:40.214+07
420	2	2018-01-31 10:13:19.069+07
416	2	2018-01-31 10:03:09.984+07
444	2	2018-02-04 23:13:43.734+07
436	1	2018-01-31 20:21:56.213+07
442	1	2018-02-04 23:07:29.932+07
422	2	2018-01-31 12:49:08.96+07
440	1	2018-02-04 23:06:29.322+07
439	1	2018-02-03 14:09:09.297+07
415	1	2018-01-31 10:01:34.743+07
445	1	2018-02-04 23:15:15.211+07
446	2	2018-02-11 17:15:41.937+07
447	2	2018-02-11 17:17:01.351+07
410	2	2018-01-25 21:10:38+07
234	1	2017-12-12 14:09:19+07
448	2	2018-02-18 20:04:58.015+07
443	1	2018-02-04 23:11:09.384+07
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (role_id, role_name) FROM stdin;
1	administrator
2	writer
\.


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_role_id_seq', 2, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password, email, created_on, last_login, last_modified) FROM stdin;
448	Saya	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	saya@gmail.com	2018-02-18 20:04:58.008	2018-02-18 20:05:16.329	\N
234	Faisal Arkanaaa	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	faisalarkan21@gmail.com	2017-12-12 14:09:19	2018-04-17 18:46:58.022	2018-02-15 12:55:15.046
443	ZOzzzvvcccxccx	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	ojo2x@gmail.com	2018-02-04 23:11:09.376	\N	2018-04-17 18:47:10.332
445	Opyyyyyyyyyyyyyyyy	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	dsldfdslkjfk@gmail.com	2018-02-04 23:15:15.206	\N	2018-02-11 09:21:27.201
440	Ojolali Uyehaa	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	ojo@gmail.com	2018-02-04 23:06:29.315	\N	2018-02-10 21:34:16.108
446	Lili Sukaisin	79b1e59ff838c33d61a5d23a01072dcbc63ade457a377582fef21e054a6f0c7e738b695eac13ecb4b2c81b1d875dbec5484fed8a990e1f039a2dda6934b3f8ba	lili@gmail.com	2018-02-11 17:15:41.929	\N	\N
439	Snap Dog	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	snap@gmail.com	2018-02-03 14:09:09.267	2018-02-03 18:24:29.068	2018-02-04 20:39:27.467
414	ASaya Makanasad	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	Sjdjd@gmail.om	2018-01-31 10:00:41.619	\N	2018-02-04 00:43:08.466
416	Dkdfjdshfjjd	e84acf6e6d0c98117014a9ed4eb06cebf068be33d8665a2ba7f5f380ce9356f4b907641c942ed936b0b81381768123121223e89fea89ca07847d64d098fd1b23	Ssjsdfjdshfjdsh@gmail.com	2018-01-31 10:03:09.98	\N	2018-02-04 22:58:46.225
423	Dery Irawanaaaaa	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	Dery@gmail.com	2018-01-31 18:04:44.593	\N	2018-02-04 23:03:16.92
444	Asdsad	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	sadsad@gmai.com	2018-02-04 23:13:43.729	\N	\N
410	lea asaki	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	lea@gmail.com	2018-01-25 21:10:38	2018-02-16 09:55:35.474	2018-02-11 23:03:49.353
420	Aasidsakdasjk	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	Skxcnbvkb@gmail.com	2018-01-31 10:13:19.064	\N	2018-02-03 19:08:59.927
421	Djhjfhdjkhsdjfhkjhsdj	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	Zkxcncnzncdj@gmail.com	2018-01-31 10:15:40.202	\N	2018-02-10 20:45:20.765
436	Coba5aaaaaaa	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	coba5@gmail.com	2018-01-31 20:21:56.207	\N	2018-02-10 20:46:14.327
442	Ojalali Uyeh	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	ojo1@gmail.com	2018-02-04 23:07:29.931	\N	2018-02-10 20:47:02.918
422	Zxczxcjzhxcjhjzxcsaa	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	Skdfkjxcbvnxbvd@gmail.com	2018-01-31 12:49:08.945	\N	2018-02-10 21:29:28.563
415	Sasjdhsajdh	f9e90e0d8c82bd32b75099e6c284d87b89142479e9291d272cbcda9e12458245778da15bbb48a52bd6aea6395b792e7d16cb1769d4eef9ab2d041e07d94edb69	Dhsajkhbsdjsaj@gmail.com	2018-01-31 10:01:34.729	\N	2018-02-11 06:31:22.906
447	Lili2	79b1e59ff838c33d61a5d23a01072dcbc63ade457a377582fef21e054a6f0c7e738b695eac13ecb4b2c81b1d875dbec5484fed8a990e1f039a2dda6934b3f8ba	lili2@gmail.com	2018-02-11 17:17:01.345	\N	\N
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 448, true);


--
-- Name: soal soal_pkey; Type: CONSTRAINT; Schema: asisten; Owner: postgres
--

ALTER TABLE ONLY asisten.soal
    ADD CONSTRAINT soal_pkey PRIMARY KEY (user_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: asisten; Owner: postgres
--

ALTER TABLE ONLY asisten.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: asisten; Owner: postgres
--

ALTER TABLE ONLY asisten.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: account_role account_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_role
    ADD CONSTRAINT account_role_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- Name: role role_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_role_name_key UNIQUE (role_name);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: account_role account_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_role
    ADD CONSTRAINT account_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(role_id);


--
-- Name: account_role account_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_role
    ADD CONSTRAINT account_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

