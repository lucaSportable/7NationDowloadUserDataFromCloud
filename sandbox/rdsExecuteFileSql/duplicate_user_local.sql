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
-- Name: player_team; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.player_team (
                                    id bigint NOT NULL,
                                    team_id bigint NOT NULL,
                                    player_id bigint NOT NULL
);


ALTER TABLE public.player_team OWNER TO metrics_server;

--
-- Name: players_sessions; Type: TABLE; Schema: public; Owner: metrics_server
--

CREATE TABLE public.players_sessions (
                                         id bigint NOT NULL,
                                         player_id bigint,
                                         session_id bigint,
                                         tag_team_id integer,
                                         sensor_team_id integer,
                                         team_id bigint
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
-- Name: player_team player_team_pkey; Type: CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.player_team
    ADD CONSTRAINT player_team_pkey PRIMARY KEY (id);


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
-- Name: player_team player_team_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.player_team
    ADD CONSTRAINT player_team_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: player_team player_team_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.player_team
    ADD CONSTRAINT player_team_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE CASCADE;


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
    ADD CONSTRAINT players_sessions_sensor_team_id_fkey FOREIGN KEY (sensor_team_id) REFERENCES public.sensors_teams(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: players_sessions players_sessions_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions
    ADD CONSTRAINT players_sessions_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.sessions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: players_sessions players_sessions_tag_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions
    ADD CONSTRAINT players_sessions_tag_team_id_fkey FOREIGN KEY (tag_team_id) REFERENCES public.tags_teams(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: players_sessions players_sessions_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: metrics_server
--

ALTER TABLE ONLY public.players_sessions
    ADD CONSTRAINT players_sessions_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE CASCADE;


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
-- PostgreSQL database dump complete
--
--
-- -- PART2: now on its export only
SET search_path TO "$user", public;
CREATE EXTENSION dblink;

--  export version:  users

INSERT INTO users(id,email, password_hash,first_name,last_name,permission_level)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev', 'SELECT * FROM users where users.id = ' || :v1)
                  AS users(id int4, email varchar, password_hash varchar, first_name varchar, last_name varchar, permission_level int2);

-- export version: settings
INSERT INTO settings(id,user_id)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev', 'SELECT * FROM settings where user_id=' || :v1 )
                  AS setting(id int4, user_id int8);

-- export: organisation

INSERT INTO organisations(id,name,logo,three_words)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev',
                     'select distinct organisations.*
                      from teams,coaches,organisations
                      where teams.id = coaches.team_id AND coaches.user_id = ' || :v1  ||'
                        and teams.organisation_id = organisations.id')
                  AS organisations(id int8, name varchar, logo varchar, three_words _text);


-- export version: teams

INSERT INTO teams(id,name,type,color,logo,organisation_id)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev', 'select distinct teams.*
                                                                                from teams,coaches
                                                                                where teams.id = coaches.team_id AND
                                                                                        coaches.user_id = '|| :v1)
                  AS teams(id int8,name varchar,type varchar,color varchar,logo varchar,organisation_id int8);


-- export version: players all the players of team the user is a coach (forced on relation players.user_id)

INSERT INTO players(id,first_name,last_name,weight,height, position, img,number,user_id)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev', 'select distinct(players.*)
                                                                                from players,teams,player_team
                                                                                where players.id = player_team.player_id and
                                                                                        player_team.team_id  IN (select distinct teams.id
                                                                                                                 from teams,coaches
                                                                                                                 where teams.id = coaches.team_id AND coaches.user_id = '|| :v1|| ');')
                  AS players(id int8, first_name varchar, last_name varchar, weight float8, height float8, position varchar, img varchar, number int4,user_id int4);

-- export version: coaches

INSERT INTO coaches(id,user_id,team_id)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev', 'SELECT * FROM coaches where user_id= ' || :v1)
                  AS setting(id int4, user_id int8,team_id int8);

-- export version: pitches

INSERT INTO pitches(id,name,dimensions,geo_fence,type ,organisation_id)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev',
    'select distinct pitches.* from teams,coaches,organisations,pitches where teams.id = coaches.team_id AND coaches.user_id ='|| :v1 || ' and teams.organisation_id = organisations.id and pitches.organisation_id = organisations.id;')
                  AS pitches(id int4,name varchar,dimensions jsonb,geo_fence jsonb,type int2 ,organisation_id int8);

-- export version: anchors

INSERT INTO anchors(id,x,y,z,pitch_id)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev', 'select distinct anchors.*
                                                                                from teams,coaches,organisations,pitches,anchors
                                                                                where teams.id = coaches.team_id AND coaches.user_id ='|| :v1 ||' and
                                                                                        teams.organisation_id = organisations.id and
                                                                                        pitches.organisation_id = organisations.id and
                                                                                        pitches.id = anchors.pitch_id;')
                  AS anchors(id int4,x float4,y float4,z float4,pitch_id int4);

-- export version: tags

INSERT INTO tags(id,type,calibration)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev',
                     'select distinct(tags.*) from teams,coaches,tags_teams,tags where teams.id = coaches.team_id and coaches.user_id =' || :v1 || ' and tags_teams.team_id = teams.id and tags_teams.tag_id = tags.id;')
                  AS tags(id int4,type varchar,calibration jsonb);

-- export version: tags_teams

INSERT INTO tags_teams(id,tag_id,team_id,name)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev',
                     'select distinct(tags_teams.*)from teams,coaches,tags_teams where teams.id = coaches.team_id and coaches.user_id ='|| :v1 ||' and tags_teams.team_id = teams.id;')
                  AS tags_teams(id int4,tag_id int4,team_id int8,name varchar);

