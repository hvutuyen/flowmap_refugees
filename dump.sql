--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: geosyrienapp_refugees2011; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geosyrienapp_refugees2011 (
    "Id" integer NOT NULL,
    land character varying(100) NOT NULL,
    pop double precision,
    "refRatio" double precision,
    "refTotal" double precision,
    male double precision,
    female double precision,
    u18 double precision,
    u18erstantrag double precision,
    u34 double precision,
    u34erstantrag double precision,
    u64 double precision,
    u64erstantrag double precision,
    ue65 double precision,
    ue65erstantrag double precision,
    unknown double precision,
    erstantrag double precision,
    folgeantrag double precision,
    geom public.geometry(Point,4326) NOT NULL,
    haltung text
);


--
-- Name: geosyrienapp_refugees2012; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geosyrienapp_refugees2012 (
    "Id" integer NOT NULL,
    land character varying(100) NOT NULL,
    pop double precision,
    "refRatio" double precision,
    "refTotal" double precision,
    male double precision,
    female double precision,
    u18 double precision,
    u18erstantrag double precision,
    u34 double precision,
    u34erstantrag double precision,
    u64 double precision,
    u64erstantrag double precision,
    ue65 double precision,
    ue65erstantrag double precision,
    unknown double precision,
    erstantrag double precision,
    folgeantrag double precision,
    geom public.geometry(Point,4326) NOT NULL,
    haltung text
);


--
-- Name: geosyrienapp_refugees2013; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geosyrienapp_refugees2013 (
    "Id" integer NOT NULL,
    land character varying(100) NOT NULL,
    pop double precision,
    "refRatio" double precision,
    "refTotal" double precision,
    male double precision,
    female double precision,
    u18 double precision,
    u18erstantrag double precision,
    u34 double precision,
    u34erstantrag double precision,
    u64 double precision,
    u64erstantrag double precision,
    ue65 double precision,
    ue65erstantrag double precision,
    unknown double precision,
    erstantrag double precision,
    folgeantrag double precision,
    geom public.geometry(Point,4326) NOT NULL,
    haltung text
);


--
-- Name: geosyrienapp_refugees2014; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geosyrienapp_refugees2014 (
    "Id" integer NOT NULL,
    land character varying(100) NOT NULL,
    pop double precision,
    "refRatio" double precision,
    "refTotal" double precision,
    male double precision,
    female double precision,
    u18 double precision,
    u18erstantrag double precision,
    u34 double precision,
    u34erstantrag double precision,
    u64 double precision,
    u64erstantrag double precision,
    ue65 double precision,
    ue65erstantrag double precision,
    unknown double precision,
    erstantrag double precision,
    folgeantrag double precision,
    geom public.geometry(Point,4326) NOT NULL,
    haltung text
);


--
-- Name: geosyrienapp_refugees2015; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geosyrienapp_refugees2015 (
    "Id" integer NOT NULL,
    land character varying(100) NOT NULL,
    pop double precision,
    "refRatio" double precision,
    "refTotal" double precision,
    male double precision,
    female double precision,
    u18 double precision,
    u18erstantrag double precision,
    u34 double precision,
    u34erstantrag double precision,
    u64 double precision,
    u64erstantrag double precision,
    ue65 double precision,
    ue65erstantrag double precision,
    unknown double precision,
    erstantrag double precision,
    folgeantrag double precision,
    geom public.geometry(Point,4326) NOT NULL,
    haltung text
);


--
-- Name: geosyrienapp_refugees2016; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geosyrienapp_refugees2016 (
    "Id" integer NOT NULL,
    land character varying(100) NOT NULL,
    pop double precision,
    "refRatio" double precision,
    "refTotal" double precision,
    male double precision,
    female double precision,
    u18 double precision,
    u18erstantrag double precision,
    u34 double precision,
    u34erstantrag double precision,
    u64 double precision,
    u64erstantrag double precision,
    ue65 double precision,
    ue65erstantrag double precision,
    unknown double precision,
    erstantrag double precision,
    folgeantrag double precision,
    geom public.geometry(Point,4326) NOT NULL,
    haltung text
);


--
-- Name: geosyrienapp_refugees2017; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geosyrienapp_refugees2017 (
    "Id" integer NOT NULL,
    land character varying(100) NOT NULL,
    pop double precision,
    "refRatio" double precision,
    "refTotal" double precision,
    male double precision,
    female double precision,
    u18 double precision,
    u18erstantrag double precision,
    u34 double precision,
    u34erstantrag double precision,
    u64 double precision,
    u64erstantrag double precision,
    ue65 double precision,
    ue65erstantrag double precision,
    unknown double precision,
    erstantrag double precision,
    folgeantrag double precision,
    geom public.geometry(Point,4326) NOT NULL,
    haltung text
);


--
-- Name: geosyrienapp_refugees2018; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geosyrienapp_refugees2018 (
    "Id" integer NOT NULL,
    land character varying(100) NOT NULL,
    pop double precision,
    "refRatio" double precision,
    "refTotal" double precision,
    male double precision,
    female double precision,
    u18 double precision,
    u18erstantrag double precision,
    u34 double precision,
    u34erstantrag double precision,
    u64 double precision,
    u64erstantrag double precision,
    ue65 double precision,
    ue65erstantrag double precision,
    unknown double precision,
    erstantrag double precision,
    folgeantrag double precision,
    geom public.geometry(Point,4326) NOT NULL,
    haltung text
);


