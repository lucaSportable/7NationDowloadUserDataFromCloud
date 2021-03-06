--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: players_sessions_scrums; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.players_sessions_scrums (
    id integer NOT NULL,
    player_session_id bigint NOT NULL,
    scrum_id bigint,
    scrum_index integer
);


ALTER TABLE public.players_sessions_scrums OWNER TO metrics_server;

--
-- Name: PlayersPlays_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public."PlayersPlays_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PlayersPlays_id_seq" OWNER TO metrics_server;

--
-- Name: PlayersPlays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public."PlayersPlays_id_seq" OWNED BY public.players_sessions_scrums.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.players (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    weight double precision,
    height double precision,
    "position" character varying,
    img character varying,
    team_id bigint,
    number integer,
    user_id integer
);


ALTER TABLE public.players OWNER TO metrics_server;

--
-- Name: Players_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public."Players_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Players_id_seq" OWNER TO metrics_server;

--
-- Name: Players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public."Players_id_seq" OWNED BY public.players.id;


--
-- Name: scrums; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.scrums (
    id bigint NOT NULL,
    name character varying,
    infringements jsonb,
    event_id bigint
);


ALTER TABLE public.scrums OWNER TO metrics_server;

--
-- Name: Plays_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public."Plays_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Plays_id_seq" OWNER TO metrics_server;

--
-- Name: Plays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public."Plays_id_seq" OWNED BY public.scrums.id;


--
-- Name: sensors; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.sensors (
    id integer NOT NULL,
    hardware_id character varying,
    fields jsonb
);


ALTER TABLE public.sensors OWNER TO metrics_server;

--
-- Name: Sensors_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public."Sensors_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sensors_id_seq" OWNER TO metrics_server;

--
-- Name: Sensors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public."Sensors_id_seq" OWNED BY public.sensors.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.sessions (
    id bigint NOT NULL,
    start_time double precision,
    end_time double precision,
    name character varying,
    video character varying,
    video_offset integer,
    pitch_id integer
);


ALTER TABLE public.sessions OWNER TO metrics_server;

--
-- Name: Sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public."Sessions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sessions_id_seq" OWNER TO metrics_server;

--
-- Name: Sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public."Sessions_id_seq" OWNED BY public.sessions.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    type character varying,
    calibration jsonb
);


ALTER TABLE public.tags OWNER TO metrics_server;

--
-- Name: Tags_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public."Tags_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tags_id_seq" OWNER TO metrics_server;

--
-- Name: Tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public."Tags_id_seq" OWNED BY public.tags.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.teams (
    id bigint NOT NULL,
    name character varying,
    type character varying,
    color character varying,
    logo character varying,
    organisation_id bigint NOT NULL
);


ALTER TABLE public.teams OWNER TO metrics_server;

--
-- Name: Teams_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public."Teams_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Teams_id_seq" OWNER TO metrics_server;

--
-- Name: Teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public."Teams_id_seq" OWNED BY public.teams.id;


--
-- Name: anchors; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.anchors (
    id integer NOT NULL,
    x real,
    y real,
    z real,
    pitch_id integer
);


ALTER TABLE public.anchors OWNER TO metrics_server;

--
-- Name: pitches; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.pitches (
    id integer NOT NULL,
    name character varying,
    dimensions jsonb,
    geo_fence jsonb,
    type smallint,
    organisation_id bigint
);


ALTER TABLE public.pitches OWNER TO metrics_server;

--
-- Name: anchors_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public.anchors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.anchors_id_seq OWNER TO metrics_server;

--
-- Name: anchors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public.anchors_id_seq OWNED BY public.pitches.id;


--
-- Name: anchors_id_seq1; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public.anchors_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.anchors_id_seq1 OWNER TO metrics_server;

--
-- Name: anchors_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public.anchors_id_seq1 OWNED BY public.anchors.id;


--
-- Name: coaches; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.coaches (
    id bigint NOT NULL,
    user_id bigint,
    team_id bigint
);


ALTER TABLE public.coaches OWNER TO metrics_server;

--
-- Name: events; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    session_id bigint,
    start_time double precision,
    end_time double precision,
    type smallint
);


ALTER TABLE public.events OWNER TO metrics_server;

--
-- Name: flights; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.flights (
    id bigint NOT NULL,
    ball_id integer,
    from_id integer,
    to_id integer,
    hang_time double precision,
    dist double precision,
    speed double precision,
    efficiency double precision,
    kick boolean,
    end_over_end_efficiency double precision,
    type smallint,
    validated boolean DEFAULT false NOT NULL,
    offset_x real,
    offset_y real,
    offset_z real,
    success boolean DEFAULT false NOT NULL,
    hit_post boolean DEFAULT false NOT NULL,
    max_height double precision,
    spin double precision,
    event_id bigint,
    polynomial_coefficients double precision[]
);


ALTER TABLE public.flights OWNER TO metrics_server;

--
-- Name: flights_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public.flights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flights_id_seq OWNER TO metrics_server;

--
-- Name: flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public.flights_id_seq OWNED BY public.flights.id;


--
-- Name: goose_db_version; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.goose_db_version (
    id integer NOT NULL,
    version_id bigint NOT NULL,
    is_applied boolean NOT NULL,
    tstamp timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goose_db_version OWNER TO metrics_server;

--
-- Name: goose_db_version_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public.goose_db_version_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goose_db_version_id_seq OWNER TO metrics_server;

--
-- Name: goose_db_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public.goose_db_version_id_seq OWNED BY public.goose_db_version.id;


--
-- Name: organisations; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.organisations (
    id bigint NOT NULL,
    name character varying,
    logo character varying,
    three_words text[]
);


ALTER TABLE public.organisations OWNER TO metrics_server;

--
-- Name: players_sessions; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.players_sessions (
    id bigint NOT NULL,
    player_id bigint,
    session_id bigint,
    tag_team_id integer,
    sensor_team_id integer
);


ALTER TABLE public.players_sessions OWNER TO metrics_server;

--
-- Name: players_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public.players_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_sessions_id_seq OWNER TO metrics_server;

--
-- Name: players_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public.players_sessions_id_seq OWNED BY public.players_sessions.id;


--
-- Name: sensors_teams; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.sensors_teams (
    id integer NOT NULL,
    sensor_id integer,
    team_id bigint,
    name character varying
);


ALTER TABLE public.sensors_teams OWNER TO metrics_server;

--
-- Name: sensors_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public.sensors_teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sensors_teams_id_seq OWNER TO metrics_server;

--
-- Name: sensors_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public.sensors_teams_id_seq OWNED BY public.sensors_teams.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    user_id bigint
);