-- export version: sensors

INSERT INTO sensors(id,hardware_id,fields)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev',
                     'select distinct(sensors.*) from teams,coaches,sensors_teams,sensors
                      where teams.id = coaches.team_id and coaches.user_id ='|| :v1 || ' and sensors_teams.team_id = teams.id and sensors_teams.sensor_id = sensors.id;')
                  AS sensors(id int4,hardware_id varchar,fields jsonb);

-- export version: sensors_teams

INSERT INTO sensors_teams(id,sensor_id,team_id,name)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev',
                     'select distinct(sensors_teams.*) from teams,coaches,sensors_teams where teams.id = coaches.team_id and coaches.user_id = '|| :v1 || ' and sensors_teams.team_id = teams.id;')
                  AS sensors_teams(id int4,sensor_id int4,team_id int8,name varchar);

-- export version: sessions

INSERT INTO sessions(id,start_time, end_time,name,video,video_offset,pitch_id)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev',
                     'select distinct sessions.*from teams,coaches,teams_sessions,sessions
                      where teams.id = coaches.team_id and coaches.user_id = '|| :v1 || ' and teams_sessions.team_id = teams.id and sessions.id = teams_sessions.session_id;')
                  AS sessions(id int8,start_time float8, end_time float8,name varchar,video varchar,video_offset int4,pitch_id int4);

-- export version: team_session

INSERT INTO teams_sessions(team_id,session_id)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev',
                     'select distinct teams_sessions.* from teams,players,coaches,teams_sessions where teams.id = coaches.team_id and coaches.user_id = '|| :v1 ||'  and teams_sessions.team_id = teams.id;')
                  AS teams_sessions(team_id int8,session_id int8);

-- export version: player_session

INSERT INTO players_sessions(id,player_id,session_id,tag_team_id,sensor_team_id,team_id)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev',
                     'select distinct(players_sessions.*)
                      from teams, players, players_sessions,player_team,(select distinct sessions.*
                                                                         from teams,coaches,teams_sessions,sessions
                                                                         where teams.id = coaches.team_id and
                                                                                 coaches.user_id = '|| :v1 || ' and
                                                                                 teams_sessions.team_id = teams.id and
                                                                                 sessions.id = teams_sessions.session_id) as sessions
                      where players.id = player_team.player_id and
                              player_team.team_id IN (select distinct teams.id
                                                      from teams,coaches
                                                      where teams.id = coaches.team_id AND coaches.user_id = '|| :v1 || ')
                        and players_sessions.session_id = sessions.id;

                     ')
AS players_sessions(id int8,player_id int8,session_id int8,tag_team_id int4,sensor_team_id int4, team_id int8);