--
-- Name: geosyrienapp_waterconsumption; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geosyrienapp_waterconsumption (
    "Id" integer NOT NULL,
    "Suburb" character varying(100) NOT NULL,
    "NoOfSingleResProp" integer NOT NULL,
    "AvgMonthlyKL" integer NOT NULL,
    "AvgMonthlyKLPredicted" integer NOT NULL,
    "PredictionAccuracy" integer NOT NULL,
    "Month" character varying(50) NOT NULL,
    "Year" integer NOT NULL,
    "DateTime" timestamp with time zone NOT NULL,
    geom public.geometry(Point,4326) NOT NULL
);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add water consumption	7	add_waterconsumption
26	Can change water consumption	7	change_waterconsumption
27	Can delete water consumption	7	delete_waterconsumption
28	Can view water consumption	7	view_waterconsumption
29	Can add refugees2011	8	add_refugees2011
30	Can change refugees2011	8	change_refugees2011
31	Can delete refugees2011	8	delete_refugees2011
32	Can view refugees2011	8	view_refugees2011
33	Can add refugees2012	9	add_refugees2012
34	Can change refugees2012	9	change_refugees2012
35	Can delete refugees2012	9	delete_refugees2012
36	Can view refugees2012	9	view_refugees2012
37	Can add refugees2013	10	add_refugees2013
38	Can change refugees2013	10	change_refugees2013
39	Can delete refugees2013	10	delete_refugees2013
40	Can view refugees2013	10	view_refugees2013
41	Can add refugees2014	11	add_refugees2014
42	Can change refugees2014	11	change_refugees2014
43	Can delete refugees2014	11	delete_refugees2014
44	Can view refugees2014	11	view_refugees2014
45	Can add refugees2015	12	add_refugees2015
46	Can change refugees2015	12	change_refugees2015
47	Can delete refugees2015	12	delete_refugees2015
48	Can view refugees2015	12	view_refugees2015
49	Can add refugees2016	13	add_refugees2016
50	Can change refugees2016	13	change_refugees2016
51	Can delete refugees2016	13	delete_refugees2016
52	Can view refugees2016	13	view_refugees2016
53	Can add refugees2017	14	add_refugees2017
54	Can change refugees2017	14	change_refugees2017
55	Can delete refugees2017	14	delete_refugees2017
56	Can view refugees2017	14	view_refugees2017
57	Can add refugees2018	15	add_refugees2018
58	Can change refugees2018	15	change_refugees2018
59	Can delete refugees2018	15	delete_refugees2018
60	Can view refugees2018	15	view_refugees2018
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$t7wy8dWsXqfB$0dymcVGuoe1/jnaUM36pN1I7qxpbdUQLDAY5ORHMDVg=	2020-04-30 02:07:53.460432+02	t	wsgusers				t	t	2019-11-08 01:32:54.015881+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-02-18 13:48:23.729735+01	31	E-Schweiz	2	[{"changed": {"fields": ["land", "unknown"]}}]	9	1
2	2020-02-18 13:48:32.678077+01	30	E-Norwegen	2	[{"changed": {"fields": ["land", "unknown"]}}]	9	1
3	2020-02-18 13:48:40.82912+01	29	E-Liechtenstein	2	[{"changed": {"fields": ["land", "pop", "refRatio", "u18erstantrag", "u34erstantrag", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag"]}}]	9	1
4	2020-02-18 13:48:52.370266+01	28	E-Island	2	[{"changed": {"fields": ["land", "u18erstantrag", "u34erstantrag", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag"]}}]	9	1
5	2020-02-18 14:20:17.230375+01	33	N-Libanon	1	[{"added": {}}]	8	1
6	2020-02-18 14:37:10.125858+01	34	N-Jordanien	1	[{"added": {}}]	8	1
7	2020-02-18 14:38:38.776869+01	34	N-Jordanien	3		8	1
8	2020-02-18 14:38:38.779935+01	33	N-Libanon	3		8	1
9	2020-02-18 14:38:53.21273+01	31	ESchweiz	2	[{"changed": {"fields": ["land"]}}]	9	1
10	2020-02-18 14:39:01.463386+01	30	ENorwegen	2	[{"changed": {"fields": ["land"]}}]	9	1
11	2020-02-18 14:39:13.291727+01	29	ELiechtenstein	2	[{"changed": {"fields": ["land"]}}]	9	1
12	2020-02-18 14:39:22.631525+01	28	EIsland	2	[{"changed": {"fields": ["land"]}}]	9	1
13	2020-03-03 18:57:34.877947+01	37	N-Tuerkei	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	15	1
14	2020-03-03 19:00:25.957539+01	0	Deutschland	2	[{"changed": {"fields": ["unknown", "folgeantrag"]}}]	15	1
15	2020-03-03 19:31:16.129821+01	36	N-Aegypten	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	15	1
16	2020-03-03 19:32:19.791265+01	35	N-Irak	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	15	1
17	2020-03-03 19:34:49.303897+01	34	N-Israel	2	[{"changed": {"fields": ["refRatio", "refTotal", "male", "female", "u18", "u18erstantrag", "u34", "u34erstantrag", "u64", "u64erstantrag", "ue65", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	15	1
18	2020-03-03 19:35:25.469806+01	33	N-Libanon	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	15	1
19	2020-03-03 19:45:36.070829+01	1	Schweden	2	[{"changed": {"fields": ["unknown"]}}]	15	1
20	2020-03-03 19:45:43.00749+01	2	Belgien	2	[{"changed": {"fields": ["unknown"]}}]	15	1
21	2020-03-03 19:45:56.363296+01	3	Bulgarien	2	[{"changed": {"fields": ["unknown"]}}]	15	1
22	2020-03-03 19:46:04.590254+01	4	Daenemark	2	[{"changed": {"fields": ["unknown"]}}]	15	1
23	2020-03-03 19:46:13.889947+01	5	Estland	2	[{"changed": {"fields": ["unknown"]}}]	15	1
24	2020-03-03 19:46:20.413815+01	6	Finnland	2	[{"changed": {"fields": ["unknown"]}}]	15	1
25	2020-03-03 19:46:28.007619+01	7	Frankreich	2	[{"changed": {"fields": ["unknown"]}}]	15	1
26	2020-03-03 19:46:53.009455+01	9	Griechenland	2	[{"changed": {"fields": ["unknown"]}}]	15	1
27	2020-03-03 19:48:04.035392+01	18	Polen	2	[{"changed": {"fields": ["unknown"]}}]	15	1
28	2020-03-03 19:48:18.630234+01	19	Portugal	2	[{"changed": {"fields": ["unknown"]}}]	15	1
29	2020-03-03 19:48:28.308687+01	20	Rumaenien	2	[{"changed": {"fields": ["unknown"]}}]	15	1
30	2020-03-03 19:48:36.324744+01	21	Slowakei	2	[{"changed": {"fields": ["unknown"]}}]	15	1
31	2020-03-03 19:48:42.046391+01	22	Slowenien	2	[{"changed": {"fields": ["unknown"]}}]	15	1
32	2020-03-03 19:48:47.367968+01	23	Spanien	2	[{"changed": {"fields": ["unknown"]}}]	15	1
33	2020-03-03 19:48:56.731097+01	24	Tschechien	2	[{"changed": {"fields": ["unknown"]}}]	15	1
34	2020-03-03 19:49:01.65397+01	25	Ungarn	2	[{"changed": {"fields": ["unknown"]}}]	15	1
35	2020-03-03 19:49:09.50554+01	26	Vereinigtes Koenigreich	2	[{"changed": {"fields": ["unknown"]}}]	15	1
36	2020-03-03 19:49:17.2405+01	27	Zypern	2	[{"changed": {"fields": ["unknown"]}}]	15	1
37	2020-03-03 19:49:31.63271+01	28	E-Island	2	[{"changed": {"fields": ["land", "unknown"]}}]	15	1
38	2020-03-03 19:49:43.864067+01	29	E-Liechtenstein	2	[{"changed": {"fields": ["land", "pop", "refRatio", "unknown"]}}]	15	1
39	2020-03-03 19:49:51.620276+01	30	E-Norwegen	2	[{"changed": {"fields": ["land", "unknown"]}}]	15	1
40	2020-03-03 19:50:01.984386+01	31	E-Schweiz	2	[{"changed": {"fields": ["land", "unknown"]}}]	15	1
41	2020-03-03 19:50:08.544671+01	32	N-Jordanien	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	15	1
42	2020-03-03 19:50:16.269918+01	33	N-Libanon	2	[]	15	1
43	2020-03-03 19:50:20.710033+01	34	N-Israel	2	[]	15	1
44	2020-03-03 19:50:24.746154+01	35	N-Irak	2	[]	15	1
45	2020-03-05 13:59:46.925031+01	37	N-Tuerkei	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	8	1
46	2020-03-05 13:59:52.276866+01	36	N-Aegypten	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	8	1
47	2020-03-05 13:59:58.631424+01	35	N-Irak	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	8	1
48	2020-03-05 14:00:08.087784+01	34	N-Israel	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	8	1
49	2020-03-05 14:00:14.359657+01	33	N-Libanon	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "erstantrag", "folgeantrag"]}}]	8	1
50	2020-03-05 14:00:20.823229+01	32	N-Jordanien	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	8	1
51	2020-03-05 14:00:29.033758+01	31	E-Schweiz	2	[{"changed": {"fields": ["land", "unknown"]}}]	8	1
52	2020-03-05 14:00:38.45605+01	30	E-Norwegen	2	[{"changed": {"fields": ["land", "unknown"]}}]	8	1
53	2020-03-05 14:00:47.126521+01	29	E-Liechtenstein	2	[{"changed": {"fields": ["land", "pop", "refRatio", "refTotal", "male", "female", "u18", "u18erstantrag", "u34", "u34erstantrag", "u64", "u64erstantrag", "ue65", "ue65erstantrag", "unknown", "erstantrag"]}}]	8	1
54	2020-03-05 14:00:56.441147+01	28	E-Island	2	[{"changed": {"fields": ["land", "refTotal", "male", "female", "u18", "u18erstantrag", "u34", "u34erstantrag", "u64", "u64erstantrag", "ue65", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	8	1
55	2020-03-05 14:01:04.178106+01	27	Zypern	2	[{"changed": {"fields": ["unknown"]}}]	8	1
56	2020-03-05 14:01:15.393043+01	26	Vereinigtes Koenigreich	2	[{"changed": {"fields": ["unknown"]}}]	8	1
57	2020-03-05 14:01:21.499074+01	25	Ungarn	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag"]}}]	8	1
58	2020-03-05 14:01:29.7894+01	24	Tschechien	2	[{"changed": {"fields": ["unknown"]}}]	8	1
59	2020-03-05 14:01:37.284053+01	23	Spanien	2	[{"changed": {"fields": ["unknown"]}}]	8	1
60	2020-03-05 14:01:49.301463+01	22	Slowenien	2	[{"changed": {"fields": ["unknown"]}}]	8	1
61	2020-03-05 14:02:08.314111+01	21	Slowakei	2	[{"changed": {"fields": ["unknown"]}}]	8	1
62	2020-03-05 14:02:16.665987+01	21	Slowakei	2	[]	8	1
63	2020-03-05 14:02:23.547955+01	20	Rumaenien	2	[{"changed": {"fields": ["unknown"]}}]	8	1
64	2020-03-05 14:02:35.380193+01	19	Portugal	2	[{"changed": {"fields": ["unknown"]}}]	8	1
65	2020-03-05 14:02:45.651498+01	18	Polen	2	[{"changed": {"fields": ["unknown"]}}]	8	1
66	2020-03-05 14:02:56.637069+01	17	Oesterreich	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64erstantrag", "ue65erstantrag"]}}]	8	1
67	2020-03-05 14:03:51.359506+01	11	Kroatien	2	[{"changed": {"fields": ["refRatio", "refTotal", "male", "female", "u18", "u18erstantrag", "u34", "u34erstantrag", "u64", "u64erstantrag", "ue65", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	8	1
68	2020-03-05 14:04:26.466233+01	7	Frankreich	2	[{"changed": {"fields": ["unknown", "folgeantrag"]}}]	8	1
69	2020-03-05 14:04:36.723542+01	7	Frankreich	2	[]	8	1
70	2020-03-05 14:04:46.134108+01	6	Finnland	2	[{"changed": {"fields": ["u18", "u34", "u64", "ue65", "ue65erstantrag", "unknown", "erstantrag"]}}]	8	1
71	2020-03-05 14:04:55.306309+01	5	Estland	2	[{"changed": {"fields": ["unknown"]}}]	8	1
72	2020-03-05 14:05:09.719826+01	4	Daenemark	2	[{"changed": {"fields": ["u18", "u18erstantrag", "unknown"]}}]	8	1
73	2020-03-05 14:05:16.824949+01	3	Bulgarien	2	[{"changed": {"fields": ["unknown"]}}]	8	1
74	2020-03-05 14:05:25.744406+01	2	Belgien	2	[{"changed": {"fields": ["unknown"]}}]	8	1
75	2020-03-05 14:05:32.768605+01	1	Schweden	2	[{"changed": {"fields": ["unknown"]}}]	8	1
76	2020-03-07 00:41:58.395273+01	37	N-Tuerkei	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "erstantrag", "folgeantrag"]}}]	9	1
77	2020-03-07 00:42:03.214181+01	36	N-Aegypten	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	9	1
78	2020-03-07 00:42:07.929751+01	35	N-Irak	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	9	1
79	2020-03-07 00:42:12.946377+01	34	N-Israel	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	9	1
80	2020-03-07 00:42:18.972773+01	33	N-Libanon	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	9	1
81	2020-03-07 00:42:24.12747+01	33	N-Libanon	2	[]	9	1
82	2020-03-07 00:42:28.624442+01	32	N-Jordanien	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	9	1
83	2020-03-07 00:42:35.542097+01	31	E-Schweiz	2	[{"changed": {"fields": ["land", "unknown"]}}]	9	1
84	2020-03-07 00:42:47.45035+01	30	E-Norwegen	2	[{"changed": {"fields": ["land", "unknown"]}}]	9	1
85	2020-03-07 00:42:55.257779+01	29	E-Liechtenstein	2	[{"changed": {"fields": ["land", "pop", "refRatio", "refTotal", "male", "female", "u18", "u18erstantrag", "u34", "u34erstantrag", "u64", "u64erstantrag", "ue65", "ue65erstantrag", "unknown", "erstantrag"]}}]	9	1
86	2020-03-07 00:43:01.954492+01	28	E-Island	2	[{"changed": {"fields": ["land", "u18erstantrag", "u34erstantrag", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag"]}}]	9	1
87	2020-03-07 00:43:08.251571+01	27	Zypern	2	[{"changed": {"fields": ["unknown"]}}]	9	1
88	2020-03-07 00:43:16.108785+01	26	Vereinigtes Koenigreich	2	[{"changed": {"fields": ["unknown"]}}]	9	1
89	2020-03-07 00:43:22.248637+01	25	Ungarn	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag"]}}]	9	1
90	2020-03-07 00:43:29.327126+01	24	Tschechien	2	[{"changed": {"fields": ["unknown"]}}]	9	1
91	2020-03-07 00:43:44.904448+01	23	Spanien	2	[{"changed": {"fields": ["unknown"]}}]	9	1
92	2020-03-07 00:43:51.077565+01	22	Slowenien	2	[{"changed": {"fields": ["unknown"]}}]	9	1
93	2020-03-07 00:43:59.55863+01	21	Slowakei	2	[{"changed": {"fields": ["unknown"]}}]	9	1
94	2020-03-07 00:44:07.040771+01	20	Rumaenien	2	[{"changed": {"fields": ["unknown"]}}]	9	1
95	2020-03-07 00:44:13.39229+01	19	Portugal	2	[{"changed": {"fields": ["unknown"]}}]	9	1
96	2020-03-07 00:44:22.750186+01	19	Portugal	2	[]	9	1
97	2020-03-07 00:44:28.214025+01	18	Polen	2	[{"changed": {"fields": ["unknown"]}}]	9	1
98	2020-03-07 00:44:36.727001+01	17	Oesterreich	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64erstantrag", "ue65erstantrag"]}}]	9	1
99	2020-03-07 00:45:21.683755+01	11	Kroatien	2	[{"changed": {"fields": ["refRatio", "refTotal", "male", "female", "u18", "u18erstantrag", "u34", "u34erstantrag", "u64", "u64erstantrag", "ue65", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	9	1
100	2020-03-07 00:45:37.845636+01	9	Griechenland	2	[{"changed": {"fields": ["unknown"]}}]	9	1
101	2020-03-07 00:45:53.144914+01	7	Frankreich	2	[{"changed": {"fields": ["unknown"]}}]	9	1
102	2020-03-07 00:46:03.193378+01	6	Finnland	2	[{"changed": {"fields": ["unknown"]}}]	9	1
103	2020-03-07 00:46:14.919406+01	5	Estland	2	[{"changed": {"fields": ["unknown"]}}]	9	1
104	2020-03-07 00:46:22.878602+01	4	Daenemark	2	[{"changed": {"fields": ["unknown"]}}]	9	1
105	2020-03-07 00:46:30.026264+01	3	Bulgarien	2	[{"changed": {"fields": ["unknown"]}}]	9	1
106	2020-03-07 00:46:35.960724+01	2	Belgien	2	[{"changed": {"fields": ["unknown"]}}]	9	1
107	2020-03-07 00:46:41.698032+01	1	Schweden	2	[{"changed": {"fields": ["unknown"]}}]	9	1
108	2020-03-07 00:53:38.446202+01	37	N-Tuerkei	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	10	1
109	2020-03-07 00:53:43.503432+01	36	N-Aegypten	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	10	1
110	2020-03-07 00:53:48.863287+01	35	N-Irak	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	10	1
111	2020-03-07 00:53:55.287067+01	34	N-Israel	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	10	1
112	2020-03-07 00:53:59.942666+01	33	N-Libanon	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	10	1
245	2020-03-07 01:20:02.502182+01	10	Italien	2	[]	13	1
113	2020-03-07 00:54:09.783246+01	32	N-Jordanien	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	10	1
114	2020-03-07 00:56:49.183973+01	31	E-Schweiz	2	[{"changed": {"fields": ["land", "unknown"]}}]	10	1
115	2020-03-07 00:56:58.843614+01	30	E-Norwegen	2	[{"changed": {"fields": ["land", "unknown"]}}]	10	1
116	2020-03-07 00:57:06.064261+01	29	E-Liechtenstein	2	[{"changed": {"fields": ["land", "pop", "refRatio", "refTotal", "male", "female", "u18", "u18erstantrag", "u34", "u34erstantrag", "u64", "u64erstantrag", "ue65", "ue65erstantrag", "unknown"]}}]	10	1
117	2020-03-07 00:57:52.570272+01	28	E-Island	2	[{"changed": {"fields": ["land"]}}]	10	1
118	2020-03-07 00:58:01.95289+01	27	Zypern	2	[{"changed": {"fields": ["unknown"]}}]	10	1
119	2020-03-07 00:58:07.992224+01	26	Vereinigtes Koenigreich	2	[{"changed": {"fields": ["unknown"]}}]	10	1
120	2020-03-07 00:58:18.394656+01	25	Ungarn	2	[{"changed": {"fields": ["unknown"]}}]	10	1
121	2020-03-07 00:58:27.307064+01	24	Tschechien	2	[{"changed": {"fields": ["unknown"]}}]	10	1
122	2020-03-07 01:01:29.865116+01	23	Spanien	2	[{"changed": {"fields": ["unknown"]}}]	10	1
123	2020-03-07 01:01:38.783364+01	22	Slowenien	2	[{"changed": {"fields": ["unknown"]}}]	10	1
124	2020-03-07 01:01:45.429407+01	21	Slowakei	2	[{"changed": {"fields": ["male", "female", "unknown"]}}]	10	1
125	2020-03-07 01:01:55.222765+01	20	Rumaenien	2	[{"changed": {"fields": ["unknown"]}}]	10	1
126	2020-03-07 01:02:01.431584+01	19	Portugal	2	[{"changed": {"fields": ["unknown"]}}]	10	1
127	2020-03-07 01:02:10.10813+01	18	Polen	2	[{"changed": {"fields": ["unknown"]}}]	10	1
128	2020-03-07 01:02:17.180256+01	17	Oesterreich	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64erstantrag", "ue65erstantrag"]}}]	10	1
129	2020-03-07 01:06:20.053844+01	9	Griechenland	2	[{"changed": {"fields": ["unknown"]}}]	10	1
130	2020-03-07 01:07:41.290334+01	6	Finnland	2	[{"changed": {"fields": ["unknown"]}}]	10	1
131	2020-03-07 01:07:50.768242+01	5	Estland	2	[{"changed": {"fields": ["unknown"]}}]	10	1
132	2020-03-07 01:08:00.236861+01	4	Daenemark	2	[{"changed": {"fields": ["unknown"]}}]	10	1
133	2020-03-07 01:08:06.961581+01	3	Bulgarien	2	[{"changed": {"fields": ["unknown"]}}]	10	1
134	2020-03-07 01:08:14.713022+01	2	Belgien	2	[{"changed": {"fields": ["unknown"]}}]	10	1
135	2020-03-07 01:08:22.153112+01	1	Schweden	2	[{"changed": {"fields": ["unknown"]}}]	10	1
136	2020-03-07 01:08:29.458338+01	0	Deutschland	2	[{"changed": {"fields": ["unknown"]}}]	10	1
137	2020-03-07 01:09:03.183304+01	37	N-Tuerkei	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	11	1
138	2020-03-07 01:09:07.732099+01	36	N-Aegypten	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	11	1
139	2020-03-07 01:09:14.027981+01	35	N-Irak	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	11	1
140	2020-03-07 01:09:21.34642+01	34	N-Israel	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	11	1
141	2020-03-07 01:09:59.705218+01	0	Deutschland	2	[{"changed": {"fields": ["unknown"]}}]	11	1
142	2020-03-07 01:10:33.393189+01	35	N-Irak	2	[]	11	1
143	2020-03-07 01:10:38.559484+01	34	N-Israel	2	[]	11	1
144	2020-03-07 01:10:41.497587+01	33	N-Libanon	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	11	1
145	2020-03-07 01:10:44.496596+01	32	N-Jordanien	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	11	1
146	2020-03-07 01:10:58.820522+01	31	E-Schweiz	2	[{"changed": {"fields": ["land", "unknown"]}}]	11	1
147	2020-03-07 01:11:04.531788+01	30	E-Norwegen	2	[{"changed": {"fields": ["land", "unknown"]}}]	11	1
148	2020-03-07 01:11:09.950601+01	29	E-Liechtenstein	2	[{"changed": {"fields": ["land", "pop", "refRatio", "refTotal", "male", "female", "u18", "u18erstantrag", "u34", "u34erstantrag", "u64", "u64erstantrag", "ue65", "ue65erstantrag", "unknown", "erstantrag"]}}]	11	1
149	2020-03-07 01:11:15.305252+01	28	E-Island	2	[{"changed": {"fields": ["land", "u18erstantrag", "u34erstantrag", "ue65erstantrag", "unknown", "erstantrag"]}}]	11	1
150	2020-03-07 01:11:20.337143+01	27	Zypern	2	[{"changed": {"fields": ["unknown"]}}]	11	1
151	2020-03-07 01:11:26.173541+01	26	Vereinigtes Koenigreich	2	[{"changed": {"fields": ["unknown"]}}]	11	1
152	2020-03-07 01:11:31.446675+01	25	Ungarn	2	[{"changed": {"fields": ["unknown"]}}]	11	1
153	2020-03-07 01:11:36.955818+01	24	Tschechien	2	[{"changed": {"fields": ["unknown"]}}]	11	1
154	2020-03-07 01:11:47.080179+01	23	Spanien	2	[{"changed": {"fields": ["unknown"]}}]	11	1
155	2020-03-07 01:11:53.696444+01	22	Slowenien	2	[{"changed": {"fields": ["unknown"]}}]	11	1
156	2020-03-07 01:11:58.29782+01	21	Slowakei	2	[{"changed": {"fields": ["unknown"]}}]	11	1
157	2020-03-07 01:12:03.040967+01	20	Rumaenien	2	[{"changed": {"fields": ["unknown"]}}]	11	1
158	2020-03-07 01:12:08.869004+01	20	Rumaenien	2	[]	11	1
159	2020-03-07 01:12:12.762642+01	19	Portugal	2	[{"changed": {"fields": ["unknown"]}}]	11	1
160	2020-03-07 01:12:21.798388+01	18	Polen	2	[{"changed": {"fields": ["unknown"]}}]	11	1
161	2020-03-07 01:12:26.164509+01	17	Oesterreich	2	[]	11	1
162	2020-03-07 01:12:39.144668+01	15	Malta	2	[]	11	1
163	2020-03-07 01:12:45.120811+01	14	Luxemburg	2	[]	11	1
164	2020-03-07 01:12:52.346324+01	13	Lituaen	2	[]	11	1
165	2020-03-07 01:13:01.050343+01	12	Lettland	2	[]	11	1
166	2020-03-07 01:13:06.933925+01	11	Kroatien	2	[]	11	1
167	2020-03-07 01:13:12.98305+01	10	Italien	2	[]	11	1
168	2020-03-07 01:13:20.27038+01	9	Griechenland	2	[{"changed": {"fields": ["unknown"]}}]	11	1
169	2020-03-07 01:13:35.223769+01	9	Griechenland	2	[]	11	1
170	2020-03-07 01:13:39.445335+01	8	Irland	2	[]	11	1
171	2020-03-07 01:13:52.58951+01	7	Frankreich	2	[{"changed": {"fields": ["unknown"]}}]	11	1
172	2020-03-07 01:14:01.32209+01	6	Finnland	2	[{"changed": {"fields": ["unknown"]}}]	11	1
173	2020-03-07 01:14:05.295906+01	5	Estland	2	[{"changed": {"fields": ["unknown"]}}]	11	1
174	2020-03-07 01:14:10.951573+01	5	Estland	2	[]	11	1
175	2020-03-07 01:14:14.576177+01	4	Daenemark	2	[{"changed": {"fields": ["unknown"]}}]	11	1
176	2020-03-07 01:14:19.575001+01	3	Bulgarien	2	[{"changed": {"fields": ["unknown"]}}]	11	1
177	2020-03-07 01:14:23.564812+01	2	Belgien	2	[{"changed": {"fields": ["unknown"]}}]	11	1
178	2020-03-07 01:14:27.104315+01	1	Schweden	2	[{"changed": {"fields": ["unknown"]}}]	11	1
179	2020-03-07 01:14:30.551464+01	0	Deutschland	2	[]	11	1
180	2020-03-07 01:14:45.029426+01	37	N-Tuerkei	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	12	1
181	2020-03-07 01:14:47.565471+01	36	N-Aegypten	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	12	1
182	2020-03-07 01:14:50.113858+01	35	N-Irak	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	12	1
183	2020-03-07 01:14:53.366524+01	34	N-Israel	2	[{"changed": {"fields": ["refTotal", "male", "female", "u18", "u18erstantrag", "u34", "u34erstantrag", "u64", "u64erstantrag", "ue65", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	12	1
184	2020-03-07 01:14:57.5876+01	33	N-Libanon	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	12	1
185	2020-03-07 01:15:01.572477+01	32	N-Jordanien	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	12	1
186	2020-03-07 01:15:05.899545+01	31	E-Schweiz	2	[{"changed": {"fields": ["land", "unknown"]}}]	12	1
187	2020-03-07 01:15:11.226146+01	30	E-Norwegen	2	[{"changed": {"fields": ["land", "unknown"]}}]	12	1
188	2020-03-07 01:15:16.620517+01	29	E-Liechtenstein	2	[{"changed": {"fields": ["land", "pop", "refRatio", "refTotal", "male", "female", "u18", "u34", "ue65", "unknown"]}}]	12	1
189	2020-03-07 01:15:21.271633+01	28	E-Island	2	[{"changed": {"fields": ["land", "u18erstantrag", "unknown"]}}]	12	1
190	2020-03-07 01:15:24.926937+01	27	Zypern	2	[{"changed": {"fields": ["unknown"]}}]	12	1
191	2020-03-07 01:15:28.367942+01	26	Vereinigtes Koenigreich	2	[{"changed": {"fields": ["unknown"]}}]	12	1
192	2020-03-07 01:15:32.572379+01	25	Ungarn	2	[{"changed": {"fields": ["unknown"]}}]	12	1
193	2020-03-07 01:15:38.590348+01	24	Tschechien	2	[{"changed": {"fields": ["unknown"]}}]	12	1
194	2020-03-07 01:15:42.579866+01	23	Spanien	2	[{"changed": {"fields": ["unknown"]}}]	12	1
195	2020-03-07 01:15:48.823744+01	22	Slowenien	2	[{"changed": {"fields": ["unknown"]}}]	12	1
196	2020-03-07 01:15:54.927182+01	21	Slowakei	2	[{"changed": {"fields": ["unknown"]}}]	12	1
197	2020-03-07 01:15:59.996744+01	20	Rumaenien	2	[{"changed": {"fields": ["unknown"]}}]	12	1
198	2020-03-07 01:16:04.937739+01	19	Portugal	2	[{"changed": {"fields": ["male", "female", "unknown"]}}]	12	1
199	2020-03-07 01:16:09.613716+01	18	Polen	2	[{"changed": {"fields": ["unknown"]}}]	12	1
200	2020-03-07 01:16:15.816503+01	17	Oesterreich	2	[]	12	1
201	2020-03-07 01:16:20.139103+01	16	Niederlande	2	[]	12	1
202	2020-03-07 01:16:25.737711+01	15	Malta	2	[]	12	1
203	2020-03-07 01:16:31.134465+01	14	Luxemburg	2	[]	12	1
204	2020-03-07 01:16:38.710752+01	13	Lituaen	2	[]	12	1
205	2020-03-07 01:16:44.659369+01	12	Lettland	2	[]	12	1
206	2020-03-07 01:16:54.098536+01	11	Kroatien	2	[]	12	1
207	2020-03-07 01:16:59.968085+01	10	Italien	2	[]	12	1
208	2020-03-07 01:17:05.629175+01	9	Griechenland	2	[{"changed": {"fields": ["unknown"]}}]	12	1
209	2020-03-07 01:17:10.522054+01	8	Irland	2	[]	12	1
210	2020-03-07 01:17:14.945764+01	7	Frankreich	2	[{"changed": {"fields": ["unknown"]}}]	12	1
211	2020-03-07 01:17:19.645036+01	6	Finnland	2	[{"changed": {"fields": ["unknown"]}}]	12	1
212	2020-03-07 01:17:23.810612+01	5	Estland	2	[{"changed": {"fields": ["unknown"]}}]	12	1
213	2020-03-07 01:17:27.377923+01	4	Daenemark	2	[{"changed": {"fields": ["unknown"]}}]	12	1
214	2020-03-07 01:17:30.90976+01	3	Bulgarien	2	[{"changed": {"fields": ["unknown"]}}]	12	1
215	2020-03-07 01:17:34.871528+01	2	Belgien	2	[{"changed": {"fields": ["unknown"]}}]	12	1
216	2020-03-07 01:17:38.857956+01	1	Schweden	2	[{"changed": {"fields": ["unknown"]}}]	12	1
217	2020-03-07 01:17:42.364797+01	0	Deutschland	2	[{"changed": {"fields": ["unknown"]}}]	12	1
218	2020-03-07 01:18:03.043979+01	37	N-Tuerkei	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	13	1
219	2020-03-07 01:18:06.763034+01	36	N-Aegypten	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	13	1
220	2020-03-07 01:18:09.636579+01	35	N-Irak	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	13	1
221	2020-03-07 01:18:12.595932+01	34	N-Israel	2	[{"changed": {"fields": ["refRatio", "refTotal", "male", "female", "u18", "u18erstantrag", "u34", "u34erstantrag", "u64", "u64erstantrag", "ue65", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	13	1
222	2020-03-07 01:18:15.857463+01	33	N-Libanon	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	13	1
223	2020-03-07 01:18:19.865283+01	32	N-Jordanien	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	13	1
224	2020-03-07 01:18:25.280288+01	31	E-Schweiz	2	[{"changed": {"fields": ["land", "unknown"]}}]	13	1
225	2020-03-07 01:18:31.392962+01	30	E-Norwegen	2	[{"changed": {"fields": ["land", "unknown"]}}]	13	1
226	2020-03-07 01:18:36.27662+01	29	E-Liechtenstein	2	[{"changed": {"fields": ["land", "pop", "refRatio", "unknown"]}}]	13	1
227	2020-03-07 01:18:40.695354+01	28	E-Island	2	[{"changed": {"fields": ["land", "unknown"]}}]	13	1
228	2020-03-07 01:18:45.096996+01	27	Zypern	2	[{"changed": {"fields": ["unknown"]}}]	13	1
229	2020-03-07 01:18:48.882981+01	26	Vereinigtes Koenigreich	2	[{"changed": {"fields": ["unknown"]}}]	13	1
230	2020-03-07 01:18:53.319688+01	25	Ungarn	2	[{"changed": {"fields": ["unknown"]}}]	13	1
231	2020-03-07 01:18:57.148798+01	24	Tschechien	2	[{"changed": {"fields": ["unknown"]}}]	13	1
232	2020-03-07 01:19:01.417642+01	23	Spanien	2	[{"changed": {"fields": ["unknown"]}}]	13	1
233	2020-03-07 01:19:05.982222+01	22	Slowenien	2	[{"changed": {"fields": ["unknown"]}}]	13	1
234	2020-03-07 01:19:10.909598+01	21	Slowakei	2	[{"changed": {"fields": ["unknown"]}}]	13	1
235	2020-03-07 01:19:15.078243+01	20	Rumaenien	2	[{"changed": {"fields": ["unknown"]}}]	13	1
236	2020-03-07 01:19:20.103772+01	19	Portugal	2	[{"changed": {"fields": ["unknown"]}}]	13	1
237	2020-03-07 01:19:25.509177+01	18	Polen	2	[{"changed": {"fields": ["unknown"]}}]	13	1
238	2020-03-07 01:19:30.03449+01	17	Oesterreich	2	[]	13	1
239	2020-03-07 01:19:34.589866+01	16	Niederlande	2	[]	13	1
240	2020-03-07 01:19:39.465173+01	15	Malta	2	[]	13	1
241	2020-03-07 01:19:44.086923+01	14	Luxemburg	2	[]	13	1
242	2020-03-07 01:19:49.243463+01	13	Lituaen	2	[]	13	1
243	2020-03-07 01:19:53.915797+01	12	Lettland	2	[]	13	1
244	2020-03-07 01:19:58.649236+01	11	Kroatien	2	[]	13	1
246	2020-03-07 01:20:09.175962+01	9	Griechenland	2	[{"changed": {"fields": ["unknown"]}}]	13	1
247	2020-03-07 01:20:16.979858+01	8	Irland	2	[]	13	1
248	2020-03-07 01:20:24.458469+01	7	Frankreich	2	[{"changed": {"fields": ["unknown"]}}]	13	1
249	2020-03-07 01:20:35.393009+01	6	Finnland	2	[{"changed": {"fields": ["unknown"]}}]	13	1
250	2020-03-07 01:20:49.279448+01	5	Estland	2	[{"changed": {"fields": ["unknown"]}}]	13	1
251	2020-03-07 01:20:52.893207+01	4	Daenemark	2	[{"changed": {"fields": ["unknown"]}}]	13	1
252	2020-03-07 01:20:57.090832+01	3	Bulgarien	2	[{"changed": {"fields": ["unknown"]}}]	13	1
253	2020-03-07 01:21:00.681147+01	2	Belgien	2	[{"changed": {"fields": ["unknown"]}}]	13	1
254	2020-03-07 01:21:03.983144+01	1	Schweden	2	[{"changed": {"fields": ["unknown"]}}]	13	1
255	2020-03-07 01:21:07.534282+01	0	Deutschland	2	[{"changed": {"fields": ["unknown"]}}]	13	1
256	2020-03-07 01:21:17.097793+01	37	N-Tuerkei	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	14	1
257	2020-03-07 01:21:19.424013+01	36	N-Aegypten	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	14	1
258	2020-03-07 01:21:22.47711+01	35	N-Irak	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	14	1
259	2020-03-07 01:21:27.823019+01	34	N-Israel	2	[{"changed": {"fields": ["refRatio", "refTotal", "male", "female", "u18", "u18erstantrag", "u34", "u34erstantrag", "u64", "u64erstantrag", "ue65", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	14	1
260	2020-03-07 01:21:31.130483+01	33	N-Libanon	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	14	1
261	2020-03-07 01:21:34.114959+01	32	N-Jordanien	2	[{"changed": {"fields": ["u18erstantrag", "u34erstantrag", "u64", "u64erstantrag", "ue65erstantrag", "unknown", "erstantrag", "folgeantrag"]}}]	14	1
262	2020-03-07 01:21:39.577146+01	31	E-Schweiz	2	[{"changed": {"fields": ["land", "unknown"]}}]	14	1
263	2020-03-07 01:21:44.27031+01	30	E-Norwegen	2	[{"changed": {"fields": ["land", "unknown"]}}]	14	1
264	2020-03-07 01:21:49.727876+01	29	E-Liechtenstein	2	[{"changed": {"fields": ["land", "pop", "refRatio", "unknown"]}}]	14	1
265	2020-03-07 01:21:54.155222+01	28	E-Island	2	[{"changed": {"fields": ["land", "unknown"]}}]	14	1
266	2020-03-07 01:21:57.689449+01	27	Zypern	2	[{"changed": {"fields": ["unknown"]}}]	14	1
267	2020-03-07 01:22:02.502697+01	26	Vereinigtes Koenigreich	2	[{"changed": {"fields": ["unknown"]}}]	14	1
268	2020-03-07 01:22:06.154601+01	25	Ungarn	2	[{"changed": {"fields": ["unknown"]}}]	14	1
269	2020-03-07 01:22:10.260105+01	24	Tschechien	2	[{"changed": {"fields": ["unknown"]}}]	14	1
270	2020-03-07 01:22:15.450423+01	23	Spanien	2	[{"changed": {"fields": ["unknown"]}}]	14	1
271	2020-03-07 01:22:19.586846+01	22	Slowenien	2	[{"changed": {"fields": ["unknown"]}}]	14	1
272	2020-03-07 01:22:24.795773+01	21	Slowakei	2	[{"changed": {"fields": ["unknown"]}}]	14	1
273	2020-03-07 01:22:29.584935+01	20	Rumaenien	2	[{"changed": {"fields": ["unknown"]}}]	14	1
274	2020-03-07 01:22:37.238756+01	19	Portugal	2	[{"changed": {"fields": ["unknown"]}}]	14	1
275	2020-03-07 01:22:42.833632+01	18	Polen	2	[{"changed": {"fields": ["unknown"]}}]	14	1
276	2020-03-07 01:22:48.065446+01	17	Oesterreich	2	[]	14	1
277	2020-03-07 01:22:53.826599+01	16	Niederlande	2	[]	14	1
278	2020-03-07 01:22:58.697755+01	15	Malta	2	[]	14	1
279	2020-03-07 01:23:06.190191+01	14	Luxemburg	2	[]	14	1
280	2020-03-07 01:23:17.242747+01	13	Lituaen	2	[]	14	1
281	2020-03-07 01:23:21.865222+01	12	Lettland	2	[]	14	1
282	2020-03-07 01:23:27.422317+01	11	Kroatien	2	[]	14	1
283	2020-03-07 01:23:32.682507+01	10	Italien	2	[]	14	1
284	2020-03-07 01:23:37.385576+01	9	Griechenland	2	[{"changed": {"fields": ["unknown"]}}]	14	1
285	2020-03-07 01:23:45.445452+01	8	Irland	2	[]	14	1
286	2020-03-07 01:23:49.977277+01	7	Frankreich	2	[{"changed": {"fields": ["unknown"]}}]	14	1
287	2020-03-07 01:23:56.567102+01	6	Finnland	2	[{"changed": {"fields": ["unknown"]}}]	14	1
288	2020-03-07 01:24:01.094823+01	5	Estland	2	[{"changed": {"fields": ["unknown"]}}]	14	1
289	2020-03-07 01:24:04.524209+01	4	Daenemark	2	[{"changed": {"fields": ["unknown"]}}]	14	1
290	2020-03-07 01:24:08.223965+01	3	Bulgarien	2	[{"changed": {"fields": ["unknown"]}}]	14	1
291	2020-03-07 01:24:12.651954+01	2	Belgien	2	[{"changed": {"fields": ["unknown"]}}]	14	1
292	2020-03-07 01:24:16.951226+01	1	Schweden	2	[{"changed": {"fields": ["unknown"]}}]	14	1
293	2020-03-07 01:24:20.168234+01	0	Deutschland	2	[{"changed": {"fields": ["unknown"]}}]	14	1
294	2020-03-25 02:33:14.248545+01	37	Tuerkei	2	[{"changed": {"fields": ["land"]}}]	14	1
295	2020-03-25 02:33:20.297476+01	36	Aegypten	2	[{"changed": {"fields": ["land"]}}]	14	1
296	2020-03-25 02:33:25.418531+01	35	Irak	2	[{"changed": {"fields": ["land"]}}]	14	1
297	2020-03-25 02:33:30.632919+01	34	Israel	2	[{"changed": {"fields": ["land"]}}]	14	1
298	2020-03-25 02:33:35.744331+01	33	Libanon	2	[{"changed": {"fields": ["land"]}}]	14	1
299	2020-03-25 02:33:41.296704+01	32	Jordanien	2	[{"changed": {"fields": ["land"]}}]	14	1
300	2020-03-25 02:33:45.757166+01	31	Schweiz	2	[{"changed": {"fields": ["land"]}}]	14	1
301	2020-03-25 02:33:50.854854+01	30	Norwegen	2	[{"changed": {"fields": ["land"]}}]	14	1
302	2020-03-25 02:33:55.747304+01	29	Liechtenstein	2	[{"changed": {"fields": ["land"]}}]	14	1
303	2020-03-25 02:34:01.499361+01	28	Island	2	[{"changed": {"fields": ["land"]}}]	14	1
304	2020-03-25 02:34:16.405797+01	37	Tuerkei	2	[{"changed": {"fields": ["land"]}}]	15	1
305	2020-03-25 02:34:21.043658+01	36	Aegypten	2	[{"changed": {"fields": ["land"]}}]	15	1
306	2020-03-25 02:34:25.628568+01	35	Irak	2	[{"changed": {"fields": ["land"]}}]	15	1
307	2020-03-25 02:34:30.118024+01	34	Israel	2	[{"changed": {"fields": ["land"]}}]	15	1
308	2020-03-25 02:34:34.789634+01	33	Libanon	2	[{"changed": {"fields": ["land"]}}]	15	1
309	2020-03-25 02:34:38.917982+01	32	Jordanien	2	[{"changed": {"fields": ["land"]}}]	15	1
310	2020-03-25 02:34:43.410779+01	31	Schweiz	2	[{"changed": {"fields": ["land"]}}]	15	1
311	2020-03-25 02:34:47.805864+01	30	Norwegen	2	[{"changed": {"fields": ["land"]}}]	15	1
312	2020-03-25 02:34:52.560061+01	29	Liechtenstein	2	[{"changed": {"fields": ["land"]}}]	15	1
313	2020-03-25 02:34:57.628536+01	28	Island	2	[{"changed": {"fields": ["land"]}}]	15	1
314	2020-03-25 02:35:08.048334+01	37	Tuerkei	2	[{"changed": {"fields": ["land"]}}]	13	1
315	2020-03-25 02:35:12.425709+01	36	Aegypten	2	[{"changed": {"fields": ["land"]}}]	13	1
316	2020-03-25 02:35:17.06824+01	35	Irak	2	[{"changed": {"fields": ["land"]}}]	13	1
317	2020-03-25 02:35:27.227839+01	34	Israel	2	[{"changed": {"fields": ["land"]}}]	13	1
318	2020-03-25 02:35:31.806587+01	33	Libanon	2	[{"changed": {"fields": ["land"]}}]	13	1
319	2020-03-25 02:35:36.399838+01	32	Jordanien	2	[{"changed": {"fields": ["land"]}}]	13	1
320	2020-03-25 02:35:44.657513+01	31	Schweiz	2	[{"changed": {"fields": ["land"]}}]	13	1
321	2020-03-25 02:35:50.660813+01	30	Norwegen	2	[{"changed": {"fields": ["land"]}}]	13	1
322	2020-03-25 02:35:56.853635+01	29	Liechtenstein	2	[{"changed": {"fields": ["land"]}}]	13	1
323	2020-03-25 02:36:02.206876+01	28	Island	2	[{"changed": {"fields": ["land"]}}]	13	1
324	2020-03-25 02:36:10.786707+01	37	Tuerkei	2	[{"changed": {"fields": ["land"]}}]	12	1
325	2020-03-25 02:36:14.749885+01	36	Aegypten	2	[{"changed": {"fields": ["land"]}}]	12	1
326	2020-03-25 02:36:19.308106+01	35	Irak	2	[{"changed": {"fields": ["land"]}}]	12	1
327	2020-03-25 02:36:23.51137+01	34	Israel	2	[{"changed": {"fields": ["land"]}}]	12	1
328	2020-03-25 02:36:28.043687+01	33	Libanon	2	[{"changed": {"fields": ["land"]}}]	12	1
329	2020-03-25 02:36:32.342063+01	32	Jordanien	2	[{"changed": {"fields": ["land"]}}]	12	1
330	2020-03-25 02:36:38.836237+01	31	Schweiz	2	[{"changed": {"fields": ["land"]}}]	12	1
331	2020-03-25 02:36:43.553338+01	30	Norwegen	2	[{"changed": {"fields": ["land"]}}]	12	1
332	2020-03-25 02:36:47.813716+01	29	Liechtenstein	2	[{"changed": {"fields": ["land"]}}]	12	1
333	2020-03-25 02:36:52.170231+01	28	Island	2	[{"changed": {"fields": ["land"]}}]	12	1
334	2020-03-25 02:36:59.796658+01	37	Tuerkei	2	[{"changed": {"fields": ["land"]}}]	11	1
335	2020-03-25 02:37:05.251232+01	36	Aegypten	2	[{"changed": {"fields": ["land"]}}]	11	1
336	2020-03-25 02:37:10.054283+01	35	Irak	2	[{"changed": {"fields": ["land"]}}]	11	1
337	2020-03-25 02:37:15.539063+01	34	Israel	2	[{"changed": {"fields": ["land"]}}]	11	1
338	2020-03-25 02:37:21.005229+01	33	Libanon	2	[{"changed": {"fields": ["land"]}}]	11	1
339	2020-03-25 02:37:26.958623+01	32	Jordanien	2	[{"changed": {"fields": ["land"]}}]	11	1
340	2020-03-25 02:37:31.943498+01	31	Schweiz	2	[{"changed": {"fields": ["land"]}}]	11	1
341	2020-03-25 02:37:36.52819+01	30	Norwegen	2	[{"changed": {"fields": ["land"]}}]	11	1
342	2020-03-25 02:37:42.082862+01	29	Liechtenstein	2	[{"changed": {"fields": ["land"]}}]	11	1
343	2020-03-25 02:37:46.384121+01	28	Island	2	[{"changed": {"fields": ["land"]}}]	11	1
344	2020-03-25 02:37:55.689897+01	37	Tuerkei	2	[{"changed": {"fields": ["land"]}}]	10	1
345	2020-03-25 02:38:00.287501+01	36	Aegypten	2	[{"changed": {"fields": ["land"]}}]	10	1
346	2020-03-25 02:38:04.716122+01	35	Irak	2	[{"changed": {"fields": ["land"]}}]	10	1
347	2020-03-25 02:38:09.215436+01	34	Israel	2	[{"changed": {"fields": ["land"]}}]	10	1
348	2020-03-25 02:38:13.473186+01	33	Libanon	2	[{"changed": {"fields": ["land"]}}]	10	1
349	2020-03-25 02:38:18.209298+01	32	Jordanien	2	[{"changed": {"fields": ["land"]}}]	10	1
350	2020-03-25 02:38:23.039639+01	31	Schweiz	2	[{"changed": {"fields": ["land"]}}]	10	1
351	2020-03-25 02:38:26.958723+01	30	Norwegen	2	[{"changed": {"fields": ["land"]}}]	10	1
352	2020-03-25 02:38:31.30212+01	29	Liechtenstein	2	[{"changed": {"fields": ["land"]}}]	10	1
353	2020-03-25 02:38:36.013262+01	28	Island	2	[{"changed": {"fields": ["land"]}}]	10	1
354	2020-03-25 02:38:42.784823+01	37	Tuerkei	2	[{"changed": {"fields": ["land"]}}]	9	1
355	2020-03-25 02:38:47.868712+01	36	Aegypten	2	[{"changed": {"fields": ["land"]}}]	9	1
356	2020-03-25 02:38:51.778544+01	35	Irak	2	[{"changed": {"fields": ["land"]}}]	9	1
357	2020-03-25 02:38:56.362435+01	34	Israel	2	[{"changed": {"fields": ["land"]}}]	9	1
358	2020-03-25 02:39:00.719548+01	33	Libanon	2	[{"changed": {"fields": ["land"]}}]	9	1
359	2020-03-25 02:39:05.742178+01	32	Jordanien	2	[{"changed": {"fields": ["land"]}}]	9	1
360	2020-03-25 02:39:10.199392+01	31	Schweiz	2	[{"changed": {"fields": ["land"]}}]	9	1
361	2020-03-25 02:39:14.917955+01	30	Norwegen	2	[{"changed": {"fields": ["land"]}}]	9	1
362	2020-03-25 02:39:18.711266+01	29	Liechtenstein	2	[{"changed": {"fields": ["land"]}}]	9	1
363	2020-03-25 02:39:22.972097+01	28	Island	2	[{"changed": {"fields": ["land"]}}]	9	1
364	2020-03-25 02:39:30.501393+01	37	Tuerkei	2	[{"changed": {"fields": ["land"]}}]	8	1
365	2020-03-25 02:39:35.71501+01	36	Aegypten	2	[{"changed": {"fields": ["land"]}}]	8	1
366	2020-03-25 02:39:40.345273+01	35	Irak	2	[{"changed": {"fields": ["land"]}}]	8	1
367	2020-03-25 02:39:44.969983+01	34	Israel	2	[{"changed": {"fields": ["land"]}}]	8	1
368	2020-03-25 02:39:48.744905+01	33	Libanon	2	[{"changed": {"fields": ["land"]}}]	8	1
369	2020-03-25 02:39:52.701028+01	31	Schweiz	2	[{"changed": {"fields": ["land"]}}]	8	1
370	2020-03-25 02:39:56.990153+01	32	Jordanien	2	[{"changed": {"fields": ["land"]}}]	8	1
371	2020-03-25 02:40:01.094125+01	30	Norwegen	2	[{"changed": {"fields": ["land"]}}]	8	1
372	2020-03-25 02:40:06.669593+01	29	Liechtenstein	2	[{"changed": {"fields": ["land"]}}]	8	1
373	2020-03-25 02:40:11.354472+01	28	Island	2	[{"changed": {"fields": ["land"]}}]	8	1
374	2020-04-01 00:53:32.681835+02	7	Frankreich	2	[{"changed": {"fields": ["unknown"]}}]	10	1
375	2020-04-16 01:19:16.021449+02	7	Frankreich	2	[{"changed": {"fields": ["geom"]}}]	8	1
376	2020-04-16 01:19:45.329961+02	7	Frankreich	2	[{"changed": {"fields": ["geom"]}}]	9	1
377	2020-04-16 01:20:14.331051+02	7	Frankreich	2	[{"changed": {"fields": ["geom"]}}]	10	1
378	2020-04-16 01:20:45.001759+02	7	Frankreich	2	[{"changed": {"fields": ["geom"]}}]	11	1
379	2020-04-16 01:21:21.29278+02	7	Frankreich	2	[{"changed": {"fields": ["geom"]}}]	12	1
380	2020-04-16 01:21:47.473316+02	7	Frankreich	2	[{"changed": {"fields": ["geom"]}}]	13	1
381	2020-04-16 01:22:25.222372+02	7	Frankreich	2	[{"changed": {"fields": ["geom"]}}]	14	1
382	2020-04-16 01:22:56.580628+02	7	Frankreich	2	[{"changed": {"fields": ["geom"]}}]	15	1
383	2020-04-21 01:41:44.31086+02	26	Großbritannien	2	[{"changed": {"fields": ["land"]}}]	9	1
384	2020-04-21 01:41:59.874324+02	26	Großbritannien	2	[{"changed": {"fields": ["land"]}}]	8	1
385	2020-04-21 01:42:19.203882+02	26	Großbritannien	2	[{"changed": {"fields": ["land"]}}]	10	1
386	2020-04-21 01:42:32.903479+02	26	Großbritannien	2	[{"changed": {"fields": ["land"]}}]	11	1
387	2020-04-21 01:42:42.7277+02	26	Großbritannien	2	[{"changed": {"fields": ["land"]}}]	12	1
388	2020-04-21 01:42:53.781737+02	26	Großbritannien	2	[{"changed": {"fields": ["land"]}}]	13	1
389	2020-04-21 01:43:03.694087+02	26	Großbritannien	2	[{"changed": {"fields": ["land"]}}]	14	1
390	2020-04-21 01:43:13.326878+02	26	Großbritannien	2	[{"changed": {"fields": ["land"]}}]	15	1
391	2020-04-30 02:17:41.235114+02	31	Schweiz	2	[{"changed": {"fields": ["haltung"]}}]	8	1
392	2020-04-30 02:18:36.833357+02	30	Norwegen	2	[{"changed": {"fields": ["haltung"]}}]	8	1
393	2020-04-30 02:19:12.983404+02	29	Liechtenstein	2	[{"changed": {"fields": ["haltung"]}}]	8	1
394	2020-04-30 02:19:41.68468+02	28	Island	2	[{"changed": {"fields": ["haltung"]}}]	8	1
395	2020-04-30 02:20:13.092266+02	27	Zypern	2	[{"changed": {"fields": ["haltung"]}}]	8	1
396	2020-04-30 02:20:53.646163+02	26	Großbritannien	2	[{"changed": {"fields": ["haltung"]}}]	8	1
397	2020-04-30 02:21:21.555353+02	25	Ungarn	2	[{"changed": {"fields": ["haltung"]}}]	8	1
398	2020-04-30 02:22:13.964444+02	24	Tschechien	2	[{"changed": {"fields": ["haltung"]}}]	8	1
399	2020-04-30 02:22:45.365966+02	23	Spanien	2	[{"changed": {"fields": ["haltung"]}}]	8	1
400	2020-04-30 02:23:04.980998+02	22	Slowenien	2	[{"changed": {"fields": ["haltung"]}}]	8	1
401	2020-04-30 02:23:32.792587+02	22	Slowenien	2	[{"changed": {"fields": ["haltung"]}}]	8	1
402	2020-04-30 02:23:53.134975+02	23	Spanien	2	[{"changed": {"fields": ["haltung"]}}]	8	1
403	2020-04-30 02:24:09.051936+02	25	Ungarn	2	[{"changed": {"fields": ["haltung"]}}]	8	1
404	2020-04-30 02:24:27.153555+02	26	Großbritannien	2	[{"changed": {"fields": ["haltung"]}}]	8	1
405	2020-04-30 02:24:42.712668+02	28	Island	2	[{"changed": {"fields": ["haltung"]}}]	8	1
406	2020-04-30 02:24:54.73959+02	29	Liechtenstein	2	[{"changed": {"fields": ["haltung"]}}]	8	1
407	2020-04-30 02:25:06.757128+02	30	Norwegen	2	[{"changed": {"fields": ["haltung"]}}]	8	1
408	2020-04-30 02:25:17.623339+02	31	Schweiz	2	[{"changed": {"fields": ["haltung"]}}]	8	1
409	2020-04-30 02:25:53.355345+02	21	Slowakei	2	[{"changed": {"fields": ["haltung"]}}]	8	1
410	2020-04-30 02:26:15.911506+02	20	Rumaenien	2	[{"changed": {"fields": ["haltung"]}}]	8	1
411	2020-04-30 02:26:48.719786+02	19	Portugal	2	[{"changed": {"fields": ["haltung"]}}]	8	1
412	2020-04-30 02:28:02.175342+02	18	Polen	2	[{"changed": {"fields": ["haltung"]}}]	8	1
413	2020-04-30 02:28:24.45869+02	17	Oesterreich	2	[{"changed": {"fields": ["haltung"]}}]	8	1
414	2020-04-30 02:29:01.843496+02	16	Niederlande	2	[{"changed": {"fields": ["haltung"]}}]	8	1
415	2020-04-30 02:29:18.618726+02	15	Malta	2	[{"changed": {"fields": ["haltung"]}}]	8	1
416	2020-04-30 02:29:32.457006+02	14	Luxemburg	2	[{"changed": {"fields": ["haltung"]}}]	8	1
417	2020-04-30 02:30:24.3039+02	13	Litauen	2	[{"changed": {"fields": ["land", "haltung"]}}]	8	1
418	2020-04-30 02:30:48.944556+02	12	Lettland	2	[{"changed": {"fields": ["haltung"]}}]	8	1
419	2020-04-30 02:32:39.323825+02	11	Kroatien	2	[{"changed": {"fields": ["haltung"]}}]	8	1
420	2020-04-30 02:33:00.793184+02	10	Italien	2	[{"changed": {"fields": ["haltung"]}}]	8	1
421	2020-04-30 02:33:28.808108+02	9	Griechenland	2	[{"changed": {"fields": ["haltung"]}}]	8	1
422	2020-04-30 02:33:48.800371+02	8	Irland	2	[{"changed": {"fields": ["haltung"]}}]	8	1
423	2020-04-30 02:34:29.791746+02	7	Frankreich	2	[{"changed": {"fields": ["haltung"]}}]	8	1
424	2020-04-30 02:34:53.702221+02	6	Finnland	2	[{"changed": {"fields": ["haltung"]}}]	8	1
425	2020-04-30 02:35:13.306608+02	5	Estland	2	[{"changed": {"fields": ["haltung"]}}]	8	1
426	2020-04-30 02:35:35.135933+02	4	Daenemark	2	[{"changed": {"fields": ["haltung"]}}]	8	1
427	2020-04-30 02:35:54.522406+02	3	Bulgarien	2	[{"changed": {"fields": ["haltung"]}}]	8	1
428	2020-04-30 02:36:13.68949+02	2	Belgien	2	[{"changed": {"fields": ["haltung"]}}]	8	1
429	2020-04-30 02:36:32.336935+02	1	Schweden	2	[{"changed": {"fields": ["haltung"]}}]	8	1
430	2020-04-30 02:36:48.635669+02	0	Deutschland	2	[{"changed": {"fields": ["haltung"]}}]	8	1
431	2020-04-30 10:28:17.604244+02	31	Schweiz	2	[{"changed": {"fields": ["haltung"]}}]	9	1
432	2020-04-30 10:28:39.221739+02	30	Norwegen	2	[{"changed": {"fields": ["haltung"]}}]	9	1
433	2020-04-30 10:29:03.202079+02	29	Liechtenstein	2	[{"changed": {"fields": ["haltung"]}}]	9	1
434	2020-04-30 10:29:28.247566+02	28	Island	2	[{"changed": {"fields": ["haltung"]}}]	9	1
435	2020-04-30 10:29:41.037062+02	27	Zypern	2	[{"changed": {"fields": ["haltung"]}}]	9	1
436	2020-04-30 10:30:10.233831+02	26	Großbritannien	2	[{"changed": {"fields": ["haltung"]}}]	9	1
437	2020-04-30 10:30:30.904985+02	25	Ungarn	2	[{"changed": {"fields": ["haltung"]}}]	9	1
438	2020-04-30 10:30:56.857483+02	24	Tschechien	2	[{"changed": {"fields": ["haltung"]}}]	9	1
439	2020-04-30 10:31:17.029426+02	23	Spanien	2	[{"changed": {"fields": ["haltung"]}}]	9	1
440	2020-04-30 10:31:43.77335+02	22	Slowenien	2	[{"changed": {"fields": ["haltung"]}}]	9	1
441	2020-04-30 10:32:03.159013+02	21	Slowakei	2	[{"changed": {"fields": ["haltung"]}}]	9	1
442	2020-04-30 10:32:24.638651+02	20	Rumaenien	2	[{"changed": {"fields": ["haltung"]}}]	9	1
443	2020-04-30 10:32:46.269785+02	19	Portugal	2	[{"changed": {"fields": ["haltung"]}}]	9	1
444	2020-04-30 10:33:03.136671+02	18	Polen	2	[{"changed": {"fields": ["haltung"]}}]	9	1
445	2020-04-30 10:33:24.268651+02	17	Oesterreich	2	[{"changed": {"fields": ["haltung"]}}]	9	1
446	2020-04-30 10:33:42.514933+02	16	Niederlande	2	[{"changed": {"fields": ["haltung"]}}]	9	1
447	2020-04-30 10:33:55.979325+02	15	Malta	2	[{"changed": {"fields": ["haltung"]}}]	9	1
448	2020-04-30 10:34:14.338008+02	14	Luxemburg	2	[{"changed": {"fields": ["haltung"]}}]	9	1
449	2020-04-30 10:34:38.726893+02	13	Litauen	2	[{"changed": {"fields": ["land", "haltung"]}}]	9	1
450	2020-04-30 10:35:04.092301+02	12	Lettland	2	[{"changed": {"fields": ["haltung"]}}]	9	1
451	2020-04-30 10:35:24.538595+02	11	Kroatien	2	[{"changed": {"fields": ["haltung"]}}]	9	1
452	2020-04-30 10:35:49.278309+02	10	Italien	2	[{"changed": {"fields": ["haltung"]}}]	9	1
453	2020-04-30 10:36:10.068248+02	9	Griechenland	2	[{"changed": {"fields": ["haltung"]}}]	9	1
454	2020-04-30 10:36:28.025532+02	8	Irland	2	[{"changed": {"fields": ["haltung"]}}]	9	1
455	2020-04-30 10:36:45.699206+02	7	Frankreich	2	[{"changed": {"fields": ["haltung"]}}]	9	1
456	2020-04-30 10:37:02.809357+02	6	Finnland	2	[{"changed": {"fields": ["haltung"]}}]	9	1
457	2020-04-30 10:37:17.986524+02	5	Estland	2	[{"changed": {"fields": ["haltung"]}}]	9	1
458	2020-04-30 10:37:34.291257+02	4	Daenemark	2	[{"changed": {"fields": ["haltung"]}}]	9	1
459	2020-04-30 10:37:53.021828+02	3	Bulgarien	2	[{"changed": {"fields": ["haltung"]}}]	9	1
460	2020-04-30 10:38:15.696094+02	2	Belgien	2	[{"changed": {"fields": ["haltung"]}}]	9	1
461	2020-04-30 10:38:37.838389+02	1	Schweden	2	[{"changed": {"fields": ["haltung"]}}]	9	1
462	2020-04-30 10:39:05.269441+02	0	Deutschland	2	[{"changed": {"fields": ["haltung"]}}]	9	1
463	2020-04-30 10:40:41.587873+02	31	Schweiz	2	[{"changed": {"fields": ["haltung"]}}]	10	1
464	2020-04-30 10:41:06.219229+02	30	Norwegen	2	[{"changed": {"fields": ["haltung"]}}]	10	1
465	2020-04-30 10:41:21.700232+02	29	Liechtenstein	2	[{"changed": {"fields": ["haltung"]}}]	10	1
466	2020-04-30 10:41:41.197489+02	28	Island	2	[{"changed": {"fields": ["haltung"]}}]	10	1
467	2020-04-30 10:41:53.1381+02	27	Zypern	2	[{"changed": {"fields": ["haltung"]}}]	10	1
468	2020-04-30 10:42:08.84329+02	26	Großbritannien	2	[{"changed": {"fields": ["haltung"]}}]	10	1
469	2020-04-30 10:42:30.648438+02	25	Ungarn	2	[{"changed": {"fields": ["haltung"]}}]	10	1
470	2020-04-30 10:42:52.349336+02	24	Tschechien	2	[{"changed": {"fields": ["haltung"]}}]	10	1
471	2020-04-30 10:43:23.256078+02	23	Spanien	2	[{"changed": {"fields": ["haltung"]}}]	10	1
472	2020-04-30 10:43:54.009766+02	22	Slowenien	2	[{"changed": {"fields": ["haltung"]}}]	10	1
473	2020-04-30 10:45:15.08151+02	21	Slowakei	2	[{"changed": {"fields": ["haltung"]}}]	10	1
474	2020-04-30 10:45:33.540171+02	20	Rumaenien	2	[{"changed": {"fields": ["haltung"]}}]	10	1
475	2020-04-30 10:45:50.142637+02	19	Portugal	2	[{"changed": {"fields": ["haltung"]}}]	10	1
476	2020-04-30 10:46:02.813287+02	18	Polen	2	[{"changed": {"fields": ["haltung"]}}]	10	1
477	2020-04-30 10:46:19.782756+02	17	Oesterreich	2	[{"changed": {"fields": ["haltung"]}}]	10	1
478	2020-04-30 10:46:39.876816+02	16	Niederlande	2	[{"changed": {"fields": ["haltung"]}}]	10	1
479	2020-04-30 10:46:50.639985+02	15	Malta	2	[{"changed": {"fields": ["haltung"]}}]	10	1
480	2020-04-30 10:47:01.301776+02	14	Luxemburg	2	[{"changed": {"fields": ["haltung"]}}]	10	1
481	2020-04-30 10:47:18.991875+02	13	Litauen	2	[{"changed": {"fields": ["land", "haltung"]}}]	10	1
482	2020-04-30 10:47:39.5576+02	12	Lettland	2	[{"changed": {"fields": ["haltung"]}}]	10	1
483	2020-04-30 10:47:58.44101+02	11	Kroatien	2	[{"changed": {"fields": ["haltung"]}}]	10	1
484	2020-04-30 10:48:16.832088+02	10	Italien	2	[{"changed": {"fields": ["haltung"]}}]	10	1
485	2020-04-30 10:48:32.282293+02	10	Italien	2	[{"changed": {"fields": ["haltung"]}}]	10	1
486	2020-04-30 10:48:50.144028+02	9	Griechenland	2	[{"changed": {"fields": ["haltung"]}}]	10	1
487	2020-04-30 10:49:04.700363+02	8	Irland	2	[{"changed": {"fields": ["haltung"]}}]	10	1
488	2020-04-30 10:49:25.158541+02	7	Frankreich	2	[{"changed": {"fields": ["haltung"]}}]	10	1
489	2020-04-30 10:49:41.711725+02	6	Finnland	2	[{"changed": {"fields": ["haltung"]}}]	10	1
490	2020-04-30 10:49:54.764351+02	5	Estland	2	[{"changed": {"fields": ["haltung"]}}]	10	1
491	2020-04-30 10:50:12.696629+02	4	Daenemark	2	[{"changed": {"fields": ["haltung"]}}]	10	1
492	2020-04-30 10:50:27.779484+02	3	Bulgarien	2	[{"changed": {"fields": ["haltung"]}}]	10	1
493	2020-04-30 10:50:49.053443+02	2	Belgien	2	[{"changed": {"fields": ["haltung"]}}]	10	1
494	2020-04-30 10:51:08.700553+02	1	Schweden	2	[{"changed": {"fields": ["haltung"]}}]	10	1
495	2020-04-30 10:51:26.162522+02	0	Deutschland	2	[{"changed": {"fields": ["haltung"]}}]	10	1
496	2020-04-30 10:56:04.936536+02	31	Schweiz	2	[{"changed": {"fields": ["haltung"]}}]	11	1
497	2020-04-30 10:56:27.27197+02	30	Norwegen	2	[{"changed": {"fields": ["haltung"]}}]	11	1
498	2020-04-30 10:56:43.396125+02	29	Liechtenstein	2	[{"changed": {"fields": ["haltung"]}}]	11	1
499	2020-04-30 10:56:57.007618+02	28	Island	2	[{"changed": {"fields": ["haltung"]}}]	11	1
500	2020-04-30 10:57:12.19836+02	27	Zypern	2	[{"changed": {"fields": ["haltung"]}}]	11	1
501	2020-04-30 10:57:30.169063+02	26	Großbritannien	2	[{"changed": {"fields": ["haltung"]}}]	11	1
502	2020-04-30 10:57:45.50302+02	25	Ungarn	2	[{"changed": {"fields": ["haltung"]}}]	11	1
503	2020-04-30 10:58:03.979052+02	24	Tschechien	2	[{"changed": {"fields": ["haltung"]}}]	11	1
504	2020-04-30 10:58:22.159402+02	23	Spanien	2	[{"changed": {"fields": ["haltung"]}}]	11	1
505	2020-04-30 10:58:37.086489+02	22	Slowenien	2	[{"changed": {"fields": ["haltung"]}}]	11	1
506	2020-04-30 10:58:50.587939+02	21	Slowakei	2	[{"changed": {"fields": ["haltung"]}}]	11	1
507	2020-04-30 10:59:13.214564+02	20	Rumaenien	2	[{"changed": {"fields": ["haltung"]}}]	11	1
508	2020-04-30 11:18:32.718743+02	19	Portugal	2	[{"changed": {"fields": ["haltung"]}}]	11	1
509	2020-04-30 11:18:47.402176+02	18	Polen	2	[{"changed": {"fields": ["haltung"]}}]	11	1
510	2020-04-30 11:23:40.666387+02	17	Oesterreich	2	[{"changed": {"fields": ["haltung"]}}]	11	1
511	2020-04-30 11:23:59.673115+02	16	Niederlande	2	[{"changed": {"fields": ["haltung"]}}]	11	1
512	2020-04-30 11:24:17.507003+02	15	Malta	2	[{"changed": {"fields": ["haltung"]}}]	11	1
513	2020-04-30 11:24:29.87161+02	14	Luxemburg	2	[{"changed": {"fields": ["haltung"]}}]	11	1
514	2020-04-30 11:24:49.960314+02	13	Litauen	2	[{"changed": {"fields": ["land", "haltung"]}}]	11	1
515	2020-04-30 11:25:24.327073+02	12	Lettland	2	[{"changed": {"fields": ["haltung"]}}]	11	1
516	2020-04-30 11:26:32.284687+02	11	Kroatien	2	[{"changed": {"fields": ["haltung"]}}]	11	1
517	2020-04-30 11:26:48.392241+02	10	Italien	2	[{"changed": {"fields": ["haltung"]}}]	11	1
518	2020-04-30 11:27:07.166962+02	9	Griechenland	2	[{"changed": {"fields": ["haltung"]}}]	11	1
519	2020-04-30 11:27:28.391004+02	8	Irland	2	[{"changed": {"fields": ["haltung"]}}]	11	1
520	2020-04-30 11:27:48.491972+02	7	Frankreich	2	[{"changed": {"fields": ["haltung"]}}]	11	1
521	2020-04-30 11:28:04.372425+02	6	Finnland	2	[{"changed": {"fields": ["haltung"]}}]	11	1
522	2020-04-30 11:28:50.296839+02	5	Estland	2	[{"changed": {"fields": ["haltung"]}}]	11	1
523	2020-04-30 11:29:14.119726+02	4	Daenemark	2	[{"changed": {"fields": ["haltung"]}}]	11	1
524	2020-04-30 11:29:54.547005+02	3	Bulgarien	2	[{"changed": {"fields": ["haltung"]}}]	11	1
525	2020-04-30 11:30:26.052839+02	2	Belgien	2	[{"changed": {"fields": ["haltung"]}}]	11	1
526	2020-04-30 11:30:43.729116+02	1	Schweden	2	[{"changed": {"fields": ["haltung"]}}]	11	1
527	2020-04-30 11:30:57.419061+02	0	Deutschland	2	[{"changed": {"fields": ["haltung"]}}]	11	1
528	2020-04-30 23:11:43.678695+02	31	Schweiz	2	[{"changed": {"fields": ["haltung"]}}]	12	1
529	2020-04-30 23:12:02.188209+02	30	Norwegen	2	[{"changed": {"fields": ["haltung"]}}]	12	1
530	2020-04-30 23:12:22.760452+02	29	Liechtenstein	2	[{"changed": {"fields": ["haltung"]}}]	12	1
531	2020-04-30 23:12:36.314364+02	28	Island	2	[{"changed": {"fields": ["haltung"]}}]	12	1
532	2020-04-30 23:12:51.189934+02	27	Zypern	2	[{"changed": {"fields": ["haltung"]}}]	12	1
533	2020-04-30 23:13:03.408881+02	26	Großbritannien	2	[{"changed": {"fields": ["haltung"]}}]	12	1
534	2020-04-30 23:13:15.911585+02	25	Ungarn	2	[{"changed": {"fields": ["haltung"]}}]	12	1
535	2020-04-30 23:13:29.152218+02	24	Tschechien	2	[{"changed": {"fields": ["haltung"]}}]	12	1
536	2020-04-30 23:13:52.128458+02	23	Spanien	2	[{"changed": {"fields": ["haltung"]}}]	12	1
537	2020-04-30 23:14:04.639658+02	22	Slowenien	2	[{"changed": {"fields": ["haltung"]}}]	12	1
538	2020-04-30 23:14:17.837253+02	21	Slowakei	2	[{"changed": {"fields": ["haltung"]}}]	12	1
539	2020-04-30 23:14:29.662533+02	20	Rumaenien	2	[{"changed": {"fields": ["haltung"]}}]	12	1
540	2020-04-30 23:14:53.60289+02	19	Portugal	2	[{"changed": {"fields": ["haltung"]}}]	12	1
541	2020-04-30 23:15:05.491757+02	18	Polen	2	[{"changed": {"fields": ["haltung"]}}]	12	1
542	2020-04-30 23:15:20.133792+02	17	Oesterreich	2	[{"changed": {"fields": ["haltung"]}}]	12	1
543	2020-04-30 23:15:34.310268+02	16	Niederlande	2	[{"changed": {"fields": ["haltung"]}}]	12	1
544	2020-04-30 23:16:40.99919+02	15	Malta	2	[{"changed": {"fields": ["haltung"]}}]	12	1
545	2020-04-30 23:17:00.177348+02	14	Luxemburg	2	[{"changed": {"fields": ["haltung"]}}]	12	1
546	2020-04-30 23:17:18.144811+02	13	Litauen	2	[{"changed": {"fields": ["land", "haltung"]}}]	12	1
547	2020-04-30 23:17:31.092774+02	12	Lettland	2	[{"changed": {"fields": ["haltung"]}}]	12	1
548	2020-04-30 23:17:47.259249+02	11	Kroatien	2	[{"changed": {"fields": ["haltung"]}}]	12	1
549	2020-04-30 23:18:08.92878+02	10	Italien	2	[{"changed": {"fields": ["haltung"]}}]	12	1
550	2020-04-30 23:19:39.480073+02	9	Griechenland	2	[{"changed": {"fields": ["haltung"]}}]	12	1
551	2020-04-30 23:19:55.683912+02	8	Irland	2	[{"changed": {"fields": ["haltung"]}}]	12	1
552	2020-04-30 23:20:10.893582+02	7	Frankreich	2	[{"changed": {"fields": ["haltung"]}}]	12	1
553	2020-04-30 23:20:26.059001+02	6	Finnland	2	[{"changed": {"fields": ["haltung"]}}]	12	1
554	2020-04-30 23:20:39.017556+02	5	Estland	2	[{"changed": {"fields": ["haltung"]}}]	12	1
555	2020-04-30 23:21:14.641124+02	4	Daenemark	2	[{"changed": {"fields": ["haltung"]}}]	12	1
556	2020-04-30 23:21:30.643442+02	3	Bulgarien	2	[{"changed": {"fields": ["haltung"]}}]	12	1
557	2020-04-30 23:21:50.231004+02	2	Belgien	2	[{"changed": {"fields": ["haltung"]}}]	12	1
558	2020-04-30 23:22:04.549469+02	1	Schweden	2	[{"changed": {"fields": ["haltung"]}}]	12	1
559	2020-04-30 23:22:22.842883+02	0	Deutschland	2	[{"changed": {"fields": ["haltung"]}}]	12	1
560	2020-04-30 23:23:25.05815+02	31	Schweiz	2	[{"changed": {"fields": ["haltung"]}}]	13	1
561	2020-04-30 23:23:45.496309+02	0	Deutschland	2	[{"changed": {"fields": ["haltung"]}}]	13	1
562	2020-04-30 23:24:06.946496+02	1	Schweden	2	[{"changed": {"fields": ["haltung"]}}]	13	1
563	2020-04-30 23:24:29.072873+02	2	Belgien	2	[{"changed": {"fields": ["haltung"]}}]	13	1
564	2020-04-30 23:24:56.990281+02	3	Bulgarien	2	[{"changed": {"fields": ["haltung"]}}]	13	1
565	2020-04-30 23:25:21.325646+02	4	Daenemark	2	[{"changed": {"fields": ["haltung"]}}]	13	1
566	2020-04-30 23:25:33.99265+02	5	Estland	2	[{"changed": {"fields": ["haltung"]}}]	13	1
567	2020-04-30 23:25:47.754389+02	6	Finnland	2	[{"changed": {"fields": ["haltung"]}}]	13	1
568	2020-04-30 23:26:40.764455+02	7	Frankreich	2	[{"changed": {"fields": ["haltung"]}}]	13	1
569	2020-04-30 23:27:04.574646+02	8	Irland	2	[{"changed": {"fields": ["haltung"]}}]	13	1
570	2020-04-30 23:27:25.179466+02	9	Griechenland	2	[{"changed": {"fields": ["haltung"]}}]	13	1
571	2020-04-30 23:27:37.839584+02	10	Italien	2	[{"changed": {"fields": ["haltung"]}}]	13	1
572	2020-04-30 23:28:13.339903+02	11	Kroatien	2	[{"changed": {"fields": ["haltung"]}}]	13	1
573	2020-04-30 23:28:38.703078+02	12	Lettland	2	[{"changed": {"fields": ["haltung"]}}]	13	1
574	2020-04-30 23:28:58.348761+02	13	Litauen	2	[{"changed": {"fields": ["land", "haltung"]}}]	13	1
575	2020-04-30 23:29:09.240683+02	14	Luxemburg	2	[{"changed": {"fields": ["haltung"]}}]	13	1
576	2020-04-30 23:29:21.410907+02	15	Malta	2	[{"changed": {"fields": ["haltung"]}}]	13	1
577	2020-04-30 23:29:35.925173+02	16	Niederlande	2	[{"changed": {"fields": ["haltung"]}}]	13	1
578	2020-04-30 23:30:07.673064+02	17	Oesterreich	2	[{"changed": {"fields": ["haltung"]}}]	13	1
579	2020-04-30 23:30:22.030838+02	18	Polen	2	[{"changed": {"fields": ["haltung"]}}]	13	1
580	2020-04-30 23:30:37.737566+02	19	Portugal	2	[{"changed": {"fields": ["haltung"]}}]	13	1
581	2020-04-30 23:30:51.872304+02	20	Rumaenien	2	[{"changed": {"fields": ["haltung"]}}]	13	1
582	2020-04-30 23:31:08.75943+02	21	Slowakei	2	[{"changed": {"fields": ["haltung"]}}]	13	1
583	2020-04-30 23:31:22.750424+02	22	Slowenien	2	[{"changed": {"fields": ["haltung"]}}]	13	1
584	2020-04-30 23:31:37.007891+02	23	Spanien	2	[{"changed": {"fields": ["haltung"]}}]	13	1
585	2020-04-30 23:31:56.378169+02	24	Tschechien	2	[{"changed": {"fields": ["haltung"]}}]	13	1
586	2020-04-30 23:32:27.43222+02	25	Ungarn	2	[{"changed": {"fields": ["haltung"]}}]	13	1
587	2020-04-30 23:32:57.183168+02	26	Großbritannien	2	[{"changed": {"fields": ["haltung"]}}]	13	1
588	2020-04-30 23:33:08.895098+02	27	Zypern	2	[{"changed": {"fields": ["haltung"]}}]	13	1
589	2020-04-30 23:33:23.439696+02	28	Island	2	[{"changed": {"fields": ["haltung"]}}]	13	1
590	2020-04-30 23:33:49.815889+02	29	Liechtenstein	2	[{"changed": {"fields": ["haltung"]}}]	13	1
591	2020-04-30 23:34:13.985565+02	30	Norwegen	2	[{"changed": {"fields": ["haltung"]}}]	13	1
592	2020-04-30 23:36:19.648703+02	31	Schweiz	2	[{"changed": {"fields": ["haltung"]}}]	14	1
593	2020-04-30 23:36:39.682047+02	30	Norwegen	2	[{"changed": {"fields": ["haltung"]}}]	14	1
594	2020-04-30 23:36:57.674158+02	29	Liechtenstein	2	[{"changed": {"fields": ["haltung"]}}]	14	1
595	2020-04-30 23:37:18.923449+02	28	Island	2	[{"changed": {"fields": ["haltung"]}}]	14	1
596	2020-04-30 23:37:34.326989+02	27	Zypern	2	[{"changed": {"fields": ["haltung"]}}]	14	1
597	2020-04-30 23:37:52.667363+02	26	Großbritannien	2	[{"changed": {"fields": ["haltung"]}}]	14	1
598	2020-04-30 23:38:07.967844+02	25	Ungarn	2	[{"changed": {"fields": ["haltung"]}}]	14	1
599	2020-04-30 23:38:22.537286+02	24	Tschechien	2	[{"changed": {"fields": ["haltung"]}}]	14	1
600	2020-04-30 23:38:44.446676+02	23	Spanien	2	[{"changed": {"fields": ["haltung"]}}]	14	1
601	2020-04-30 23:39:10.122848+02	22	Slowenien	2	[{"changed": {"fields": ["haltung"]}}]	14	1
602	2020-04-30 23:39:31.314858+02	21	Slowakei	2	[{"changed": {"fields": ["haltung"]}}]	14	1
603	2020-04-30 23:39:48.184752+02	20	Rumaenien	2	[{"changed": {"fields": ["haltung"]}}]	14	1
604	2020-04-30 23:40:07.4913+02	19	Portugal	2	[{"changed": {"fields": ["haltung"]}}]	14	1
605	2020-04-30 23:40:24.140541+02	18	Polen	2	[{"changed": {"fields": ["haltung"]}}]	14	1
606	2020-04-30 23:40:42.166759+02	17	Oesterreich	2	[{"changed": {"fields": ["haltung"]}}]	14	1
607	2020-04-30 23:41:02.083812+02	16	Niederlande	2	[{"changed": {"fields": ["haltung"]}}]	14	1
608	2020-04-30 23:41:13.37946+02	15	Malta	2	[{"changed": {"fields": ["haltung"]}}]	14	1
609	2020-04-30 23:41:24.632679+02	14	Luxemburg	2	[{"changed": {"fields": ["haltung"]}}]	14	1
610	2020-04-30 23:41:41.318377+02	13	Litauen	2	[{"changed": {"fields": ["land", "haltung"]}}]	14	1
611	2020-04-30 23:42:00.283923+02	12	Lettland	2	[{"changed": {"fields": ["haltung"]}}]	14	1
612	2020-04-30 23:42:16.150471+02	11	Kroatien	2	[{"changed": {"fields": ["haltung"]}}]	14	1
613	2020-04-30 23:42:28.399268+02	10	Italien	2	[{"changed": {"fields": ["haltung"]}}]	14	1
614	2020-04-30 23:42:48.766254+02	9	Griechenland	2	[{"changed": {"fields": ["haltung"]}}]	14	1
615	2020-04-30 23:43:07.772545+02	8	Irland	2	[{"changed": {"fields": ["haltung"]}}]	14	1
616	2020-04-30 23:43:26.35876+02	7	Frankreich	2	[{"changed": {"fields": ["haltung"]}}]	14	1
617	2020-04-30 23:43:42.038795+02	6	Finnland	2	[{"changed": {"fields": ["haltung"]}}]	14	1
618	2020-04-30 23:44:10.737094+02	5	Estland	2	[{"changed": {"fields": ["haltung"]}}]	14	1
619	2020-04-30 23:44:50.29965+02	4	Daenemark	2	[{"changed": {"fields": ["haltung"]}}]	14	1
620	2020-04-30 23:45:12.404784+02	3	Bulgarien	2	[{"changed": {"fields": ["haltung"]}}]	14	1
621	2020-04-30 23:45:39.975733+02	2	Belgien	2	[{"changed": {"fields": ["haltung"]}}]	14	1
622	2020-04-30 23:45:55.466918+02	1	Schweden	2	[{"changed": {"fields": ["haltung"]}}]	14	1
623	2020-04-30 23:46:13.001122+02	0	Deutschland	2	[{"changed": {"fields": ["haltung"]}}]	14	1
624	2020-04-30 23:52:37.767944+02	31	Schweiz	2	[{"changed": {"fields": ["haltung"]}}]	15	1
625	2020-04-30 23:53:08.0133+02	30	Norwegen	2	[{"changed": {"fields": ["haltung"]}}]	15	1
626	2020-04-30 23:53:20.111273+02	29	Liechtenstein	2	[{"changed": {"fields": ["haltung"]}}]	15	1
627	2020-04-30 23:53:33.571138+02	28	Island	2	[{"changed": {"fields": ["haltung"]}}]	15	1
628	2020-04-30 23:53:44.536487+02	27	Zypern	2	[{"changed": {"fields": ["haltung"]}}]	15	1
629	2020-04-30 23:54:24.224258+02	26	Großbritannien	2	[{"changed": {"fields": ["haltung"]}}]	15	1
630	2020-04-30 23:54:38.193395+02	25	Ungarn	2	[{"changed": {"fields": ["haltung"]}}]	15	1
631	2020-04-30 23:54:59.267558+02	24	Tschechien	2	[{"changed": {"fields": ["haltung"]}}]	15	1
632	2020-04-30 23:55:20.942575+02	23	Spanien	2	[{"changed": {"fields": ["haltung"]}}]	15	1
633	2020-04-30 23:55:38.456661+02	22	Slowenien	2	[{"changed": {"fields": ["haltung"]}}]	15	1
634	2020-04-30 23:56:01.714379+02	21	Slowakei	2	[{"changed": {"fields": ["haltung"]}}]	15	1
635	2020-04-30 23:56:15.616175+02	20	Rumaenien	2	[{"changed": {"fields": ["haltung"]}}]	15	1
636	2020-04-30 23:57:33.666128+02	19	Portugal	2	[{"changed": {"fields": ["haltung"]}}]	15	1
637	2020-04-30 23:57:53.262097+02	18	Polen	2	[{"changed": {"fields": ["haltung"]}}]	15	1
638	2020-04-30 23:58:13.293237+02	17	Oesterreich	2	[{"changed": {"fields": ["haltung"]}}]	15	1
639	2020-04-30 23:58:30.019026+02	16	Niederlande	2	[{"changed": {"fields": ["haltung"]}}]	15	1
640	2020-04-30 23:58:50.09885+02	15	Malta	2	[{"changed": {"fields": ["haltung"]}}]	15	1
641	2020-04-30 23:59:03.598858+02	14	Luxemburg	2	[{"changed": {"fields": ["haltung"]}}]	15	1
642	2020-04-30 23:59:21.782935+02	13	Litauen	2	[{"changed": {"fields": ["land", "haltung"]}}]	15	1
643	2020-04-30 23:59:34.994631+02	12	Lettland	2	[{"changed": {"fields": ["haltung"]}}]	15	1
644	2020-04-30 23:59:50.338893+02	11	Kroatien	2	[{"changed": {"fields": ["haltung"]}}]	15	1
645	2020-05-01 00:00:10.423383+02	10	Italien	2	[{"changed": {"fields": ["haltung"]}}]	15	1
646	2020-05-01 00:00:34.781185+02	9	Griechenland	2	[{"changed": {"fields": ["haltung"]}}]	15	1
647	2020-05-01 00:01:02.836449+02	8	Irland	2	[{"changed": {"fields": ["haltung"]}}]	15	1
648	2020-05-01 00:01:25.954848+02	7	Frankreich	2	[{"changed": {"fields": ["haltung"]}}]	15	1
649	2020-05-01 00:01:40.862186+02	6	Finnland	2	[{"changed": {"fields": ["haltung"]}}]	15	1
650	2020-05-01 00:01:58.994612+02	5	Estland	2	[{"changed": {"fields": ["haltung"]}}]	15	1
651	2020-05-01 00:02:18.215063+02	4	Daenemark	2	[{"changed": {"fields": ["haltung"]}}]	15	1
652	2020-05-01 00:02:59.514493+02	3	Bulgarien	2	[{"changed": {"fields": ["haltung"]}}]	15	1
653	2020-05-01 00:03:23.908899+02	2	Belgien	2	[{"changed": {"fields": ["haltung"]}}]	15	1
654	2020-05-01 00:03:43.015617+02	1	Schweden	2	[{"changed": {"fields": ["haltung"]}}]	15	1
655	2020-05-01 00:03:56.593872+02	0	Deutschland	2	[{"changed": {"fields": ["haltung"]}}]	15	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	geosyrienapp	waterconsumption
8	geosyrienapp	refugees2011
9	geosyrienapp	refugees2012
10	geosyrienapp	refugees2013
11	geosyrienapp	refugees2014
12	geosyrienapp	refugees2015
13	geosyrienapp	refugees2016
14	geosyrienapp	refugees2017
15	geosyrienapp	refugees2018
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-11-08 01:30:10.257712+01
2	auth	0001_initial	2019-11-08 01:30:10.304782+01
3	admin	0001_initial	2019-11-08 01:30:10.356136+01
4	admin	0002_logentry_remove_auto_add	2019-11-08 01:30:10.375367+01
5	admin	0003_logentry_add_action_flag_choices	2019-11-08 01:30:10.389853+01
6	contenttypes	0002_remove_content_type_name	2019-11-08 01:30:10.410865+01
7	auth	0002_alter_permission_name_max_length	2019-11-08 01:30:10.417859+01
8	auth	0003_alter_user_email_max_length	2019-11-08 01:30:10.430095+01
9	auth	0004_alter_user_username_opts	2019-11-08 01:30:10.442795+01
10	auth	0005_alter_user_last_login_null	2019-11-08 01:30:10.45273+01
11	auth	0006_require_contenttypes_0002	2019-11-08 01:30:10.454797+01
12	auth	0007_alter_validators_add_error_messages	2019-11-08 01:30:10.46523+01
13	auth	0008_alter_user_username_max_length	2019-11-08 01:30:10.480746+01
14	auth	0009_alter_user_last_name_max_length	2019-11-08 01:30:10.490744+01
15	auth	0010_alter_group_name_max_length	2019-11-08 01:30:10.50162+01
16	auth	0011_update_proxy_permissions	2019-11-08 01:30:10.528386+01
17	sessions	0001_initial	2019-11-08 01:30:10.536581+01
23	geosyrienapp	0001_initial	2020-02-18 12:16:03.020978+01
24	geosyrienapp	0002_auto_20200227_1344	2020-02-27 14:45:16.908548+01
25	geosyrienapp	0003_auto_20200430_0006	2020-04-30 02:07:25.566309+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
g0w99mebxuew85b5us2rbisxfo9n48ow	MzljMzllY2JhMGJkNGQ2YWY5MDM0OWJiN2I5OWM5OGFmNTk2YTdlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZDIyYjE1YjEzYWVhZjdkNzJmYjY0MmQzZGIyZWFiODgxZTRjM2NiIn0=	2019-12-23 15:45:04.63722+01
583tm3sffaw6puio1o3hniq5quirbv6l	MzljMzllY2JhMGJkNGQ2YWY5MDM0OWJiN2I5OWM5OGFmNTk2YTdlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZDIyYjE1YjEzYWVhZjdkNzJmYjY0MmQzZGIyZWFiODgxZTRjM2NiIn0=	2020-01-01 03:02:51.77048+01
76vs3e08xfexbv8d35o1kuk7fagbp7pg	ZjgyNTk0NzMxMTg0MDkwZjNiNWY3MDM2NjgzNjE0ZDBkZDVkZDI4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MmZmY2Q1ZDc1MTdiYTNhNWNhMmE2OTJhNDQyMzdjN2RmNTFmOTdlIn0=	2020-01-19 01:18:14.722578+01
h1z95yoa5k1n48gfw0f4bz1ml4x4zaz9	ZjgyNTk0NzMxMTg0MDkwZjNiNWY3MDM2NjgzNjE0ZDBkZDVkZDI4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MmZmY2Q1ZDc1MTdiYTNhNWNhMmE2OTJhNDQyMzdjN2RmNTFmOTdlIn0=	2020-02-06 12:41:56.54089+01
pzioxtkdilf28ecjkg46wh6zqlvdr46e	ZjgyNTk0NzMxMTg0MDkwZjNiNWY3MDM2NjgzNjE0ZDBkZDVkZDI4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MmZmY2Q1ZDc1MTdiYTNhNWNhMmE2OTJhNDQyMzdjN2RmNTFmOTdlIn0=	2020-02-20 17:51:54.595012+01
bsdrkcytzduxv5314kmu1w9xco4q2ps6	ZjgyNTk0NzMxMTg0MDkwZjNiNWY3MDM2NjgzNjE0ZDBkZDVkZDI4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MmZmY2Q1ZDc1MTdiYTNhNWNhMmE2OTJhNDQyMzdjN2RmNTFmOTdlIn0=	2020-03-12 14:45:51.993134+01
z86ju4ma4tn3mr91h4e1y779cxlsrv6b	ZjgyNTk0NzMxMTg0MDkwZjNiNWY3MDM2NjgzNjE0ZDBkZDVkZDI4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MmZmY2Q1ZDc1MTdiYTNhNWNhMmE2OTJhNDQyMzdjN2RmNTFmOTdlIn0=	2020-03-17 18:26:45.958946+01
gjxcla9woae0ju7ot0izt8d5s7r8rj1t	ZjgyNTk0NzMxMTg0MDkwZjNiNWY3MDM2NjgzNjE0ZDBkZDVkZDI4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MmZmY2Q1ZDc1MTdiYTNhNWNhMmE2OTJhNDQyMzdjN2RmNTFmOTdlIn0=	2020-03-30 02:52:58.740372+02
v9vxu1krx5ovtuxmukk7dd8ljn5gfp7x	ZjgyNTk0NzMxMTg0MDkwZjNiNWY3MDM2NjgzNjE0ZDBkZDVkZDI4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MmZmY2Q1ZDc1MTdiYTNhNWNhMmE2OTJhNDQyMzdjN2RmNTFmOTdlIn0=	2020-04-15 00:07:06.34699+02
d99espi4ue6hzfldk7pomakjyui2rlxc	ZjgyNTk0NzMxMTg0MDkwZjNiNWY3MDM2NjgzNjE0ZDBkZDVkZDI4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MmZmY2Q1ZDc1MTdiYTNhNWNhMmE2OTJhNDQyMzdjN2RmNTFmOTdlIn0=	2020-04-30 01:17:54.808212+02
zqde9pdqaq9j0utpnjiqz5mgi8rr5yer	ZjgyNTk0NzMxMTg0MDkwZjNiNWY3MDM2NjgzNjE0ZDBkZDVkZDI4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MmZmY2Q1ZDc1MTdiYTNhNWNhMmE2OTJhNDQyMzdjN2RmNTFmOTdlIn0=	2020-05-14 02:07:53.467412+02
\.


--
-- Data for Name: geosyrienapp_refugees2011; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.geosyrienapp_refugees2011 ("Id", land, pop, "refRatio", "refTotal", male, female, u18, u18erstantrag, u34, u34erstantrag, u64, u64erstantrag, ue65, ue65erstantrag, unknown, erstantrag, folgeantrag, geom, haltung) FROM stdin;
37	Tuerkei	72913709	3.48754717717076002	25429	14510	10919	8577	\N	16049	\N	\N	\N	803	\N	\N	\N	\N	0101000020E61000004C256344A09541400B36979AE2874340	\N
0	Deutschland	80328000	0.427621750821631008	3435	2095	1340	1300	1040	1505	1200	590	360	40	30	0	2635	3435	0101000020E6100000AA96D20585C524405F3D7294B18D4940	Das Resettlement-Programm von Deutschland:\r\nDas Aufnahmeprogramm für syrische Flüchtlinge aus der Türkei, welches mit der Aufnahmeanordnung des Bundesministerium des Innern (BMI) vom 11. Januar 2017 begonnen hatte wird nun mit der Aufnahmeanordnung vom 13. Januar 2020 fortgesetzt. Das BMI hat entschieden das deutsche Engagement fortzusetzen und eine Aufnahme von bis zu 500 Personen pro Monat bis zum 31. Dezember 2020 zu ermöglichen. Die Anordnung wurde mit den obersten Landesbehörden abgestimmt. Den Begleitregelungen können Sie detaillierte Informationen zum Programm entnehmen. So können auch unbegleitete Minderjährige über dieses humanitäre Verfahren Schutz in Deutschland finden.\r\n\r\nQuelle: www.resettlement.de
28	Island	318000	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0101000020E6100000573EED26EF9232C0A0A4666EBA3F5040	Im Zeitraum 2015 - 2016 hat Island die Umsiedlung von rund 90 Personen aus Syrien genehmigt. Die erste Gruppe ist am 19. Januar 2016 und die zweite Gruppe am 6. April 2016 eingetroffen. Bis April 2016 sind insgesamt 48 Syrer eingetroffen.\r\n\r\nQuelle: https://www.unhcr.org/3c5e58384.pdf
7	Frankreich	63070000	0.0190264785159347007	120	90	30	20	65	65	30	30	5	5	5	\N	120	\N	0101000020E6100000BF1072DEFFE707401AA6B6D4416A4740	Seit 2013 hat Frankreich mehr als 4600 Asyl für Syrer gewährt. Frankreich hat außerdem zugesagt, 1000 Syrer durch Studentenvisa (Stipendienprogramm) und 500 Syrer und Iraker durch ein neues Programm "Humanitarian Corridors" (privates Sponsoring) aufzunehmen, das 2017/2018 aus dem Libanon eingeführt werden soll.\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
5	Estland	1330000	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0101000020E610000084CF2752E08A3940CC8100CB01564D40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Estland versprach 2016 und 2017 auf der Grundlage des Migrationsplans der Europäischen Kommission 580 Flüchtlinge umzusiedeln.
11	Kroatien	4280000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0101000020E61000006B986CFF74673040CE8A2E0C4D8A4640	Kroatien hat durch die Umsiedlung von 152 syrischen Staatsangehörigen die Anforderungen vollständig erfüllt. Als zusätzliche Solidaritätsmaßnahme hat die Regierung im Oktober 2017 einen Beschluss über die Umsiedlung von weiteren 100 syrischen Flüchtlingen aus der Türkei durchgesetzt. Im Mai und August 2018 wurden zwei Auswahlmissionen in der Türkei (Ankara) durchgeführt. Von Januar bis November 2018 wurden 112 Syrer aus der Türkei nach Kroatien umgesiedelt.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/04a_croatia_arm2018_part2_en.pdf
13	Litauen	3030000	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0101000020E61000008616E71D1FE33740FD83A6F7BDA94B40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
14	Luxemburg	512000	0.1953125	10	5	5	0	0	5	5	0	0	0	0	5	10	10	0101000020E6100000B0AB8BB58B491840D678BE5D35E24840	In Luxemburg gibt es kein offizielles Resettlement-Programm. Es gibt jedoch eine Ad-hoc-Resettlement.
15	Malta	415000	3.01204819277108005	125	115	5	10	10	100	95	15	15	0	0	0	120	125	0101000020E6100000A0D8A7B87ACF2C40E2666B97F3F54140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
18	Polen	38538447	0.00259481135812244992	10	10	5	0	0	10	10	0	0	0	0	\N	10	10	0101000020E6100000687C9573DF633340BC79D70D55104A40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
19	Portugal	10276617	0	0	0	0	0	0	0	0	0	0	0	0	\N	0	0	0101000020E61000001CA9D4C9880021C0B7A9639039CC4340	Im Zeitraum von 2018-2019 hat Portugal gemäß den von der Europäischen Kommission festgelegten Prioritäten 1010 Menschen umgesiedelt. Davon wurden 606 Flüchtlinge aus der Türkei umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/4e92a0cc9/unhcr-resettlement-handbook-country-chapter-portugal.html
25	Ungarn	9990000	0.0900900900900900997	90	65	25	20	\N	50	\N	20	\N	0	\N	\N	\N	90	0101000020E61000000ECB597645653340A0A82ED0D5944740	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch Ungarn.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
21	Slowakei	5404322	0.0185037086983344014	10	5	5	5	5	0	0	0	0	0	0	\N	5	10	0101000020E6100000E7E6EA29A37A3340F2A896034D5A4840	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch die Slowakei.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
20	Rumaenien	20200000	0.0173267326732673005	35	30	5	5	5	25	25	10	10	0	0	\N	35	35	0101000020E610000007825CF711F938406863CE771CED4640	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Um die Resettlement- und Integrationspolitik Rumäniens zu verbessern, beriet die UNHCR die Regierung bei der Verbesserung und Stärkung ihres Handlungrahmens. In Zusammenarbeit mit NRO-Partnern organisiert UNHCR auch Sensibilisierungs- und Schulungssitzungen zum Thema Integration für Regierungsbeamte.\r\n\r\nQuelle: https://www.unhcr.org/ro/homepage/despre-noi/resurse/publicatii/romania-eng
35	Irak	31367957	104.730760756909007	328519	166565	161954	148183	\N	165215	\N	\N	\N	15121	\N	\N	\N	\N	0101000020E61000009AF8310A2CDF4540690D961415854040	\N
34	Israel	7491851	64.9332187733045032	48647	35465	13182	2317	\N	45830	\N	\N	\N	500	\N	\N	\N	\N	0101000020E6100000048588B79180414061D545B70A763F40	\N
33	Libanon	4464427	34.8891358286292999	15576	9059	6517	5975	\N	9117	\N	\N	\N	248	\N	236	\N	\N	0101000020E61000001213371BA9F04140B182650927F64040	\N
32	Jordanien	6639142	57.5089371488062966	38181	19817	18364	13163	\N	21768	\N	\N	\N	3250	\N	\N	\N	\N	0101000020E6100000A58864F5BB6242409E1F3927EC3E3F40	\N
36	Aegypten	82914314	13.7593853818775003	114085	61211	52864	54693	\N	56748	\N	\N	\N	2644	\N	\N	\N	\N	0101000020E610000041E0178BA5DC3D40DFFDD878F57E3A40	\N
27	Zypern	840000	2.20238095238094989	185	150	35	40	40	125	120	25	20	0	0	\N	180	185	0101000020E61000002B1E11AEC4804040FE18038355754140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
24	Tschechien	10505445	0.0237971832701994006	25	20	5	5	0	15	5	5	0	0	0	\N	5	25	0101000020E610000035D02F1BF39F2E40C4D78874E0DD4840	2015 initiierte die Tschechische Republik ein Resettlement Programm für syrische Flüchtlingsfamilien in Jordanien mit schwerkranken Kindern. Darüber hinaus hat sich die Tschechische Republik im Juli 2015 dem Europäischen Resettlement Programm angeschlossen und sich verpflichtet bis Juli 2017 400 Flüchtlinge umzusiedeln. Im Rahmen des Programms hat die Tschechische Republik 2015 insgesamt 20 syrische Flüchtlinge aus Jordanien und 2016 32 irakische Flüchtlinge aus Libanon umgesiedelt.\r\nDas Resettlement Programm der Tschechischen Republik wurde von der Regierung im Juni 2017 ausgesetzt.\r\nQuelle: https://www.unhcr.org/4e2d65a79.pdf
22	Slowenien	2054741	0.0486679343041288015	10	10	5	5	5	5	5	0	0	0	0	\N	10	10	0101000020E6100000F19D0EDFDF9B2D4055C48844CA0E4740	Slowenien setzte sein erstes Resettlement Programm für Flüchtlinge mit Unterstützung der IOM und der UN-Migrationsagentur um, indem es 2018 34 syrische Flüchtlinge aus der Türkei nach Slowenien umsiedelte. Das Programm für Flüchtlinge trat nach der Unterzeichnung eines Rahmenabkommens zwischen der IOM, der UN-Migrationsagentur und slowenische Regierung im April 2018 in Kraft.\r\n\r\nQuelle: https://www.iom.int/news/slovenias-first-refugee-resettlement-programme-completed-after-arrival-last-syrian-family
23	Spanien	46815916	0.020292244201736899	95	80	20	25	25	50	40	20	20	0	0	\N	85	95	0101000020E6100000E44148F12E2E0DC0A70F72594B1F4440	Der spanische Ministerrat stimmte am 29. Januar 2010 zur Einrichtung eines jährlichen Programms zum Resettlement von Flüchtlingen gemäß dem kürzlich geänderten Asylgesetz zu. Bis 2017 wurden 1709 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: \r\nhttps://www.unhcr.org/news/briefing/2010/2/4b681a469/unhcr-welcomes-establishment-spains-resettlement-programme.html\r\nhttps://www.refworld.org/country,,UNHCR,,ESP,,59786cf14,0.html
26	Großbritannien	63290000	0.0813714646863644003	515	375	135	110	110	275	270	105	105	5	5	\N	510	515	0101000020E610000030531E48D0EC06C0F09CF005DB0F4B40	Syrian Resettlement Programme (VPRS):\r\nDas syrische Resettlement Programm soll den am stärksten gefährdeten Personen helfen - Überlebenden von Folter, Menschen mit schwerwiegenden Erkrankungen und Frauen mit Kindern. Sie werden von der UN identifiziert und dann vom Innenministerium überprüft, bevor sie nach Großbritannien umgesiedelt werden. Die Regierung plant mit dem Programm die Umsiedlung von 20000 syrischen Flüchtlingen aus Flüchtlingslagern in Jordanien, Libanon, Irak, Ägypten und der Türkei im Zeitraum von September 2015 bis Mai 2020.\r\n\r\nQuelle: https://www.refugeecouncil.org.uk/latest/projects/syrian-resettlement-programme-vprs/
29	Liechtenstein	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0101000020E610000025EE03EC4C122340BEA65D057E914740	Liechtenstein hat zwischen 2014 und 2016 6 syrische Flüchtlingsfamilien umgesiedelt. Darüber hinaus hat Liechtenstein im Rahmen des EU-Resettlement-Programms beschlossen, 43 Personen aus Griechenland und Italien umzusiedeln, von denen die ersten im Januar 2017 ankamen.\r\n\r\nQuelle: https://www.refworld.org/pdfid/5b0818244.pdf
30	Norwegen	4970000	0.40241448692152898	200	140	55	60	55	105	95	35	35	0	0	\N	185	200	0101000020E610000064A5087B5AB22E401C9D238D02305140	Das Resettlement Programm von Norwegen:\r\nDas norwegische Parlament entscheidet wie viele Flüchtlinge Norwegen durch das Programm im kommenden Jahr aufnehmen wird, welche Nationalitäten sie haben und woher sie kommen werden. Viele Jahre lang belief sich die Quote auf 1120 Flüchtlingen pro Jahr. Diese Quote wurde jedoch erstmals im Jahr 2014 und darüber hinaus im Jahr 2015 angesichts der Situation in Syrien erhöht. Die Quote beläuft sich 2015 auf 2620 Umsiedlungsflüchtlinge. 2014 wurden tausend Syrer aufgenommen, die nach Jordanien, Libanon und in die Türkei geflohen waren. Norwegens derzeitige Quote an Flüchtlingen des Resettlement Programms der UNHCR, beträgt 1200 Flüchtlinge pro Jahr.\r\n\r\nQuelle: https://www.npaid.org/Our-Work/Refugees-and-Integration/Reception-Service-for-Refugees\r\nhttps://www.iom.int/countries/norway
31	Schweiz	7950000	1.12578616352201011	895	650	245	285	240	500	360	110	85	0	0	\N	690	895	0101000020E610000054D53C69D76A2040B531933C20664740	Das Resettlement-Programm der Schweiz:\r\nFür die Mehrheit der Flüchtlinge bleibt die letzte Hoffnung auf eine dauerhafte Lösung für ihre Existenz die Niederlassung in einem dritten Land, wie zum Beispiel der Schweiz. Seit 2013 hat die Schweiz über 3500 syrische Flüchtlinge aufgenommen, die zuvor vom UNHCR als verletzlichste Schutzsuchende identifiziert worden sind. Die Kriterien der Schweiz für eine dauerhafte Aufnahme sind: erhöhten Schutzbedarf, Wille und Potential für eine Integration, zwischen 40 bis 60 Prozent Frauen und junge Frauen sowie sieben Prozent behinderte, ältere oder kranke Personen. Im November 2018 hat der Bundesrat bekräftigt, das Resettlement-Programm weiterzuführen und alle zwei Jahre weitere 1500 bis 2000 syrische Flüchtlinge sowie Schutzsuchende aus anderen Ländern aufzunehmen.\r\n\r\nQuelle: www.fluechtlingshilfe.ch
3	Bulgarien	7330000	0.115961800818554006	85	65	20	20	20	50	35	20	15	0	0	\N	65	85	0101000020E6100000C9FE08EA2C3739400B4D5D6B6B624540	Am 12. April 2016 genehmigte der bulgarische Ministerrat den Nationalen Rahmen für das Resettlement Programm, der mit einem Beschluss des Nationalen Rates für Migration und Integration verabschiedet wurde. Der Beschluss dient dazu die Verpflichtungen Bulgariens aus dem Abkommen zwischen der EU und der Türkei vom 18. März 2016 zu erfüllen. Am 28. November 2017 hat der bulgarische Ministerrat die Frist für das Resettlement Programm von 110 Flüchtlingen bis Ende Oktober 2019 verlängert.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/5bf2cf0a4/unhcr-resettlement-handbook-country-chapter-bulgaria.html
17	Oesterreich	8380000	0.519093078758950055	435	320	115	140	\N	235	\N	60	\N	5	\N	0	0	435	0101000020E6100000E903AF79C1402C40D2D0F07AF1CA4740	Im Herbst 2013 begann Österreich mit der Umsetzung eines neuen Aufnahmeprogramms für syrische Flüchtlinge: Humanitarian Admission Programme (HAP). Der erste Teil des HAP (HAP I) mit einer Quote von 500 syrischen Flüchtlingen wurde gemeinsam vom Bundesministerium des Innern, dem Bundesamt für Einwanderung und Asyl und dem Bundesministerium für Europa, Integration und auswärtige Angelegenheiten, der UNHCR und die Internationale Organisation für Migration (IOM) organisiert. Das Programm sollte syrischen Flüchtlingen direkt aus der Krisenregion helfen und wurde getrennt vom laufenden regulären Asylverfahren angeboten.\r\nBundesinnenministerin Johanna Mikl-Leitner erklärte am 19. April 2014, dass die HAP, die die am stärksten gefährdeten Flüchtlinge, darunter Frauen, Kinder und verfolgte Minderheiten wie Christen, unterstützt, um 1000 syrische Flüchtlinge erweitert werde (HAP II). Mit dieser Initiative folgt Österreich seiner humanitären Tradition und belegt nach Deutschland den zweiten Platz in Bezug auf EU-Mitgliedstaaten, die syrischen Flüchtlingen Schutz bieten.\r\nHauptziel des HAP ist es, die Nachbarstaaten Syriens zu unterstützen und ein starkes Signal für Solidarität in der internationalen Gemeinschaft zu setzen. Der Anstieg der Zahlen wurde durch die derzeitige dramatische Situation in Syrien gerechtfertigt.\r\n\r\nQuelle: https://www.resettlement.eu/country/austria
16	Niederlande	16690000	0.119832234871179999	200	140	55	30	30	110	90	50	40	5	5	5	170	200	0101000020E6100000CEB5DCE2332015402490F6AEE60C4A40	Das Resettlement Programm der Niederlande:\r\nDie Niederlande nehmen am Resettlement Programmteil. Die Regierung hat vereinbart im Zeitraum von 2016 bis 2019 insgesamt 2500 Flüchtlinge umzusiedeln, ungefähr 750 pro Jahr.\r\nEU-Türkei-Abkommen:\r\nDas Abkommen zwischen der EU und der Türkei bedeutet, dass ab dem 20. März 2016 jeder illegale Migrant, der nach Griechenland kommt, in die Türkei zurückkehren muss. Für jede syrische Person, die nach diesem Abkommen zurückkehrt, wird einem der teilnehmenden europäischen Mitgliedstaaten ein syrischer Flüchtling in der Türkei empfohlen. In den Jahren 2016 und 2017 wurden im Rahmen dieses Abkommens insgesamt fast 3.000 Syrer aus der Türkei in die Niederlande umgesiedelt. 2018 siedelten die Niederlande rund 750 Flüchtlinge aus der Türkei um. Für 2019 sollen 1000 Flüchtlinge aus der Türkei umgesiedelt werden.\r\n\r\nQuelle: https://www.coa.nl/en/reception-of-asylum-seekers/resettlement-of-refugees
12	Lettland	2080000	0.0721153846153845951	15	15	0	0	0	15	15	0	0	0	0	0	15	15	0101000020E61000002CC7FD6990E938405D6DC3B4E86C4C40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Im Vergleich zu den Vorjahren hat die Zahl der Asylbewerber aus Syrien zugenommen - 179 (2016 - 149). Am 14. November 2017 genehmigte das Kabinett den vom Innenminister verfassten Report zum Handlungsplan bezüglich der Aufnahme von Personen, die internationalen Schutz benötigen. Der Report sagte aus, dass Lettland die Anforderungen zur Umsiedlung von Flüchtlingen aus Griechenland, Türkei und Italien vollständig erfüllt hat. Die Flüchtlinge kamen mehrheitlich aus Syrien, Eritrea und Irak.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/16a_latvia_arm_part2_2017_en.pdf
10	Italien	59950000	0.0900750625521268	540	350	190	200	200	250	250	85	85	5	5	0	540	540	0101000020E610000059AD8ECBD823284040A1B5DAF7654540	Italien kündigte ein privates Sponsoring-Projekt (Humanitarian Corridors) an, das 1.000 Personen aufnehmen soll, darunter eine bedeutende Anzahl von Syrern. Bisher wurden 278 Syrer durch dieses Projekt aufgenommen (Stand: 30.04.2017).\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
9	Griechenland	11120000	0.314748201438849018	350	310	40	35	35	270	270	45	45	0	0	20	350	350	0101000020E6100000326BE8719FF43640D8FE65A58F894340	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Griechenland ist im EU-Türkei-Abkommen miteinbezogen. Für jede von den griechischen Inseln in die Türkei abgeschobene Person aus Syrien soll eine andere syrische Person aus der Türkei in der EU neu angesiedelt werden.\r\n\r\nQuelle: https://www.bpb.de/gesellschaft/migration/laenderprofile/243222/fluechtlingsabkommen-eu-tuerkei
8	Irland	4590000	0.0217864923747277013	10	5	5	5	5	5	5	5	5	0	0	5	10	10	0101000020E6100000DD659E819F4620C01DE7661A75964A40	Syrian Humanitarian Admission Programme:\r\nZusätzlich zu Irlands etablierten Programmen zum Resettlement von Flüchtlingen, führte die Regierung 2014 als Reaktion auf die sich verschärfende Krise in Syrien ein einmaliges privates Programm ein: das Syrian Humanitarian Admission Program (SHAP).\r\nAnträge für SHAP konnten in einem Zeitraum von sechs Wochen zwischen dem 14. März 2014 und dem 30. April 2014 gestellt werden. Mit SHAP konnten irische Staatsbürger syrischer Herkunft und in Irland rechtmäßig ansässige syrische Staatsangehörige beantragen, Familienmitglieder nach Syrien zu bringen oder aus Syrien in die umliegenden Länder vertrieben zu werden, nach Irland. Die Abteilung für Familienzusammenführung des irischen Einbürgerungs- und Einwanderungsdienstes (INIS) war für die Bearbeitung von Anträgen im Rahmen von SHAP verantwortlich. Irland erteilte 119 Personen, die das SHAP-System nutzen, aus Anträgen, die im Namen von 308 Personen gestellt wurden, die Erlaubnis, sich in Irland aufzuhalten. Die SHAP-Begünstigten durften sich zunächst zwei Jahre in Irland aufhalten.\r\n\r\nQuelle: https://www.unhcr.org/en-ie/resettlement-58c923ff4.html
6	Finnland	5380000	0.176579925650557995	95	70	25	\N	50	\N	20	\N	0	\N	\N	\N	\N	95	0101000020E610000005602B7C50463A40A068EB17ED1F5040	Seit 2001 betrug die Flüchtlingszahl im Rahmen des jährlichen Resettlement Programms 750 Personen. In den Jahren 2013 und 2014 hat die Regierung beschlossen, die Quote für die Jahre 2014 und 2015 um 300 Personen zu erhöhen, um der Situation in Syrien gerecht zu werden.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57f07/unhcr-resettlement-handbook-country-chapter-finland.html
4	Daenemark	5560000	0.845323741007193985	470	345	125	\N	\N	275	275	90	90	5	5	\N	470	470	0101000020E610000008FFEC50570E2440FBA56CB299FD4B40	Das Resettlement Programm sieht eine jährliche Zahl von 500 Umsiedlungsplätzen für Flüchtlinge vor. Ab Juli 2005 hat Dänemark ein dreijähriges flexibles Quotenprogramm mit 1.500 Plätzen durchgeführt. Der derzeitige Zeitraum begann am 1. Januar 2014 und läuft bis zum 31. Dezember 2016. 2014 wurden im Rahmen des Programms 250 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57b07/unhcr-resettlement-handbook-country-chapter-denmark.html
2	Belgien	11000000	0.581818181818182012	640	490	150	125	90	365	275	150	105	0	0	\N	470	640	0101000020E610000067B12BDA069012403EE2907BE5514940	Das Resettlement-Programm von Belgien:\r\nIm Dezember 2011 beschloss die belgische Regierung, ein strukturelles Resettlement Programm zu entwickeln. Diese Entscheidung basierte auf Piloterfahrungen aus verschiedenen Ad-Doc-Resettlementhandlungen (Irak, Libyen) und der Entwicklung des gemeinsamen europäischen Resettlement-Programms. Die Höhe der Quote wird von der Regierung (Staatssekretär für Asyl und Migration) festgelegt. Die Quote für 2014 wurde auf 100 festgelegt. Aufgrund der syrischen Flüchtlingskrise gab die Regierung im November 2014 ihre Entscheidung bekannt, die Resettlementquote für 2015 von 150 auf 300 zu verdoppeln. Im Rahmen der Schlussfolgerungen des Rates vom 20. Juli 2015 und des EU Resettlement-Programms, hat sich Belgien verpflichtet, 550 Flüchtlinge im Jahr 2016 und 550 Flüchtlinge im Jahr 2017 umzusiedeln. Für die AMIF-Zusage 2018 und 2019 hat Belgien zugesagt, 1.150 Flüchtlinge im Jahr 2018 und 850 in den ersten 10 Monaten des Jahres 2019 umzusiedeln.\r\n\r\nQuelle: https://www.unhcr.org/5278adfb9.pdf
1	Schweden	9480000	0.675105485232067037	640	440	195	155	155	295	295	150	150	35	35	\N	640	640	0101000020E610000071C5DF5CDEBE3040D618AD11CC634F40	Die Regierung und das Parlament stellen der schwedischen Migrationsbehörde jedes Jahr die Mittel zur Verfügung, um eine bestimmte Anzahl von Flüchtlingen nach Schweden umzusiedeln. Der Schwerpunkt der Auswahl wird von der schwedischen Regierung festgelegt. 2019 hat Schweden 5.000 Flüchtlinge aufgenommen und im Jahr 2020 ist die Anzahl der Plätze gleich. Die schwedische Migrationsbehörde legt in Zusammenarbeit mit dem UNHCR fest, welche Flüchtlingsgruppen für die Neuansiedlung aus verschiedenen Ländern in Betracht gezogen werden. Das UNHCR empfiehlt zwei Regionen. Eine davon ist die Umsiedlung aus Syrien und den angrenzenden Staaten, hauptsächlich Syrer und Iraker in der Türkei, im Libanon und in Jordanien.\r\n\r\nQuelle: https://www.migrationsverket.se/English/About-the-Migration-Agency/Our-mission/The-Swedish-resettlement-programme.html
\.


--
-- Data for Name: geosyrienapp_refugees2012; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.geosyrienapp_refugees2012 ("Id", land, pop, "refRatio", "refTotal", male, female, u18, u18erstantrag, u34, u34erstantrag, u64, u64erstantrag, ue65, ue65erstantrag, unknown, erstantrag, folgeantrag, geom, haltung) FROM stdin;
33	Libanon	4757978	285.524649336335983	135852	67649	68203	70689	\N	61411	\N	\N	\N	3752	\N	\N	\N	\N	0101000020E61000001213371BA9F04140B182650927F64040	\N
35	Irak	32412690	264.979549676377019	858870	440754	418116	494120	\N	327435	\N	\N	\N	37315	\N	\N	\N	\N	0101000020E61000009AF8310A2CDF4540690D961415854040	\N
1	Schweden	9560000	8.28451882845187981	7920	4785	3140	2550	2550	2955	2955	2235	2235	180	180	\N	7920	7920	0101000020E610000071C5DF5CDEBE3040D618AD11CC634F40	Die Regierung und das Parlament stellen der schwedischen Migrationsbehörde jedes Jahr die Mittel zur Verfügung, um eine bestimmte Anzahl von Flüchtlingen nach Schweden umzusiedeln. Der Schwerpunkt der Auswahl wird von der schwedischen Regierung festgelegt. 2019 hat Schweden 5.000 Flüchtlinge aufgenommen und im Jahr 2020 ist die Anzahl der Plätze gleich. Die schwedische Migrationsbehörde legt in Zusammenarbeit mit dem UNHCR fest, welche Flüchtlingsgruppen für die Neuansiedlung aus verschiedenen Ländern in Betracht gezogen werden. Das UNHCR empfiehlt zwei Regionen. Eine davon ist die Umsiedlung aus Syrien und den angrenzenden Staaten, hauptsächlich Syrer und Iraker in der Türkei, im Libanon und in Jordanien.\r\n\r\nQuelle: https://www.migrationsverket.se/English/About-the-Migration-Agency/Our-mission/The-Swedish-resettlement-programme.html
32	Jordanien	6877411	444.415783788405008	305643	150646	154997	152348	\N	140900	\N	\N	\N	12395	\N	\N	\N	\N	0101000020E6100000A58864F5BB6242409E1F3927EC3E3F40	\N
29	Liechtenstein	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0101000020E610000025EE03EC4C122340BEA65D057E914740	Liechtenstein hat zwischen 2014 und 2016 6 syrische Flüchtlingsfamilien umgesiedelt. Darüber hinaus hat Liechtenstein im Rahmen des EU-Resettlement-Programms beschlossen, 43 Personen aus Griechenland und Italien umzusiedeln, von denen die ersten im Januar 2017 ankamen.\r\n\r\nQuelle: https://www.refworld.org/pdfid/5b0818244.pdf
27	Zypern	862000	6.55452436194896038	565	425	140	130	120	350	310	80	70	5	5	\N	505	565	0101000020E61000002B1E11AEC4804040FE18038355754140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
7	Frankreich	63380000	0.100189334174818998	635	390	245	180	170	260	255	175	175	20	20	\N	625	635	0101000020E6100000A1F7C610009C08406BEF535568664740	Seit 2013 hat Frankreich mehr als 4600 Asyl für Syrer gewährt. Frankreich hat außerdem zugesagt, 1000 Syrer durch Studentenvisa (Stipendienprogramm) und 500 Syrer und Iraker durch ein neues Programm "Humanitarian Corridors" (privates Sponsoring) aufzunehmen, das 2017/2018 aus dem Libanon eingeführt werden soll.\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
31	Schweiz	8040000	1.52985074626865991	1230	805	425	440	410	575	545	205	180	10	10	\N	1145	1230	0101000020E610000054D53C69D76A2040B531933C20664740	Das Resettlement-Programm der Schweiz:\r\nFür die Mehrheit der Flüchtlinge bleibt die letzte Hoffnung auf eine dauerhafte Lösung für ihre Existenz die Niederlassung in einem dritten Land, wie zum Beispiel der Schweiz. Seit 2013 hat die Schweiz über 3500 syrische Flüchtlinge aufgenommen, die zuvor vom UNHCR als verletzlichste Schutzsuchende identifiziert worden sind. Die Kriterien der Schweiz für eine dauerhafte Aufnahme sind: erhöhten Schutzbedarf, Wille und Potential für eine Integration, zwischen 40 bis 60 Prozent Frauen und junge Frauen sowie sieben Prozent behinderte, ältere oder kranke Personen. Im November 2018 hat der Bundesrat bekräftigt, das Resettlement-Programm weiterzuführen und alle zwei Jahre weitere 1500 bis 2000 syrische Flüchtlinge sowie Schutzsuchende aus anderen Ländern aufzunehmen.\r\n\r\nQuelle: www.fluechtlingshilfe.ch
5	Estland	1330000	0.0375939849624059991	5	5	0	0	0	0	0	5	5	0	0	\N	5	5	0101000020E610000084CF2752E08A3940CC8100CB01564D40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Estland versprach 2016 und 2017 auf der Grundlage des Migrationsplans der Europäischen Kommission 580 Flüchtlinge umzusiedeln.
11	Kroatien	4270000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0101000020E61000006B986CFF74673040CE8A2E0C4D8A4640	Kroatien hat durch die Umsiedlung von 152 syrischen Staatsangehörigen die Anforderungen vollständig erfüllt. Als zusätzliche Solidaritätsmaßnahme hat die Regierung im Oktober 2017 einen Beschluss über die Umsiedlung von weiteren 100 syrischen Flüchtlingen aus der Türkei durchgesetzt. Im Mai und August 2018 wurden zwei Auswahlmissionen in der Türkei (Ankara) durchgeführt. Von Januar bis November 2018 wurden 112 Syrer aus der Türkei nach Kroatien umgesiedelt.\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/04a_croatia_arm2018_part2_en.pdf
13	Litauen	2990000	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0101000020E61000008616E71D1FE33740FD83A6F7BDA94B40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
14	Luxemburg	525000	0.190476190476189994	10	10	0	0	0	5	5	0	0	0	0	5	10	10	0101000020E6100000B0AB8BB58B491840D678BE5D35E24840	In Luxemburg gibt es kein offizielles Resettlement-Programm. Es gibt jedoch eine Ad-hoc-Resettlement.
15	Malta	418000	3.58851674641148	150	130	25	30	30	90	90	25	25	0	0	5	150	150	0101000020E6100000A0D8A7B87ACF2C40E2666B97F3F54140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
18	Polen	38533299	0.0272491592271919998	105	65	45	30	30	60	60	15	15	0	0	\N	105	105	0101000020E6100000687C9573DF633340BC79D70D55104A40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
21	Slowakei	5410836	0.00924071622204035957	5	5	0	0	0	5	5	0	0	0	0	\N	5	5	0101000020E6100000E7E6EA29A37A3340F2A896034D5A4840	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch die Slowakei.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
23	Spanien	46766403	0.0545263230956634024	255	160	95	70	65	125	100	60	50	5	5	\N	220	255	0101000020E6100000E44148F12E2E0DC0A70F72594B1F4440	Der spanische Ministerrat stimmte am 29. Januar 2010 zur Einrichtung eines jährlichen Programms zum Resettlement von Flüchtlingen gemäß dem kürzlich geänderten Asylgesetz zu. Bis 2017 wurden 1709 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/news/briefing/2010/2/4b681a469/unhcr-welcomes-establishment-spains-resettlement-programme.html\r\nhttps://www.refworld.org/country,,UNHCR,,ESP,,59786cf14,0.html
34	Israel	7628921	70.9549882611184017	54131	45750	8381	2636	\N	51095	\N	\N	\N	400	\N	\N	\N	\N	0101000020E6100000048588B79180414061D545B70A763F40	\N
2	Belgien	11080000	0.929602888086643042	1030	710	320	260	215	475	375	280	210	15	15	\N	815	1030	0101000020E610000067B12BDA069012403EE2907BE5514940	Das Resettlement-Programm von Belgien:\r\nIm Dezember 2011 beschloss die belgische Regierung, ein strukturelles Resettlement Programm zu entwickeln. Diese Entscheidung basierte auf Piloterfahrungen aus verschiedenen Ad-Doc-Resettlementhandlungen (Irak, Libyen) und der Entwicklung des gemeinsamen europäischen Resettlement-Programms. Die Höhe der Quote wird von der Regierung (Staatssekretär für Asyl und Migration) festgelegt. Die Quote für 2014 wurde auf 100 festgelegt. Aufgrund der syrischen Flüchtlingskrise gab die Regierung im November 2014 ihre Entscheidung bekannt, die Resettlementquote für 2015 von 150 auf 300 zu verdoppeln. Im Rahmen der Schlussfolgerungen des Rates vom 20. Juli 2015 und des EU Resettlement-Programms, hat sich Belgien verpflichtet, 550 Flüchtlinge im Jahr 2016 und 550 Flüchtlinge im Jahr 2017 umzusiedeln. Für die AMIF-Zusage 2018 und 2019 hat Belgien zugesagt, 1.150 Flüchtlinge im Jahr 2018 und 850 in den ersten 10 Monaten des Jahres 2019 umzusiedeln.\r\n\r\nQuelle: https://www.unhcr.org/5278adfb9.pdf
37	Tuerkei	74183095	24.7782867511795999	183813	97526	86287	11406	\N	26933	\N	\N	\N	1378	\N	151140	\N	\N	0101000020E61000004C256344A09541400B36979AE2874340	\N
36	Aegypten	84724268	19.5433969402957999	165580	86237	79343	84584	\N	76109	\N	\N	\N	4887	\N	\N	\N	\N	0101000020E610000041E0178BA5DC3D40DFFDD878F57E3A40	\N
30	Norwegen	5040000	0.644841269841269993	325	215	110	90	85	155	145	80	75	5	5	\N	310	325	0101000020E610000064A5087B5AB22E401C9D238D02305140	Das Resettlement Programm von Norwegen:\r\nDas norwegische Parlament entscheidet wie viele Flüchtlinge Norwegen durch das Programm im kommenden Jahr aufnehmen wird, welche Nationalitäten sie haben und woher sie kommen werden. Viele Jahre lang belief sich die Quote auf 1120 Flüchtlingen pro Jahr. Diese Quote wurde jedoch erstmals im Jahr 2014 und darüber hinaus im Jahr 2015 angesichts der Situation in Syrien erhöht. Die Quote beläuft sich 2015 auf 2620 Umsiedlungsflüchtlinge. 2014 wurden tausend Syrer aufgenommen, die nach Jordanien, Libanon und in die Türkei geflohen waren. Norwegens derzeitige Quote an Flüchtlingen des Resettlement Programms der UNHCR, beträgt 1.200 Flüchtlinge pro Jahr.\r\n\r\nQuelle: https://www.npaid.org/Our-Work/Refugees-and-Integration/Reception-Service-for-Refugees\r\nhttps://www.iom.int/countries/norway
28	Island	320000	0.15625	5	5	0	5	\N	0	\N	5	\N	0	\N	\N	\N	5	0101000020E6100000573EED26EF9232C0A0A4666EBA3F5040	Im Zeitraum 2015-2016 hat Island die Umsiedlung von rund 90 Personen aus Syrien genehmigt. Die erste Gruppe ist am 19. Januar 2016 und die zweite Gruppe am 6. April 2016 eingetroffen. Bis April 2016 sind insgesamt 48 Syrer eingetroffen.\r\n\r\nQuelle: https://www.unhcr.org/3c5e58384.pdf
26	Großbritannien	63710000	0.204834405901742012	1305	980	325	210	210	765	755	265	260	25	25	\N	1290	1305	0101000020E610000030531E48D0EC06C0F09CF005DB0F4B40	Syrian Resettlement Programme (VPRS):\r\nDas syrische Resettlement Programm soll den am stärksten gefährdeten Personen helfen - Überlebenden von Folter, Menschen mit schwerwiegenden Erkrankungen und Frauen mit Kindern. Sie werden von der UN identifiziert und dann vom Innenministerium überprüft, bevor sie nach Großbritannien umgesiedelt werden. Die Regierung plant mit dem Programm die Umsiedlung von 20000 syrischen Flüchtlingen aus Flüchtlingslagern in Jordanien, Libanon, Irak, Ägypten und der Türkei im Zeitraum von September 2015 bis Mai 2020.\r\n\r\nQuelle: https://www.refugeecouncil.org.uk/latest/projects/syrian-resettlement-programme-vprs/
25	Ungarn	9930000	0.146022155085598987	145	120	25	40	\N	85	\N	20	\N	0	\N	\N	\N	145	0101000020E61000000ECB597645653340A0A82ED0D5944740	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch Ungarn.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
24	Tschechien	10516125	0.0665644427010900069	70	50	20	20	15	30	30	20	15	0	0	\N	60	70	0101000020E610000035D02F1BF39F2E40C4D78874E0DD4840	2015 initiierte die Tschechische Republik ein Resettlement Programm für syrische Flüchtlingsfamilien in Jordanien mit schwerkranken Kindern. Darüber hinaus hat sich die Tschechische Republik im Juli 2015 dem Europäischen Resettlement Programm angeschlossen und sich verpflichtet bis Juli 2017 400 Flüchtlinge umzusiedeln. Im Rahmen des Programms hat die Tschechische Republik 2015 insgesamt 20 syrische Flüchtlinge aus Jordanien und 2016 32 irakische Flüchtlinge aus Libanon umgesiedelt.\r\nDas Resettlement Programm der Tschechischen Republik wurde von der Regierung im Juni 2017 ausgesetzt.\r\n\r\nQuelle: https://www.unhcr.org/4e2d65a79.pdf
22	Slowenien	2058123	0.145763882916618986	30	20	10	10	10	15	15	5	5	0	0	\N	30	30	0101000020E6100000F19D0EDFDF9B2D4055C48844CA0E4740	Slowenien setzte sein erstes Resettlement Programm für Flüchtlinge mit Unterstützung der IOM und der UN-Migrationsagentur um, indem es 2018 34 syrische Flüchtlinge aus der Türkei nach Slowenien umsiedelte. Das Programm für Flüchtlinge trat nach der Unterzeichnung eines Rahmenabkommens zwischen der IOM, der UN-Migrationsagentur und slowenische Regierung im April 2018 in Kraft.\r\n\r\nQuelle: https://www.iom.int/news/slovenias-first-refugee-resettlement-programme-completed-after-arrival-last-syrian-family
20	Rumaenien	20100000	0.121890547263681995	245	185	60	55	55	140	130	45	45	0	0	\N	235	245	0101000020E610000007825CF711F938406863CE771CED4640	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Um die Resettlement- und Integrationspolitik Rumäniens zu verbessern, beriet die UNHCR die Regierung bei der Verbesserung und Stärkung ihres Handlungrahmens. In Zusammenarbeit mit NRO-Partnern organisiert UNHCR auch Sensibilisierungs- und Schulungssitzungen zum Thema Integration für Regierungsbeamte.\r\n\r\nQuelle: https://www.unhcr.org/ro/homepage/despre-noi/resurse/publicatii/romania-eng
19	Portugal	10291027	0.0194344063036663017	20	15	5	10	10	5	5	5	5	0	0	\N	20	20	0101000020E61000001CA9D4C9880021C0B7A9639039CC4340	Im Zeitraum von 2018-2019 hat Portugal gemäß den von der Europäischen Kommission festgelegten Prioritäten 1010 Menschen umgesiedelt. Davon wurden 606 Flüchtlinge aus der Türkei umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/4e92a0cc9/unhcr-resettlement-handbook-country-chapter-portugal.html
3	Bulgarien	7290000	0.617283950617284027	450	345	105	100	100	265	260	75	75	5	5	\N	435	450	0101000020E6100000C9FE08EA2C3739400B4D5D6B6B624540	Am 12. April 2016 genehmigte der bulgarische Ministerrat den Nationalen Rahmen für das Resettlement Programm, der mit einem Beschluss des Nationalen Rates für Migration und Integration verabschiedet wurde. Der Beschluss dient dazu die Verpflichtungen Bulgariens aus dem Abkommen zwischen der EU und der Türkei vom 18. März 2016 zu erfüllen. Am 28. November 2017 hat der bulgarische Ministerrat die Frist für das Resettlement Programm von 110 Flüchtlingen bis Ende Oktober 2019 verlängert.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/5bf2cf0a4/unhcr-resettlement-handbook-country-chapter-bulgaria.html
17	Oesterreich	8410000	1.10582639714625008	930	660	270	280	\N	465	\N	175	\N	5	\N	5	0	930	0101000020E6100000E903AF79C1402C40D2D0F07AF1CA4740	Im Herbst 2013 begann Österreich mit der Umsetzung eines neuen Aufnahmeprogramms für syrische Flüchtlinge: Humanitarian Admission Programme (HAP). Der erste Teil des HAP (HAP I) mit einer Quote von 500 syrischen Flüchtlingen wurde gemeinsam vom Bundesministerium des Innern, dem Bundesamt für Einwanderung und Asyl und dem Bundesministerium für Europa, Integration und auswärtige Angelegenheiten, der UNHCR und die Internationale Organisation für Migration (IOM) organisiert. Das Programm sollte syrischen Flüchtlingen direkt aus der Krisenregion helfen und wurde getrennt vom laufenden regulären Asylverfahren angeboten.\r\nBundesinnenministerin Johanna Mikl-Leitner erklärte am 19. April 2014, dass die HAP, die die am stärksten gefährdeten Flüchtlinge, darunter Frauen, Kinder und verfolgte Minderheiten wie Christen, unterstützt, um 1000 syrische Flüchtlinge erweitert werde (HAP II). Mit dieser Initiative folgt Österreich seiner humanitären Tradition und belegt nach Deutschland den zweiten Platz in Bezug auf EU-Mitgliedstaaten, die syrischen Flüchtlingen Schutz bieten.\r\nHauptziel des HAP ist es, die Nachbarstaaten Syriens zu unterstützen und ein starkes Signal für Solidarität in der internationalen Gemeinschaft zu setzen. Der Anstieg der Zahlen wurde durch die derzeitige dramatische Situation in Syrien gerechtfertigt.\r\n\r\nQuelle: https://www.resettlement.eu/country/austria
16	Niederlande	16720000	0.343899521531099983	575	370	205	120	105	260	210	170	120	20	15	5	455	575	0101000020E6100000CEB5DCE2332015402490F6AEE60C4A40	Das Resettlement Programm der Niederlande:\r\nDie Niederlande nehmen am Resettlement Programmteil. Die Regierung hat vereinbart im Zeitraum von 2016 bis 2019 insgesamt 2.500 Flüchtlinge umzusiedeln, ungefähr 750 pro Jahr.\r\nEU-Türkei-Abkommen:\r\nDas Abkommen zwischen der EU und der Türkei bedeutet, dass ab dem 20. März 2016 jeder illegale Migrant, der nach Griechenland kommt, in die Türkei zurückkehren muss. Für jede syrische Person, die nach diesem Abkommen zurückkehrt, wird einem der teilnehmenden europäischen Mitgliedstaaten ein syrischer Flüchtling in der Türkei empfohlen. In den Jahren 2016 und 2017 wurden im Rahmen dieses Abkommens insgesamt fast 3.000 Syrer aus der Türkei in die Niederlande umgesiedelt. 2018 siedelten die Niederlande rund 750 Flüchtlinge aus der Türkei um. Für 2019 sollen 1.000 Flüchtlinge aus der Türkei umgesiedelt werden.\r\n\r\nQuelle: https://www.coa.nl/en/reception-of-asylum-seekers/resettlement-of-refugees
12	Lettland	2050000	0.0975609756097561009	20	15	5	5	5	10	10	5	5	0	0	0	20	20	0101000020E61000002CC7FD6990E938405D6DC3B4E86C4C40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Im Vergleich zu den Vorjahren hat die Zahl der Asylbewerber aus Syrien zugenommen - 179 (2016 - 149). Am 14. November 2017 genehmigte das Kabinett den vom Innenminister verfassten Report zum Handlungsplan bezüglich der Aufnahme von Personen, die internationalen Schutz benötigen. Der Report sagte aus, dass Lettland die Anforderungen zur Umsiedlung von Flüchtlingen aus Griechenland, Türkei und Italien vollständig erfüllt hat. Die Flüchtlinge kamen mehrheitlich aus Syrien, Eritrea und Irak.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/16a_latvia_arm_part2_2017_en.pdf
10	Italien	60170000	0.0589995014126641001	355	265	90	75	75	205	205	75	75	5	5	5	355	355	0101000020E610000059AD8ECBD823284040A1B5DAF7654540	Italien kündigte ein privates Sponsoring-Projekt (Humanitarian Corridors) an, das 1.000 Personen aufnehmen soll, darunter eine bedeutende Anzahl von Syrern. Bisher wurden 278 Syrer durch dieses Projekt aufgenommen (Stand: 30.04.2017).\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
9	Griechenland	11090000	0.24797114517583399	275	220	55	50	50	200	200	25	25	0	0	\N	275	275	0101000020E6100000326BE8719FF43640D8FE65A58F894340	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Griechenland ist im EU-Türkei-Abkommen miteinbezogen. Für jede von den griechischen Inseln in die Türkei abgeschobene Person aus Syrien soll eine andere syrische Person aus der Türkei in der EU neu angesiedelt werden.\r\n\r\nQuelle: https://www.bpb.de/gesellschaft/migration/laenderprofile/243222/fluechtlingsabkommen-eu-tuerkei
8	Irland	4610000	0.0325379609544469012	15	10	5	0	0	5	5	5	5	0	0	5	15	15	0101000020E6100000DD659E819F4620C01DE7661A75964A40	Syrian Humanitarian Admission Programme:\r\nZusätzlich zu Irlands etablierten Programmen zum Resettlement von Flüchtlingen, führte die Regierung 2014 als Reaktion auf die sich verschärfende Krise in Syrien ein einmaliges privates Programm ein: das Syrian Humanitarian Admission Program (SHAP).\r\nAnträge für SHAP konnten in einem Zeitraum von sechs Wochen zwischen dem 14. März 2014 und dem 30. April 2014 gestellt werden. Mit SHAP konnten irische Staatsbürger syrischer Herkunft und in Irland rechtmäßig ansässige syrische Staatsangehörige beantragen, Familienmitglieder nach Syrien zu bringen oder aus Syrien in die umliegenden Länder vertrieben zu werden, nach Irland. Die Abteilung für Familienzusammenführung des irischen Einbürgerungs- und Einwanderungsdienstes (INIS) war für die Bearbeitung von Anträgen im Rahmen von SHAP verantwortlich. Irland erteilte 119 Personen, die das SHAP-System nutzen, aus Anträgen, die im Namen von 308 Personen gestellt wurden, die Erlaubnis, sich in Irland aufzuhalten. Die SHAP-Begünstigten durften sich zunächst zwei Jahre in Irland aufhalten.\r\n\r\nQuelle: https://www.unhcr.org/en-ie/resettlement-58c923ff4.html
6	Finnland	5400000	0.342592592592593004	185	120	60	40	40	85	85	55	55	0	0	\N	180	185	0101000020E610000005602B7C50463A40A068EB17ED1F5040	Seit 2001 betrug die Flüchtlingszahl im Rahmen des jährlichen Resettlement Programms 750 Personen. In den Jahren 2013 und 2014 hat die Regierung beschlossen, die Quote für die Jahre 2014 und 2015 um 300 Personen zu erhöhen, um der Situation in Syrien gerecht zu werden.\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57f07/unhcr-resettlement-handbook-country-chapter-finland.html
4	Daenemark	5580000	1.56810035842294004	875	570	310	245	245	425	425	195	195	15	15	\N	875	875	0101000020E610000008FFEC50570E2440FBA56CB299FD4B40	Das Resettlement Programm sieht eine jährliche Zahl von 500 Umsiedlungsplätzen für Flüchtlinge vor. Ab Juli 2005 hat Dänemark ein dreijähriges flexibles Quotenprogramm mit 1.500 Plätzen durchgeführt. Der derzeitige Zeitraum begann am 1. Januar 2014 und läuft bis zum 31. Dezember 2016. 2014 wurden im Rahmen des Programms 250 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57b07/unhcr-resettlement-handbook-country-chapter-denmark.html
0	Deutschland	80524000	0.984799562863245992	7930	4875	3045	2680	2110	3510	2935	1600	1055	135	135	105	6200	7930	0101000020E6100000AA96D20585C524405F3D7294B18D4940	Das Resettlement-Programm von Deutschland:\r\nDas Aufnahmeprogramm für syrische Flüchtlinge aus der Türkei, welches mit der Aufnahmeanordnung des Bundesministeriums des Innern (BMI) vom 11. Januar 2017 begonnen hatte wird nun mit der Aufnahmeanordnung vom 13. Januar 2020 fortgesetzt. Das BMI hat entschieden das deutsche Engagement fortzusetzen und eine Aufnahme von bis zu 500 Personen pro Monat bis zum 31. Dezember 2020 zu ermöglichen. Die Anordnung wurde mit den obersten Landesbehörden abgestimmt. Den Begleitregelungen können Sie detaillierte Informationen zum Programm entnehmen. So können auch unbegleitete Minderjährige über dieses humanitäre Verfahren Schutz in Deutschland finden.\r\n\r\nQuelle: www.resettlement.de
\.


--
-- Data for Name: geosyrienapp_refugees2013; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.geosyrienapp_refugees2013 ("Id", land, pop, "refRatio", "refTotal", male, female, u18, u18erstantrag, u34, u34erstantrag, u64, u64erstantrag, ue65, ue65erstantrag, unknown, erstantrag, folgeantrag, geom, haltung) FROM stdin;
33	Libanon	5105624	1689.36451254537997	862526	423385	439141	454723	\N	385686	\N	\N	\N	22117	\N	\N	\N	\N	0101000020E61000001213371BA9F04140B182650927F64040	\N
34	Israel	7756163	68.3005243701040996	52975	44745	8230	2667	\N	49908	\N	\N	\N	400	\N	\N	\N	\N	0101000020E6100000048588B79180414061D545B70A763F40	\N
1	Schweden	9650000	4.89637305699482006	4725	10430	6110	4810	4635	6400	6165	4925	4725	405	385	\N	15905	16540	0101000020E610000071C5DF5CDEBE3040D618AD11CC634F40	Die Regierung und das Parlament stellen der schwedischen Migrationsbehörde jedes Jahr die Mittel zur Verfügung, um eine bestimmte Anzahl von Flüchtlingen nach Schweden umzusiedeln. Der Schwerpunkt der Auswahl wird von der schwedischen Regierung festgelegt. 2019 hat Schweden 5.000 Flüchtlinge aufgenommen und im Jahr 2020 ist die Anzahl der Plätze gleich. Die schwedische Migrationsbehörde legt in Zusammenarbeit mit dem UNHCR fest, welche Flüchtlingsgruppen für die Neuansiedlung aus verschiedenen Ländern in Betracht gezogen werden. Das UNHCR empfiehlt zwei Regionen. Eine davon ist die Umsiedlung aus Syrien und den angrenzenden Staaten, hauptsächlich Syrer und Iraker in der Türkei, im Libanon und in Jordanien.\r\n\r\nQuelle: https://www.migrationsverket.se/English/About-the-Migration-Agency/Our-mission/The-Swedish-resettlement-programme.html
23	Spanien	46593236	0.155601984803115989	725	410	315	190	190	315	305	195	185	30	30	\N	710	725	0101000020E6100000E44148F12E2E0DC0A70F72594B1F4440	Der spanische Ministerrat stimmte am 29. Januar 2010 zur Einrichtung eines jährlichen Programms zum Resettlement von Flüchtlingen gemäß dem kürzlich geänderten Asylgesetz zu. Bis 2017 wurden 1709 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/news/briefing/2010/2/4b681a469/unhcr-welcomes-establishment-spains-resettlement-programme.html\r\nhttps://www.refworld.org/country,,UNHCR,,ESP,,59786cf14,0.html
7	Frankreich	63700000	0.206436420722135	1315	745	570	430	430	430	425	400	395	55	55	\N	1305	1315	0101000020E6100000B262B83A004208406BEF535568664740	Seit 2013 hat Frankreich mehr als 4600 Asyl für Syrer gewährt. Frankreich hat außerdem zugesagt, 1000 Syrer durch Studentenvisa (Stipendienprogramm) und 500 Syrer und Iraker durch ein neues Programm "Humanitarian Corridors" (privates Sponsoring) aufzunehmen, das 2017/2018 aus dem Libanon eingeführt werden soll.\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
5	Estland	1320000	0.113636363636363993	15	15	5	0	0	10	10	5	5	0	0	\N	15	15	0101000020E610000084CF2752E08A3940CC8100CB01564D40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Estland versprach 2016 und 2017 auf der Grundlage des Migrationsplans der Europäischen Kommission 580 Flüchtlinge umzusiedeln.
11	Kroatien	4260000	0.457746478873238993	195	180	10	20	20	145	145	30	30	0	0	0	190	195	0101000020E61000006B986CFF74673040CE8A2E0C4D8A4640	Kroatien hat durch die Umsiedlung von 152 syrischen Staatsangehörigen die Anforderungen vollständig erfüllt. Als zusätzliche Solidaritätsmaßnahme hat die Regierung im Oktober 2017 einen Beschluss über die Umsiedlung von weiteren 100 syrischen Flüchtlingen aus der Türkei durchgesetzt. Im Mai und August 2018 wurden zwei Auswahlmissionen in der Türkei (Ankara) durchgeführt. Von Januar bis November 2018 wurden 112 Syrer aus der Türkei nach Kroatien umgesiedelt.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/04a_croatia_arm2018_part2_en.pdf
13	Litauen	2960000	0.0337837837837837995	10	10	5	0	0	5	5	0	0	0	0	5	5	10	0101000020E61000008616E71D1FE33740FD83A6F7BDA94B40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
14	Luxemburg	537000	0.465549348230911986	25	15	10	5	5	10	10	10	10	0	0	0	25	25	0101000020E6100000B0AB8BB58B491840D678BE5D35E24840	In Luxemburg gibt es kein offizielles Resettlement-Programm. Es gibt jedoch eine Ad-hoc-Resettlement.
15	Malta	423000	5.91016548463356983	250	195	55	75	75	125	125	45	45	5	5	0	250	250	0101000020E6100000A0D8A7B87ACF2C40E2666B97F3F54140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
18	Polen	38495659	0.0662412351480980988	255	160	95	100	90	95	105	55	55	5	5	\N	255	255	0101000020E6100000687C9573DF633340BC79D70D55104A40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
21	Slowakei	5415949	0.018463984797493501	10	\N	\N	0	0	5	10	5	5	0	0	\N	15	10	0101000020E6100000E7E6EA29A37A3340F2A896034D5A4840	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch die Slowakei.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
30	Norwegen	5100000	1.6960784313725501	865	625	240	185	185	455	445	220	215	10	10	\N	850	865	0101000020E610000064A5087B5AB22E401C9D238D02305140	Das Resettlement Programm von Norwegen:\r\nDas norwegische Parlament entscheidet wie viele Flüchtlinge Norwegen durch das Programm im kommenden Jahr aufnehmen wird, welche Nationalitäten sie haben und woher sie kommen werden. Viele Jahre lang belief sich die Quote auf 1120 Flüchtlingen pro Jahr. Diese Quote wurde jedoch erstmals im Jahr 2014 und darüber hinaus im Jahr 2015 angesichts der Situation in Syrien erhöht. Die Quote beläuft sich 2015 auf 2620 Umsiedlungsflüchtlinge. 2014 wurden tausend Syrer aufgenommen, die nach Jordanien, Libanon und in die Türkei geflohen waren. Norwegens derzeitige Quote an Flüchtlingen des Resettlement Programms der UNHCR, beträgt 1.200 Flüchtlinge pro Jahr.\r\n\r\nQuelle: https://www.npaid.org/Our-Work/Refugees-and-Integration/Reception-Service-for-Refugees\r\nhttps://www.iom.int/countries/norway
29	Liechtenstein	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0101000020E610000025EE03EC4C122340BEA65D057E914740	Liechtenstein hat zwischen 2014 und 2016 6 syrische Flüchtlingsfamilien umgesiedelt. Darüber hinaus hat Liechtenstein im Rahmen des EU-Resettlement-Programms beschlossen, 43 Personen aus Griechenland und Italien umzusiedeln, von denen die ersten im Januar 2017 ankamen.\r\n\r\nQuelle: https://www.refworld.org/pdfid/5b0818244.pdf
32	Jordanien	7104642	909.703824626208984	646312	313396	332916	333248	\N	287636	\N	\N	\N	25428	\N	\N	\N	\N	0101000020E6100000A58864F5BB6242409E1F3927EC3E3F40	\N
27	Zypern	866000	6.58198614318706987	570	405	165	170	165	300	225	90	70	5	5	\N	470	570	0101000020E61000002B1E11AEC4804040FE18038355754140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
37	Tuerkei	75536413	5.18120975641244996	39137	22206	16931	13453	\N	24560	\N	\N	\N	1124	\N	\N	\N	\N	0101000020E61000004C256344A09541400B36979AE2874340	\N
36	Aegypten	86637406	29.233100538582601	253268	131231	122037	116562	\N	128431	\N	\N	\N	8275	\N	\N	\N	\N	0101000020E610000041E0178BA5DC3D40DFFDD878F57E3A40	\N
35	Irak	33532494	396.800190287068972	1330570	687117	643453	724460	\N	551047	\N	\N	\N	55063	\N	\N	\N	\N	0101000020E61000009AF8310A2CDF4540690D961415854040	\N
31	Schweiz	8140000	2.33415233415232981	1900	1120	780	765	750	700	685	395	380	40	40	\N	1850	1900	0101000020E610000054D53C69D76A2040B531933C20664740	Das Resettlement-Programm der Schweiz:\r\nFür die Mehrheit der Flüchtlinge bleibt die letzte Hoffnung auf eine dauerhafte Lösung für ihre Existenz die Niederlassung in einem dritten Land, wie zum Beispiel der Schweiz. Seit 2013 hat die Schweiz über 3500 syrische Flüchtlinge aufgenommen, die zuvor vom UNHCR als verletzlichste Schutzsuchende identifiziert worden sind. Die Kriterien der Schweiz für eine dauerhafte Aufnahme sind: erhöhten Schutzbedarf, Wille und Potential für eine Integration, zwischen 40 bis 60 Prozent Frauen und junge Frauen sowie sieben Prozent behinderte, ältere oder kranke Personen. Im November 2018 hat der Bundesrat bekräftigt, das Resettlement-Programm weiterzuführen und alle zwei Jahre weitere 1500 bis 2000 syrische Flüchtlinge sowie Schutzsuchende aus anderen Ländern aufzunehmen.\r\n\r\nQuelle: www.fluechtlingshilfe.ch
28	Island	322000	0.155279503105589994	5	5	0	0	0	5	5	0	0	0	0	0	0	5	0101000020E6100000573EED26EF9232C0A0A4666EBA3F5040	Im Zeitraum 2015-2016 hat Island die Umsiedlung von rund 90 Personen aus Syrien genehmigt. Die erste Gruppe ist am 19. Januar 2016 und die zweite Gruppe am 6. April 2016 eingetroffen. Bis April 2016 sind insgesamt 48 Syrer eingetroffen.\r\n\r\nQuelle: https://www.unhcr.org/3c5e58384.pdf
26	Großbritannien	64110000	0.31664326938075199	2030	1505	520	305	305	1210	1205	420	420	40	35	\N	2020	2030	0101000020E610000030531E48D0EC06C0F09CF005DB0F4B40	Syrian Resettlement Programme (VPRS):\r\nDas syrische Resettlement Programm soll den am stärksten gefährdeten Personen helfen - Überlebenden von Folter, Menschen mit schwerwiegenden Erkrankungen und Frauen mit Kindern. Sie werden von der UN identifiziert und dann vom Innenministerium überprüft, bevor sie nach Großbritannien umgesiedelt werden. Die Regierung plant mit dem Programm die Umsiedlung von 20 000 syrischen Flüchtlingen aus Flüchtlingslagern in Jordanien, Libanon, Irak, Ägypten und der Türkei im Zeitraum von September 2015 bis Mai 2020.\r\n\r\nQuelle: https://www.refugeecouncil.org.uk/latest/projects/syrian-resettlement-programme-vprs/
25	Ungarn	9910000	0.983854692230071048	975	885	95	100	100	755	710	115	115	10	10	\N	935	975	0101000020E61000000ECB597645653340A0A82ED0D5944740	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch Ungarn.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
24	Tschechien	10512419	0.0665879090245547062	70	40	30	20	20	30	30	20	20	5	5	\N	70	70	0101000020E610000035D02F1BF39F2E40C4D78874E0DD4840	2015 initiierte die Tschechische Republik ein Resettlement Programm für syrische Flüchtlingsfamilien in Jordanien mit schwerkranken Kindern. Darüber hinaus hat sich die Tschechische Republik im Juli 2015 dem Europäischen Resettlement Programm angeschlossen und sich verpflichtet bis Juli 2017 400 Flüchtlinge umzusiedeln. Im Rahmen des Programms hat die Tschechische Republik 2015 insgesamt 20 syrische Flüchtlinge aus Jordanien und 2016 32 irakische Flüchtlinge aus Libanon umgesiedelt.\r\nDas Resettlement Programm der Tschechischen Republik wurde von der Regierung im Juni 2017 ausgesetzt.\r\n\r\nQuelle: https://www.unhcr.org/4e2d65a79.pdf
22	Slowenien	2060663	0.291168424919553026	60	45	20	25	25	25	20	10	10	0	0	\N	55	60	0101000020E6100000F19D0EDFDF9B2D4055C48844CA0E4740	Slowenien setzte sein erstes Resettlement Programm für Flüchtlinge mit Unterstützung der IOM und der UN-Migrationsagentur um, indem es 2018 34 syrische Flüchtlinge aus der Türkei nach Slowenien umsiedelte. Das Programm für Flüchtlinge trat nach der Unterzeichnung eines Rahmenabkommens zwischen der IOM, der UN-Migrationsagentur und slowenische Regierung im April 2018 in Kraft.\r\n\r\nQuelle: https://www.iom.int/news/slovenias-first-refugee-resettlement-programme-completed-after-arrival-last-syrian-family
20	Rumaenien	20020000	0.504495504495504954	1010	655	355	320	305	445	425	235	220	15	15	\N	965	1010	0101000020E610000007825CF711F938406863CE771CED4640	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Um die Resettlement- und Integrationspolitik Rumäniens zu verbessern, beriet die UNHCR die Regierung bei der Verbesserung und Stärkung ihres Handlungrahmens. In Zusammenarbeit mit NRO-Partnern organisiert UNHCR auch Sensibilisierungs- und Schulungssitzungen zum Thema Integration für Regierungsbeamte.\r\n\r\nQuelle: https://www.unhcr.org/ro/homepage/despre-noi/resurse/publicatii/romania-eng
19	Portugal	10309573	0.140645980197240006	145	100	45	55	55	60	60	30	0	0	0	\N	145	145	0101000020E61000001CA9D4C9880021C0B7A9639039CC4340	Im Zeitraum von 2018-2019 hat Portugal gemäß den von der Europäischen Kommission festgelegten Prioritäten 1010 Menschen umgesiedelt. Davon wurden 606 Flüchtlinge aus der Türkei umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/4e92a0cc9/unhcr-resettlement-handbook-country-chapter-portugal.html
3	Bulgarien	7250000	6.22068965517240979	4510	2805	1705	1700	1660	1985	1975	780	775	45	40	\N	4445	4510	0101000020E6100000C9FE08EA2C3739400B4D5D6B6B624540	Am 12. April 2016 genehmigte der bulgarische Ministerrat den Nationalen Rahmen für das Resettlement Programm, der mit einem Beschluss des Nationalen Rates für Migration und Integration verabschiedet wurde. Der Beschluss dient dazu die Verpflichtungen Bulgariens aus dem Abkommen zwischen der EU und der Türkei vom 18. März 2016 zu erfüllen. Am 28. November 2017 hat der bulgarische Ministerrat die Frist für das Resettlement Programm von 110 Flüchtlingen bis Ende Oktober 2019 verlängert.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/5bf2cf0a4/unhcr-resettlement-handbook-country-chapter-bulgaria.html
17	Oesterreich	8450000	2.37278106508875997	2005	1415	590	570	\N	940	\N	465	\N	30	\N	0	0	2005	0101000020E6100000E903AF79C1402C40D2D0F07AF1CA4740	Im Herbst 2013 begann Österreich mit der Umsetzung eines neuen Aufnahmeprogramms für syrische Flüchtlinge: Humanitarian Admission Programme (HAP). Der erste Teil des HAP (HAP I) mit einer Quote von 500 syrischen Flüchtlingen wurde gemeinsam vom Bundesministerium des Innern, dem Bundesamt für Einwanderung und Asyl und dem Bundesministerium für Europa, Integration und auswärtige Angelegenheiten, der UNHCR und die Internationale Organisation für Migration (IOM) organisiert. Das Programm sollte syrischen Flüchtlingen direkt aus der Krisenregion helfen und wurde getrennt vom laufenden regulären Asylverfahren angeboten.\r\nBundesinnenministerin Johanna Mikl-Leitner erklärte am 19. April 2014, dass die HAP, die die am stärksten gefährdeten Flüchtlinge, darunter Frauen, Kinder und verfolgte Minderheiten wie Christen, unterstützt, um 1000 syrische Flüchtlinge erweitert werde (HAP II). Mit dieser Initiative folgt Österreich seiner humanitären Tradition und belegt nach Deutschland den zweiten Platz in Bezug auf EU-Mitgliedstaaten, die syrischen Flüchtlingen Schutz bieten.\r\nHauptziel des HAP ist es, die Nachbarstaaten Syriens zu unterstützen und ein starkes Signal für Solidarität in der internationalen Gemeinschaft zu setzen. Der Anstieg der Zahlen wurde durch die derzeitige dramatische Situation in Syrien gerechtfertigt.\r\n\r\nQuelle: https://www.resettlement.eu/country/austria
16	Niederlande	16800000	1.34821428571429003	2265	1525	740	510	505	1000	990	695	685	45	45	15	2230	2265	0101000020E6100000CEB5DCE2332015402490F6AEE60C4A40	Das Resettlement Programm der Niederlande:\r\nDie Niederlande nehmen am Resettlement Programmteil. Die Regierung hat vereinbart im Zeitraum von 2016 bis 2019 insgesamt 2.500 Flüchtlinge umzusiedeln, ungefähr 750 pro Jahr.\r\nEU-Türkei-Abkommen:\r\nDas Abkommen zwischen der EU und der Türkei bedeutet, dass ab dem 20. März 2016 jeder illegale Migrant, der nach Griechenland kommt, in die Türkei zurückkehren muss. Für jede syrische Person, die nach diesem Abkommen zurückkehrt, wird einem der teilnehmenden europäischen Mitgliedstaaten ein syrischer Flüchtling in der Türkei empfohlen. In den Jahren 2016 und 2017 wurden im Rahmen dieses Abkommens insgesamt fast 3.000 Syrer aus der Türkei in die Niederlande umgesiedelt. 2018 siedelten die Niederlande rund 750 Flüchtlinge aus der Türkei um. Für 2019 sollen 1.000 Flüchtlinge aus der Türkei umgesiedelt werden.\r\n\r\nQuelle: https://www.coa.nl/en/reception-of-asylum-seekers/resettlement-of-refugees
12	Lettland	2020000	0.0742574257425742956	15	15	0	5	5	10	10	0	0	0	0	0	15	15	0101000020E61000002CC7FD6990E938405D6DC3B4E86C4C40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Im Vergleich zu den Vorjahren hat die Zahl der Asylbewerber aus Syrien zugenommen - 179 (2016 - 149). Am 14. November 2017 genehmigte das Kabinett den vom Innenminister verfassten Report zum Handlungsplan bezüglich der Aufnahme von Personen, die internationalen Schutz benötigen. Der Report sagte aus, dass Lettland die Anforderungen zur Umsiedlung von Flüchtlingen aus Griechenland, Türkei und Italien vollständig erfüllt hat. Die Flüchtlinge kamen mehrheitlich aus Syrien, Eritrea und Irak.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/16a_latvia_arm_part2_2017_en.pdf
10	Italien	60510000	0.104941332011237995	635	485	150	140	140	350	350	140	140	5	5	0	635	635	0101000020E610000059AD8ECBD823284040A1B5DAF7654540	Italien kündigte ein privates Sponsoring-Projekt (Humanitarian Corridors) an, das 1.000 Personen aufnehmen soll, darunter eine bedeutende Anzahl von Syrern. Bisher wurden 278 Syrer durch dieses Projekt aufgenommen (Stand: 30.04.2017).\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
9	Griechenland	11000000	0.440909090909090973	485	330	155	155	155	255	245	65	65	5	5	\N	470	485	0101000020E6100000326BE8719FF43640D8FE65A58F894340	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Griechenland ist im EU-Türkei-Abkommen miteinbezogen. Für jede von den griechischen Inseln in die Türkei abgeschobene Person aus Syrien soll eine andere syrische Person aus der Türkei in der EU neu angesiedelt werden.\r\n\r\nQuelle: https://www.bpb.de/gesellschaft/migration/laenderprofile/243222/fluechtlingsabkommen-eu-tuerkei
8	Irland	4630000	0.0863930885529158032	40	20	15	5	5	15	15	15	15	0	0	5	35	40	0101000020E6100000DD659E819F4620C01DE7661A75964A40	Syrian Humanitarian Admission Programme:\r\nZusätzlich zu Irlands etablierten Programmen zum Resettlement von Flüchtlingen, führte die Regierung 2014 als Reaktion auf die sich verschärfende Krise in Syrien ein einmaliges privates Programm ein: das Syrian Humanitarian Admission Program (SHAP).\r\nAnträge für SHAP konnten in einem Zeitraum von sechs Wochen zwischen dem 14. März 2014 und dem 30. April 2014 gestellt werden. Mit SHAP konnten irische Staatsbürger syrischer Herkunft und in Irland rechtmäßig ansässige syrische Staatsangehörige beantragen, Familienmitglieder nach Syrien zu bringen oder aus Syrien in die umliegenden Länder vertrieben zu werden, nach Irland. Die Abteilung für Familienzusammenführung des irischen Einbürgerungs- und Einwanderungsdienstes (INIS) war für die Bearbeitung von Anträgen im Rahmen von SHAP verantwortlich. Irland erteilte 119 Personen, die das SHAP-System nutzen, aus Anträgen, die im Namen von 308 Personen gestellt wurden, die Erlaubnis, sich in Irland aufzuhalten. Die SHAP-Begünstigten durften sich zunächst zwei Jahre in Irland aufhalten.\r\n\r\nQuelle: https://www.unhcr.org/en-ie/resettlement-58c923ff4.html
6	Finnland	5430000	0.276243093922652005	150	105	0	25	25	80	80	35	35	5	5	\N	150	150	0101000020E610000005602B7C50463A40A068EB17ED1F5040	Seit 2001 betrug die Flüchtlingszahl im Rahmen des jährlichen Resettlement Programms 750 Personen. In den Jahren 2013 und 2014 hat die Regierung beschlossen, die Quote für die Jahre 2014 und 2015 um 300 Personen zu erhöhen, um der Situation in Syrien gerecht zu werden.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57f07/unhcr-resettlement-handbook-country-chapter-finland.html
4	Daenemark	5000000	3.37000000000000011	1685	1120	565	435	435	730	730	475	475	40	40	\N	1685	1685	0101000020E610000008FFEC50570E2440FBA56CB299FD4B40	Das Resettlement Programm sieht eine jährliche Zahl von 500 Umsiedlungsplätzen für Flüchtlinge vor. Ab Juli 2005 hat Dänemark ein dreijähriges flexibles Quotenprogramm mit 1.500 Plätzen durchgeführt. Der derzeitige Zeitraum begann am 1. Januar 2014 und läuft bis zum 31. Dezember 2016. 2014 wurden im Rahmen des Programms 250 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57b07/unhcr-resettlement-handbook-country-chapter-denmark.html
2	Belgien	11140000	1.01885098743267011	1135	720	410	285	240	515	450	295	250	40	30	\N	965	1135	0101000020E610000067B12BDA069012403EE2907BE5514940	Das Resettlement-Programm von Belgien:\r\nIm Dezember 2011 beschloss die belgische Regierung, ein strukturelles Resettlement Programm zu entwickeln. Diese Entscheidung basierte auf Piloterfahrungen aus verschiedenen Ad-Doc-Resettlementhandlungen (Irak, Libyen) und der Entwicklung des gemeinsamen europäischen Resettlement-Programms. Die Höhe der Quote wird von der Regierung (Staatssekretär für Asyl und Migration) festgelegt. Die Quote für 2014 wurde auf 100 festgelegt. Aufgrund der syrischen Flüchtlingskrise gab die Regierung im November 2014 ihre Entscheidung bekannt, die Resettlementquote für 2015 von 150 auf 300 zu verdoppeln. Im Rahmen der Schlussfolgerungen des Rates vom 20. Juli 2015 und des EU Resettlement-Programms, hat sich Belgien verpflichtet, 550 Flüchtlinge im Jahr 2016 und 550 Flüchtlinge im Jahr 2017 umzusiedeln. Für die AMIF-Zusage 2018 und 2019 hat Belgien zugesagt, 1.150 Flüchtlinge im Jahr 2018 und 850 in den ersten 10 Monaten des Jahres 2019 umzusiedeln.\r\n\r\nQuelle: https://www.unhcr.org/5278adfb9.pdf
0	Deutschland	80767000	1.59161538747261	12855	8390	4450	3970	3665	5930	5565	2725	2410	225	215	\N	11850	12855	0101000020E6100000AA96D20585C524405F3D7294B18D4940	Das Resettlement-Programm von Deutschland:\r\nDas Aufnahmeprogramm für syrische Flüchtlinge aus der Türkei, welches mit der Aufnahmeanordnung des Bundesministeriums des Innern (BMI) vom 11. Januar 2017 begonnen hatte wird nun mit der Aufnahmeanordnung vom 13. Januar 2020 fortgesetzt. Das BMI hat entschieden das deutsche Engagement fortzusetzen und eine Aufnahme von bis zu 500 Personen pro Monat bis zum 31. Dezember 2020 zu ermöglichen. Die Anordnung wurde mit den obersten Landesbehörden abgestimmt. Den Begleitregelungen können Sie detaillierte Informationen zum Programm entnehmen. So können auch unbegleitete Minderjährige über dieses humanitäre Verfahren Schutz in Deutschland finden.\r\n\r\nQuelle: www.resettlement.de
\.


--
-- Data for Name: geosyrienapp_refugees2014; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.geosyrienapp_refugees2014 ("Id", land, pop, "refRatio", "refTotal", male, female, u18, u18erstantrag, u34, u34erstantrag, u64, u64erstantrag, ue65, ue65erstantrag, unknown, erstantrag, folgeantrag, geom, haltung) FROM stdin;
30	Norwegen	5160000	3.87596899224806002	2000	1660	340	290	290	1215	1205	485	475	10	10	\N	1980	2000	0101000020E610000064A5087B5AB22E401C9D238D02305140	Das Resettlement Programm von Norwegen:\r\nDas norwegische Parlament entscheidet wie viele Flüchtlinge Norwegen durch das Programm im kommenden Jahr aufnehmen wird, welche Nationalitäten sie haben und woher sie kommen werden. Viele Jahre lang belief sich die Quote auf 1120 Flüchtlingen pro Jahr. Diese Quote wurde jedoch erstmals im Jahr 2014 und darüber hinaus im Jahr 2015 angesichts der Situation in Syrien erhöht. Die Quote beläuft sich 2015 auf 2620 Umsiedlungsflüchtlinge. 2014 wurden tausend Syrer aufgenommen, die nach Jordanien, Libanon und in die Türkei geflohen waren. Norwegens derzeitige Quote an Flüchtlingen des Resettlement Programms der UNHCR, beträgt 1.200 Flüchtlinge pro Jahr.\r\nQuelle: https://www.npaid.org/Our-Work/Refugees-and-Integration/Reception-Service-for-Refugees\r\n\r\nhttps://www.iom.int/countries/norway
34	Israel	7878651	50.4223375296100969	39726	33725	6001	2500	\N	36926	\N	\N	\N	300	\N	\N	\N	\N	0101000020E6100000048588B79180414061D545B70A763F40	\N
1	Schweden	9750000	31.538461538461501	30750	21520	9230	8105	7985	13205	13030	8985	8845	460	450	\N	30315	30750	0101000020E610000071C5DF5CDEBE3040D618AD11CC634F40	Die Regierung und das Parlament stellen der schwedischen Migrationsbehörde jedes Jahr die Mittel zur Verfügung, um eine bestimmte Anzahl von Flüchtlingen nach Schweden umzusiedeln. Der Schwerpunkt der Auswahl wird von der schwedischen Regierung festgelegt. 2019 hat Schweden 5.000 Flüchtlinge aufgenommen und im Jahr 2020 ist die Anzahl der Plätze gleich. Die schwedische Migrationsbehörde legt in Zusammenarbeit mit dem UNHCR fest, welche Flüchtlingsgruppen für die Neuansiedlung aus verschiedenen Ländern in Betracht gezogen werden. Das UNHCR empfiehlt zwei Regionen. Eine davon ist die Umsiedlung aus Syrien und den angrenzenden Staaten, hauptsächlich Syrer und Iraker in der Türkei, im Libanon und in Jordanien.\r\n\r\nQuelle: https://www.migrationsverket.se/English/About-the-Migration-Agency/Our-mission/The-Swedish-resettlement-programme.html
5	Estland	1320000	0.0378787878787879007	5	5	0	0	0	5	5	0	0	0	0	\N	5	5	0101000020E610000084CF2752E08A3940CC8100CB01564D40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Estland versprach 2016 und 2017 auf der Grundlage des Migrationsplans der Europäischen Kommission 580 Flüchtlinge umzusiedeln.
7	Frankreich	64030000	0.444322973606121996	2845	1590	1255	955	955	965	965	795	790	125	125	\N	2830	2845	0101000020E6100000B262B83A004208401AA6B6D4416A4740	Seit 2013 hat Frankreich mehr als 4600 Asyl für Syrer gewährt. Frankreich hat außerdem zugesagt, 1000 Syrer durch Studentenvisa (Stipendienprogramm) und 500 Syrer und Iraker durch ein neues Programm "Humanitarian Corridors" (privates Sponsoring) aufzunehmen, das 2017/2018 aus dem Libanon eingeführt werden soll.\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
23	Spanien	46455123	0.325044882563328974	1510	930	580	475	475	675	665	335	330	25	25	\N	1495	1510	0101000020E6100000E44148F12E2E0DC0A70F72594B1F4440	Der spanische Ministerrat stimmte am 29. Januar 2010 zur Einrichtung eines jährlichen Programms zum Resettlement von Flüchtlingen gemäß dem kürzlich geänderten Asylgesetz zu. Bis 2017 wurden 1709 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/news/briefing/2010/2/4b681a469/unhcr-welcomes-establishment-spains-resettlement-programme.html\r\nhttps://www.refworld.org/country,,UNHCR,,ESP,,59786cf14,0.html
11	Kroatien	4240000	0.15330188679245299	65	65	0	5	5	50	45	10	10	0	0	0	60	65	0101000020E61000006B986CFF74673040CE8A2E0C4D8A4640	Kroatien hat durch die Umsiedlung von 152 syrischen Staatsangehörigen die Anforderungen vollständig erfüllt. Als zusätzliche Solidaritätsmaßnahme hat die Regierung im Oktober 2017 einen Beschluss über die Umsiedlung von weiteren 100 syrischen Flüchtlingen aus der Türkei durchgesetzt. Im Mai und August 2018 wurden zwei Auswahlmissionen in der Türkei (Ankara) durchgeführt. Von Januar bis November 2018 wurden 112 Syrer aus der Türkei nach Kroatien umgesiedelt.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/04a_croatia_arm2018_part2_en.pdf
15	Malta	429000	7.10955710955710973	305	240	65	95	95	170	170	45	40	0	0	0	305	305	0101000020E6100000A0D8A7B87ACF2C40E2666B97F3F54140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
14	Luxemburg	550000	1.72727272727272996	95	65	30	35	35	35	35	25	25	0	0	0	95	95	0101000020E6100000B0AB8BB58B491840D678BE5D35E24840	In Luxemburg gibt es kein offizielles Resettlement-Programm. Es gibt jedoch eine Ad-hoc-Resettlement.
13	Litauen	2930000	0.0511945392491467977	15	10	5	5	0	5	5	5	0	0	0	0	5	15	0101000020E61000008616E71D1FE33740FD83A6F7BDA94B40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
18	Polen	38478602	0.0298867406877203999	115	95	20	15	10	75	70	25	25	0	0	\N	105	115	0101000020E6100000687C9573DF633340BC79D70D55104A40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
21	Slowakei	5421349	0.0737823740917619986	40	35	5	0	0	35	30	5	5	0	0	\N	35	40	0101000020E6100000E7E6EA29A37A3340F2A896034D5A4840	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch die Slowakei.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
29	Liechtenstein	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0101000020E610000025EE03EC4C122340BEA65D057E914740	Liechtenstein hat zwischen 2014 und 2016 6 syrische Flüchtlingsfamilien umgesiedelt. Darüber hinaus hat Liechtenstein im Rahmen des EU-Resettlement-Programms beschlossen, 43 Personen aus Griechenland und Italien umzusiedeln, von denen die ersten im Januar 2017 ankamen.\r\n\r\nQuelle: https://www.refworld.org/pdfid/5b0818244.pdf
27	Zypern	858000	11.5967365967365996	995	710	285	270	265	520	335	195	145	5	5	\N	750	995	0101000020E61000002B1E11AEC4804040FE18038355754140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
33	Libanon	5449543	2141.79244021011982	1167179	550918	616261	620443	\N	513953	\N	\N	\N	32783	\N	\N	\N	\N	0101000020E61000001213371BA9F04140B182650927F64040	\N
32	Jordanien	7315458	919.874052998458978	672930	333252	339678	339407	\N	307737	\N	\N	\N	25786	\N	\N	\N	\N	0101000020E6100000A58864F5BB6242409E1F3927EC3E3F40	\N
17	Oesterreich	8510000	9.08343125734429968	7730	6200	1530	1765	1750	4245	4205	1700	1685	20	20	0	7660	7730	0101000020E6100000E903AF79C1402C40D2D0F07AF1CA4740	Im Herbst 2013 begann Österreich mit der Umsetzung eines neuen Aufnahmeprogramms für syrische Flüchtlinge: Humanitarian Admission Programme (HAP). Der erste Teil des HAP (HAP I) mit einer Quote von 500 syrischen Flüchtlingen wurde gemeinsam vom Bundesministerium des Innern, dem Bundesamt für Einwanderung und Asyl und dem Bundesministerium für Europa, Integration und auswärtige Angelegenheiten, der UNHCR und die Internationale Organisation für Migration (IOM) organisiert. Das Programm sollte syrischen Flüchtlingen direkt aus der Krisenregion helfen und wurde getrennt vom laufenden regulären Asylverfahren angeboten.\r\nBundesinnenministerin Johanna Mikl-Leitner erklärte am 19. April 2014, dass die HAP, die die am stärksten gefährdeten Flüchtlinge, darunter Frauen, Kinder und verfolgte Minderheiten wie Christen, unterstützt, um 1000 syrische Flüchtlinge erweitert werde (HAP II). Mit dieser Initiative folgt Österreich seiner humanitären Tradition und belegt nach Deutschland den zweiten Platz in Bezug auf EU-Mitgliedstaaten, die syrischen Flüchtlingen Schutz bieten.\r\nHauptziel des HAP ist es, die Nachbarstaaten Syriens zu unterstützen und ein starkes Signal für Solidarität in der internationalen Gemeinschaft zu setzen. Der Anstieg der Zahlen wurde durch die derzeitige dramatische Situation in Syrien gerechtfertigt.\r\n\r\nQuelle: https://www.resettlement.eu/country/austria
37	Tuerkei	76873714	18.1095712378355991	139215	82196	57019	50437	\N	85434	\N	\N	\N	3344	\N	\N	\N	\N	0101000020E61000004C256344A09541400B36979AE2874340	\N
36	Aegypten	88596790	29.5428310664529015	261740	134904	126836	192776	\N	60374	\N	\N	\N	8590	\N	\N	\N	\N	0101000020E610000041E0178BA5DC3D40DFFDD878F57E3A40	\N
35	Irak	34690330	80.563661400741907	279478	157973	121505	126627	\N	146160	\N	\N	\N	6691	\N	\N	\N	\N	0101000020E61000009AF8310A2CDF4540690D961415854040	\N
31	Schweiz	8240000	4.63592233009708998	3820	2095	1720	1710	1700	1225	1205	825	805	55	55	\N	3770	3820	0101000020E610000054D53C69D76A2040B531933C20664740	Das Resettlement-Programm der Schweiz:\r\nFür die Mehrheit der Flüchtlinge bleibt die letzte Hoffnung auf eine dauerhafte Lösung für ihre Existenz die Niederlassung in einem dritten Land, wie zum Beispiel der Schweiz. Seit 2013 hat die Schweiz über 3500 syrische Flüchtlinge aufgenommen, die zuvor vom UNHCR als verletzlichste Schutzsuchende identifiziert worden sind. Die Kriterien der Schweiz für eine dauerhafte Aufnahme sind: erhöhten Schutzbedarf, Wille und Potential für eine Integration, zwischen 40 bis 60 Prozent Frauen und junge Frauen sowie sieben Prozent behinderte, ältere oder kranke Personen. Im November 2018 hat der Bundesrat bekräftigt, das Resettlement-Programm weiterzuführen und alle zwei Jahre weitere 1500 bis 2000 syrische Flüchtlinge sowie Schutzsuchende aus anderen Ländern aufzunehmen.\r\n\r\nQuelle: www.fluechtlingshilfe.ch
28	Island	326000	0.153374233128833998	5	5	0	0	\N	5	\N	0	0	0	\N	\N	\N	5	0101000020E6100000573EED26EF9232C0A0A4666EBA3F5040	Im Zeitraum 2015-2016 hat Island die Umsiedlung von rund 90 Personen aus Syrien genehmigt. Die erste Gruppe ist am 19. Januar 2016 und die zweite Gruppe am 6. April 2016 eingetroffen. Bis April 2016 sind insgesamt 48 Syrer eingetroffen.\r\n\r\nQuelle: https://www.unhcr.org/3c5e58384.pdf
26	Großbritannien	64600000	0.364551083591330982	2355	1840	515	335	335	1375	1370	525	525	40	40	\N	2355	2355	0101000020E610000030531E48D0EC06C0F09CF005DB0F4B40	Syrian Resettlement Programme (VPRS):\r\nDas syrische Resettlement Programm soll den am stärksten gefährdeten Personen helfen - Überlebenden von Folter, Menschen mit schwerwiegenden Erkrankungen und Frauen mit Kindern. Sie werden von der UN identifiziert und dann vom Innenministerium überprüft, bevor sie nach Großbritannien umgesiedelt werden. Die Regierung plant mit dem Programm die Umsiedlung von 20 000 syrischen Flüchtlingen aus Flüchtlingslagern in Jordanien, Libanon, Irak, Ägypten und der Türkei im Zeitraum von September 2015 bis Mai 2020.\r\n\r\nQuelle: https://www.refugeecouncil.org.uk/latest/projects/syrian-resettlement-programme-vprs/
25	Ungarn	9880000	6.93825910931173961	6855	6280	575	690	665	4920	4770	1235	1180	10	10	\N	6630	6855	0101000020E61000000ECB597645653340A0A82ED0D5944740	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch Ungarn.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
24	Tschechien	10538275	0.104381409670937994	110	65	45	30	30	40	40	25	25	10	10	\N	105	110	0101000020E610000035D02F1BF39F2E40C4D78874E0DD4840	2015 initiierte die Tschechische Republik ein Resettlement Programm für syrische Flüchtlingsfamilien in Jordanien mit schwerkranken Kindern. Darüber hinaus hat sich die Tschechische Republik im Juli 2015 dem Europäischen Resettlement Programm angeschlossen und sich verpflichtet bis Juli 2017 400 Flüchtlinge umzusiedeln. Im Rahmen des Programms hat die Tschechische Republik 2015 insgesamt 20 syrische Flüchtlinge aus Jordanien und 2016 32 irakische Flüchtlinge aus Libanon umgesiedelt.\r\nDas Resettlement Programm der Tschechischen Republik wurde von der Regierung im Juni 2017 ausgesetzt.\r\n\r\nQuelle: https://www.unhcr.org/4e2d65a79.pdf
22	Slowenien	2062731	0.436314769109496015	90	50	40	15	15	45	45	30	30	0	0	\N	90	90	0101000020E6100000F19D0EDFDF9B2D4055C48844CA0E4740	Slowenien setzte sein erstes Resettlement Programm für Flüchtlinge mit Unterstützung der IOM und der UN-Migrationsagentur um, indem es 2018 34 syrische Flüchtlinge aus der Türkei nach Slowenien umsiedelte. Das Programm für Flüchtlinge trat nach der Unterzeichnung eines Rahmenabkommens zwischen der IOM, der UN-Migrationsagentur und slowenische Regierung im April 2018 in Kraft.\r\n\r\nQuelle: https://www.iom.int/news/slovenias-first-refugee-resettlement-programme-completed-after-arrival-last-syrian-family
20	Rumaenien	19400000	0.31701030927835	615	470	140	115	115	320	310	165	160	10	10	\N	595	615	0101000020E610000007825CF711F938406863CE771CED4640	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Um die Resettlement- und Integrationspolitik Rumäniens zu verbessern, beriet die UNHCR die Regierung bei der Verbesserung und Stärkung ihres Handlungrahmens. In Zusammenarbeit mit NRO-Partnern organisiert UNHCR auch Sensibilisierungs- und Schulungssitzungen zum Thema Integration für Regierungsbeamte.\r\nQuelle: https://www.unhcr.org/ro/homepage/despre-noi/resurse/publicatii/romania-eng
19	Portugal	10341330	0.0193398721441053016	20	15	5	0	0	10	10	5	5	0	0	\N	20	20	0101000020E61000001CA9D4C9880021C0B7A9639039CC4340	Im Zeitraum von 2018-2019 hat Portugal gemäß den von der Europäischen Kommission festgelegten Prioritäten 1010 Menschen umgesiedelt. Davon wurden 606 Flüchtlinge aus der Türkei umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/4e92a0cc9/unhcr-resettlement-handbook-country-chapter-portugal.html
16	Niederlande	16870000	5.2104327208061596	8790	6950	1840	1580	1570	4360	4340	2755	2745	95	95	0	8750	8790	0101000020E6100000CEB5DCE2332015402490F6AEE60C4A40	Das Resettlement Programm der Niederlande:\r\nDie Niederlande nehmen am Resettlement Programmteil. Die Regierung hat vereinbart im Zeitraum von 2016 bis 2019 insgesamt 2.500 Flüchtlinge umzusiedeln, ungefähr 750 pro Jahr.\r\nEU-Türkei-Abkommen:\r\nDas Abkommen zwischen der EU und der Türkei bedeutet, dass ab dem 20. März 2016 jeder illegale Migrant, der nach Griechenland kommt, in die Türkei zurückkehren muss. Für jede syrische Person, die nach diesem Abkommen zurückkehrt, wird einem der teilnehmenden europäischen Mitgliedstaaten ein syrischer Flüchtling in der Türkei empfohlen. In den Jahren 2016 und 2017 wurden im Rahmen dieses Abkommens insgesamt fast 3.000 Syrer aus der Türkei in die Niederlande umgesiedelt. 2018 siedelten die Niederlande rund 750 Flüchtlinge aus der Türkei um. Für 2019 sollen 1.000 Flüchtlinge aus der Türkei umgesiedelt werden.\r\n\r\nQuelle: https://www.coa.nl/en/reception-of-asylum-seekers/resettlement-of-refugees
12	Lettland	2000000	0.174999999999999989	35	30	5	5	5	20	20	10	10	0	0	0	35	35	0101000020E61000002CC7FD6990E938405D6DC3B4E86C4C40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Im Vergleich zu den Vorjahren hat die Zahl der Asylbewerber aus Syrien zugenommen - 179 (2016 - 149). Am 14. November 2017 genehmigte das Kabinett den vom Innenminister verfassten Report zum Handlungsplan bezüglich der Aufnahme von Personen, die internationalen Schutz benötigen. Der Report sagte aus, dass Lettland die Anforderungen zur Umsiedlung von Flüchtlingen aus Griechenland, Türkei und Italien vollständig erfüllt hat. Die Flüchtlinge kamen mehrheitlich aus Syrien, Eritrea und Irak.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/16a_latvia_arm_part2_2017_en.pdf
10	Italien	60780000	0.0830865416255346934	505	385	120	105	105	275	270	125	125	5	5	5	505	505	0101000020E610000059AD8ECBD823284040A1B5DAF7654540	Italien kündigte ein privates Sponsoring-Projekt (Humanitarian Corridors) an, das 1.000 Personen aufnehmen soll, darunter eine bedeutende Anzahl von Syrern. Bisher wurden 278 Syrer durch dieses Projekt aufgenommen (Stand: 30.04.2017).\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
9	Griechenland	10930000	0.718206770356816016	785	560	225	250	240	360	325	170	160	5	5	\N	730	785	0101000020E6100000326BE8719FF43640D8FE65A58F894340	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Griechenland ist im EU-Türkei-Abkommen miteinbezogen. Für jede von den griechischen Inseln in die Türkei abgeschobene Person aus Syrien soll eine andere syrische Person aus der Türkei in der EU neu angesiedelt werden.\r\n\r\nQuelle: https://www.bpb.de/gesellschaft/migration/laenderprofile/243222/fluechtlingsabkommen-eu-tuerkei
8	Irland	4670000	0.0535331905781585016	25	20	5	5	5	10	10	10	10	0	0	0	25	25	0101000020E6100000DD659E819F4620C01DE7661A75964A40	Syrian Humanitarian Admission Programme:\r\nZusätzlich zu Irlands etablierten Programmen zum Resettlement von Flüchtlingen, führte die Regierung 2014 als Reaktion auf die sich verschärfende Krise in Syrien ein einmaliges privates Programm ein: das Syrian Humanitarian Admission Program (SHAP).\r\nAnträge für SHAP konnten in einem Zeitraum von sechs Wochen zwischen dem 14. März 2014 und dem 30. April 2014 gestellt werden. Mit SHAP konnten irische Staatsbürger syrischer Herkunft und in Irland rechtmäßig ansässige syrische Staatsangehörige beantragen, Familienmitglieder nach Syrien zu bringen oder aus Syrien in die umliegenden Länder vertrieben zu werden, nach Irland. Die Abteilung für Familienzusammenführung des irischen Einbürgerungs- und Einwanderungsdienstes (INIS) war für die Bearbeitung von Anträgen im Rahmen von SHAP verantwortlich. Irland erteilte 119 Personen, die das SHAP-System nutzen, aus Anträgen, die im Namen von 308 Personen gestellt wurden, die Erlaubnis, sich in Irland aufzuhalten. Die SHAP-Begünstigten durften sich zunächst zwei Jahre in Irland aufhalten.\r\n\r\nQuelle: https://www.unhcr.org/en-ie/resettlement-58c923ff4.html
6	Finnland	5450000	0.275229357798164986	150	115	35	15	15	90	90	40	35	0	0	\N	145	150	0101000020E610000005602B7C50463A40A068EB17ED1F5040	Seit 2001 betrug die Flüchtlingszahl im Rahmen des jährlichen Resettlement Programms 750 Personen. In den Jahren 2013 und 2014 hat die Regierung beschlossen, die Quote für die Jahre 2014 und 2015 um 300 Personen zu erhöhen, um der Situation in Syrien gerecht zu werden.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57f07/unhcr-resettlement-handbook-country-chapter-finland.html
4	Daenemark	5630000	12.8063943161634004	7210	5740	1470	1420	1420	3560	3550	2190	2190	40	40	\N	7200	7210	0101000020E610000008FFEC50570E2440FBA56CB299FD4B40	Das Resettlement Programm sieht eine jährliche Zahl von 500 Umsiedlungsplätzen für Flüchtlinge vor. Ab Juli 2005 hat Dänemark ein dreijähriges flexibles Quotenprogramm mit 1.500 Plätzen durchgeführt. Der derzeitige Zeitraum begann am 1. Januar 2014 und läuft bis zum 31. Dezember 2016. 2014 wurden im Rahmen des Programms 250 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57b07/unhcr-resettlement-handbook-country-chapter-denmark.html
3	Bulgarien	7200000	8.67361111111111072	6245	4230	2015	2020	2005	3175	3155	1020	1015	25	25	\N	6200	6245	0101000020E6100000C9FE08EA2C3739400B4D5D6B6B624540	Am 12. April 2016 genehmigte der bulgarische Ministerrat den Nationalen Rahmen für das Resettlement Programm, der mit einem Beschluss des Nationalen Rates für Migration und Integration verabschiedet wurde. Der Beschluss dient dazu die Verpflichtungen Bulgariens aus dem Abkommen zwischen der EU und der Türkei vom 18. März 2016 zu erfüllen. Am 28. November 2017 hat der bulgarische Ministerrat die Frist für das Resettlement Programm von 110 Flüchtlingen bis Ende Oktober 2019 verlängert.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/5bf2cf0a4/unhcr-resettlement-handbook-country-chapter-bulgaria.html
2	Belgien	11180000	2.41949910554561987	2705	1650	1055	930	920	1115	1075	615	590	45	45	\N	2635	2705	0101000020E610000067B12BDA069012403EE2907BE5514940	Das Resettlement-Programm von Belgien:\r\nIm Dezember 2011 beschloss die belgische Regierung, ein strukturelles Resettlement Programm zu entwickeln. Diese Entscheidung basierte auf Piloterfahrungen aus verschiedenen Ad-Doc-Resettlementhandlungen (Irak, Libyen) und der Entwicklung des gemeinsamen europäischen Resettlement-Programms. Die Höhe der Quote wird von der Regierung (Staatssekretär für Asyl und Migration) festgelegt. Die Quote für 2014 wurde auf 100 festgelegt. Aufgrund der syrischen Flüchtlingskrise gab die Regierung im November 2014 ihre Entscheidung bekannt, die Resettlementquote für 2015 von 150 auf 300 zu verdoppeln. Im Rahmen der Schlussfolgerungen des Rates vom 20. Juli 2015 und des EU Resettlement-Programms, hat sich Belgien verpflichtet, 550 Flüchtlinge im Jahr 2016 und 550 Flüchtlinge im Jahr 2017 umzusiedeln. Für die AMIF-Zusage 2018 und 2019 hat Belgien zugesagt, 1.150 Flüchtlinge im Jahr 2018 und 850 in den ersten 10 Monaten des Jahres 2019 umzusiedeln.\r\n\r\nQuelle: https://www.unhcr.org/5278adfb9.pdf
0	Deutschland	81198000	5.06170102711888958	41100	28970	12120	2190	2090	11415	10935	20095	19400	9075	8530	\N	39330	41100	0101000020E6100000AA96D20585C524405F3D7294B18D4940	Das Resettlement-Programm von Deutschland:\r\nDas Aufnahmeprogramm für syrische Flüchtlinge aus der Türkei, welches mit der Aufnahmeanordnung des Bundesministeriums des Innern (BMI) vom 11. Januar 2017 begonnen hatte wird nun mit der Aufnahmeanordnung vom 13. Januar 2020 fortgesetzt. Das BMI hat entschieden das deutsche Engagement fortzusetzen und eine Aufnahme von bis zu 500 Personen pro Monat bis zum 31. Dezember 2020 zu ermöglichen. Die Anordnung wurde mit den obersten Landesbehörden abgestimmt. Den Begleitregelungen können Sie detaillierte Informationen zum Programm entnehmen. So können auch unbegleitete Minderjährige über dieses humanitäre Verfahren Schutz in Deutschland finden.\r\n\r\nQuelle: www.resettlement.de
\.


--
-- Data for Name: geosyrienapp_refugees2015; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.geosyrienapp_refugees2015 ("Id", land, pop, "refRatio", "refTotal", male, female, u18, u18erstantrag, u34, u34erstantrag, u64, u64erstantrag, ue65, ue65erstantrag, unknown, erstantrag, folgeantrag, geom, haltung) FROM stdin;
32	Jordanien	7505315	918.08671588067898	689053	341091	347962	341540	\N	319160	\N	\N	\N	28353	\N	\N	\N	\N	0101000020E6100000A58864F5BB6242409E1F3927EC3E3F40	\N
34	Israel	8001760	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0101000020E6100000048588B79180414061D545B70A763F40	\N
1	Schweden	9850000	52.0913705583756013	51310	33000	18315	17580	17495	22635	22465	10375	10220	725	710	\N	50890	51310	0101000020E610000071C5DF5CDEBE3040D618AD11CC634F40	Die Regierung und das Parlament stellen der schwedischen Migrationsbehörde jedes Jahr die Mittel zur Verfügung, um eine bestimmte Anzahl von Flüchtlingen nach Schweden umzusiedeln. Der Schwerpunkt der Auswahl wird von der schwedischen Regierung festgelegt. 2019 hat Schweden 5.000 Flüchtlinge aufgenommen und im Jahr 2020 ist die Anzahl der Plätze gleich. Die schwedische Migrationsbehörde legt in Zusammenarbeit mit dem UNHCR fest, welche Flüchtlingsgruppen für die Neuansiedlung aus verschiedenen Ländern in Betracht gezogen werden. Das UNHCR empfiehlt zwei Regionen. Eine davon ist die Umsiedlung aus Syrien und den angrenzenden Staaten, hauptsächlich Syrer und Iraker in der Türkei, im Libanon und in Jordanien.\r\n\r\nQuelle: https://www.migrationsverket.se/English/About-the-Migration-Agency/Our-mission/The-Swedish-resettlement-programme.html
5	Estland	1320000	0.113636363636363993	15	10	0	5	5	10	10	0	0	0	0	\N	15	15	0101000020E610000084CF2752E08A3940CC8100CB01564D40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Estland versprach 2016 und 2017 auf der Grundlage des Migrationsplans der Europäischen Kommission 580 Flüchtlinge umzusiedeln.
7	Frankreich	64300000	0.721617418351476969	4640	2640	2000	1515	1505	1705	1710	1255	1250	165	165	\N	4625	4640	0101000020E6100000BF1072DEFFE707401AA6B6D4416A4740	Seit 2013 hat Frankreich mehr als 4600 Asyl für Syrer gewährt. Frankreich hat außerdem zugesagt, 1000 Syrer durch Studentenvisa (Stipendienprogramm) und 500 Syrer und Iraker durch ein neues Programm "Humanitarian Corridors" (privates Sponsoring) aufzunehmen, das 2017/2018 aus dem Libanon eingeführt werden soll.\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
23	Spanien	46410149	1.23356639083403996	5725	3455	2275	2090	2090	2355	2355	1205	1205	70	70	\N	5720	5725	0101000020E6100000E44148F12E2E0DC0A70F72594B1F4440	Der spanische Ministerrat stimmte am 29. Januar 2010 zur Einrichtung eines jährlichen Programms zum Resettlement von Flüchtlingen gemäß dem kürzlich geänderten Asylgesetz zu. Bis 2017 wurden 1709 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/news/briefing/2010/2/4b681a469/unhcr-welcomes-establishment-spains-resettlement-programme.html\r\nhttps://www.refworld.org/country,,UNHCR,,ESP,,59786cf14,0.html
11	Kroatien	4200000	0.0595238095238094997	25	25	0	0	0	20	15	5	5	0	0	0	25	25	0101000020E61000006B986CFF74673040CE8A2E0C4D8A4640	Kroatien hat durch die Umsiedlung von 152 syrischen Staatsangehörigen die Anforderungen vollständig erfüllt. Als zusätzliche Solidaritätsmaßnahme hat die Regierung im Oktober 2017 einen Beschluss über die Umsiedlung von weiteren 100 syrischen Flüchtlingen aus der Türkei durchgesetzt. Im Mai und August 2018 wurden zwei Auswahlmissionen in der Türkei (Ankara) durchgeführt. Von Januar bis November 2018 wurden 112 Syrer aus der Türkei nach Kroatien umgesiedelt.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/04a_croatia_arm2018_part2_en.pdf
13	Litauen	2910000	0.0343642611683849034	10	5	5	5	0	0	0	5	0	0	0	0	5	10	0101000020E61000008616E71D1FE33740FD83A6F7BDA94B40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
15	Malta	440000	9.43181818181817988	415	330	90	105	105	250	240	55	45	5	5	0	395	415	0101000020E6100000A0D8A7B87ACF2C40E2666B97F3F54140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
14	Luxemburg	563000	11.2788632326821006	635	415	220	205	205	255	255	175	175	5	5	0	635	635	0101000020E6100000B0AB8BB58B491840D678BE5D35E24840	In Luxemburg gibt es kein offizielles Resettlement-Programm. Es gibt jedoch eine Ad-hoc-Resettlement.
18	Polen	38437239	0.0780493104616593047	300	190	105	65	65	135	125	85	80	10	10	\N	285	300	0101000020E6100000687C9573DF633340BC79D70D55104A40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
21	Slowakei	5426252	0.0184289266329688006	10	5	0	0	0	5	5	0	0	0	0	\N	5	10	0101000020E6100000E7E6EA29A37A3340F2A896034D5A4840	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch die Slowakei.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
30	Norwegen	5210000	20.2783109404990007	10565	7905	2655	2585	2580	6140	6125	1800	1795	35	35	\N	10535	10565	0101000020E610000064A5087B5AB22E401C9D238D02305140	Das Resettlement Programm von Norwegen:\r\nDas norwegische Parlament entscheidet wie viele Flüchtlinge Norwegen durch das Programm im kommenden Jahr aufnehmen wird, welche Nationalitäten sie haben und woher sie kommen werden. Viele Jahre lang belief sich die Quote auf 1120 Flüchtlingen pro Jahr. Diese Quote wurde jedoch erstmals im Jahr 2014 und darüber hinaus im Jahr 2015 angesichts der Situation in Syrien erhöht. Die Quote beläuft sich 2015 auf 2620 Umsiedlungsflüchtlinge. 2014 wurden tausend Syrer aufgenommen, die nach Jordanien, Libanon und in die Türkei geflohen waren. Norwegens derzeitige Quote an Flüchtlingen des Resettlement Programms der UNHCR, beträgt 1.200 Flüchtlinge pro Jahr.\r\nQuelle: https://www.npaid.org/Our-Work/Refugees-and-Integration/Reception-Service-for-Refugees\r\n\r\nhttps://www.iom.int/countries/norway
29	Liechtenstein	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	\N	0	\N	0	0	0101000020E610000025EE03EC4C122340BEA65D057E914740	Liechtenstein hat zwischen 2014 und 2016 6 syrische Flüchtlingsfamilien umgesiedelt. Darüber hinaus hat Liechtenstein im Rahmen des EU-Resettlement-Programms beschlossen, 43 Personen aus Griechenland und Italien umzusiedeln, von denen die ersten im Januar 2017 ankamen.\r\n\r\nQuelle: https://www.refworld.org/pdfid/5b0818244.pdf
27	Zypern	847000	12.0425029515938995	1020	620	395	295	280	545	465	165	155	5	5	\N	910	1020	0101000020E61000002B1E11AEC4804040FE18038355754140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
33	Libanon	5731420	1898.71096517092997	1088231	526399	561832	577335	\N	482160	\N	\N	\N	28736	\N	\N	\N	\N	0101000020E61000001213371BA9F04140B182650927F64040	\N
37	Tuerkei	78094809	32.0013587586851997	249914	152999	96915	85418	\N	158916	\N	\N	\N	5580	\N	\N	\N	\N	0101000020E61000004C256344A09541400B36979AE2874340	\N
36	Aegypten	90543877	27.6848096531143995	250669	129119	121550	113885	\N	128810	\N	\N	\N	7974	\N	\N	\N	\N	0101000020E610000041E0178BA5DC3D40DFFDD878F57E3A40	\N
35	Irak	35848344	79.5434232610577965	285150	158841	126309	113235	\N	163046	\N	\N	\N	8869	\N	\N	\N	\N	0101000020E61000009AF8310A2CDF4540690D961415854040	\N
31	Schweiz	8330000	5.69627851140455999	4745	2985	1760	1785	1760	2220	2170	710	690	30	30	\N	4650	4745	0101000020E610000054D53C69D76A2040B531933C20664740	Das Resettlement-Programm der Schweiz:\r\nFür die Mehrheit der Flüchtlinge bleibt die letzte Hoffnung auf eine dauerhafte Lösung für ihre Existenz die Niederlassung in einem dritten Land, wie zum Beispiel der Schweiz. Seit 2013 hat die Schweiz über 3500 syrische Flüchtlinge aufgenommen, die zuvor vom UNHCR als verletzlichste Schutzsuchende identifiziert worden sind. Die Kriterien der Schweiz für eine dauerhafte Aufnahme sind: erhöhten Schutzbedarf, Wille und Potential für eine Integration, zwischen 40 bis 60 Prozent Frauen und junge Frauen sowie sieben Prozent behinderte, ältere oder kranke Personen. Im November 2018 hat der Bundesrat bekräftigt, das Resettlement-Programm weiterzuführen und alle zwei Jahre weitere 1500 bis 2000 syrische Flüchtlinge sowie Schutzsuchende aus anderen Ländern aufzunehmen.\r\n\r\nQuelle: www.fluechtlingshilfe.ch
28	Island	329000	1.21580547112462001	40	30	10	15	\N	20	20	5	5	0	0	\N	40	40	0101000020E6100000573EED26EF9232C0A0A4666EBA3F5040	Im Zeitraum 2015-2016 hat Island die Umsiedlung von rund 90 Personen aus Syrien genehmigt. Die erste Gruppe ist am 19. Januar 2016 und die zweite Gruppe am 6. April 2016 eingetroffen. Bis April 2016 sind insgesamt 48 Syrer eingetroffen.\r\n\r\nQuelle: https://www.unhcr.org/3c5e58384.pdf
26	Großbritannien	65110000	0.430041468284442008	2800	2350	450	370	370	1795	1790	530	530	25	25	\N	2795	2800	0101000020E610000030531E48D0EC06C0F09CF005DB0F4B40	Syrian Resettlement Programme (VPRS):\r\nDas syrische Resettlement Programm soll den am stärksten gefährdeten Personen helfen - Überlebenden von Folter, Menschen mit schwerwiegenden Erkrankungen und Frauen mit Kindern. Sie werden von der UN identifiziert und dann vom Innenministerium überprüft, bevor sie nach Großbritannien umgesiedelt werden. Die Regierung plant mit dem Programm die Umsiedlung von 20 000 syrischen Flüchtlingen aus Flüchtlingslagern in Jordanien, Libanon, Irak, Ägypten und der Türkei im Zeitraum von September 2015 bis Mai 2020.\r\n\r\nQuelle: https://www.refugeecouncil.org.uk/latest/projects/syrian-resettlement-programme-vprs/
25	Ungarn	9860000	65.5020283975658941	64585	48130	16450	19380	19230	33500	33225	11525	11450	180	175	\N	64080	64585	0101000020E61000000ECB597645653340A0A82ED0D5944740	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch Ungarn.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
24	Tschechien	10553843	0.127915490120518005	135	80	55	45	45	55	50	35	30	0	0	\N	130	135	0101000020E610000035D02F1BF39F2E40C4D78874E0DD4840	2015 initiierte die Tschechische Republik ein Resettlement Programm für syrische Flüchtlingsfamilien in Jordanien mit schwerkranken Kindern. Darüber hinaus hat sich die Tschechische Republik im Juli 2015 dem Europäischen Resettlement Programm angeschlossen und sich verpflichtet bis Juli 2017 400 Flüchtlinge umzusiedeln. Im Rahmen des Programms hat die Tschechische Republik 2015 insgesamt 20 syrische Flüchtlinge aus Jordanien und 2016 32 irakische Flüchtlinge aus Libanon umgesiedelt.\r\nDas Resettlement Programm der Tschechischen Republik wurde von der Regierung im Juni 2017 ausgesetzt.\r\n\r\nQuelle: https://www.unhcr.org/4e2d65a79.pdf
22	Slowenien	2064632	0.0726521723968241995	15	15	0	10	10	5	5	0	0	0	0	\N	15	15	0101000020E6100000F19D0EDFDF9B2D4055C48844CA0E4740	Slowenien setzte sein erstes Resettlement Programm für Flüchtlinge mit Unterstützung der IOM und der UN-Migrationsagentur um, indem es 2018 34 syrische Flüchtlinge aus der Türkei nach Slowenien umsiedelte. Das Programm für Flüchtlinge trat nach der Unterzeichnung eines Rahmenabkommens zwischen der IOM, der UN-Migrationsagentur und slowenische Regierung im April 2018 in Kraft.\r\n\r\nQuelle: https://www.iom.int/news/slovenias-first-refugee-resettlement-programme-completed-after-arrival-last-syrian-family
20	Rumaenien	19870000	0.276799194765978973	550	375	175	160	160	270	270	110	110	10	10	\N	550	550	0101000020E610000007825CF711F938406863CE771CED4640	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Um die Resettlement- und Integrationspolitik Rumäniens zu verbessern, beriet die UNHCR die Regierung bei der Verbesserung und Stärkung ihres Handlungrahmens. In Zusammenarbeit mit NRO-Partnern organisiert UNHCR auch Sensibilisierungs- und Schulungssitzungen zum Thema Integration für Regierungsbeamte.\r\n\r\nQuelle: https://www.unhcr.org/ro/homepage/despre-noi/resurse/publicatii/romania-eng
19	Portugal	10374822	0.0192774391695588014	20	\N	\N	5	5	10	10	5	5	0	0	\N	15	20	0101000020E61000001CA9D4C9880021C0B7A9639039CC4340	Im Zeitraum von 2018-2019 hat Portugal gemäß den von der Europäischen Kommission festgelegten Prioritäten 1010 Menschen umgesiedelt. Davon wurden 606 Flüchtlinge aus der Türkei umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/4e92a0cc9/unhcr-resettlement-handbook-country-chapter-portugal.html
3	Bulgarien	7150000	8.32167832167831989	5950	3825	2155	2210	2195	2695	2685	1045	1040	30	30	\N	5950	5985	0101000020E6100000C9FE08EA2C3739400B4D5D6B6B624540	Am 12. April 2016 genehmigte der bulgarische Ministerrat den Nationalen Rahmen für das Resettlement Programm, der mit einem Beschluss des Nationalen Rates für Migration und Integration verabschiedet wurde. Der Beschluss dient dazu die Verpflichtungen Bulgariens aus dem Abkommen zwischen der EU und der Türkei vom 18. März 2016 zu erfüllen. Am 28. November 2017 hat der bulgarische Ministerrat die Frist für das Resettlement Programm von 110 Flüchtlingen bis Ende Oktober 2019 verlängert.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/5bf2cf0a4/unhcr-resettlement-handbook-country-chapter-bulgaria.html
17	Oesterreich	8580000	29.1550116550116982	25015	16460	8550	9340	9285	10960	10785	4595	4535	125	115	0	24720	25015	0101000020E6100000E903AF79C1402C40D2D0F07AF1CA4740	Im Herbst 2013 begann Österreich mit der Umsetzung eines neuen Aufnahmeprogramms für syrische Flüchtlinge: Humanitarian Admission Programme (HAP). Der erste Teil des HAP (HAP I) mit einer Quote von 500 syrischen Flüchtlingen wurde gemeinsam vom Bundesministerium des Innern, dem Bundesamt für Einwanderung und Asyl und dem Bundesministerium für Europa, Integration und auswärtige Angelegenheiten, der UNHCR und die Internationale Organisation für Migration (IOM) organisiert. Das Programm sollte syrischen Flüchtlingen direkt aus der Krisenregion helfen und wurde getrennt vom laufenden regulären Asylverfahren angeboten.\r\nBundesinnenministerin Johanna Mikl-Leitner erklärte am 19. April 2014, dass die HAP, die die am stärksten gefährdeten Flüchtlinge, darunter Frauen, Kinder und verfolgte Minderheiten wie Christen, unterstützt, um 1000 syrische Flüchtlinge erweitert werde (HAP II). Mit dieser Initiative folgt Österreich seiner humanitären Tradition und belegt nach Deutschland den zweiten Platz in Bezug auf EU-Mitgliedstaaten, die syrischen Flüchtlingen Schutz bieten.\r\nHauptziel des HAP ist es, die Nachbarstaaten Syriens zu unterstützen und ein starkes Signal für Solidarität in der internationalen Gemeinschaft zu setzen. Der Anstieg der Zahlen wurde durch die derzeitige dramatische Situation in Syrien gerechtfertigt.\r\n\r\nQuelle: https://www.resettlement.eu/country/austria
16	Niederlande	16940000	11.0330578512397004	18690	14750	3885	4025	4015	9515	9490	4995	4975	155	155	0	18640	18690	0101000020E6100000CEB5DCE2332015402490F6AEE60C4A40	Das Resettlement Programm der Niederlande:\r\nDie Niederlande nehmen am Resettlement Programmteil. Die Regierung hat vereinbart im Zeitraum von 2016 bis 2019 insgesamt 2.500 Flüchtlinge umzusiedeln, ungefähr 750 pro Jahr.\r\nEU-Türkei-Abkommen:\r\nDas Abkommen zwischen der EU und der Türkei bedeutet, dass ab dem 20. März 2016 jeder illegale Migrant, der nach Griechenland kommt, in die Türkei zurückkehren muss. Für jede syrische Person, die nach diesem Abkommen zurückkehrt, wird einem der teilnehmenden europäischen Mitgliedstaaten ein syrischer Flüchtling in der Türkei empfohlen. In den Jahren 2016 und 2017 wurden im Rahmen dieses Abkommens insgesamt fast 3.000 Syrer aus der Türkei in die Niederlande umgesiedelt. 2018 siedelten die Niederlande rund 750 Flüchtlinge aus der Türkei um. Für 2019 sollen 1.000 Flüchtlinge aus der Türkei umgesiedelt werden.\r\n\r\nQuelle: https://www.coa.nl/en/reception-of-asylum-seekers/resettlement-of-refugees
12	Lettland	1990000	0.0251256281407035015	5	5	0	0	0	5	5	0	0	0	0	0	5	5	0101000020E61000002CC7FD6990E938405D6DC3B4E86C4C40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Im Vergleich zu den Vorjahren hat die Zahl der Asylbewerber aus Syrien zugenommen - 179 (2016 - 149). Am 14. November 2017 genehmigte das Kabinett den vom Innenminister verfassten Report zum Handlungsplan bezüglich der Aufnahme von Personen, die internationalen Schutz benötigen. Der Report sagte aus, dass Lettland die Anforderungen zur Umsiedlung von Flüchtlingen aus Griechenland, Türkei und Italien vollständig erfüllt hat. Die Flüchtlinge kamen mehrheitlich aus Syrien, Eritrea und Irak.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/16a_latvia_arm_part2_2017_en.pdf
10	Italien	60800000	0.0822368421052632054	500	315	185	195	200	170	175	125	125	5	5	5	505	500	0101000020E610000059AD8ECBD823284040A1B5DAF7654540	Italien kündigte ein privates Sponsoring-Projekt (Humanitarian Corridors) an, das 1.000 Personen aufnehmen soll, darunter eine bedeutende Anzahl von Syrern. Bisher wurden 278 Syrer durch dieses Projekt aufgenommen (Stand: 30.04.2017).\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
9	Griechenland	10860000	3.22283609576426988	3500	2295	1205	1015	1000	1570	1460	875	825	35	35	\N	3325	3500	0101000020E6100000326BE8719FF43640D8FE65A58F894340	ehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Griechenland ist im EU-Türkei-Abkommen miteinbezogen. Für jede von den griechischen Inseln in die Türkei abgeschobene Person aus Syrien soll eine andere syrische Person aus der Türkei in der EU neu angesiedelt werden.\r\n\r\nQuelle: https://www.bpb.de/gesellschaft/migration/laenderprofile/243222/fluechtlingsabkommen-eu-tuerkei
8	Irland	4710000	0.159235668789808993	75	50	25	15	15	30	30	25	25	5	5	5	75	75	0101000020E6100000DD659E819F4620C01DE7661A75964A40	Syrian Humanitarian Admission Programme:\r\nZusätzlich zu Irlands etablierten Programmen zum Resettlement von Flüchtlingen, führte die Regierung 2014 als Reaktion auf die sich verschärfende Krise in Syrien ein einmaliges privates Programm ein: das Syrian Humanitarian Admission Program (SHAP).\r\nAnträge für SHAP konnten in einem Zeitraum von sechs Wochen zwischen dem 14. März 2014 und dem 30. April 2014 gestellt werden. Mit SHAP konnten irische Staatsbürger syrischer Herkunft und in Irland rechtmäßig ansässige syrische Staatsangehörige beantragen, Familienmitglieder nach Syrien zu bringen oder aus Syrien in die umliegenden Länder vertrieben zu werden, nach Irland. Die Abteilung für Familienzusammenführung des irischen Einbürgerungs- und Einwanderungsdienstes (INIS) war für die Bearbeitung von Anträgen im Rahmen von SHAP verantwortlich. Irland erteilte 119 Personen, die das SHAP-System nutzen, aus Anträgen, die im Namen von 308 Personen gestellt wurden, die Erlaubnis, sich in Irland aufzuhalten. Die SHAP-Begünstigten durften sich zunächst zwei Jahre in Irland aufhalten.\r\n\r\nQuelle: https://www.unhcr.org/en-ie/resettlement-58c923ff4.html
6	Finnland	5470000	1.59963436928702007	875	630	245	195	195	445	445	220	225	10	10	\N	875	875	0101000020E610000005602B7C50463A40A068EB17ED1F5040	Seit 2001 betrug die Flüchtlingszahl im Rahmen des jährlichen Resettlement Programms 750 Personen. In den Jahren 2013 und 2014 hat die Regierung beschlossen, die Quote für die Jahre 2014 und 2015 um 300 Personen zu erhöhen, um der Situation in Syrien gerecht zu werden.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57f07/unhcr-resettlement-handbook-country-chapter-finland.html
4	Daenemark	5660000	15.1678445229682008	8585	5615	2970	2630	2630	4240	4240	1645	1645	70	70	\N	8580	8585	0101000020E610000008FFEC50570E2440FBA56CB299FD4B40	Das Resettlement Programm sieht eine jährliche Zahl von 500 Umsiedlungsplätzen für Flüchtlinge vor. Ab Juli 2005 hat Dänemark ein dreijähriges flexibles Quotenprogramm mit 1.500 Plätzen durchgeführt. Der derzeitige Zeitraum begann am 1. Januar 2014 und läuft bis zum 31. Dezember 2016. 2014 wurden im Rahmen des Programms 250 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57b07/unhcr-resettlement-handbook-country-chapter-denmark.html
2	Belgien	11240000	9.26601423487545084	10415	6810	3605	3370	3340	4560	4525	2340	2290	140	140	\N	10295	10415	0101000020E610000067B12BDA069012403EE2907BE5514940	Das Resettlement-Programm von Belgien:\r\nIm Dezember 2011 beschloss die belgische Regierung, ein strukturelles Resettlement Programm zu entwickeln. Diese Entscheidung basierte auf Piloterfahrungen aus verschiedenen Ad-Doc-Resettlementhandlungen (Irak, Libyen) und der Entwicklung des gemeinsamen europäischen Resettlement-Programms. Die Höhe der Quote wird von der Regierung (Staatssekretär für Asyl und Migration) festgelegt. Die Quote für 2014 wurde auf 100 festgelegt. Aufgrund der syrischen Flüchtlingskrise gab die Regierung im November 2014 ihre Entscheidung bekannt, die Resettlementquote für 2015 von 150 auf 300 zu verdoppeln. Im Rahmen der Schlussfolgerungen des Rates vom 20. Juli 2015 und des EU Resettlement-Programms, hat sich Belgien verpflichtet, 550 Flüchtlinge im Jahr 2016 und 550 Flüchtlinge im Jahr 2017 umzusiedeln. Für die AMIF-Zusage 2018 und 2019 hat Belgien zugesagt, 1.150 Flüchtlinge im Jahr 2018 und 850 in den ersten 10 Monaten des Jahres 2019 umzusiedeln.\r\n\r\nQuelle: https://www.unhcr.org/5278adfb9.pdf
0	Deutschland	82176000	19.3067318925233984	158655	119230	43035	43240	42095	85800	84315	32305	31135	1155	1105	\N	158655	162495	0101000020E6100000AA96D20585C524405F3D7294B18D4940	Das Resettlement-Programm von Deutschland:\r\nDas Aufnahmeprogramm für syrische Flüchtlinge aus der Türkei, welches mit der Aufnahmeanordnung des Bundesministeriums des Innern (BMI) vom 11. Januar 2017 begonnen hatte wird nun mit der Aufnahmeanordnung vom 13. Januar 2020 fortgesetzt. Das BMI hat entschieden das deutsche Engagement fortzusetzen und eine Aufnahme von bis zu 500 Personen pro Monat bis zum 31. Dezember 2020 zu ermöglichen. Die Anordnung wurde mit den obersten Landesbehörden abgestimmt. Den Begleitregelungen können Sie detaillierte Informationen zum Programm entnehmen. So können auch unbegleitete Minderjährige über dieses humanitäre Verfahren Schutz in Deutschland finden.\r\n\r\nQuelle: www.resettlement.de
\.


--
-- Data for Name: geosyrienapp_refugees2016; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.geosyrienapp_refugees2016 ("Id", land, pop, "refRatio", "refTotal", male, female, u18, u18erstantrag, u34, u34erstantrag, u64, u64erstantrag, ue65, ue65erstantrag, unknown, erstantrag, folgeantrag, geom, haltung) FROM stdin;
34	Israel	8134749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0101000020E6100000048588B79180414061D545B70A763F40	\N
33	Libanon	6071981	1698.46216580717009	1031303	492453	538850	561636	\N	441412	\N	\N	\N	28255	\N	\N	\N	\N	0101000020E61000001213371BA9F04140B182650927F64040	\N
4	Daenemark	5710000	2.21541155866899997	1265	625	640	490	485	505	500	255	255	15	15	\N	1255	1265	0101000020E610000008FFEC50570E2440FBA56CB299FD4B40	Das Resettlement Programm sieht eine jährliche Zahl von 500 Umsiedlungsplätzen für Flüchtlinge vor. Ab Juli 2005 hat Dänemark ein dreijähriges flexibles Quotenprogramm mit 1.500 Plätzen durchgeführt. Der derzeitige Zeitraum begann am 1. Januar 2014 und läuft bis zum 31. Dezember 2016. 2014 wurden im Rahmen des Programms 250 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57b07/unhcr-resettlement-handbook-country-chapter-denmark.html
5	Estland	1320000	0.340909090909090995	45	25	25	20	20	20	20	5	5	0	0	\N	45	45	0101000020E610000084CF2752E08A3940CC8100CB01564D40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Estland versprach 2016 und 2017 auf der Grundlage des Migrationsplans der Europäischen Kommission 580 Flüchtlinge umzusiedeln.
9	Griechenland	10780000	24.7680890538033012	26700	14550	12150	12580	12565	9325	9290	4620	4610	170	170	\N	26630	26700	0101000020E6100000326BE8719FF43640D8FE65A58F894340	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Griechenland ist im EU-Türkei-Abkommen miteinbezogen. Für jede von den griechischen Inseln in die Türkei abgeschobene Person aus Syrien soll eine andere syrische Person aus der Türkei in der EU neu angesiedelt werden.\r\n\r\nQuelle: https://www.bpb.de/gesellschaft/migration/laenderprofile/243222/fluechtlingsabkommen-eu-tuerkei
10	Italien	60670000	0.161529586286467991	980	560	420	490	490	280	275	190	195	15	20	5	975	980	0101000020E610000059AD8ECBD823284040A1B5DAF7654540	Italien kündigte ein privates Sponsoring-Projekt (Humanitarian Corridors) an, das 1.000 Personen aufnehmen soll, darunter eine bedeutende Anzahl von Syrern. Bisher wurden 278 Syrer durch dieses Projekt aufgenommen (Stand: 30.04.2017).\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
13	Litauen	2870000	0.57491289198606299	165	85	80	80	80	55	55	30	30	0	0	0	165	165	0101000020E61000008616E71D1FE33740FD83A6F7BDA94B40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
14	Luxemburg	576000	5.81597222222221966	335	195	135	155	185	125	100	50	45	0	0	5	330	335	0101000020E6100000B0AB8BB58B491840D678BE5D35E24840	In Luxemburg gibt es kein offizielles Resettlement-Programm. Es gibt jedoch eine Ad-hoc-Resettlement.
31	Schweiz	8420000	2.54156769596200016	2140	1095	1045	1085	1050	695	650	340	320	25	20	\N	2040	2140	0101000020E610000054D53C69D76A2040B531933C20664740	Das Resettlement-Programm der Schweiz:\r\nFür die Mehrheit der Flüchtlinge bleibt die letzte Hoffnung auf eine dauerhafte Lösung für ihre Existenz die Niederlassung in einem dritten Land, wie zum Beispiel der Schweiz. Seit 2013 hat die Schweiz über 3500 syrische Flüchtlinge aufgenommen, die zuvor vom UNHCR als verletzlichste Schutzsuchende identifiziert worden sind. Die Kriterien der Schweiz für eine dauerhafte Aufnahme sind: erhöhten Schutzbedarf, Wille und Potential für eine Integration, zwischen 40 bis 60 Prozent Frauen und junge Frauen sowie sieben Prozent behinderte, ältere oder kranke Personen. Im November 2018 hat der Bundesrat bekräftigt, das Resettlement-Programm weiterzuführen und alle zwei Jahre weitere 1500 bis 2000 syrische Flüchtlinge sowie Schutzsuchende aus anderen Ländern aufzunehmen.\r\n\r\nQuelle: www.fluechtlingshilfe.ch
15	Malta	450000	7.33333333333333037	330	210	120	125	110	155	140	50	35	0	0	0	285	330	0101000020E6100000A0D8A7B87ACF2C40E2666B97F3F54140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
18	Polen	38432992	0.011708690283598	45	35	10	10	10	25	20	15	10	0	0	\N	40	45	0101000020E6100000687C9573DF633340BC79D70D55104A40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
19	Portugal	10427301	0.40758389922761401	425	245	180	180	10	155	5	85	5	5	0	\N	20	425	0101000020E61000001CA9D4C9880021C0B7A9639039CC4340	Im Zeitraum von 2018-2019 hat Portugal gemäß den von der Europäischen Kommission festgelegten Prioritäten 1010 Menschen umgesiedelt. Davon wurden 606 Flüchtlinge aus der Türkei umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/4e92a0cc9/unhcr-resettlement-handbook-country-chapter-portugal.html
22	Slowenien	2065879	1.35535527492171992	280	215	70	90	85	140	135	55	50	0	0	\N	270	280	0101000020E6100000F19D0EDFDF9B2D4055C48844CA0E4740	Slowenien setzte sein erstes Resettlement Programm für Flüchtlinge mit Unterstützung der IOM und der UN-Migrationsagentur um, indem es 2018 34 syrische Flüchtlinge aus der Türkei nach Slowenien umsiedelte. Das Programm für Flüchtlinge trat nach der Unterzeichnung eines Rahmenabkommens zwischen der IOM, der UN-Migrationsagentur und slowenische Regierung im April 2018 in Kraft.\r\n\r\nQuelle: https://www.iom.int/news/slovenias-first-refugee-resettlement-programme-completed-after-arrival-last-syrian-family
25	Ungarn	9830000	5.06612410986774986	4980	2905	2075	2050	2035	2120	2050	790	775	15	15	\N	4875	4980	0101000020E61000000ECB597645653340A0A82ED0D5944740	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch Ungarn.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
27	Zypern	848000	14.3278301886792008	1215	720	490	430	425	585	550	180	175	15	15	\N	1165	1215	0101000020E61000002B1E11AEC4804040FE18038355754140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
29	Liechtenstein	\N	\N	5	0	5	5	5	0	0	0	0	0	0	\N	5	5	0101000020E610000025EE03EC4C122340BEA65D057E914740	Liechtenstein hat zwischen 2014 und 2016 6 syrische Flüchtlingsfamilien umgesiedelt. Darüber hinaus hat Liechtenstein im Rahmen des EU-Resettlement-Programms beschlossen, 43 Personen aus Griechenland und Italien umzusiedeln, von denen die ersten im Januar 2017 ankamen\r\n\r\nQuelle: https://www.refworld.org/pdfid/5b0818244.pdf
32	Jordanien	7734377	931.958708503606999	720812	358081	362731	354090	\N	336154	\N	\N	\N	30568	\N	\N	\N	\N	0101000020E6100000A58864F5BB6242409E1F3927EC3E3F40	\N
26	Großbritannien	65650000	0.239908606245239991	1575	1225	345	320	320	935	930	265	265	15	15	\N	1570	1575	0101000020E610000030531E48D0EC06C0F09CF005DB0F4B40	Syrian Resettlement Programme (VPRS):\r\nDas syrische Resettlement Programm soll den am stärksten gefährdeten Personen helfen - Überlebenden von Folter, Menschen mit schwerwiegenden Erkrankungen und Frauen mit Kindern. Sie werden von der UN identifiziert und dann vom Innenministerium überprüft, bevor sie nach Großbritannien umgesiedelt werden. Die Regierung plant mit dem Programm die Umsiedlung von 20 000 syrischen Flüchtlingen aus Flüchtlingslagern in Jordanien, Libanon, Irak, Ägypten und der Türkei im Zeitraum von September 2015 bis Mai 2020.\r\n\r\nQuelle: https://www.refugeecouncil.org.uk/latest/projects/syrian-resettlement-programme-vprs/
28	Island	333000	1.05105105105105001	35	25	5	5	5	15	15	10	10	0	0	\N	35	35	0101000020E6100000573EED26EF9232C0A0A4666EBA3F5040	Im Zeitraum 2015-2016 hat Island die Umsiedlung von rund 90 Personen aus Syrien genehmigt. Die erste Gruppe ist am 19. Januar 2016 und die zweite Gruppe am 6. April 2016 eingetroffen. Bis April 2016 sind insgesamt 48 Syrer eingetroffen.\r\n\r\nQuelle: https://www.unhcr.org/3c5e58384.pdf
37	Tuerkei	79409926	36.6942792516895011	291389	177653	113736	98017	\N	186756	\N	\N	\N	6616	\N	\N	\N	\N	0101000020E61000004C256344A09541400B36979AE2874340	\N
36	Aegypten	92519544	28.4724706382037986	263426	136374	127052	118591	\N	136697	\N	\N	\N	8138	\N	\N	\N	\N	0101000020E610000041E0178BA5DC3D40DFFDD878F57E3A40	\N
35	Irak	37032056	74.6674718789580965	276509	148197	128312	113475	\N	154142	\N	\N	\N	8892	\N	\N	\N	\N	0101000020E61000009AF8310A2CDF4540690D961415854040	\N
0	Deutschland	82522000	32.5725261142482978	268795	170475	97750	22000	21865	102520	101745	116865	115735	47780	47165	\N	266250	268795	0101000020E6100000AA96D20585C524405F3D7294B18D4940	Das Resettlement-Programm von Deutschland:\r\nDas Aufnahmeprogramm für syrische Flüchtlinge aus der Türkei, welches mit der Aufnahmeanordnung des Bundesministeriums des Innern (BMI) vom 11. Januar 2017 begonnen hatte wird nun mit der Aufnahmeanordnung vom 13. Januar 2020 fortgesetzt. Das BMI hat entschieden das deutsche Engagement fortzusetzen und eine Aufnahme von bis zu 500 Personen pro Monat bis zum 31. Dezember 2020 zu ermöglichen. Die Anordnung wurde mit den obersten Landesbehörden abgestimmt. Den Begleitregelungen können Sie detaillierte Informationen zum Programm entnehmen. So können auch unbegleitete Minderjährige über dieses humanitäre Verfahren Schutz in Deutschland finden.\r\n\r\nQuelle: www.resettlement.de
1	Schweden	10000000	5.45500000000000007	5455	2810	2650	2685	2480	1575	1265	1040	830	155	130	\N	4710	5455	0101000020E610000071C5DF5CDEBE3040D618AD11CC634F40	Die Regierung und das Parlament stellen der schwedischen Migrationsbehörde jedes Jahr die Mittel zur Verfügung, um eine bestimmte Anzahl von Flüchtlingen nach Schweden umzusiedeln. Der Schwerpunkt der Auswahl wird von der schwedischen Regierung festgelegt. 2019 hat Schweden 5.000 Flüchtlinge aufgenommen und im Jahr 2020 ist die Anzahl der Plätze gleich. Die schwedische Migrationsbehörde legt in Zusammenarbeit mit dem UNHCR fest, welche Flüchtlingsgruppen für die Neuansiedlung aus verschiedenen Ländern in Betracht gezogen werden. Das UNHCR empfiehlt zwei Regionen. Eine davon ist die Umsiedlung aus Syrien und den angrenzenden Staaten, hauptsächlich Syrer und Iraker in der Türkei, im Libanon und in Jordanien.\r\n\r\nQuelle: https://www.migrationsverket.se/English/About-the-Migration-Agency/Our-mission/The-Swedish-resettlement-programme.html
2	Belgien	11310000	2.1131741821397001	2390	1260	1130	970	905	875	815	490	460	55	55	\N	2235	2390	0101000020E610000067B12BDA069012403EE2907BE5514940	Das Resettlement-Programm von Belgien:\r\nIm Dezember 2011 beschloss die belgische Regierung, ein strukturelles Resettlement Programm zu entwickeln. Diese Entscheidung basierte auf Piloterfahrungen aus verschiedenen Ad-Doc-Resettlementhandlungen (Irak, Libyen) und der Entwicklung des gemeinsamen europäischen Resettlement-Programms. Die Höhe der Quote wird von der Regierung (Staatssekretär für Asyl und Migration) festgelegt. Die Quote für 2014 wurde auf 100 festgelegt. Aufgrund der syrischen Flüchtlingskrise gab die Regierung im November 2014 ihre Entscheidung bekannt, die Resettlementquote für 2015 von 150 auf 300 zu verdoppeln. Im Rahmen der Schlussfolgerungen des Rates vom 20. Juli 2015 und des EU Resettlement-Programms, hat sich Belgien verpflichtet, 550 Flüchtlinge im Jahr 2016 und 550 Flüchtlinge im Jahr 2017 umzusiedeln. Für die AMIF-Zusage 2018 und 2019 hat Belgien zugesagt, 1.150 Flüchtlinge im Jahr 2018 und 850 in den ersten 10 Monaten des Jahres 2019 umzusiedeln.\r\n\r\nQuelle: https://www.unhcr.org/5278adfb9.pdf
3	Bulgarien	7100000	3.71830985915492995	2640	1395	1245	1130	1110	990	960	490	485	30	30	\N	2585	2640	0101000020E6100000C9FE08EA2C3739400B4D5D6B6B624540	Am 12. April 2016 genehmigte der bulgarische Ministerrat den Nationalen Rahmen für das Resettlement Programm, der mit einem Beschluss des Nationalen Rates für Migration und Integration verabschiedet wurde. Der Beschluss dient dazu die Verpflichtungen Bulgariens aus dem Abkommen zwischen der EU und der Türkei vom 18. März 2016 zu erfüllen. Am 28. November 2017 hat der bulgarische Ministerrat die Frist für das Resettlement Programm von 110 Flüchtlingen bis Ende Oktober 2019 verlängert.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/5bf2cf0a4/unhcr-resettlement-handbook-country-chapter-bulgaria.html
6	Finnland	5490000	1.09289617486339008	600	330	270	285	285	215	210	95	95	10	10	\N	600	600	0101000020E610000005602B7C50463A40A068EB17ED1F5040	Seit 2001 betrug die Flüchtlingszahl im Rahmen des jährlichen Resettlement Programms 750 Personen. In den Jahren 2013 und 2014 hat die Regierung beschlossen, die Quote für die Jahre 2014 und 2015 um 300 Personen zu erhöhen, um der Situation in Syrien gerecht zu werden.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57f07/unhcr-resettlement-handbook-country-chapter-finland.html
7	Frankreich	64470000	0.732899022801303035	4725	2475	2250	1825	1855	1590	1595	1180	1185	135	130	\N	4765	4725	0101000020E6100000A1F7C610009C08401AA6B6D4416A4740	Seit 2013 hat Frankreich mehr als 4600 Asyl für Syrer gewährt. Frankreich hat außerdem zugesagt, 1000 Syrer durch Studentenvisa (Stipendienprogramm) und 500 Syrer und Iraker durch ein neues Programm "Humanitarian Corridors" (privates Sponsoring) aufzunehmen, das 2017/2018 aus dem Libanon eingeführt werden soll.\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
24	Tschechien	10578820	0.0756228010307388038	80	35	40	25	20	30	25	15	15	5	5	\N	65	80	0101000020E610000035D02F1BF39F2E40C4D78874E0DD4840	2015 initiierte die Tschechische Republik ein Resettlement Programm für syrische Flüchtlingsfamilien in Jordanien mit schwerkranken Kindern. Darüber hinaus hat sich die Tschechische Republik im Juli 2015 dem Europäischen Resettlement Programm angeschlossen und sich verpflichtet bis Juli 2017 400 Flüchtlinge umzusiedeln. Im Rahmen des Programms hat die Tschechische Republik 2015 insgesamt 20 syrische Flüchtlinge aus Jordanien und 2016 32 irakische Flüchtlinge aus Libanon umgesiedelt.\r\nDas Resettlement Programm der Tschechischen Republik wurde von der Regierung im Juni 2017 ausgesetzt.\r\n\r\nQuelle: https://www.unhcr.org/4e2d65a79.pdf
8	Irland	4770000	0.51362683438155099	245	130	115	95	95	100	100	45	45	0	0	5	245	245	0101000020E6100000DD659E819F4620C01DE7661A75964A40	Syrian Humanitarian Admission Programme:\r\nZusätzlich zu Irlands etablierten Programmen zum Resettlement von Flüchtlingen, führte die Regierung 2014 als Reaktion auf die sich verschärfende Krise in Syrien ein einmaliges privates Programm ein: das Syrian Humanitarian Admission Program (SHAP).\r\nAnträge für SHAP konnten in einem Zeitraum von sechs Wochen zwischen dem 14. März 2014 und dem 30. April 2014 gestellt werden. Mit SHAP konnten irische Staatsbürger syrischer Herkunft und in Irland rechtmäßig ansässige syrische Staatsangehörige beantragen, Familienmitglieder nach Syrien zu bringen oder aus Syrien in die umliegenden Länder vertrieben zu werden, nach Irland. Die Abteilung für Familienzusammenführung des irischen Einbürgerungs- und Einwanderungsdienstes (INIS) war für die Bearbeitung von Anträgen im Rahmen von SHAP verantwortlich. Irland erteilte 119 Personen, die das SHAP-System nutzen, aus Anträgen, die im Namen von 308 Personen gestellt wurden, die Erlaubnis, sich in Irland aufzuhalten. Die SHAP-Begünstigten durften sich zunächst zwei Jahre in Irland aufhalten.\r\n\r\nQuelle: https://www.unhcr.org/en-ie/resettlement-58c923ff4.html
11	Kroatien	4170000	0.803357314148680945	335	275	60	75	75	220	215	45	45	0	0	5	335	335	0101000020E61000006B986CFF74673040CE8A2E0C4D8A4640	Kroatien hat durch die Umsiedlung von 152 syrischen Staatsangehörigen die Anforderungen vollständig erfüllt. Als zusätzliche Solidaritätsmaßnahme hat die Regierung im Oktober 2017 einen Beschluss über die Umsiedlung von weiteren 100 syrischen Flüchtlingen aus der Türkei durchgesetzt. Im Mai und August 2018 wurden zwei Auswahlmissionen in der Türkei (Ankara) durchgeführt. Von Januar bis November 2018 wurden 112 Syrer aus der Türkei nach Kroatien umgesiedelt.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/04a_croatia_arm2018_part2_en.pdf
12	Lettland	1970000	0.761421319796954044	150	75	75	75	75	55	55	20	20	0	0	0	150	150	0101000020E61000002CC7FD6990E938405D6DC3B4E86C4C40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Im Vergleich zu den Vorjahren hat die Zahl der Asylbewerber aus Syrien zugenommen - 179 (2016 - 149). Am 14. November 2017 genehmigte das Kabinett den vom Innenminister verfassten Report zum Handlungsplan bezüglich der Aufnahme von Personen, die internationalen Schutz benötigen. Der Report sagte aus, dass Lettland die Anforderungen zur Umsiedlung von Flüchtlingen aus Griechenland, Türkei und Italien vollständig erfüllt hat. Die Flüchtlinge kamen mehrheitlich aus Syrien, Eritrea und Irak.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/16a_latvia_arm_part2_2017_en.pdf
16	Niederlande	17030000	1.70874926600117005	2910	1700	1210	1160	1145	1105	1085	600	590	40	40	5	2865	2910	0101000020E6100000CEB5DCE2332015402490F6AEE60C4A40	Das Resettlement Programm der Niederlande:\r\nDie Niederlande nehmen am Resettlement Programmteil. Die Regierung hat vereinbart im Zeitraum von 2016 bis 2019 insgesamt 2.500 Flüchtlinge umzusiedeln, ungefähr 750 pro Jahr.\r\nEU-Türkei-Abkommen:\r\nDas Abkommen zwischen der EU und der Türkei bedeutet, dass ab dem 20. März 2016 jeder illegale Migrant, der nach Griechenland kommt, in die Türkei zurückkehren muss. Für jede syrische Person, die nach diesem Abkommen zurückkehrt, wird einem der teilnehmenden europäischen Mitgliedstaaten ein syrischer Flüchtling in der Türkei empfohlen. In den Jahren 2016 und 2017 wurden im Rahmen dieses Abkommens insgesamt fast 3.000 Syrer aus der Türkei in die Niederlande umgesiedelt. 2018 siedelten die Niederlande rund 750 Flüchtlinge aus der Türkei um. Für 2019 sollen 1.000 Flüchtlinge aus der Türkei umgesiedelt werden.\r\n\r\nQuelle: https://www.coa.nl/en/reception-of-asylum-seekers/resettlement-of-refugees
17	Oesterreich	8700000	10.0862068965516993	8775	4000	4770	5365	5310	2280	2240	1095	1065	30	30	5	8640	8775	0101000020E6100000E903AF79C1402C40D2D0F07AF1CA4740	Im Herbst 2013 begann Österreich mit der Umsetzung eines neuen Aufnahmeprogramms für syrische Flüchtlinge: Humanitarian Admission Programme (HAP). Der erste Teil des HAP (HAP I) mit einer Quote von 500 syrischen Flüchtlingen wurde gemeinsam vom Bundesministerium des Innern, dem Bundesamt für Einwanderung und Asyl und dem Bundesministerium für Europa, Integration und auswärtige Angelegenheiten, der UNHCR und die Internationale Organisation für Migration (IOM) organisiert. Das Programm sollte syrischen Flüchtlingen direkt aus der Krisenregion helfen und wurde getrennt vom laufenden regulären Asylverfahren angeboten.\r\nBundesinnenministerin Johanna Mikl-Leitner erklärte am 19. April 2014, dass die HAP, die die am stärksten gefährdeten Flüchtlinge, darunter Frauen, Kinder und verfolgte Minderheiten wie Christen, unterstützt, um 1000 syrische Flüchtlinge erweitert werde (HAP II). Mit dieser Initiative folgt Österreich seiner humanitären Tradition und belegt nach Deutschland den zweiten Platz in Bezug auf EU-Mitgliedstaaten, die syrischen Flüchtlingen Schutz bieten.\r\nHauptziel des HAP ist es, die Nachbarstaaten Syriens zu unterstützen und ein starkes Signal für Solidarität in der internationalen Gemeinschaft zu setzen. Der Anstieg der Zahlen wurde durch die derzeitige dramatische Situation in Syrien gerechtfertigt.\r\n\r\nQuelle: https://www.resettlement.eu/country/austria
20	Rumaenien	19760000	0.412449392712550988	815	465	350	275	275	385	385	145	145	5	5	\N	805	815	0101000020E610000007825CF711F938406863CE771CED4640	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Um die Resettlement- und Integrationspolitik Rumäniens zu verbessern, beriet die UNHCR die Regierung bei der Verbesserung und Stärkung ihres Handlungrahmens. In Zusammenarbeit mit NRO-Partnern organisiert UNHCR auch Sensibilisierungs- und Schulungssitzungen zum Thema Integration für Regierungsbeamte.\r\n\r\nQuelle: https://www.unhcr.org/ro/homepage/despre-noi/resurse/publicatii/romania-eng
21	Slowakei	5435343	0.0275971544022153015	15	5	10	5	5	10	5	0	0	0	0	\N	10	15	0101000020E6100000E7E6EA29A37A3340F2A896034D5A4840	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch die Slowakei.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
23	Spanien	46449874	0.640475364906264	2975	1690	1285	1330	1305	1065	1050	545	535	35	35	\N	2920	2975	0101000020E6100000E44148F12E2E0DC0A70F72594B1F4440	Der spanische Ministerrat stimmte am 29. Januar 2010 zur Einrichtung eines jährlichen Programms zum Resettlement von Flüchtlingen gemäß dem kürzlich geänderten Asylgesetz zu. Bis 2017 wurden 1709 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/news/briefing/2010/2/4b681a469/unhcr-welcomes-establishment-spains-resettlement-programme.html\r\nhttps://www.refworld.org/country,,UNHCR,,ESP,,59786cf14,0.html
30	Norwegen	5250000	1.06666666666666998	560	290	265	310	310	180	170	65	60	5	5	\N	540	560	0101000020E610000064A5087B5AB22E401C9D238D02305140	Das Resettlement Programm von Norwegen:\r\nDas norwegische Parlament entscheidet wie viele Flüchtlinge Norwegen durch das Programm im kommenden Jahr aufnehmen wird, welche Nationalitäten sie haben und woher sie kommen werden. Viele Jahre lang belief sich die Quote auf 1120 Flüchtlingen pro Jahr. Diese Quote wurde jedoch erstmals im Jahr 2014 und darüber hinaus im Jahr 2015 angesichts der Situation in Syrien erhöht. Die Quote beläuft sich 2015 auf 2620 Umsiedlungsflüchtlinge. 2014 wurden tausend Syrer aufgenommen, die nach Jordanien, Libanon und in die Türkei geflohen waren. Norwegens derzeitige Quote an Flüchtlingen des Resettlement Programms der UNHCR, beträgt 1.200 Flüchtlinge pro Jahr.\r\n\r\nQuelle: https://www.npaid.org/Our-Work/Refugees-and-Integration/Reception-Service-for-Refugees\r\nhttps://www.iom.int/countries/norway
\.


--
-- Data for Name: geosyrienapp_refugees2017; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.geosyrienapp_refugees2017 ("Id", land, pop, "refRatio", "refTotal", male, female, u18, u18erstantrag, u34, u34erstantrag, u64, u64erstantrag, ue65, ue65erstantrag, unknown, erstantrag, folgeantrag, geom, haltung) FROM stdin;
34	Israel	8269949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0101000020E6100000048588B79180414061D545B70A763F40	\N
33	Libanon	6432778	1583.16671273282009	1018416	484778	532638	562926	\N	428314	\N	\N	\N	27176	\N	\N	\N	\N	0101000020E61000001213371BA9F04140B182650927F64040	\N
1	Schweden	10120000	5.38537549407115002	5450	2740	2710	2470	2420	1835	1755	1025	965	120	105	\N	5250	5450	0101000020E610000071C5DF5CDEBE3040D618AD11CC634F40	Die Regierung und das Parlament stellen der schwedischen Migrationsbehörde jedes Jahr die Mittel zur Verfügung, um eine bestimmte Anzahl von Flüchtlingen nach Schweden umzusiedeln. Der Schwerpunkt der Auswahl wird von der schwedischen Regierung festgelegt. 2019 hat Schweden 5.000 Flüchtlinge aufgenommen und im Jahr 2020 ist die Anzahl der Plätze gleich. Die schwedische Migrationsbehörde legt in Zusammenarbeit mit dem UNHCR fest, welche Flüchtlingsgruppen für die Neuansiedlung aus verschiedenen Ländern in Betracht gezogen werden. Das UNHCR empfiehlt zwei Regionen. Eine davon ist die Umsiedlung aus Syrien und den angrenzenden Staaten, hauptsächlich Syrer und Iraker in der Türkei, im Libanon und in Jordanien.\r\n\r\nQuelle: https://www.migrationsverket.se/English/About-the-Migration-Agency/Our-mission/The-Swedish-resettlement-programme.html
31	Schweiz	8480000	2.29952830188678981	1950	995	955	1070	1015	575	525	285	250	15	15	\N	1810	1950	0101000020E610000054D53C69D76A2040B531933C20664740	Das Resettlement-Programm der Schweiz:\r\nFür die Mehrheit der Flüchtlinge bleibt die letzte Hoffnung auf eine dauerhafte Lösung für ihre Existenz die Niederlassung in einem dritten Land, wie zum Beispiel der Schweiz. Seit 2013 hat die Schweiz über 3500 syrische Flüchtlinge aufgenommen, die zuvor vom UNHCR als verletzlichste Schutzsuchende identifiziert worden sind. Die Kriterien der Schweiz für eine dauerhafte Aufnahme sind: erhöhten Schutzbedarf, Wille und Potential für eine Integration, zwischen 40 bis 60 Prozent Frauen und junge Frauen sowie sieben Prozent behinderte, ältere oder kranke Personen. Im November 2018 hat der Bundesrat bekräftigt, das Resettlement-Programm weiterzuführen und alle zwei Jahre weitere 1500 bis 2000 syrische Flüchtlinge sowie Schutzsuchende aus anderen Ländern aufzunehmen.\r\n\r\nQuelle: www.fluechtlingshilfe.ch
5	Estland	1320000	0.606060606060605966	80	45	35	45	45	20	20	15	15	0	0	\N	80	80	0101000020E610000084CF2752E08A3940CC8100CB01564D40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Estland versprach 2016 und 2017 auf der Grundlage des Migrationsplans der Europäischen Kommission 580 Flüchtlinge umzusiedeln.
7	Frankreich	64620000	0.728876508820798019	4710	2495	2215	1965	1965	1555	1545	1060	1060	125	125	\N	4695	4710	0101000020E6100000BF1072DEFFE7074022A81ABD1A6E4740	Seit 2013 hat Frankreich mehr als 4600 Asyl für Syrer gewährt. Frankreich hat außerdem zugesagt, 1000 Syrer durch Studentenvisa (Stipendienprogramm) und 500 Syrer und Iraker durch ein neues Programm "Humanitarian Corridors" (privates Sponsoring) aufzunehmen, das 2017/2018 aus dem Libanon eingeführt werden soll.\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
11	Kroatien	4130000	0.375302663438257023	155	115	40	40	40	95	85	20	20	0	0	0	140	155	0101000020E61000006B986CFF74673040CE8A2E0C4D8A4640	Kroatien hat durch die Umsiedlung von 152 syrischen Staatsangehörigen die Anforderungen vollständig erfüllt. Als zusätzliche Solidaritätsmaßnahme hat die Regierung im Oktober 2017 einen Beschluss über die Umsiedlung von weiteren 100 syrischen Flüchtlingen aus der Türkei durchgesetzt. Im Mai und August 2018 wurden zwei Auswahlmissionen in der Türkei (Ankara) durchgeführt. Von Januar bis November 2018 wurden 112 Syrer aus der Türkei nach Kroatien umgesiedelt.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/04a_croatia_arm2018_part2_en.pdf
14	Luxemburg	591000	6.85279187817258961	405	240	165	220	220	120	120	60	60	5	5	0	405	405	0101000020E6100000B0AB8BB58B491840D678BE5D35E24840	In Luxemburg gibt es kein offizielles Resettlement-Programm. Es gibt jedoch eine Ad-hoc-Resettlement.
13	Litauen	2830000	0.61837455830388699	175	95	80	85	85	70	70	15	15	0	0	5	170	175	0101000020E61000008616E71D1FE33740FD83A6F7BDA94B40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
15	Malta	460000	10.7608695652173996	495	310	185	200	190	225	190	65	50	0	0	5	435	495	0101000020E6100000A0D8A7B87ACF2C40E2666B97F3F54140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
18	Polen	38433558	0.0117085178530699999	45	30	15	10	10	25	20	10	10	0	0	\N	40	45	0101000020E6100000687C9573DF633340BC79D70D55104A40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
21	Slowakei	5443120	0.0183718161642586995	10	5	5	5	5	5	5	0	0	0	0	\N	10	10	0101000020E6100000E7E6EA29A37A3340F2A896034D5A4840	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch die Slowakei.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
23	Spanien	46532869	0.901513293753712031	4195	2325	1870	2080	2070	1260	1220	825	800	25	25	\N	4120	4195	0101000020E6100000E44148F12E2E0DC0A70F72594B1F4440	Der spanische Ministerrat stimmte am 29. Januar 2010 zur Einrichtung eines jährlichen Programms zum Resettlement von Flüchtlingen gemäß dem kürzlich geänderten Asylgesetz zu. Bis 2017 wurden 1709 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/news/briefing/2010/2/4b681a469/unhcr-welcomes-establishment-spains-resettlement-programme.html\r\nhttps://www.refworld.org/country,,UNHCR,,ESP,,59786cf14,0.html
28	Island	338000	1.03550295857988006	35	25	5	5	5	20	20	10	10	0	0	\N	30	35	0101000020E6100000573EED26EF9232C0A0A4666EBA3F5040	Im Zeitraum 2015-2016 hat Island die Umsiedlung von rund 90 Personen aus Syrien genehmigt. Die erste Gruppe ist am 19. Januar 2016 und die zweite Gruppe am 6. April 2016 eingetroffen. Bis April 2016 sind insgesamt 48 Syrer eingetroffen.\r\n\r\nQuelle: https://www.unhcr.org/3c5e58384.pdf
27	Zypern	855000	21.1695906432749013	1810	1290	510	495	490	1075	1040	225	220	5	5	\N	1770	1810	0101000020E61000002B1E11AEC4804040FE18038355754140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
32	Jordanien	7970430	921.959041105686993	734841	367629	367212	361806	\N	341613	\N	\N	\N	31422	\N	\N	\N	\N	0101000020E6100000A58864F5BB6242409E1F3927EC3E3F40	\N
17	Oesterreich	8770000	8.3865450399087802	7355	3145	4210	4880	4835	1420	1380	1035	1015	25	25	0	7255	7355	0101000020E6100000E903AF79C1402C40D2D0F07AF1CA4740	Im Herbst 2013 begann Österreich mit der Umsetzung eines neuen Aufnahmeprogramms für syrische Flüchtlinge: Humanitarian Admission Programme (HAP). Der erste Teil des HAP (HAP I) mit einer Quote von 500 syrischen Flüchtlingen wurde gemeinsam vom Bundesministerium des Innern, dem Bundesamt für Einwanderung und Asyl und dem Bundesministerium für Europa, Integration und auswärtige Angelegenheiten, der UNHCR und die Internationale Organisation für Migration (IOM) organisiert. Das Programm sollte syrischen Flüchtlingen direkt aus der Krisenregion helfen und wurde getrennt vom laufenden regulären Asylverfahren angeboten.\r\nBundesinnenministerin Johanna Mikl-Leitner erklärte am 19. April 2014, dass die HAP, die die am stärksten gefährdeten Flüchtlinge, darunter Frauen, Kinder und verfolgte Minderheiten wie Christen, unterstützt, um 1000 syrische Flüchtlinge erweitert werde (HAP II). Mit dieser Initiative folgt Österreich seiner humanitären Tradition und belegt nach Deutschland den zweiten Platz in Bezug auf EU-Mitgliedstaaten, die syrischen Flüchtlingen Schutz bieten.\r\nHauptziel des HAP ist es, die Nachbarstaaten Syriens zu unterstützen und ein starkes Signal für Solidarität in der internationalen Gemeinschaft zu setzen. Der Anstieg der Zahlen wurde durch die derzeitige dramatische Situation in Syrien gerechtfertigt.\r\n\r\nQuelle: https://www.resettlement.eu/country/austria
37	Tuerkei	80747189	45.1986012788631015	364966	228891	136075	119532	\N	308483	\N	\N	\N	8065	\N	\N	\N	\N	0101000020E61000004C256344A09541400B36979AE2874340	\N
36	Aegypten	94538320	30.5940490586250995	289231	151450	137781	128036	\N	151915	\N	\N	\N	9280	\N	\N	\N	\N	0101000020E610000041E0178BA5DC3D40DFFDD878F57E3A40	\N
35	Irak	38254854	75.9929707220944977	290710	155117	135593	118539	\N	162044	\N	\N	\N	10127	\N	\N	\N	\N	0101000020E61000009AF8310A2CDF4540690D961415854040	\N
30	Norwegen	5290000	1.9092627599243901	1010	550	460	370	370	480	475	150	150	5	5	\N	1000	1010	0101000020E610000064A5087B5AB22E401C9D238D02305140	Das Resettlement Programm von Norwegen:\r\nDas norwegische Parlament entscheidet wie viele Flüchtlinge Norwegen durch das Programm im kommenden Jahr aufnehmen wird, welche Nationalitäten sie haben und woher sie kommen werden. Viele Jahre lang belief sich die Quote auf 1120 Flüchtlingen pro Jahr. Diese Quote wurde jedoch erstmals im Jahr 2014 und darüber hinaus im Jahr 2015 angesichts der Situation in Syrien erhöht. Die Quote beläuft sich 2015 auf 2620 Umsiedlungsflüchtlinge. 2014 wurden tausend Syrer aufgenommen, die nach Jordanien, Libanon und in die Türkei geflohen waren. Norwegens derzeitige Quote an Flüchtlingen des Resettlement Programms der UNHCR, beträgt 1.200 Flüchtlinge pro Jahr.\r\n\r\nQuelle: https://www.npaid.org/Our-Work/Refugees-and-Integration/Reception-Service-for-Refugees\r\nhttps://www.iom.int/countries/norway
29	Liechtenstein	\N	\N	10	5	5	5	5	5	5	5	5	0	0	\N	10	10	0101000020E610000025EE03EC4C122340BEA65D057E914740	Liechtenstein hat zwischen 2014 und 2016 6 syrische Flüchtlingsfamilien umgesiedelt. Darüber hinaus hat Liechtenstein im Rahmen des EU-Resettlement-Programms beschlossen, 43 Personen aus Griechenland und Italien umzusiedeln, von denen die ersten im Januar 2017 ankamen.\r\n\r\nQuelle: https://www.refworld.org/pdfid/5b0818244.pdf
26	Großbritannien	66040000	0.119624470018171003	790	500	290	185	180	400	395	180	180	5	5	\N	785	790	0101000020E610000030531E48D0EC06C0F09CF005DB0F4B40	Syrian Resettlement Programme (VPRS):\r\nDas syrische Resettlement Programm soll den am stärksten gefährdeten Personen helfen - Überlebenden von Folter, Menschen mit schwerwiegenden Erkrankungen und Frauen mit Kindern. Sie werden von der UN identifiziert und dann vom Innenministerium überprüft, bevor sie nach Großbritannien umgesiedelt werden. Die Regierung plant mit dem Programm die Umsiedlung von 20 000 syrischen Flüchtlingen aus Flüchtlingslagern in Jordanien, Libanon, Irak, Ägypten und der Türkei im Zeitraum von September 2015 bis Mai 2020.\r\n\r\nQuelle: https://www.refugeecouncil.org.uk/latest/projects/syrian-resettlement-programme-vprs/
25	Ungarn	9800000	0.58673469387755095	575	330	245	260	260	225	215	95	90	0	0	\N	565	575	0101000020E61000000ECB597645653340A0A82ED0D5944740	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch Ungarn.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
24	Tschechien	10610055	0.0706876637303010952	75	40	35	35	30	25	25	15	15	0	0	\N	70	75	0101000020E610000035D02F1BF39F2E40C4D78874E0DD4840	2015 initiierte die Tschechische Republik ein Resettlement Programm für syrische Flüchtlingsfamilien in Jordanien mit schwerkranken Kindern. Darüber hinaus hat sich die Tschechische Republik im Juli 2015 dem Europäischen Resettlement Programm angeschlossen und sich verpflichtet bis Juli 2017 400 Flüchtlinge umzusiedeln. Im Rahmen des Programms hat die Tschechische Republik 2015 insgesamt 20 syrische Flüchtlinge aus Jordanien und 2016 32 irakische Flüchtlinge aus Libanon umgesiedelt.\r\nDas Resettlement Programm der Tschechischen Republik wurde von der Regierung im Juni 2017 ausgesetzt.\r\n\r\nQuelle: https://www.unhcr.org/4e2d65a79.pdf
22	Slowenien	2065890	0.459850234039565986	95	60	35	40	40	35	35	15	15	0	0	\N	90	95	0101000020E6100000F19D0EDFDF9B2D4055C48844CA0E4740	Slowenien setzte sein erstes Resettlement Programm für Flüchtlinge mit Unterstützung der IOM und der UN-Migrationsagentur um, indem es 2018 34 syrische Flüchtlinge aus der Türkei nach Slowenien umsiedelte. Das Programm für Flüchtlinge trat nach der Unterzeichnung eines Rahmenabkommens zwischen der IOM, der UN-Migrationsagentur und slowenische Regierung im April 2018 in Kraft.\r\n\r\nQuelle: https://www.iom.int/news/slovenias-first-refugee-resettlement-programme-completed-after-arrival-last-syrian-family
20	Rumaenien	19630000	0.483953132959755006	950	580	370	300	295	460	440	175	170	10	10	\N	920	950	0101000020E610000007825CF711F938406863CE771CED4640	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Um die Resettlement- und Integrationspolitik Rumäniens zu verbessern, beriet die UNHCR die Regierung bei der Verbesserung und Stärkung ihres Handlungrahmens. In Zusammenarbeit mit NRO-Partnern organisiert UNHCR auch Sensibilisierungs- und Schulungssitzungen zum Thema Integration für Regierungsbeamte.\r\n\r\nQuelle: https://www.unhcr.org/ro/homepage/despre-noi/resurse/publicatii/romania-eng
19	Portugal	10487289	0.405252491849895979	425	250	180	200	5	150	5	75	0	0	0	\N	10	425	0101000020E61000001CA9D4C9880021C0B7A9639039CC4340	Im Zeitraum von 2018-2019 hat Portugal gemäß den von der Europäischen Kommission festgelegten Prioritäten 1010 Menschen umgesiedelt. Davon wurden 606 Flüchtlinge aus der Türkei umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/4e92a0cc9/unhcr-resettlement-handbook-country-chapter-portugal.html
16	Niederlande	17140000	1.7561260210034999	3010	1915	1095	860	850	1350	1330	745	735	55	55	0	2965	3010	0101000020E6100000CEB5DCE2332015402490F6AEE60C4A40	Das Resettlement Programm der Niederlande:\r\nDie Niederlande nehmen am Resettlement Programmteil. Die Regierung hat vereinbart im Zeitraum von 2016 bis 2019 insgesamt 2.500 Flüchtlinge umzusiedeln, ungefähr 750 pro Jahr.\r\nEU-Türkei-Abkommen:\r\nDas Abkommen zwischen der EU und der Türkei bedeutet, dass ab dem 20. März 2016 jeder illegale Migrant, der nach Griechenland kommt, in die Türkei zurückkehren muss. Für jede syrische Person, die nach diesem Abkommen zurückkehrt, wird einem der teilnehmenden europäischen Mitgliedstaaten ein syrischer Flüchtling in der Türkei empfohlen. In den Jahren 2016 und 2017 wurden im Rahmen dieses Abkommens insgesamt fast 3.000 Syrer aus der Türkei in die Niederlande umgesiedelt. 2018 siedelten die Niederlande rund 750 Flüchtlinge aus der Türkei um. Für 2019 sollen 1.000 Flüchtlinge aus der Türkei umgesiedelt werden.\r\n\r\nQuelle: https://www.coa.nl/en/reception-of-asylum-seekers/resettlement-of-refugees
12	Lettland	1950000	0.717948717948717952	140	70	70	75	75	45	45	20	20	0	0	0	140	140	0101000020E61000002CC7FD6990E938405D6DC3B4E86C4C40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Im Vergleich zu den Vorjahren hat die Zahl der Asylbewerber aus Syrien zugenommen - 179 (2016 - 149). Am 14. November 2017 genehmigte das Kabinett den vom Innenminister verfassten Report zum Handlungsplan bezüglich der Aufnahme von Personen, die internationalen Schutz benötigen. Der Report sagte aus, dass Lettland die Anforderungen zur Umsiedlung von Flüchtlingen aus Griechenland, Türkei und Italien vollständig erfüllt hat. Die Flüchtlinge kamen mehrheitlich aus Syrien, Eritrea und Irak.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/16a_latvia_arm_part2_2017_en.pdf
10	Italien	60590000	0.244264730153491011	1480	875	605	805	860	435	455	230	245	10	10	0	1570	1480	0101000020E610000059AD8ECBD823284040A1B5DAF7654540	Italien kündigte ein privates Sponsoring-Projekt (Humanitarian Corridors) an, das 1.000 Personen aufnehmen soll, darunter eine bedeutende Anzahl von Syrern. Bisher wurden 278 Syrer durch dieses Projekt aufgenommen (Stand: 30.04.2017).\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
9	Griechenland	10770000	15.2228412256267003	16395	9225	7170	7625	7605	6215	6165	2485	2465	70	70	\N	16305	16395	0101000020E6100000326BE8719FF43640D8FE65A58F894340	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Griechenland ist im EU-Türkei-Abkommen miteinbezogen. Für jede von den griechischen Inseln in die Türkei abgeschobene Person aus Syrien soll eine andere syrische Person aus der Türkei in der EU neu angesiedelt werden.\r\n\r\nQuelle: https://www.bpb.de/gesellschaft/migration/laenderprofile/243222/fluechtlingsabkommen-eu-tuerkei
8	Irland	4830000	1.1283643892339501	545	320	225	240	240	220	220	80	80	0	0	5	545	545	0101000020E6100000DD659E819F4620C01DE7661A75964A40	Syrian Humanitarian Admission Programme:\r\nZusätzlich zu Irlands etablierten Programmen zum Resettlement von Flüchtlingen, führte die Regierung 2014 als Reaktion auf die sich verschärfende Krise in Syrien ein einmaliges privates Programm ein: das Syrian Humanitarian Admission Program (SHAP).\r\nAnträge für SHAP konnten in einem Zeitraum von sechs Wochen zwischen dem 14. März 2014 und dem 30. April 2014 gestellt werden. Mit SHAP konnten irische Staatsbürger syrischer Herkunft und in Irland rechtmäßig ansässige syrische Staatsangehörige beantragen, Familienmitglieder nach Syrien zu bringen oder aus Syrien in die umliegenden Länder vertrieben zu werden, nach Irland. Die Abteilung für Familienzusammenführung des irischen Einbürgerungs- und Einwanderungsdienstes (INIS) war für die Bearbeitung von Anträgen im Rahmen von SHAP verantwortlich. Irland erteilte 119 Personen, die das SHAP-System nutzen, aus Anträgen, die im Namen von 308 Personen gestellt wurden, die Erlaubnis, sich in Irland aufzuhalten. Die SHAP-Begünstigten durften sich zunächst zwei Jahre in Irland aufhalten.\r\n\r\nQuelle: https://www.unhcr.org/en-ie/resettlement-58c923ff4.html
6	Finnland	5500000	1.3454545454545499	740	430	310	340	345	275	275	115	115	5	5	\N	740	740	0101000020E610000005602B7C50463A40A068EB17ED1F5040	Seit 2001 betrug die Flüchtlingszahl im Rahmen des jährlichen Resettlement Programms 750 Personen. In den Jahren 2013 und 2014 hat die Regierung beschlossen, die Quote für die Jahre 2014 und 2015 um 300 Personen zu erhöhen, um der Situation in Syrien gerecht zu werden.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57f07/unhcr-resettlement-handbook-country-chapter-finland.html
4	Daenemark	5750000	1.34782608695651995	775	490	285	295	285	325	320	145	145	10	10	\N	765	775	0101000020E610000008FFEC50570E2440FBA56CB299FD4B40	Das Resettlement Programm sieht eine jährliche Zahl von 500 Umsiedlungsplätzen für Flüchtlinge vor. Ab Juli 2005 hat Dänemark ein dreijähriges flexibles Quotenprogramm mit 1.500 Plätzen durchgeführt. Der derzeitige Zeitraum begann am 1. Januar 2014 und läuft bis zum 31. Dezember 2016. 2014 wurden im Rahmen des Programms 250 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57b07/unhcr-resettlement-handbook-country-chapter-denmark.html
3	Bulgarien	7050000	1.36879432624112995	965	530	435	385	375	365	350	205	200	10	10	\N	940	965	0101000020E6100000C9FE08EA2C3739400B4D5D6B6B624540	Am 12. April 2016 genehmigte der bulgarische Ministerrat den Nationalen Rahmen für das Resettlement Programm, der mit einem Beschluss des Nationalen Rates für Migration und Integration verabschiedet wurde. Der Beschluss dient dazu die Verpflichtungen Bulgariens aus dem Abkommen zwischen der EU und der Türkei vom 18. März 2016 zu erfüllen. Am 28. November 2017 hat der bulgarische Ministerrat die Frist für das Resettlement Programm von 110 Flüchtlingen bis Ende Oktober 2019 verlängert.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/5bf2cf0a4/unhcr-resettlement-handbook-country-chapter-bulgaria.html
2	Belgien	11250000	2.47111111111111015	2780	1485	1295	1110	1050	970	910	635	600	70	65	\N	2625	2780	0101000020E610000067B12BDA069012403EE2907BE5514940	Das Resettlement-Programm von Belgien:\r\nIm Dezember 2011 beschloss die belgische Regierung, ein strukturelles Resettlement Programm zu entwickeln. Diese Entscheidung basierte auf Piloterfahrungen aus verschiedenen Ad-Doc-Resettlementhandlungen (Irak, Libyen) und der Entwicklung des gemeinsamen europäischen Resettlement-Programms. Die Höhe der Quote wird von der Regierung (Staatssekretär für Asyl und Migration) festgelegt. Die Quote für 2014 wurde auf 100 festgelegt. Aufgrund der syrischen Flüchtlingskrise gab die Regierung im November 2014 ihre Entscheidung bekannt, die Resettlementquote für 2015 von 150 auf 300 zu verdoppeln. Im Rahmen der Schlussfolgerungen des Rates vom 20. Juli 2015 und des EU Resettlement-Programms, hat sich Belgien verpflichtet, 550 Flüchtlinge im Jahr 2016 und 550 Flüchtlinge im Jahr 2017 umzusiedeln. Für die AMIF-Zusage 2018 und 2019 hat Belgien zugesagt, 1.150 Flüchtlinge im Jahr 2018 und 850 in den ersten 10 Monaten des Jahres 2019 umzusiedeln.\r\n\r\nQuelle: https://www.unhcr.org/5278adfb9.pdf
0	Deutschland	82792000	6.08875253647695036	50410	25785	24585	31175	30460	11775	11310	7145	6895	315	305	\N	48970	50410	0101000020E6100000AA96D20585C524405F3D7294B18D4940	Das Resettlement-Programm von Deutschland:\r\nDas Aufnahmeprogramm für syrische Flüchtlinge aus der Türkei, welches mit der Aufnahmeanordnung des Bundesministeriums des Innern (BMI) vom 11. Januar 2017 begonnen hatte wird nun mit der Aufnahmeanordnung vom 13. Januar 2020 fortgesetzt. Das BMI hat entschieden das deutsche Engagement fortzusetzen und eine Aufnahme von bis zu 500 Personen pro Monat bis zum 31. Dezember 2020 zu ermöglichen. Die Anordnung wurde mit den obersten Landesbehörden abgestimmt. Den Begleitregelungen können Sie detaillierte Informationen zum Programm entnehmen. So können auch unbegleitete Minderjährige über dieses humanitäre Verfahren Schutz in Deutschland finden.\r\n\r\nQuelle: www.resettlement.de
\.


--
-- Data for Name: geosyrienapp_refugees2018; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.geosyrienapp_refugees2018 ("Id", land, pop, "refRatio", "refTotal", male, female, u18, u18erstantrag, u34, u34erstantrag, u64, u64erstantrag, ue65, ue65erstantrag, unknown, erstantrag, folgeantrag, geom, haltung) FROM stdin;
33	Libanon	6815014	1422.80118573490995	969641	464651	504990	536065	\N	407682	\N	\N	\N	25894	\N	\N	\N	\N	0101000020E61000001213371BA9F04140B182650927F64040	\N
1	Schweden	10230000	2.7468230694037099	2810	1365	1445	1050	975	1075	1015	565	510	120	110	\N	2615	2810	0101000020E610000071C5DF5CDEBE3040D618AD11CC634F40	Die Regierung und das Parlament stellen der schwedischen Migrationsbehörde jedes Jahr die Mittel zur Verfügung, um eine bestimmte Anzahl von Flüchtlingen nach Schweden umzusiedeln. Der Schwerpunkt der Auswahl wird von der schwedischen Regierung festgelegt. 2019 hat Schweden 5.000 Flüchtlinge aufgenommen und im Jahr 2020 ist die Anzahl der Plätze gleich. Die schwedische Migrationsbehörde legt in Zusammenarbeit mit dem UNHCR fest, welche Flüchtlingsgruppen für die Neuansiedlung aus verschiedenen Ländern in Betracht gezogen werden. Das UNHCR empfiehlt zwei Regionen. Eine davon ist die Umsiedlung aus Syrien und den angrenzenden Staaten, hauptsächlich Syrer und Iraker in der Türkei, im Libanon und in Jordanien.\r\n\r\nQuelle: https://www.migrationsverket.se/English/About-the-Migration-Agency/Our-mission/The-Swedish-resettlement-programme.html
5	Estland	1320000	0.0378787878787879007	5	5	0	0	0	0	0	0	0	0	0	\N	5	5	0101000020E610000084CF2752E08A3940CC8100CB01564D40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Estland versprach 2016 und 2017 auf der Grundlage des Migrationsplans der Europäischen Kommission 580 Flüchtlinge umzusiedeln.
31	Schweiz	8540000	1.62763466042154992	1390	680	710	820	740	365	300	195	150	10	5	\N	1195	1390	0101000020E610000054D53C69D76A2040B531933C20664740	Das Resettlement-Programm der Schweiz:\r\nFür die Mehrheit der Flüchtlinge bleibt die letzte Hoffnung auf eine dauerhafte Lösung für ihre Existenz die Niederlassung in einem dritten Land, wie zum Beispiel der Schweiz. Seit 2013 hat die Schweiz über 3500 syrische Flüchtlinge aufgenommen, die zuvor vom UNHCR als verletzlichste Schutzsuchende identifiziert worden sind. Die Kriterien der Schweiz für eine dauerhafte Aufnahme sind: erhöhten Schutzbedarf, Wille und Potential für eine Integration, zwischen 40 bis 60 Prozent Frauen und junge Frauen sowie sieben Prozent behinderte, ältere oder kranke Personen. Im November 2018 hat der Bundesrat bekräftigt, das Resettlement-Programm weiterzuführen und alle zwei Jahre weitere 1500 bis 2000 syrische Flüchtlinge sowie Schutzsuchende aus anderen Ländern aufzunehmen.\r\n\r\nQuelle: www.fluechtlingshilfe.ch
7	Frankreich	64730000	0.479684844739687977	3105	1645	1465	1240	1240	1045	1025	745	730	75	70	\N	3070	3105	0101000020E6100000BF1072DEFFE707401AA6B6D4416A4740	Seit 2013 hat Frankreich mehr als 4600 Asyl für Syrer gewährt. Frankreich hat außerdem zugesagt, 1000 Syrer durch Studentenvisa (Stipendienprogramm) und 500 Syrer und Iraker durch ein neues Programm "Humanitarian Corridors" (privates Sponsoring) aufzunehmen, das 2017/2018 aus dem Libanon eingeführt werden soll.\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
15	Malta	467000	10.3854389721626994	485	310	175	230	220	215	200	45	35	0	0	0	455	485	0101000020E6100000A0D8A7B87ACF2C40E2666B97F3F54140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
18	Polen	38411148	0.00650852715987557031	25	15	10	10	10	10	10	5	5	0	0	\N	25	25	0101000020E6100000687C9573DF633340BC79D70D55104A40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
11	Kroatien	4100000	0.219512195121950998	90	65	30	35	35	35	25	20	15	0	0	0	80	90	0101000020E61000006B986CFF74673040CE8A2E0C4D8A4640	Kroatien hat durch die Umsiedlung von 152 syrischen Staatsangehörigen die Anforderungen vollständig erfüllt. Als zusätzliche Solidaritätsmaßnahme hat die Regierung im Oktober 2017 einen Beschluss über die Umsiedlung von weiteren 100 syrischen Flüchtlingen aus der Türkei durchgesetzt. Im Mai und August 2018 wurden zwei Auswahlmissionen in der Türkei (Ankara) durchgeführt. Von Januar bis November 2018 wurden 112 Syrer aus der Türkei nach Kroatien umgesiedelt.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/04a_croatia_arm2018_part2_en.pdf
13	Litauen	2790000	0.0537634408602151032	15	10	5	5	5	10	10	5	5	0	0	5	15	15	0101000020E61000008616E71D1FE33740FD83A6F7BDA94B40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
14	Luxemburg	602000	4.73421926910299007	285	150	130	135	135	85	85	60	60	5	5	0	280	285	0101000020E6100000B0AB8BB58B491840D678BE5D35E24840	In Luxemburg gibt es kein offizielles Resettlement-Programm. Es gibt jedoch eine Ad-hoc-Resettlement.
21	Slowakei	5450421	0.0183472065735839004	10	5	5	5	5	0	0	5	5	0	0	\N	10	10	0101000020E6100000E7E6EA29A37A3340F2A896034D5A4840	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch die Slowakei.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
23	Spanien	46728962	0.592780126380722971	2770	1550	1220	1295	1285	905	885	545	525	25	25	\N	2725	2770	0101000020E6100000E44148F12E2E0DC0A70F72594B1F4440	Der spanische Ministerrat stimmte am 29. Januar 2010 zur Einrichtung eines jährlichen Programms zum Resettlement von Flüchtlingen gemäß dem kürzlich geänderten Asylgesetz zu. Bis 2017 wurden 1709 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/news/briefing/2010/2/4b681a469/unhcr-welcomes-establishment-spains-resettlement-programme.html\r\nhttps://www.refworld.org/country,,UNHCR,,ESP,,59786cf14,0.html
28	Island	348000	1.14942528735631999	40	30	10	5	5	20	20	15	15	0	0	\N	40	40	0101000020E6100000573EED26EF9232C0A0A4666EBA3F5040	Im Zeitraum 2015-2016 hat Island die Umsiedlung von rund 90 Personen aus Syrien genehmigt. Die erste Gruppe ist am 19. Januar 2016 und die zweite Gruppe am 6. April 2016 eingetroffen. Bis April 2016 sind insgesamt 48 Syrer eingetroffen.\r\n\r\nQuelle: https://www.unhcr.org/3c5e58384.pdf
27	Zypern	864000	23.2060185185185013	2005	1360	630	645	640	1055	1025	295	290	10	10	\N	1970	2005	0101000020E61000002B1E11AEC4804040FE18038355754140	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil.
32	Jordanien	8213688	936.553713751971031	769256	388616	380640	361287	\N	372763	\N	\N	\N	35206	\N	\N	\N	\N	0101000020E6100000A58864F5BB6242409E1F3927EC3E3F40	\N
34	Israel	8407396	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0101000020E6100000048588B79180414061D545B70A763F40	\N
17	Oesterreich	8820000	3.74716553287982013	3305	1515	1795	2315	2310	595	585	385	375	10	10	0	3275	3305	0101000020E6100000E903AF79C1402C40D2D0F07AF1CA4740	Im Herbst 2013 begann Österreich mit der Umsetzung eines neuen Aufnahmeprogramms für syrische Flüchtlinge: Humanitarian Admission Programme (HAP). Der erste Teil des HAP (HAP I) mit einer Quote von 500 syrischen Flüchtlingen wurde gemeinsam vom Bundesministerium des Innern, dem Bundesamt für Einwanderung und Asyl und dem Bundesministerium für Europa, Integration und auswärtige Angelegenheiten, der UNHCR und die Internationale Organisation für Migration (IOM) organisiert. Das Programm sollte syrischen Flüchtlingen direkt aus der Krisenregion helfen und wurde getrennt vom laufenden regulären Asylverfahren angeboten.\r\nBundesinnenministerin Johanna Mikl-Leitner erklärte am 19. April 2014, dass die HAP, die die am stärksten gefährdeten Flüchtlinge, darunter Frauen, Kinder und verfolgte Minderheiten wie Christen, unterstützt, um 1000 syrische Flüchtlinge erweitert werde (HAP II). Mit dieser Initiative folgt Österreich seiner humanitären Tradition und belegt nach Deutschland den zweiten Platz in Bezug auf EU-Mitgliedstaaten, die syrischen Flüchtlingen Schutz bieten.\r\nHauptziel des HAP ist es, die Nachbarstaaten Syriens zu unterstützen und ein starkes Signal für Solidarität in der internationalen Gemeinschaft zu setzen. Der Anstieg der Zahlen wurde durch die derzeitige dramatische Situation in Syrien gerechtfertigt.\r\n\r\nQuelle: https://www.resettlement.eu/country/austria
37	Tuerkei	82106972	486.365640179740012	3993401	2198813	1794588	1767998	\N	2105085	\N	\N	\N	120272	\N	\N	\N	\N	0101000020E61000004C256344A09541400B36979AE2874340	\N
36	Aegypten	96601146	25.3548751895758997	244931	127810	117121	94674	\N	141292	\N	\N	\N	8905	\N	\N	\N	\N	0101000020E610000041E0178BA5DC3D40DFFDD878F57E3A40	\N
35	Irak	39518029	75.1457012190562068	296961	156842	140119	121056	\N	164537	\N	\N	\N	11073	\N	\N	\N	\N	0101000020E61000009AF8310A2CDF4540690D961415854040	\N
30	Norwegen	5320000	0.798872180451127956	425	210	215	110	110	250	245	65	60	0	0	\N	415	425	0101000020E610000064A5087B5AB22E401C9D238D02305140	Das Resettlement Programm von Norwegen:\r\nDas norwegische Parlament entscheidet wie viele Flüchtlinge Norwegen durch das Programm im kommenden Jahr aufnehmen wird, welche Nationalitäten sie haben und woher sie kommen werden. Viele Jahre lang belief sich die Quote auf 1120 Flüchtlingen pro Jahr. Diese Quote wurde jedoch erstmals im Jahr 2014 und darüber hinaus im Jahr 2015 angesichts der Situation in Syrien erhöht. Die Quote beläuft sich 2015 auf 2620 Umsiedlungsflüchtlinge. 2014 wurden tausend Syrer aufgenommen, die nach Jordanien, Libanon und in die Türkei geflohen waren. Norwegens derzeitige Quote an Flüchtlingen des Resettlement Programms der UNHCR, beträgt 1.200 Flüchtlinge pro Jahr.\r\n\r\nQuelle: https://www.npaid.org/Our-Work/Refugees-and-Integration/Reception-Service-for-Refugees\r\nhttps://www.iom.int/countries/norway
29	Liechtenstein	\N	\N	5	0	0	0	0	0	0	0	0	0	0	\N	5	5	0101000020E610000025EE03EC4C122340BEA65D057E914740	Liechtenstein hat zwischen 2014 und 2016 6 syrische Flüchtlingsfamilien umgesiedelt. Darüber hinaus hat Liechtenstein im Rahmen des EU-Resettlement-Programms beschlossen, 43 Personen aus Griechenland und Italien umzusiedeln, von denen die ersten im Januar 2017 ankamen.\r\n\r\nQuelle: https://www.refworld.org/pdfid/5b0818244.pdf
26	Großbritannien	66470000	0.138408304498269991	920	625	295	205	205	505	500	185	185	10	10	\N	915	920	0101000020E610000030531E48D0EC06C0F09CF005DB0F4B40	Syrian Resettlement Programme (VPRS):\r\nDas syrische Resettlement Programm soll den am stärksten gefährdeten Personen helfen - Überlebenden von Folter, Menschen mit schwerwiegenden Erkrankungen und Frauen mit Kindern. Sie werden von der UN identifiziert und dann vom Innenministerium überprüft, bevor sie nach Großbritannien umgesiedelt werden. Die Regierung plant mit dem Programm die Umsiedlung von 20 000 syrischen Flüchtlingen aus Flüchtlingslagern in Jordanien, Libanon, Irak, Ägypten und der Türkei im Zeitraum von September 2015 bis Mai 2020.\r\n\r\nQuelle: https://www.refugeecouncil.org.uk/latest/projects/syrian-resettlement-programme-vprs/
25	Ungarn	9780000	0.0511247443762780987	50	40	5	15	15	30	30	5	5	0	0	\N	50	50	0101000020E61000000ECB597645653340A0A82ED0D5944740	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Trotz der Bereitschaft der meisten EU-Mitgliedstaaten, Asylsuchende umzusiedeln, wurde im September 2015 der mit qualifizierter Mehrheit der angenommene Beschluss (EU) 2015/1601 von fünf Mitgliedstaaten abgelehnt, darunter auch Ungarn.\r\n\r\nQuelle: https://www.europarl.europa.eu/RegData/etudes/BRIE/2020/649327/EPRS_BRI(2020)649327_EN.pdf
24	Tschechien	10649800	0.0328644669383462984	35	25	15	10	10	15	15	5	5	0	0	\N	30	35	0101000020E610000035D02F1BF39F2E40C4D78874E0DD4840	2015 initiierte die Tschechische Republik ein Resettlement Programm für syrische Flüchtlingsfamilien in Jordanien mit schwerkranken Kindern. Darüber hinaus hat sich die Tschechische Republik im Juli 2015 dem Europäischen Resettlement Programm angeschlossen und sich verpflichtet bis Juli 2017 400 Flüchtlinge umzusiedeln. Im Rahmen des Programms hat die Tschechische Republik 2015 insgesamt 20 syrische Flüchtlinge aus Jordanien und 2016 32 irakische Flüchtlinge aus Libanon umgesiedelt.\r\nDas Resettlement Programm der Tschechischen Republik wurde von der Regierung im Juni 2017 ausgesetzt.\r\n\r\nQuelle: https://www.unhcr.org/4e2d65a79.pdf
22	Slowenien	2076595	0.794569957069144017	165	115	45	55	55	80	75	30	30	0	0	\N	155	165	0101000020E6100000F19D0EDFDF9B2D4055C48844CA0E4740	Slowenien setzte sein erstes Resettlement Programm für Flüchtlinge mit Unterstützung der IOM und der UN-Migrationsagentur um, indem es 2018 34 syrische Flüchtlinge aus der Türkei nach Slowenien umsiedelte. Das Programm für Flüchtlinge trat nach der Unterzeichnung eines Rahmenabkommens zwischen der IOM, der UN-Migrationsagentur und slowenische Regierung im April 2018 in Kraft.\r\n\r\nQuelle: https://www.iom.int/news/slovenias-first-refugee-resettlement-programme-completed-after-arrival-last-syrian-family
20	Rumaenien	19520000	0.189549180327868994	370	235	135	110	105	180	165	75	70	5	5	\N	350	370	0101000020E610000007825CF711F938406863CE771CED4640	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Um die Resettlement- und Integrationspolitik Rumäniens zu verbessern, beriet die UNHCR die Regierung bei der Verbesserung und Stärkung ihres Handlungrahmens. In Zusammenarbeit mit NRO-Partnern organisiert UNHCR auch Sensibilisierungs- und Schulungssitzungen zum Thema Integration für Regierungsbeamte.\r\n\r\nQuelle: https://www.unhcr.org/ro/homepage/despre-noi/resurse/publicatii/romania-eng
19	Portugal	10542398	0.00948550794610486005	10	5	5	0	0	5	5	0	0	0	0	\N	10	10	0101000020E61000001CA9D4C9880021C0B7A9639039CC4340	Im Zeitraum von 2018-2019 hat Portugal gemäß den von der Europäischen Kommission festgelegten Prioritäten 1010 Menschen umgesiedelt. Davon wurden 606 Flüchtlinge aus der Türkei umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/4e92a0cc9/unhcr-resettlement-handbook-country-chapter-portugal.html
16	Niederlande	17190000	1.78592204770215002	3070	2185	885	680	645	1480	1440	870	835	45	45	0	2960	3070	0101000020E6100000CEB5DCE2332015402490F6AEE60C4A40	Das Resettlement Programm der Niederlande:\r\nDie Niederlande nehmen am Resettlement Programmteil. Die Regierung hat vereinbart im Zeitraum von 2016 bis 2019 insgesamt 2.500 Flüchtlinge umzusiedeln, ungefähr 750 pro Jahr.\r\nEU-Türkei-Abkommen:\r\nDas Abkommen zwischen der EU und der Türkei bedeutet, dass ab dem 20. März 2016 jeder illegale Migrant, der nach Griechenland kommt, in die Türkei zurückkehren muss. Für jede syrische Person, die nach diesem Abkommen zurückkehrt, wird einem der teilnehmenden europäischen Mitgliedstaaten ein syrischer Flüchtling in der Türkei empfohlen. In den Jahren 2016 und 2017 wurden im Rahmen dieses Abkommens insgesamt fast 3.000 Syrer aus der Türkei in die Niederlande umgesiedelt. 2018 siedelten die Niederlande rund 750 Flüchtlinge aus der Türkei um. Für 2019 sollen 1.000 Flüchtlinge aus der Türkei umgesiedelt werden.\r\n\r\nQuelle: https://www.coa.nl/en/reception-of-asylum-seekers/resettlement-of-refugees
12	Lettland	1930000	0.0259067357512953005	5	5	0	0	0	0	0	0	0	0	0	5	5	5	0101000020E61000002CC7FD6990E938405D6DC3B4E86C4C40	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Im Vergleich zu den Vorjahren hat die Zahl der Asylbewerber aus Syrien zugenommen - 179 (2016 - 149). Am 14. November 2017 genehmigte das Kabinett den vom Innenminister verfassten Report zum Handlungsplan bezüglich der Aufnahme von Personen, die internationalen Schutz benötigen. Der Report sagte aus, dass Lettland die Anforderungen zur Umsiedlung von Flüchtlingen aus Griechenland, Türkei und Italien vollständig erfüllt hat. Die Flüchtlinge kamen mehrheitlich aus Syrien, Eritrea und Irak.\r\n\r\nQuelle: https://ec.europa.eu/home-affairs/sites/homeaffairs/files/16a_latvia_arm_part2_2017_en.pdf
10	Italien	60480000	0.0545634920634920986	330	225	105	115	115	140	140	70	70	5	5	0	330	330	0101000020E610000059AD8ECBD823284040A1B5DAF7654540	Italien kündigte ein privates Sponsoring-Projekt (Humanitarian Corridors) an, das 1.000 Personen aufnehmen soll, darunter eine bedeutende Anzahl von Syrern. Bisher wurden 278 Syrer durch dieses Projekt aufgenommen (Stand: 30.04.2017).\r\n\r\nQuelle: https://www.refworld.org/country,,UNHCR,,PRT,,59786cf14,0.html
9	Griechenland	10740000	12.4674115456238006	13390	7525	5865	6265	6200	5250	5125	1820	1775	50	45	\N	13145	13390	0101000020E6100000326BE8719FF43640D8FE65A58F894340	Nehmen nicht am offiziellen Resettlement Programm der UNHCR teil. Griechenland ist im EU-Türkei-Abkommen miteinbezogen. Für jede von den griechischen Inseln in die Türkei abgeschobene Person aus Syrien soll eine andere syrische Person aus der Türkei in der EU neu angesiedelt werden.\r\n\r\nQuelle: https://www.bpb.de/gesellschaft/migration/laenderprofile/243222/fluechtlingsabkommen-eu-tuerkei
8	Irland	4900000	0.673469387755102011	330	190	140	145	145	125	125	55	55	5	5	5	330	330	0101000020E6100000DD659E819F4620C01DE7661A75964A40	Syrian Humanitarian Admission Programme:\r\nZusätzlich zu Irlands etablierten Programmen zum Resettlement von Flüchtlingen, führte die Regierung 2014 als Reaktion auf die sich verschärfende Krise in Syrien ein einmaliges privates Programm ein: das Syrian Humanitarian Admission Program (SHAP).\r\nAnträge für SHAP konnten in einem Zeitraum von sechs Wochen zwischen dem 14. März 2014 und dem 30. April 2014 gestellt werden. Mit SHAP konnten irische Staatsbürger syrischer Herkunft und in Irland rechtmäßig ansässige syrische Staatsangehörige beantragen, Familienmitglieder nach Syrien zu bringen oder aus Syrien in die umliegenden Länder vertrieben zu werden, nach Irland. Die Abteilung für Familienzusammenführung des irischen Einbürgerungs- und Einwanderungsdienstes (INIS) war für die Bearbeitung von Anträgen im Rahmen von SHAP verantwortlich. Irland erteilte 119 Personen, die das SHAP-System nutzen, aus Anträgen, die im Namen von 308 Personen gestellt wurden, die Erlaubnis, sich in Irland aufzuhalten. Die SHAP-Begünstigten durften sich zunächst zwei Jahre in Irland aufhalten.\r\n\r\nQuelle: https://www.unhcr.org/en-ie/resettlement-58c923ff4.html
6	Finnland	5520000	0.199275362318840993	110	70	40	40	35	45	45	25	20	0	0	\N	105	110	0101000020E610000005602B7C50463A40A068EB17ED1F5040	Seit 2001 betrug die Flüchtlingszahl im Rahmen des jährlichen Resettlement Programms 750 Personen. In den Jahren 2013 und 2014 hat die Regierung beschlossen, die Quote für die Jahre 2014 und 2015 um 300 Personen zu erhöhen, um der Situation in Syrien gerecht zu werden.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57f07/unhcr-resettlement-handbook-country-chapter-finland.html
4	Daenemark	5780000	1.06401384083045003	615	255	360	190	190	300	285	115	115	10	10	\N	600	615	0101000020E610000008FFEC50570E2440FBA56CB299FD4B40	Das Resettlement Programm sieht eine jährliche Zahl von 500 Umsiedlungsplätzen für Flüchtlinge vor. Ab Juli 2005 hat Dänemark ein dreijähriges flexibles Quotenprogramm mit 1.500 Plätzen durchgeführt. Der derzeitige Zeitraum begann am 1. Januar 2014 und läuft bis zum 31. Dezember 2016. 2014 wurden im Rahmen des Programms 250 syrische Flüchtlinge umgesiedelt.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/3c5e57b07/unhcr-resettlement-handbook-country-chapter-denmark.html
3	Bulgarien	7010000	0.720399429386590961	505	290	215	220	215	190	185	95	95	5	5	\N	495	505	0101000020E6100000C9FE08EA2C3739400B4D5D6B6B624540	Am 12. April 2016 genehmigte der bulgarische Ministerrat den Nationalen Rahmen für das Resettlement Programm, der mit einem Beschluss des Nationalen Rates für Migration und Integration verabschiedet wurde. Der Beschluss dient dazu die Verpflichtungen Bulgariens aus dem Abkommen zwischen der EU und der Türkei vom 18. März 2016 zu erfüllen. Am 28. November 2017 hat der bulgarische Ministerrat die Frist für das Resettlement Programm von 110 Flüchtlingen bis Ende Oktober 2019 verlängert.\r\n\r\nQuelle: https://www.unhcr.org/protection/resettlement/5bf2cf0a4/unhcr-resettlement-handbook-country-chapter-bulgaria.html
2	Belgien	11410000	2.54163014899210982	2900	1575	1330	1125	1075	1010	960	695	665	70	70	\N	2770	2900	0101000020E610000067B12BDA069012403EE2907BE5514940	Das Resettlement-Programm von Belgien:\r\nIm Dezember 2011 beschloss die belgische Regierung, ein strukturelles Resettlement Programm zu entwickeln. Diese Entscheidung basierte auf Piloterfahrungen aus verschiedenen Ad-Doc-Resettlementhandlungen (Irak, Libyen) und der Entwicklung des gemeinsamen europäischen Resettlement-Programms. Die Höhe der Quote wird von der Regierung (Staatssekretär für Asyl und Migration) festgelegt. Die Quote für 2014 wurde auf 100 festgelegt. Aufgrund der syrischen Flüchtlingskrise gab die Regierung im November 2014 ihre Entscheidung bekannt, die Resettlementquote für 2015 von 150 auf 300 zu verdoppeln. Im Rahmen der Schlussfolgerungen des Rates vom 20. Juli 2015 und des EU Resettlement-Programms, hat sich Belgien verpflichtet, 550 Flüchtlinge im Jahr 2016 und 550 Flüchtlinge im Jahr 2017 umzusiedeln. Für die AMIF-Zusage 2018 und 2019 hat Belgien zugesagt, 1.150 Flüchtlinge im Jahr 2018 und 850 in den ersten 10 Monaten des Jahres 2019 umzusiedeln.\r\n\r\nQuelle: https://www.unhcr.org/5278adfb9.pdf
0	Deutschland	83019000	5.54150254760958028	46005	22580	23400	30545	29590	8805	8245	6465	6145	185	185	\N	44165	\N	0101000020E6100000AA96D20585C524405F3D7294B18D4940	Das Resettlement-Programm von Deutschland:\r\nDas Aufnahmeprogramm für syrische Flüchtlinge aus der Türkei, welches mit der Aufnahmeanordnung des Bundesministeriums des Innern (BMI) vom 11. Januar 2017 begonnen hatte wird nun mit der Aufnahmeanordnung vom 13. Januar 2020 fortgesetzt. Das BMI hat entschieden das deutsche Engagement fortzusetzen und eine Aufnahme von bis zu 500 Personen pro Monat bis zum 31. Dezember 2020 zu ermöglichen. Die Anordnung wurde mit den obersten Landesbehörden abgestimmt. Den Begleitregelungen können Sie detaillierte Informationen zum Programm entnehmen. So können auch unbegleitete Minderjährige über dieses humanitäre Verfahren Schutz in Deutschland finden.\r\n\r\nQuelle: www.resettlement.de
\.


--
-- Data for Name: geosyrienapp_waterconsumption; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.geosyrienapp_waterconsumption ("Id", "Suburb", "NoOfSingleResProp", "AvgMonthlyKL", "AvgMonthlyKLPredicted", "PredictionAccuracy", "Month", "Year", "DateTime", geom) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 655, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: geosyrienapp_refugees2011 geosyrienapp_refugees2011_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geosyrienapp_refugees2011
    ADD CONSTRAINT geosyrienapp_refugees2011_pkey PRIMARY KEY ("Id");


--
-- Name: geosyrienapp_refugees2012 geosyrienapp_refugees2012_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geosyrienapp_refugees2012
    ADD CONSTRAINT geosyrienapp_refugees2012_pkey PRIMARY KEY ("Id");


--
-- Name: geosyrienapp_refugees2013 geosyrienapp_refugees2013_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geosyrienapp_refugees2013
    ADD CONSTRAINT geosyrienapp_refugees2013_pkey PRIMARY KEY ("Id");


--
-- Name: geosyrienapp_refugees2014 geosyrienapp_refugees2014_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geosyrienapp_refugees2014
    ADD CONSTRAINT geosyrienapp_refugees2014_pkey PRIMARY KEY ("Id");


--
-- Name: geosyrienapp_refugees2015 geosyrienapp_refugees2015_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geosyrienapp_refugees2015
    ADD CONSTRAINT geosyrienapp_refugees2015_pkey PRIMARY KEY ("Id");


--
-- Name: geosyrienapp_refugees2016 geosyrienapp_refugees2016_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geosyrienapp_refugees2016
    ADD CONSTRAINT geosyrienapp_refugees2016_pkey PRIMARY KEY ("Id");


--
-- Name: geosyrienapp_refugees2017 geosyrienapp_refugees2017_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geosyrienapp_refugees2017
    ADD CONSTRAINT geosyrienapp_refugees2017_pkey PRIMARY KEY ("Id");


--
-- Name: geosyrienapp_refugees2018 geosyrienapp_refugees2018_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geosyrienapp_refugees2018
    ADD CONSTRAINT geosyrienapp_refugees2018_pkey PRIMARY KEY ("Id");


--
-- Name: geosyrienapp_waterconsumption geosyrienapp_waterconsumption_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geosyrienapp_waterconsumption
    ADD CONSTRAINT geosyrienapp_waterconsumption_pkey PRIMARY KEY ("Id");


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: geosyrienapp_refugees2011_coord_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX geosyrienapp_refugees2011_coord_id ON public.geosyrienapp_refugees2011 USING gist (geom);


--
-- Name: geosyrienapp_refugees2012_coord_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX geosyrienapp_refugees2012_coord_id ON public.geosyrienapp_refugees2012 USING gist (geom);


--
-- Name: geosyrienapp_refugees2013_coord_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX geosyrienapp_refugees2013_coord_id ON public.geosyrienapp_refugees2013 USING gist (geom);


--
-- Name: geosyrienapp_refugees2014_coord_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX geosyrienapp_refugees2014_coord_id ON public.geosyrienapp_refugees2014 USING gist (geom);


--
-- Name: geosyrienapp_refugees2015_coord_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX geosyrienapp_refugees2015_coord_id ON public.geosyrienapp_refugees2015 USING gist (geom);


--
-- Name: geosyrienapp_refugees2016_coord_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX geosyrienapp_refugees2016_coord_id ON public.geosyrienapp_refugees2016 USING gist (geom);


--
-- Name: geosyrienapp_refugees2017_coord_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX geosyrienapp_refugees2017_coord_id ON public.geosyrienapp_refugees2017 USING gist (geom);


--
-- Name: geosyrienapp_refugees2018_coord_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX geosyrienapp_refugees2018_coord_id ON public.geosyrienapp_refugees2018 USING gist (geom);


--
-- Name: geosyrienapp_waterconsumption_geom_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX geosyrienapp_waterconsumption_geom_id ON public.geosyrienapp_waterconsumption USING gist (geom);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