ALTER TABLE public.settings OWNER TO metrics_server;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO metrics_server;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: stats; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.stats (
    id bigint NOT NULL,
    player_session_id bigint NOT NULL,
    delta_s double precision,
    max_v double precision,
    heatmap character varying,
    kcalperkg double precision,
    power_ratio double precision,
    speed_bands integer[]
);


ALTER TABLE public.stats OWNER TO metrics_server;

--
-- Name: stats_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public.stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_id_seq OWNER TO metrics_server;

--
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public.stats_id_seq OWNED BY public.stats.id;


--
-- Name: tags_teams; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.tags_teams (
    id integer NOT NULL,
    tag_id integer,
    team_id bigint,
    name character varying
);


ALTER TABLE public.tags_teams OWNER TO metrics_server;

--
-- Name: tags_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public.tags_teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_teams_id_seq OWNER TO metrics_server;

--
-- Name: tags_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public.tags_teams_id_seq OWNED BY public.tags_teams.id;


--
-- Name: teams_sessions; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.teams_sessions (
    team_id bigint NOT NULL,
    session_id bigint NOT NULL
);


ALTER TABLE public.teams_sessions OWNER TO metrics_server;

--
-- Name: users; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(50) DEFAULT 'NO'::character varying NOT NULL,
    password_hash character varying(100) DEFAULT 'NO'::character varying NOT NULL,
    first_name character varying,
    last_name character varying,
    permission_level smallint DEFAULT '0'::smallint
);


ALTER TABLE public.users OWNER TO metrics_server;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: metrics_server
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO metrics_server;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metrics_server
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: anchors id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.anchors ALTER COLUMN id SET DEFAULT nextval('public.anchors_id_seq1'::regclass);


--
-- Name: flights id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.flights ALTER COLUMN id SET DEFAULT nextval('public.flights_id_seq'::regclass);


--
-- Name: goose_db_version id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.goose_db_version ALTER COLUMN id SET DEFAULT nextval('public.goose_db_version_id_seq'::regclass);


--
-- Name: pitches id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.pitches ALTER COLUMN id SET DEFAULT nextval('public.anchors_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public."Players_id_seq"'::regclass);


--
-- Name: players_sessions id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions ALTER COLUMN id SET DEFAULT nextval('public.players_sessions_id_seq'::regclass);


--
-- Name: players_sessions_scrums id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions_scrums ALTER COLUMN id SET DEFAULT nextval('public."PlayersPlays_id_seq"'::regclass);


--
-- Name: scrums id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.scrums ALTER COLUMN id SET DEFAULT nextval('public."Plays_id_seq"'::regclass);


--
-- Name: sensors id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.sensors ALTER COLUMN id SET DEFAULT nextval('public."Sensors_id_seq"'::regclass);