-- export version: stats

INSERT INTO stats(id,player_session_id,delta_s, max_v, heatmap,kcalperkg,power_ratio,speed_bands)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev','
select distinct(stats.*)
from teams, players,stats, players_sessions, player_team, (select distinct sessions.*
                                                           from teams,coaches,teams_sessions,sessions
                                                           where teams.id = coaches.team_id and
                                                                   coaches.user_id = '|| :v1 || ' and
                                                                   teams_sessions.team_id = teams.id and
                                                                   sessions.id = teams_sessions.session_id) as sessions
where players.id = player_team.player_id and
        player_team.team_id IN (select distinct teams.id
                                from teams,coaches
                                where teams.id = coaches.team_id AND coaches.user_id = ' || :v1 ||' )
  and players_sessions.session_id = sessions.id
  and stats.player_session_id = players_sessions.id;')
AS stats(id int8,player_session_id int8,delta_s float8, max_v float8, heatmap varchar,kcalperkg float8,power_ratio float8,speed_bands _int4);

-- export version: events

INSERT INTO events(id,session_id,start_time, end_time,type)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev','
select distinct events.*
from teams,coaches,teams_sessions,sessions,events
where teams.id = coaches.team_id and
        coaches.user_id = '|| :v1 || ' and
        teams_sessions.team_id = teams.id and
        sessions.id = teams_sessions.session_id and
        sessions.id = events.session_id;
')
as events(id int8,session_id int8,start_time float8, end_time float8,type int2);

-- export version: flights

INSERT INTO flights(id,ball_id,from_id,to_id,hang_time,dist,speed, efficiency, kick, end_over_end_efficiency, type,validated, offset_x, offset_y, offset_z,
                    success,hit_post,max_height, spin, event_id, polynomial_coefficients)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev','
select distinct flights.*
from teams,coaches,teams_sessions,sessions,events,flights
where teams.id = coaches.team_id AND
        coaches.user_id =' || :v1 || ' and
        teams_sessions.team_id = teams.id and
        sessions.id = teams_sessions.session_id and
        sessions.id = events.session_id and
        events.id = flights.event_id;
')
as flights(id int8,ball_id int4,from_id int4,to_id int4,hang_time float8,dist float8,speed float8, efficiency float8,
                             kick bool, end_over_end_efficiency float8, type int2, validated bool, offset_x float4, offset_y float4, offset_z float4,
                             success bool ,hit_post bool,max_height float8, spin float8, event_id int8, polynomial_coefficients _float8);

-- export version: scrums
INSERT INTO scrums(id,name,infringements,event_id)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev','
select distinct scrums.*
from teams,coaches,teams_sessions,sessions,events,flights,scrums
where teams.id = coaches.team_id AND coaches.user_id = '|| :v1 || ' and
        teams_sessions.team_id = teams.id and
        sessions.id = teams_sessions.session_id and
        sessions.id = events.session_id and
        events.id = scrums.event_id;
')
                  as scrums(id int8,name varchar,infringements jsonb,event_id int8);

-- players session scrum

INSERT INTO players_sessions_scrums(id,player_session_id,scrum_id,scrum_index)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev','
select distinct (players_sessions_scrums.*)
from players,teams, players_sessions,players_sessions_scrums,player_team
where   players.id = players_sessions.player_id and
        players_sessions.id = players_sessions_scrums.player_session_id and
        players.id = player_team.player_id and
        player_team.team_id IN (select distinct teams.id
                     from teams,players,coaches
                     where teams.id = coaches.team_id AND coaches.user_id = '|| :v1 || ');
')
as players_sessions_scrums(id int4,player_session_id int8,scrum_id int8,scrum_index int4);

-- export goose version
INSERT INTO goose_db_version(id,version_id,is_applied,tstamp)
SELECT * FROM dblink('host=127.0.0.1 user=postgres dbname=metrics_server_dev','
SELECT *
FROM   goose_db_version
WHERE  version_id=(SELECT MAX(version_id) FROM goose_db_version)
')
as goose_db_version(id int4,version_id int8,is_applied bool,tstamp timestamp);