--
-- Name: sensors_teams id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.sensors_teams ALTER COLUMN id SET DEFAULT nextval('public.sensors_teams_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public."Sessions_id_seq"'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: stats id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.stats ALTER COLUMN id SET DEFAULT nextval('public.stats_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public."Tags_id_seq"'::regclass);


--
-- Name: tags_teams id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.tags_teams ALTER COLUMN id SET DEFAULT nextval('public.tags_teams_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public."Teams_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: anchors; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.anchors (id, x, y, z, pitch_id) FROM stdin;
1932	-4.9000001	79.5599976	2.1400001	1
1946	-62.8499985	14.3299999	3.41000009	1
2084	47.1399994	74.7600021	16.2800007	1
2088	-62.2299995	56.5299988	3.23000002	1
2089	-28	79.1299973	5.8499999	1
2095	11.2399998	-4.86000013	4.82000017	1
2097	59.7099991	23.4200001	2.97000003	1
2103	-62.5	35.5999985	3.22000003	1
2114	-45.7700005	-4.78999996	16.25	1
2115	63.5499992	65.1299973	7.92000008	1
2120	-69.4400024	3.81999993	7.76999998	1
2122	45.7099991	-5.19999981	16.0599995	1
2123	-62.4399986	64.7900009	7.44999981	1
2213	28.7600002	79.3899994	4.92999983	1
2215	-44.1199989	75.0299988	15.7399998	1
2485	63.3499985	5.21999979	7.57000017	1
2486	-11.2799997	-4.69000006	4.86000013	1
2503	59.7400017	44.2400017	2.96000004	1
\.


--
-- Data for Name: coaches; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.coaches (id, user_id, team_id) FROM stdin;
1	1	102099706615955457
1000001	1	102099706615955457
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.events (id, session_id, start_time, end_time, type) FROM stdin;
1	102445584439902208	1563195569.25297999	1563195570.25297999	0
2	102445584439902208	1563195571.00297999	1563195571.90298009	0
3	102445584439902208	1563195573.6029799	1563195574.6029799	0
4	102445584439902208	1563195576.1029799	1563195577.00297999	0
5	102445584439902208	1563195578.20298004	1563195579.30297995	0
6	102445584439902208	1563195580.25297999	1563195581.40298009	0
7	102445584439902208	1563195582.55297995	1563195583.65298009	0
8	102445584439902208	1563195584.8529799	1563195586.00297999	0
9	102445584439902208	1563195587.30297995	1563195588.1029799	0
10	102445584439902208	1563195589.95298004	1563195590.65298009	0
11	102445584439902208	1563195616.00297999	1563195617.25297999	0
12	102445584439902208	1563195621.25297999	1563195622.95298004	0
13	102445584439902208	1563195628.25297999	1563195630.6029799	0
14	102445584439902208	1563195633.25297999	1563195635.80398011	0
15	102445584439902208	1563195637.95298004	1563195640.40298009	0
16	102445584439902208	1563195647.75297999	1563195650.00297999	0
17	102445584439902208	1563195655.40298009	1563195657.80297995	0
102445585985830912	102445584439902208	1563195586	1563195603	1
1001	102445584439902208	1	-1	0
1002	102445584439902208	10	2	0
1007	102445584439902208	1	2	0
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.flights (id, ball_id, from_id, to_id, hang_time, dist, speed, efficiency, kick, end_over_end_efficiency, type, validated, offset_x, offset_y, offset_z, success, hit_post, max_height, spin, event_id, polynomial_coefficients) FROM stdin;
102445584918073997	21133	20598	20185	1.05000019073485995	8.72390747070311967	8.30848179617713001	0.888340353071542022	f	0.257432916460191008	0	f	0	0	0	f	f	1.24329054355621005	\N	1	{{-1.61223000000000005,32.9735980000000026,0.849277999999999977},{11.4758720000000007,0.948679999999999968,-1.917578},{1.72371999999999992,0.52258300000000002,-3.09762599999999999}}
102445585042657933	21133	20185	20598	1.15000009536743009	6.13164663314818981	5.33186619535809037	0.816348271519661051	f	0.56153555812728595	0	f	0	0	0	f	f	1.8197990655898999	\N	2	{{-6.33528100000000016,33.7517059999999987,2.01229900000000006},{-11.9371120000000008,1.35208700000000004,2.54321900000000012},{-5.51724299999999968,0.639742000000000033,0.136343999999999993}}
102445585209709197	21133	20598	20185	1.09999990463256991	7.92583703994750977	7.20530702463558015	0.943618443483672964	f	0.242433047797899009	0	f	0	0	0	f	f	1.38034164905548007	\N	3	{{-3.75985300000000011,33.6575709999999972,1.23951699999999998},{9.01796700000000051,-0.103350999999999998,-1.24992100000000006},{2.46706700000000012,0.21848999999999999,-2.58675899999999981}}
102445585370272397	21133	20185	20598	1.04999995231627996	6.43726110458374023	6.13072513992332979	0.89749318173329995	f	0.369510467720373992	0	f	0	0	0	f	f	1.30244159698485995	\N	4	{{-5.28860699999999984,34.5372410000000016,1.18728499999999992},{-0.992271000000000014,-0.501313000000000009,-1.5057879999999999},{6.79220799999999958,-1.18591099999999994,-3.39224199999999998}}
102445585514451597	21133	20598	20185	1.15000009536743009	8.70305728912354049	7.56787527599539978	0.972423763966125954	f	0.154248497715848004	0	f	0	0	0	f	f	1.91878950595856002	\N	5	{{-1.48106800000000005,34.4223599999999976,1.59482699999999999},{10.8679939999999995,1.27030200000000004,-1.3502320000000001},{2.44125799999999993,0.856168999999999958,-2.57750900000000005}}
102445585648800397	21133	20185	20598	1.20000004768372004	8.26057338714599965	6.88381088241693018	0.927879970463735049	f	0.158545220605963988	0	f	0	0	0	f	f	1.44130742549895996	\N	6	{{-6.97378699999999974,34.2374069999999975,1.30079199999999995},{-8.94567799999999913,-1.20141000000000009,0.00335700000000000017},{-2.32609900000000014,-0.780599999999999961,-1.07020000000000004}}
102445585796321933	21133	20598	20185	1.09999990463256991	7.69275856018065962	6.99341747920447965	0.901228259986880054	f	0.266222388296861012	0	f	0	0	0	f	f	1.13433885574340998	\N	7	{{-2.16234800000000016,34.3839200000000034,0.48175800000000002},{9.29086399999999912,0.793100999999999945,-2.23479099999999997},{1.61934899999999993,0.609492000000000034,-2.47733999999999988}}
102445585960096397	21133	20185	20598	1.34999990463256991	8.49522972106933949	6.29276320088443963	0.884398160222129026	f	0.354536608022476996	0	f	0	0	0	f	f	1.60653758049011008	\N	8	{{-7.03167800000000032,34.1773219999999966,1.02549299999999999},{-8.74975799999999992,-1.04419700000000004,-2.12113899999999989},{-2.35408600000000012,-0.564764999999999961,-2.4306589999999999}}
102445586110829197	21133	20598	20185	1.04999995231627996	5.89224195480347035	5.61165925941735999	0.96099348017564501	f	0.247254049595833997	0	f	0	0	0	f	f	1.45914900302887007	\N	9	{{-4.41025199999999984,33.748268000000003,1.51810099999999992},{8.94716299999999976,-0.245719999999999994,1.49501100000000009},{2.14582600000000001,0.197791999999999996,-0.585980999999999974}}
102445586281222797	21133	20185	20598	1.04999995231627996	5.35608148574829013	5.10103021808034995	0.943671879081352971	f	0.182204774994961988	0	f	0	0	0	f	f	1.58533751964569003	\N	10	{{-4.77720699999999976,35.0284419999999983,1.66423300000000007},{-8.97267399999999959,0.489176999999999973,1.93445299999999998},{-2.49272900000000019,-0.141937000000000008,-0.851087999999999956}}
102445588011373197	21133	20185	20185	1.40000009536743009	2.26044225692748979	1.61460150210506992	0.884612697008613003	f	0.400198285715148983	0	f	0	0	0	f	f	2.67054343223571999	\N	11	{{2.92754599999999998,20.0948190000000011,0.404457999999999984},{-2.74849999999999994,-0.536985000000000046,2.94356699999999982},{-2.12187500000000018,1.13114899999999996,3.6854070000000001}}
102445588371821197	21133	20185	20598	1.75	5.82585144042969016	3.32905796595981984	0.806812693915691992	t	0.36202902486011701	0	f	0	0	0	f	f	2.34861779212952015	\N	12	{{-4.85085899999999981,19.7703339999999983,0.476183999999999996},{-2.85016900000000017,0.467895999999999979,-4.05625999999999998},{0.27917900000000001,-0.260460999999999998,-2.36383199999999993}}
102445588886278797	21133	20598	20185	2.60000014305115013	10.3544645309447993	3.98248613894062009	0.25339171957609502	t	0.941813622222282043	0	f	0	0	0	f	f	8.91871452331542969	\N	13	{{5.27957500000000035,17.1818460000000002,4.88090899999999994},{2.92008499999999982,-0.92818999999999996,-7.94216899999999981},{-0.666194999999999982,-0.167992000000000002,-4.25846199999999975}}
102445589220512397	21133	20185	20598	2.70099997520446999	13.2173900604247994	4.8935172831403797	0.965488357010587994	t	0.231826765681382996	0	f	0	0	0	f	f	9.42349624633789062	\N	14	{{-6.71173800000000043,16.5205610000000007,3.43859499999999985},{-4.27804599999999979,-0.51142399999999999,-10.0958089999999991},{0.406092999999999982,-0.239072000000000007,-4.60225799999999996}}
102445589515424397	21133	20598	20185	2.5	18.8678894042968999	7.54715576171875036	0.799043362774249033	t	0.577510735956192955	0	f	0	0	0	f	f	6.42601823806762962	\N	15	{{10.1230849999999997,8.65949299999999944,1.97589999999999999},{6.78110400000000002,-3.65850099999999978,-8.17898300000000056},{-0.235354000000000008,-0.159987999999999991,-3.79077200000000003}}
102445590151123597	21133	20185	20598	2.35000014305115013	18.0405158996581996	7.67681480914087011	0.944849679747891025	t	0.314079011917179018	0	t	0	0	0	f	f	7.40277481079102007	\N	16	{{-5.39141500000000029,12.1314530000000005,3.83352300000000001},{-9.37069299999999927,-0.671953000000000022,-6.90835199999999983},{-0.489437000000000011,0.161330000000000001,-3.99590800000000002}}
102445590655750797	21133	20598	20598	2.45000004768371982	17.3997211456299006	7.10192685999331008	0.852108227948776054	t	0.488354410940922024	0	t	0	0	0	f	f	7.40037107467651012	\N	17	{{8.38708300000000051,8.85692000000000057,3.13359100000000002},{6.09715100000000021,-0.980230000000000046,-7.58728499999999961},{-0.513735000000000053,0.230866999999999989,-3.78341899999999987}}
1	0	0	0	0	0	0	0	f	0	0	f	0	0	0	f	f	0	0	2	{{8.38708300000000051,8.85692000000000057,3.13359100000000002},{6.09715100000000021,-0.980230000000000046,-7.58728499999999961},{-0.513735000000000053,0.230866999999999989,-3.78341899999999987}}
1000	21133	0	0	0	0	0	0	f	0	0	f	0	0	0	f	f	0	0	2	{{8.38708300000000051,8.85692000000000057,3.13359100000000002},{6.09715100000000021,-0.980230000000000046,-7.58728499999999961},{-0.513735000000000053,0.230866999999999989,-3.78341899999999987}}
\.


--
-- Data for Name: goose_db_version; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.goose_db_version (id, version_id, is_applied, tstamp) FROM stdin;
1	0	t	2020-01-27 11:58:55.486336
2	20181022104307	t	2020-01-27 11:58:55.506302
3	20181022113900	t	2020-01-27 11:58:55.690683
4	20181119111446	t	2020-01-27 11:58:55.699607
5	20181119161640	t	2020-01-27 11:58:55.702699
6	20181119162256	t	2020-01-27 11:58:55.710473
7	20181119162436	t	2020-01-27 11:58:55.755999
8	20181119162818	t	2020-01-27 11:58:55.784618
9	20181119163114	t	2020-01-27 11:58:55.848275
10	20181119163442	t	2020-01-27 11:58:55.88448
11	20181119163506	t	2020-01-27 11:58:55.88813
12	20181121150823	t	2020-01-27 11:58:55.891358
13	20190131113721	t	2020-01-27 11:58:55.903481
14	20190404172250	t	2020-01-27 11:58:55.906277
15	20190417142051	t	2020-01-27 11:58:55.933305
16	20190418112537	t	2020-01-27 11:58:55.948341
17	20190418172911	t	2020-01-27 11:58:55.957631
18	20190425122736	t	2020-01-27 11:58:55.961558
19	20190502163857	t	2020-01-27 11:58:55.964164
20	20190502164118	t	2020-01-27 11:58:55.968695
21	20190502164247	t	2020-01-27 11:58:55.971496
22	20190503105712	t	2020-01-27 11:58:55.97504
23	20190503120236	t	2020-01-27 11:58:55.977951
24	20190509101822	t	2020-01-27 11:58:55.989529
25	20190711162055	t	2020-01-27 11:58:55.99186
26	20190820111611	t	2020-01-27 11:58:55.993635
27	20190820112855	t	2020-01-27 11:58:55.999572
28	20190820115808	t	2020-01-27 11:58:56.001909
29	20190820120123	t	2020-01-27 11:58:56.003675
30	20190820120415	t	2020-01-27 11:58:56.008114
31	20190820142817	t	2020-01-27 11:58:56.011081
32	20190820151406	t	2020-01-27 11:58:56.01293
33	20190820153221	t	2020-01-27 11:58:56.017218
34	20190820153638	t	2020-01-27 11:58:56.018557
35	20190820153930	t	2020-01-27 11:58:56.024645
36	20190820154119	t	2020-01-27 11:58:56.02575
37	20190820160529	t	2020-01-27 11:58:56.032113
38	20190820161332	t	2020-01-27 11:58:56.042358
39	20190820162903	t	2020-01-27 11:58:56.051341
40	20190820164247	t	2020-01-27 11:58:56.060109
41	20190820165244	t	2020-01-27 11:58:56.065716
42	20190820170339	t	2020-01-27 11:58:56.073477
43	20190820171022	t	2020-01-27 11:58:56.081384
44	20190820172815	t	2020-01-27 11:58:56.094638
45	20190904161625	t	2020-01-27 11:58:56.100677
46	20190911131242	t	2020-01-27 11:58:56.10653
47	20190911131728	t	2020-01-27 11:58:56.114036
48	20190911132855	t	2020-01-27 11:58:56.120328
49	20191016100154	t	2020-01-27 11:58:56.134323
50	20191017165449	t	2020-01-27 11:58:56.140002
51	20191018103710	t	2020-01-27 11:58:56.142394
52	20191105152634	t	2020-01-27 11:58:56.166448
53	20191105152913	t	2020-01-27 11:58:56.178154
54	20191105153300	t	2020-01-27 11:58:56.183204
55	20191105154815	t	2020-01-27 11:58:56.189846
56	20191108102732	t	2020-01-27 11:58:56.198131
57	20191111154557	t	2020-01-27 11:58:56.207304
58	20191111155609	t	2020-01-27 11:58:56.213988
59	20191114104418	t	2020-01-27 11:58:56.220384
60	20191114165334	t	2020-01-27 11:58:56.221753
61	20191122102328	t	2020-01-27 11:58:56.243626
62	20191122114528	t	2020-01-27 11:58:56.244813
63	20191122114826	t	2020-01-27 11:58:56.246217
64	20191203152457	t	2020-01-27 11:58:56.247901
65	20200122111957	t	2020-01-27 11:58:56.251674
66	20200122134629	t	2020-01-27 11:58:56.25321
67	20200122135038	t	2020-01-27 11:58:56.254543
\.


--
-- Data for Name: organisations; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.organisations (id, name, logo, three_words) FROM stdin;
1	Sportable	data:image/png;base64,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/GMzLdsAADo4aVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/Pgo8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzA2NyA3OS4xNTc3NDcsIDIwMTUvMDMvMzAtMjM6NDA6NDIgICAgICAgICI+CiAgIDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+CiAgICAgIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiCiAgICAgICAgICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgICAgICAgICAgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iCiAgICAgICAgICAgIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiCiAgICAgICAgICAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIKICAgICAgICAgICAgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIgogICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgICAgICAgICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iPgogICAgICAgICA8eG1wOkNyZWF0b3JUb29sPkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE1IChNYWNpbnRvc2gpPC94bXA6Q3JlYXRvclRvb2w+CiAgICAgICAgIDx4bXA6Q3JlYXRlRGF0ZT4yMDE2LTA1LTMwVDE5OjIwOjU3KzAyOjAwPC94bXA6Q3JlYXRlRGF0ZT4KICAgICAgICAgPHhtcDpNZXRhZGF0YURhdGU+MjAxNi0wNS0zMFQxOToyMDo1NyswMjowMDwveG1wOk1ldGFkYXRhRGF0ZT4KICAgICAgICAgPHhtcDpNb2RpZnlEYXRlPjIwMTYtMDUtMzBUMTk6MjA6NTcrMDI6MDA8L3htcDpNb2RpZnlEYXRlPgogICAgICAgICA8eG1wTU06SW5zdGFuY2VJRD54bXAuaWlkOmNlNTY1MTM0LWExM2UtNGE0OS1hZjkyLTMzZGI0Yzg3ZTkwZDwveG1wTU06SW5zdGFuY2VJRD4KICAgICAgICAgPHhtcE1NOkRvY3VtZW50SUQ+YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOjQ1ZTU0MWY1LTY3MTktMTE3OS1iMzQyLWU2NTQ5OTljNjg0YjwveG1wTU06RG9jdW1lbnRJRD4KICAgICAgICAgPHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD54bXAuZGlkOjkwMGVmMDY0LTk4ZDQtNDBmYi1iOWY5LTk4YTViOTk1OWI4NDwveG1wTU06T3JpZ2luYWxEb2N1bWVudElEPgogICAgICAgICA8eG1wTU06SGlzdG9yeT4KICAgICAgICAgICAgPHJkZjpTZXE+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6YWN0aW9uPmNyZWF0ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDo5MDBlZjA2NC05OGQ0LTQwZmItYjlmOS05OGE1Yjk5NTliODQ8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMTYtMDUtMzBUMTk6MjA6NTcrMDI6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE1IChNYWNpbnRvc2gpPC9zdEV2dDpzb2Z0d2FyZUFnZW50PgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+c2F2ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDpjZTU2NTEzNC1hMTNlLTRhNDktYWY5Mi0zM2RiNGM4N2U5MGQ8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMTYtMDUtMzBUMTk6MjA6NTcrMDI6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE1IChNYWNpbnRvc2gpPC9zdEV2dDpzb2Z0d2FyZUFnZW50PgogICAgICAgICAgICAgICAgICA8c3RFdnQ6Y2hhbmdlZD4vPC9zdEV2dDpjaGFuZ2VkPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgPC9yZGY6U2VxPgogICAgICAgICA8L3htcE1NOkhpc3Rvcnk+CiAgICAgICAgIDxkYzpmb3JtYXQ+aW1hZ2UvcG5nPC9kYzpmb3JtYXQ+CiAgICAgICAgIDxwaG90b3Nob3A6Q29sb3JNb2RlPjM8L3Bob3Rvc2hvcDpDb2xvck1vZGU+CiAgICAgICAgIDxwaG90b3Nob3A6SUNDUHJvZmlsZT5zUkdCIElFQzYxOTY2LTIuMTwvcGhvdG9zaG9wOklDQ1Byb2ZpbGU+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb24+CiAgICAgICAgIDx0aWZmOlhSZXNvbHV0aW9uPjcyMDAwMC8xMDAwMDwvdGlmZjpYUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6WVJlc29sdXRpb24+NzIwMDAwLzEwMDAwPC90aWZmOllSZXNvbHV0aW9uPgogICAgICAgICA8dGlmZjpSZXNvbHV0aW9uVW5pdD4yPC90aWZmOlJlc29sdXRpb25Vbml0PgogICAgICAgICA8ZXhpZjpDb2xvclNwYWNlPjE8L2V4aWY6Q29sb3JTcGFjZT4KICAgICAgICAgPGV4aWY6UGl4ZWxYRGltZW5zaW9uPjUwMDwvZXhpZjpQaXhlbFhEaW1lbnNpb24+CiAgICAgICAgIDxleGlmOlBpeGVsWURpbWVuc2lvbj41MDA8L2V4aWY6UGl4ZWxZRGltZW5zaW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPD94cGFja2V0IGVuZD0idyI/PrCkP4MAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAN4tJREFUeNrs3XmUHXWd/vF3Z4NIJGmTthKWlECEEISBVgkjLijF0ipmXCjZFMhkRBAH1GZfRISEYLMNyBoBEUFacQR1iqVlQEclqAGVJex0QOi2wCQIJCQh/fujbm6n/SG5CUlu1a3365w+zDkzk1v3863k6efeqvo29fX1IUmSim2QI5AkyUCXJEkGuiRJMtAlSZKBLkmSgS5Jkgx0SZJkoEuSJANdkiQDXZIkGeiSJGltG1KGN9nU1ORKS9J61NbVOxjYApgEbAO8E9gMeDuwKTAceOs/FMuFwKvAM8CzQDfwZ+A+4M9JFLyyJsdSlj1LmsrwRg10SVrnAb4R8GHgfcBkYGdgxFp8iSXAr4FbgR8nUfCogW6gS5LWTohvBXwaaAN2BYaux5f/FXAFcH0SBcsMdANdkrR6Ib4J8HlgX6A1B4f0OPAN4Nok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	{test,demo,seed}
\.


--
-- Data for Name: pitches; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.pitches (id, name, dimensions, geo_fence, type, organisation_id) FROM stdin;
1	Ealing	{"P1": {"X": -54.69, "Y": 0.07, "Z": 0.01}, "P2": {"X": -47.07, "Y": 0.05, "Z": -0.02}, "P3": {"X": -41.97, "Y": 0.03, "Z": 0.0}, "P4": {"X": -25.07, "Y": 0.02, "Z": 0.0}, "P5": {"X": -10.13, "Y": 0.02, "Z": -0.01}, "P6": {"X": 0.0, "Y": 0.0, "Z": 0.0}, "P7": {"X": 10.12, "Y": 0.01, "Z": 0.0}, "P8": {"X": 25.11, "Y": 0.02, "Z": 0.0}, "P9": {"X": 42.0, "Y": 0.02, "Z": -0.01}, "P10": {"X": 47.1, "Y": 0.05, "Z": 0.0}, "P11": {"X": 54.72, "Y": 0.04, "Z": 0.01}, "P12": {"X": 47.11, "Y": 5.13, "Z": 0.0}, "P13": {"X": 47.11, "Y": 15.14, "Z": 0.0}, "P14": {"X": 47.16, "Y": 55.06, "Z": 0.01}, "P15": {"X": 47.18, "Y": 65.1, "Z": 0.01}, "P16": {"X": 54.77, "Y": 70.19, "Z": 0.02}, "P17": {"X": 47.16, "Y": 70.22, "Z": 0.01}, "P18": {"X": 42.11, "Y": 70.24, "Z": 0.01}, "P19": {"X": 25.16, "Y": 70.23, "Z": 0.01}, "P20": {"X": 10.15, "Y": 70.23, "Z": 0.01}, "P21": {"X": -0.01, "Y": 70.24, "Z": 0.01}, "P22": {"X": -10.13, "Y": 70.23, "Z": 0.01}, "P23": {"X": -25.05, "Y": 70.22, "Z": 0.0}, "P24": {"X": -41.94, "Y": 70.23, "Z": 0.01}, "P25": {"X": -47.06, "Y": 70.21, "Z": 0.0}, "P26": {"X": -54.68, "Y": 70.22, "Z": 0.01}, "P27": {"X": -47.07, "Y": 65.1, "Z": 0.0}, "P28": {"X": -47.1, "Y": 55.08, "Z": 0.0}, "P29": {"X": -47.09, "Y": 15.16, "Z": 0.0}, "P30": {"X": -47.08, "Y": 5.19, "Z": 0.0}, "P31": {"X": -47.04, "Y": 32.24, "Z": 2.94}, "P32": {"X": -47.15, "Y": 32.14, "Z": 12.92}, "P33": {"X": -46.95, "Y": 37.9, "Z": 2.96}, "P34": {"X": -46.76, "Y": 37.7, "Z": 12.93}, "P35": {"X": 47.1, "Y": 37.9, "Z": 2.94}, "P36": {"X": 47.32, "Y": 37.68, "Z": 12.93}, "P37": {"X": 47.12, "Y": 32.24, "Z": 2.93}, "P38": {"X": 47.37, "Y": 32.13, "Z": 12.91}}	{"xMax": 70.5, "xMin": -70.5, "yMax": 85, "yMin": -20}	0	1
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.players (id, first_name, last_name, weight, height, "position", img, team_id, number, user_id) FROM stdin;
102337596167749632	Test	Player 1	80	188	Forward	\N	102099706615955457	1	1
102099707768602625	Test	Player 2	70	182	Back	\N	102099706615955457	1	2
102099708780544001	Test	Player 3	75	185	Middle	\N	102099706615955457	1	3
3	James	10	0	0	10		102099706615955457	10	1
4	luca	paterlini test 1	0	0	Center		102099706615955457	6	1
5	luca	paterlini test 2	0	0	10		102099706615955457	10	1
6	James	10	0	0	10		102099706615955457	10	1
1	p	6	0	0	Center		102099706615955457	6	1
\.


--
-- Data for Name: players_sessions; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.players_sessions (id, player_id, session_id, tag_team_id, sensor_team_id) FROM stdin;
1312	102099708780544001	102445584439902208	1	\N
1313	102337596167749632	102445584439902208	3	1
1314	102099707768602625	102445584439902208	2	\N
1315	\N	102445584439902208	4	\N
3	102337596167749632	102445584439902208	4	1
103555159629824000	102337596167749632	103555159629758464	1	1
103555159657938944	102337596167749632	103555159657807872	1	\N
103555159687954432	\N	103555159687757824	4	\N
666666666	102337596167749632	102445584439902208	1	1
\.


--
-- Data for Name: players_sessions_scrums; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.players_sessions_scrums (id, player_session_id, scrum_id, scrum_index) FROM stdin;
1	1313	1	1
\.


--
-- Data for Name: scrums; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.scrums (id, name, infringements, event_id) FROM stdin;
1	Scrum 1	{}	102445585985830912
\.


--
-- Data for Name: sensors; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.sensors (id, hardware_id, fields) FROM stdin;
6	6	{"L1c": -270.7726126430031, "L1m": 6.670919257033828, "L2c": -301.7572302506321, "L2m": 7.549592950979037, "L3c": -380.1581087940044, "L3m": 9.365807065632037, "R1c": -291.29629627066794, "R1m": 7.34483853430832, "R2c": -298.1744175870094, "R2m": 7.459955406229907, "R3c": -356.37237782056576, "R3m": 8.792804782150649}
1	1	\N
2	2	\N
\.


--
-- Data for Name: sensors_teams; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.sensors_teams (id, sensor_id, team_id, name) FROM stdin;
1	6	102099706615955457	Pad 20
34	6	102099706615955457	Test Sensor
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.sessions (id, start_time, end_time, name, video, video_offset, pitch_id) FROM stdin;
102445584439902208	1563195563.35728002	1563195668.71542001	Data for Oli 8	\N	\N	1
103555159629758464	1.30000000000000004	1580126337.54501343	session 2		0	1
103555159657807872	1.30000000000000004	1580126338.00342512	session 3		0	1
103555159687757824	1.30000000000000004	1580126338.39199686	session 4		0	1
1	1.10000000000000009	111	update test 1		0	1
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.settings (id, user_id) FROM stdin;
\.


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.stats (id, player_session_id, delta_s, max_v, heatmap, kcalperkg, power_ratio, speed_bands) FROM stdin;
1	1312	61.0891529084264988	2.88296389579772994	["AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9/7z9AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPX0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPX1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD19QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD19fUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9fX1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPX1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9fUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD19QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPX1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9fUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9fUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9fUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9fUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9fUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9fUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=="]	0.0917472200128773008	0	\N
2	1313	0.0597921194623729987	0.156793281435965992	["AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=="]	0.000333333412806192985	0	\N
3	1314	90.4892098056515977	3.85171198844909979	["AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC7AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAL9lAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA1s8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADP0gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANbPAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADW1r8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA8NYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD28wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD////3AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//9P8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8A9/8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wD2//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//wAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AAAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=="]	0.153104946613312004	0	\N
4	1315	4	8	["AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC7AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAL9lAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA1s8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADP0gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANbPAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADW1r8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA8NYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD28wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD////3AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//9P8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8A9/8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wD2//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//wAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AAAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=="]	90.4892098056515977	0.153104946613312004	\N
5	103555159629824000	0	0	{}	0	\N	{0,0,0,0,0,0,0,0,0,0}
6	103555159657938944	0	0	{}	0	\N	{0,0,0,0,0,0,0,0,0,0}
7	103555159687954432	0	0	{}	0	\N	{0,0,0,0,0,0,0,0,0,0}
8	666666666	0	0	{}	0	\N	{0,0,0,0,0,0,0,0,0,0}
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.tags (id, type, calibration) FROM stdin;
21133	ball	[[-0.0012270116019501565, 0.99989636343366306, -0.014344226527248573], [-0.99989636343366306, -0.0014325162799908586, -0.014325162799909214], [-0.014344226527248573, 0.014325162799909214, 0.99979449532195919]]
20332	player	\N
20185	player	\N
20598	player	\N
1	player	\N
2	ball	\N
\.


--
-- Data for Name: tags_teams; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.tags_teams (id, tag_id, team_id, name) FROM stdin;
4	21133	102099706615955457	Ball 1
3	20332	102099706615955457	Player 1
2	20185	102099706615955457	Player 2
1	20598	102099706615955457	Player 3
34	20185	102099706615955457	Test Tag
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.teams (id, name, type, color, logo, organisation_id) FROM stdin;
102099706615955457	Sportable A Team	\N	#9c27b0	data:image/png;base64,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/GMzLdsAADo4aVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/Pgo8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzA2NyA3OS4xNTc3NDcsIDIwMTUvMDMvMzAtMjM6NDA6NDIgICAgICAgICI+CiAgIDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+CiAgICAgIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiCiAgICAgICAgICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgICAgICAgICAgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iCiAgICAgICAgICAgIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiCiAgICAgICAgICAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIKICAgICAgICAgICAgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIgogICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgICAgICAgICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iPgogICAgICAgICA8eG1wOkNyZWF0b3JUb29sPkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE1IChNYWNpbnRvc2gpPC94bXA6Q3JlYXRvclRvb2w+CiAgICAgICAgIDx4bXA6Q3JlYXRlRGF0ZT4yMDE2LTA1LTMwVDE5OjIwOjU3KzAyOjAwPC94bXA6Q3JlYXRlRGF0ZT4KICAgICAgICAgPHhtcDpNZXRhZGF0YURhdGU+MjAxNi0wNS0zMFQxOToyMDo1NyswMjowMDwveG1wOk1ldGFkYXRhRGF0ZT4KICAgICAgICAgPHhtcDpNb2RpZnlEYXRlPjIwMTYtMDUtMzBUMTk6MjA6NTcrMDI6MDA8L3htcDpNb2RpZnlEYXRlPgogICAgICAgICA8eG1wTU06SW5zdGFuY2VJRD54bXAuaWlkOmNlNTY1MTM0LWExM2UtNGE0OS1hZjkyLTMzZGI0Yzg3ZTkwZDwveG1wTU06SW5zdGFuY2VJRD4KICAgICAgICAgPHhtcE1NOkRvY3VtZW50SUQ+YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOjQ1ZTU0MWY1LTY3MTktMTE3OS1iMzQyLWU2NTQ5OTljNjg0YjwveG1wTU06RG9jdW1lbnRJRD4KICAgICAgICAgPHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD54bXAuZGlkOjkwMGVmMDY0LTk4ZDQtNDBmYi1iOWY5LTk4YTViOTk1OWI4NDwveG1wTU06T3JpZ2luYWxEb2N1bWVudElEPgogICAgICAgICA8eG1wTU06SGlzdG9yeT4KICAgICAgICAgICAgPHJkZjpTZXE+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6YWN0aW9uPmNyZWF0ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDo5MDBlZjA2NC05OGQ0LTQwZmItYjlmOS05OGE1Yjk5NTliODQ8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMTYtMDUtMzBUMTk6MjA6NTcrMDI6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE1IChNYWNpbnRvc2gpPC9zdEV2dDpzb2Z0d2FyZUFnZW50PgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+c2F2ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDpjZTU2NTEzNC1hMTNlLTRhNDktYWY5Mi0zM2RiNGM4N2U5MGQ8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMTYtMDUtMzBUMTk6MjA6NTcrMDI6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE1IChNYWNpbnRvc2gpPC9zdEV2dDpzb2Z0d2FyZUFnZW50PgogICAgICAgICAgICAgICAgICA8c3RFdnQ6Y2hhbmdlZD4vPC9zdEV2dDpjaGFuZ2VkPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgPC9yZGY6U2VxPgogICAgICAgICA8L3htcE1NOkhpc3Rvcnk+CiAgICAgICAgIDxkYzpmb3JtYXQ+aW1hZ2UvcG5nPC9kYzpmb3JtYXQ+CiAgICAgICAgIDxwaG90b3Nob3A6Q29sb3JNb2RlPjM8L3Bob3Rvc2hvcDpDb2xvck1vZGU+CiAgICAgICAgIDxwaG90b3Nob3A6SUNDUHJvZmlsZT5zUkdCIElFQzYxOTY2LTIuMTwvcGhvdG9zaG9wOklDQ1Byb2ZpbGU+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb24+CiAgICAgICAgIDx0aWZmOlhSZXNvbHV0aW9uPjcyMDAwMC8xMDAwMDwvdGlmZjpYUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6WVJlc29sdXRpb24+NzIwMDAwLzEwMDAwPC90aWZmOllSZXNvbHV0aW9uPgogICAgICAgICA8dGlmZjpSZXNvbHV0aW9uVW5pdD4yPC90aWZmOlJlc29sdXRpb25Vbml0PgogICAgICAgICA8ZXhpZjpDb2xvclNwYWNlPjE8L2V4aWY6Q29sb3JTcGFjZT4KICAgICAgICAgPGV4aWY6UGl4ZWxYRGltZW5zaW9uPjUwMDwvZXhpZjpQaXhlbFhEaW1lbnNpb24+CiAgICAgICAgIDxleGlmOlBpeGVsWURpbWVuc2lvbj41MDA8L2V4aWY6UGl4ZWxZRGltZW5zaW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPD94cGFja2V0IGVuZD0idyI/PrCkP4MAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAN4tJREFUeNrs3XmUHXWd/vF3Z4NIJGmTthKWlECEEISBVgkjLijF0ipmXCjZFMhkRBAH1GZfRISEYLMNyBoBEUFacQR1iqVlQEclqAGVJex0QOi2wCQIJCQh/fujbm6n/SG5CUlu1a3365w+zDkzk1v3863k6efeqvo29fX1IUmSim2QI5AkyUCXJEkGuiRJMtAlSZKBLkmSgS5Jkgx0SZJkoEuSJANdkiQDXZIkGeiSJGltG1KGN9nU1ORKS9J61NbVOxjYApgEbAO8E9gMeDuwKTAceOs/FMuFwKvAM8CzQDfwZ+A+4M9JFLyyJsdSlj1LmsrwRg10SVrnAb4R8GHgfcBkYGdgxFp8iSXAr4FbgR8nUfCogW6gS5LWTohvBXwaaAN2BYaux5f/FXAFcH0SBcsMdANdkrR6Ib4J8HlgX6A1B4f0OPAN4Nok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	1
1	ANiceName		#ffffff		1
\.


--
-- Data for Name: teams_sessions; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.teams_sessions (team_id, session_id) FROM stdin;
102099706615955457	102445584439902208
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: metrics_server
--

COPY public.users (id, email, password_hash, first_name, last_name, permission_level) FROM stdin;
1	bill@example.com	$2a$10$2fqtOXTkb4cLpa4N9xd3j.pGWwOLrGcSPktwHC3mfHBooPDyx6uXi	Bill	Gates	1
2	jeff@example.com	$2a$10$2fqtOXTkb4cLpa4N9xd3j.pGWwOLrGcSPktwHC3mfHBooPDyx6uXi	Jeff	Bezos	0
3	elon@example.com	$2a$10$2fqtOXTkb4cLpa4N9xd3j.pGWwOLrGcSPktwHC3mfHBooPDyx6uXi	Elon	Musk	2
4	luca@sportable.com	$2a$10$sHJnXEnk4H627TrtdujsoeMM/Q2kjLq9SBemWdGsw4fWT/tPKq9PG			0
10001	hello@example.com	$2a$10$xDObvutpn/EnMnZ.Dfqzie8EAut311M36gRpyhg6/mLtGKh9n1CyC			0
\.


--
-- Name: PlayersPlays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public."PlayersPlays_id_seq"', 1, true);


--
-- Name: Players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public."Players_id_seq"', 6, true);


--
-- Name: Plays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public."Plays_id_seq"', 1, false);


--
-- Name: Sensors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public."Sensors_id_seq"', 2, true);


--
-- Name: Sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public."Sessions_id_seq"', 1, false);


--
-- Name: Tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public."Tags_id_seq"', 1, false);


--
-- Name: Teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public."Teams_id_seq"', 2, true);


--
-- Name: anchors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public.anchors_id_seq', 1, false);


--
-- Name: anchors_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public.anchors_id_seq1', 1, false);


--
-- Name: flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public.flights_id_seq', 1, true);


--
-- Name: goose_db_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public.goose_db_version_id_seq', 67, true);


--
-- Name: players_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public.players_sessions_id_seq', 3, true);


--
-- Name: sensors_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public.sensors_teams_id_seq', 2, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, false);


--
-- Name: stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public.stats_id_seq', 8, true);


--
-- Name: tags_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public.tags_teams_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metrics_server
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: players_sessions_scrums PlayersPlays_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions_scrums
    ADD CONSTRAINT "PlayersPlays_pkey" PRIMARY KEY (id);


--
-- Name: players Players_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT "Players_pkey" PRIMARY KEY (id);


--
-- Name: scrums Plays_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.scrums
    ADD CONSTRAINT "Plays_pkey" PRIMARY KEY (id);


--
-- Name: sensors Sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT "Sensors_pkey" PRIMARY KEY (id);


--
-- Name: sessions Sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (id);


--
-- Name: tags Tags_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY (id);


--
-- Name: teams Teams_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT "Teams_pkey" PRIMARY KEY (id);


--
-- Name: pitches anchors_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.pitches
    ADD CONSTRAINT anchors_pkey PRIMARY KEY (id);


--
-- Name: anchors anchors_pkey1; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.anchors
    ADD CONSTRAINT anchors_pkey1 PRIMARY KEY (id);


--
-- Name: coaches coaches_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.coaches
    ADD CONSTRAINT coaches_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);


--
-- Name: goose_db_version goose_db_version_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.goose_db_version
    ADD CONSTRAINT goose_db_version_pkey PRIMARY KEY (id);


--
-- Name: organisations organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.organisations
    ADD CONSTRAINT organisations_pkey PRIMARY KEY (id);


--
-- Name: players_sessions players_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions
    ADD CONSTRAINT players_sessions_pkey PRIMARY KEY (id);


--
-- Name: sensors_teams sensors_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.sensors_teams
    ADD CONSTRAINT sensors_teams_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: stats stats_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (id);


--
-- Name: tags_teams tags_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.tags_teams
    ADD CONSTRAINT tags_teams_pkey PRIMARY KEY (id);


--
-- Name: teams_sessions teams_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.teams_sessions
    ADD CONSTRAINT teams_sessions_pkey PRIMARY KEY (team_id, session_id);


--
-- Name: users unique_email; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: three_words_unique; Type: INDEX; Schema: public; Owner: metrics_server
--

CREATE UNIQUE INDEX three_words_unique ON public.organisations USING btree (three_words);


--
-- Name: anchors anchors_pitch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.anchors
    ADD CONSTRAINT anchors_pitch_id_fkey FOREIGN KEY (pitch_id) REFERENCES public.pitches(id);


--
-- Name: coaches coaches_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.coaches
    ADD CONSTRAINT coaches_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: coaches coaches_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.coaches
    ADD CONSTRAINT coaches_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: events events_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.sessions(id);


--
-- Name: flights flights_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: players_sessions_scrums players_plays_player_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions_scrums
    ADD CONSTRAINT players_plays_player_session_id_fkey FOREIGN KEY (player_session_id) REFERENCES public.players_sessions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: players_sessions_scrums players_plays_scrum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions_scrums
    ADD CONSTRAINT players_plays_scrum_id_fkey FOREIGN KEY (scrum_id) REFERENCES public.scrums(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: players_sessions players_sessions_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions
    ADD CONSTRAINT players_sessions_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: players_sessions players_sessions_sensor_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions
    ADD CONSTRAINT players_sessions_sensor_team_id_fkey FOREIGN KEY (sensor_team_id) REFERENCES public.sensors_teams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: players_sessions players_sessions_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions
    ADD CONSTRAINT players_sessions_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.sessions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: players_sessions players_sessions_tag_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions
    ADD CONSTRAINT players_sessions_tag_team_id_fkey FOREIGN KEY (tag_team_id) REFERENCES public.tags_teams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: players players_team_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_team_id_foreign FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: players players_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: scrums plays_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.scrums
    ADD CONSTRAINT plays_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: sensors_teams sensors_teams_sensor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.sensors_teams
    ADD CONSTRAINT sensors_teams_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES public.sensors(id);


--
-- Name: sensors_teams sensors_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.sensors_teams
    ADD CONSTRAINT sensors_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: sessions sessions_pitch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pitch_id_fkey FOREIGN KEY (pitch_id) REFERENCES public.pitches(id) ON UPDATE CASCADE;


--
-- Name: settings settings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pitches sites_organisation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.pitches
    ADD CONSTRAINT sites_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES public.organisations(id);


--
-- Name: stats stats_player_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_player_session_id_fkey FOREIGN KEY (player_session_id) REFERENCES public.players_sessions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tags_teams tags_teams_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.tags_teams
    ADD CONSTRAINT tags_teams_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: tags_teams tags_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.tags_teams
    ADD CONSTRAINT tags_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: teams teams_organisation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES public.organisations(id);


--
-- Name: teams_sessions teams_sessions_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.teams_sessions
    ADD CONSTRAINT teams_sessions_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.sessions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teams_sessions teams_sessions_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.teams_sessions
    ADD CONSTRAINT teams_sessions_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: metrics_server
--

GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

