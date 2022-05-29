--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: player_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_stats (
    player text,
    "grouping" text,
    mat numeric,
    runs numeric,
    hs numeric,
    bat_av numeric,
    hundreds numeric,
    wkts numeric,
    bowl_av numeric,
    ct numeric,
    st numeric
);


ALTER TABLE public.player_stats OWNER TO postgres;

--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    name text,
    team text,
    age numeric,
    role text,
    batting_hand text,
    bowling_hand text,
    bowling_type text,
    career_span text,
    img text
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO postgres;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: team_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_stats (
    team text,
    "grouping" text,
    mat numeric,
    won numeric,
    lost numeric,
    tied numeric,
    draw numeric,
    nr numeric,
    wlratio numeric
);


ALTER TABLE public.team_stats OWNER TO postgres;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name text,
    img text
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO postgres;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: player_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_stats (player, "grouping", mat, runs, hs, bat_av, hundreds, wkts, bowl_av, ct, st) FROM stdin;
Alastair Cook	overall	257	15737	294	42.88	38	1	7	212	0
Alastair Cook	Test matches	161	12472	294	45.35	33	1	7	175	0
Alastair Cook	One-Day Internationals	92	3204	137	36.4	5	0	0	36	0
Alastair Cook	Twenty20 Internationals	4	61	26	15.25	0	0	0	1	0
Alastair Cook	in Africa	10	508	118	29.88	1	0	0	6	0
Alastair Cook	in Americas	8	652	139	54.33	2	0	0	5	0
Alastair Cook	in Asia	57	3814	263	47.67	11	0	0	29	0
Alastair Cook	in Europe	141	8236	294	42.02	18	1	7	131	0
Alastair Cook	in Oceania	41	2527	244	40.75	6	0	0	41	0
Alastair Cook	home	140	8192	294	42.01	18	1	7	131	0
Alastair Cook	away	107	6613	244	42.12	17	0	0	76	0
Alastair Cook	neutral	10	932	263	62.13	3	0	0	5	0
Alastair Cook	matches batting first	134	8300	243	41.29	23	0	0	109	0
Alastair Cook	matches fielding first	123	7437	294	44.8	15	1	6	103	0
Alastair Cook	won match	113	7562	294	51.44	21	0	0	113	0
Alastair Cook	lost match	101	4518	176	28.96	6	0	0	65	0
Alastair Cook	Basil D'Oliveira	19	1263	118	35.08	2	0	0	20	0
Alastair Cook	ICC Champions Trophy	5	161	64	32.2	0	0	0	2	0
Alastair Cook	The Ashes	35	2493	244	40.2	5	0	0	40	0
Alastair Cook	The Wisden Trophy	20	1739	243	57.96	6	0	0	20	0
Imran Khan	overall	263	7516	136	35.45	7	544	24.08	64	0
Imran Khan	Test matches	88	3807	136	37.69	6	362	22.81	28	0
Imran Khan	One-Day Internationals	175	3709	102	33.41	1	182	26.61	36	0
Imran Khan	in Americas	14	457	53	22.85	0	57	26.38	4	0
Imran Khan	in Asia	143	3810	135	36.99	4	304	21.77	36	0
Imran Khan	in Europe	32	933	118	40.56	2	67	23.56	10	0
Imran Khan	in Oceania	74	2316	136	35.09	1	116	29.3	14	0
Imran Khan	home	84	2274	123	40.6	3	215	20.47	25	0
Imran Khan	away	107	3594	136	33.9	3	250	27.35	28	0
Imran Khan	neutral	72	1648	102	32.96	1	79	23.56	11	0
Imran Khan	matches batting first	147	4774	136	37.59	6	219	29.72	36	0
Imran Khan	matches fielding first	116	2742	117	32.25	1	325	20.28	28	0
Imran Khan	won match	119	2966	117	42.98	2	259	18.42	35	0
Imran Khan	lost match	94	2194	82	23.09	0	146	27.96	16	0
Imran Khan	World Cup	28	666	102	35.05	1	34	19.26	6	0
Imran Khan	Asia Cup	3	23	21	11.5	0	3	7.66	3	0
Babar Azam	overall	193	9066	158	49	20	1	2	98	0
Babar Azam	Test matches	37	2461	143	43.17	5	1	2	25	0
Babar Azam	One-Day Internationals	83	3985	158	56.92	14	0	0	39	0
Babar Azam	Twenty20 Internationals	73	2620	122	45.17	1	0	0	34	0
Babar Azam	in Africa	28	1286	122	49.46	3	0	0	19	0
Babar Azam	in Americas	16	671	125	41.93	1	0	0	8	0
Babar Azam	in Asia	84	4184	143	53.64	11	1	2	37	0
Babar Azam	in Europe	40	1823	158	50.63	3	0	0	23	0
Babar Azam	in Oceania	25	1102	104	38	2	0	0	11	0
Babar Azam	home	32	1703	143	60.82	5	0	0	14	0
Babar Azam	away	105	4539	158	43.22	8	1	2	55	0
Babar Azam	neutral	56	2824	127	54.3	7	0	0	29	0
Babar Azam	matches batting first	96	5221	158	52.21	13	1	2	54	0
Babar Azam	matches fielding first	97	3845	143	45.23	7	0	0	44	0
Babar Azam	won match	106	5485	143	62.32	14	1	2	55	0
Babar Azam	lost match	74	2980	158	33.11	4	0	0	41	0
Babar Azam	World Cup	8	474	101	67.71	1	0	0	5	0
Babar Azam	Asia Cup	5	156	66	31.2	0	0	0	1	0
Babar Azam	ICC Champions Trophy	5	133	46	44.33	0	0	0	4	0
Babar Azam	ICC World Test Champ	14	1224	143	61.2	4	1	2	8	0
Babar Azam	Men's T20 World Cup	6	303	70	60.6	0	0	0	4	0
Ben Stokes	overall	209	8036	258	36.03	13	260	35.22	146	0
Ben Stokes	Test matches	74	4723	258	36.33	10	167	32.11	84	0
Ben Stokes	One-Day Internationals	101	2871	102	40.43	3	74	41.59	47	0
Ben Stokes	Twenty20 Internationals	34	442	47	20.09	0	19	37.73	15	0
Ben Stokes	in Africa	21	1008	258	40.32	2	33	28.9	23	0
Ben Stokes	in Americas	18	590	79	28.09	0	20	39	11	0
Ben Stokes	in Asia	49	1705	128	31.57	2	54	34.85	36	0
Ben Stokes	in Europe	99	3862	176	41.08	8	117	35.52	63	0
Ben Stokes	in Oceania	22	871	120	30.03	1	36	38.5	13	0
Ben Stokes	home	97	3859	176	41.49	8	117	35.09	62	0
Ben Stokes	away	103	4033	258	33.6	5	134	34.89	77	0
Ben Stokes	neutral	9	144	57	14.4	0	9	41.88	7	0
Ben Stokes	matches batting first	107	5132	258	39.78	10	121	34.91	90	0
Ben Stokes	matches fielding first	102	2904	135	30.89	3	139	35.49	56	0
Ben Stokes	won match	107	4199	176	45.64	8	129	28.48	96	0
Ben Stokes	lost match	85	2914	120	24.9	2	122	39.21	44	0
Ben Stokes	World Cup	11	465	89	66.42	0	7	35.14	3	0
Ben Stokes	Basil D'Oliveira	12	1028	258	46.72	3	29	30.03	26	0
Ben Stokes	ICC Champions Trophy	4	184	102	92	1	3	62.33	1	0
Ben Stokes	ICC World Test Champ	20	1426	176	41.94	4	38	30.05	28	0
Ben Stokes	Men's T20 World Cup	6	56	15	14	0	4	44.75	5	0
Ben Stokes	The Ashes	17	1013	135	34.93	3	38	38.71	14	0
Ben Stokes	The Wisden Trophy	12	953	176	52.94	2	31	26.8	14	0
James Anderson	overall	381	1530	81	8.89	0	926	27.36	155	0
James Anderson	Test matches	168	1256	81	9.3	0	639	26.48	99	0
James Anderson	One-Day Internationals	194	273	28	7.58	0	269	29.22	53	0
James Anderson	Twenty20 Internationals	19	1	1	1	0	18	30.66	3	0
James Anderson	in Africa	31	79	29	9.87	0	65	30.3	9	0
James Anderson	in Americas	29	61	20	5.08	0	58	27.22	9	0
James Anderson	in Asia	61	297	23	8.48	0	109	32.24	28	0
James Anderson	in Europe	195	890	81	10.34	0	547	24.74	84	0
James Anderson	in Oceania	65	203	23	6.54	0	147	32.24	25	0
James Anderson	home	192	890	81	10.34	0	543	24.76	82	0
James Anderson	away	144	542	29	7.52	0	305	32.51	61	0
James Anderson	neutral	45	98	15	7	0	78	25.32	12	0
James Anderson	matches batting first	192	846	34	9.72	0	459	27.03	65	0
James Anderson	matches fielding first	189	684	81	8.04	0	467	27.68	90	0
James Anderson	won match	174	425	29	8.33	0	521	19.59	72	0
James Anderson	lost match	160	739	34	7.46	0	265	40.21	59	0
James Anderson	World Cup	25	15	8	3	0	27	40.03	2	0
James Anderson	Basil D'Oliveira	21	174	34	10.23	0	78	29.92	14	0
James Anderson	ICC Champions Trophy	12	27	15	13.5	0	21	21.76	2	0
James Anderson	ICC World Test Champ	18	70	11	5.38	0	61	20.16	7	0
James Anderson	Men's T20 World Cup	9	0	0	0	0	8	29.12	0	0
James Anderson	The Ashes	34	243	29	7.59	0	111	33.27	21	0
James Anderson	The Wisden Trophy	22	130	20	7.64	0	87	22.6	19	0
James Neesham	overall	116	2445	137	28.43	2	103	33	47	0
James Neesham	Test matches	12	709	137	33.76	2	14	48.21	12	0
James Neesham	One-Day Internationals	66	1320	97	28.69	0	68	31.45	24	0
James Neesham	Twenty20 Internationals	38	416	48	21.89	0	21	27.9	11	0
James Neesham	in Africa	11	160	41	22.85	0	5	50.2	5	0
James Neesham	in Americas	5	296	107	37	1	3	52.33	2	0
James Neesham	in Asia	26	356	71	17.8	0	26	28.61	5	0
James Neesham	in Europe	16	367	97	28.23	0	17	27.76	5	0
James Neesham	in Oceania	58	1266	137	33.31	1	52	34.15	30	0
James Neesham	home	54	1144	137	34.66	1	49	31.65	30	0
James Neesham	away	35	872	107	25.64	1	30	39.23	10	0
James Neesham	neutral	27	429	97	22.57	0	24	28	7	0
James Neesham	matches batting first	61	1687	137	33.74	2	58	29.51	28	0
James Neesham	matches fielding first	55	758	74	21.05	0	45	37.51	19	0
James Neesham	won match	64	1400	107	40	1	62	26.32	34	0
James Neesham	lost match	44	814	97	18.08	0	32	47.71	10	0
James Neesham	World Cup	10	232	97	33.14	0	15	19.46	4	0
James Neesham	Chappell-Hadlee	5	165	74	33	0	2	90	3	0
James Neesham	ICC Champions Trophy	3	47	23	15.66	0	0	0	0	0
James Neesham	Men's T20 World Cup	9	93	35	31	0	6	18.66	1	0
James Neesham	Trans-Tasman Trophy	1	6	3	3	0	1	111	0	0
Kane Williamson	overall	311	15466	251	47.15	37	73	36.72	166	0
Kane Williamson	Test matches	86	7272	251	53.47	24	30	40.23	72	0
Kane Williamson	One-Day Internationals	151	6173	148	47.48	13	37	35.4	60	0
Kane Williamson	Twenty20 Internationals	74	2021	95	32.59	0	6	27.33	34	0
Kane Williamson	in Africa	23	1153	145	57.65	3	7	24.71	19	0
Kane Williamson	in Americas	14	697	161	38.72	2	8	31.12	5	0
Kane Williamson	in Asia	82	3303	192	38.4	8	5	125.2	44	0
Kane Williamson	in Europe	31	1812	148	56.62	5	17	29.35	11	0
Kane Williamson	in Oceania	161	8501	251	49.42	19	36	31.5	87	0
Kane Williamson	home	148	7802	251	50.99	17	35	30.42	80	0
Kane Williamson	away	107	5075	166	40.27	14	33	39.21	58	0
Kane Williamson	neutral	56	2589	192	52.83	6	5	64.4	28	0
Kane Williamson	matches batting first	163	8278	251	43.56	19	41	33.31	84	0
Kane Williamson	matches fielding first	148	7188	238	52.08	18	32	41.09	82	0
Kane Williamson	won match	152	8852	251	61.9	24	37	26.48	101	0
Kane Williamson	lost match	128	4538	140	30.25	5	25	46.4	52	0
Kane Williamson	World Cup	23	911	148	56.93	2	2	53	9	0
Kane Williamson	Chappell-Hadlee	10	305	81	33.88	0	1	63	5	0
Kane Williamson	ICC Champions Trophy	6	345	100	69	1	1	111	2	0
Kane Williamson	ICC World Test Champ	11	960	251	56.47	3	1	26	6	0
Kane Williamson	Men's T20 World Cup	20	521	85	32.56	0	0	0	11	0
Kane Williamson	Trans-Tasman Trophy	9	699	166	41.11	2	2	45.5	6	0
Marcus Stoinis	overall	80	1562	146	30.62	1	43	44.18	26	0
Marcus Stoinis	One-Day Internationals	45	1106	146	31.6	1	33	45.63	12	0
Marcus Stoinis	Twenty20 Internationals	35	456	78	28.5	0	10	39.4	14	0
Marcus Stoinis	in Africa	5	41	16	20.5	0	3	39.66	3	0
Marcus Stoinis	in Asia	24	397	62	36.09	0	7	74.14	5	0
Marcus Stoinis	in Europe	22	317	44	17.61	0	11	49.18	6	0
Marcus Stoinis	in Oceania	29	807	146	40.35	1	22	32.77	12	0
Marcus Stoinis	home	20	475	87	33.92	0	17	31.58	7	0
Marcus Stoinis	away	39	884	146	32.74	1	16	58.37	14	0
Marcus Stoinis	neutral	21	203	40	20.3	0	10	42.9	5	0
Marcus Stoinis	matches batting first	38	673	60	24.03	0	23	41.13	11	0
Marcus Stoinis	matches fielding first	42	889	146	38.65	1	20	47.7	15	0
Marcus Stoinis	won match	40	455	47	25.27	0	21	37.61	13	0
Marcus Stoinis	lost match	39	1103	146	34.46	1	22	50.45	13	0
Marcus Stoinis	World Cup	8	87	22	14.5	0	7	34.85	3	0
Marcus Stoinis	Chappell-Hadlee	2	188	146	188	1	3	23.66	1	0
Marcus Stoinis	Men's T20 World Cup	7	80	40	80	0	0	0	1	0
Mitchell Starc	overall	211	2224	99	19	0	523	24.91	78	0
Mitchell Starc	Test matches	64	1713	99	23.14	0	268	27.19	32	0
Mitchell Starc	One-Day Internationals	99	428	52	12.22	0	195	22.45	33	0
Mitchell Starc	Twenty20 Internationals	48	83	14	10.37	0	60	22.68	13	0
Mitchell Starc	in Africa	15	110	35	12.22	0	27	31.44	3	0
Mitchell Starc	in Americas	15	125	35	15.62	0	32	20.12	5	0
Mitchell Starc	in Asia	48	489	99	16.86	0	102	23.93	14	0
Mitchell Starc	in Europe	35	424	66	20.19	0	81	27.83	11	0
Mitchell Starc	in Oceania	98	1076	84	21.52	0	281	24.33	45	0
Mitchell Starc	home	95	1044	84	21.75	0	271	24.68	42	0
Mitchell Starc	away	74	1008	99	19.01	0	173	26.4	28	0
Mitchell Starc	neutral	42	172	34	10.75	0	79	22.4	8	0
Mitchell Starc	matches batting first	105	1335	99	21.19	0	260	24.51	46	0
Mitchell Starc	matches fielding first	106	889	84	16.46	0	263	25.3	32	0
Mitchell Starc	won match	124	1066	84	24.22	0	341	20.35	49	0
Mitchell Starc	lost match	72	897	99	13.38	0	152	32.94	23	0
Mitchell Starc	World Cup	18	68	29	8.5	0	49	14.81	8	0
Mitchell Starc	Border-Gavaskar	15	528	99	29.33	0	42	37.38	9	0
Mitchell Starc	Chappell-Hadlee	7	52	29	17.33	0	16	19.06	6	0
Mitchell Starc	Frank Worrell Trophy	3	62	35	15.5	0	12	17.91	2	0
Mitchell Starc	ICC Champions Trophy	4	5	5	2.5	0	6	34.66	0	0
Mitchell Starc	ICC World Test Champ	13	336	54	30.54	0	57	23.45	7	0
Mitchell Starc	Men's T20 World Cup	17	25	13	5	0	24	23.25	1	0
Mitchell Starc	The Ashes	16	479	66	26.61	0	68	26.57	9	0
Mitchell Starc	Trans-Tasman Trophy	8	164	32	23.42	0	32	24.06	4	0
Shaheen Shah Afridi	overall	88	227	19	8.1	0	184	24.35	14	0
Shaheen Shah Afridi	Test matches	21	121	19	5.76	0	86	23.89	2	0
Shaheen Shah Afridi	One-Day Internationals	28	87	19	14.5	0	53	24.62	4	0
Shaheen Shah Afridi	Twenty20 Internationals	39	19	10	19	0	45	24.93	8	0
Shaheen Shah Afridi	in Africa	19	38	14	7.6	0	40	24.72	6	0
Shaheen Shah Afridi	in Americas	4	19	19	9.5	0	19	14.05	1	0
Shaheen Shah Afridi	in Asia	36	51	14	7.28	0	75	21.49	3	0
Shaheen Shah Afridi	in Europe	22	73	19	10.42	0	35	30.42	4	0
Shaheen Shah Afridi	in Oceania	7	46	10	6.57	0	15	36.6	0	0
Shaheen Shah Afridi	home	16	22	8	3.66	0	33	24.81	2	0
Shaheen Shah Afridi	away	48	188	19	8.95	0	101	26.91	12	0
Shaheen Shah Afridi	neutral	24	17	14	17	0	50	18.9	0	0
Shaheen Shah Afridi	matches batting first	46	126	19	7	0	100	23.17	7	0
Shaheen Shah Afridi	matches fielding first	42	101	19	10.1	0	84	25.77	7	0
Shaheen Shah Afridi	won match	47	56	19	9.33	0	117	17.72	10	0
Shaheen Shah Afridi	lost match	33	166	19	8.73	0	61	34.65	3	0
Shaheen Shah Afridi	World Cup	5	1	1	0	0	16	14.62	0	0
Shaheen Shah Afridi	Asia Cup	3	14	14	0	0	4	31.75	0	0
Shaheen Shah Afridi	ICC World Test Champ	16	94	19	5.52	0	64	23.65	2	0
Shaheen Shah Afridi	Men's T20 World Cup	6	0	0	0	0	7	24.14	0	0
Trent Boult	overall	210	876	52	13.27	0	523	26.16	89	0
Trent Boult	Test matches	73	687	52	15.61	0	292	27.67	39	0
Trent Boult	One-Day Internationals	93	159	21	9.35	0	169	25.21	34	0
Trent Boult	Twenty20 Internationals	44	30	8	6	0	62	21.69	16	0
Trent Boult	in Africa	6	23	17	11.5	0	15	35.66	2	0
Trent Boult	in Americas	9	47	14	9.4	0	20	29.6	4	0
Trent Boult	in Asia	46	202	52	10.1	0	93	28.69	11	0
Trent Boult	in Europe	21	78	24	11.14	0	58	24.31	14	0
Trent Boult	in Oceania	128	526	38	16.43	0	337	25.16	58	0
Trent Boult	home	117	443	38	17.03	0	310	24.25	54	0
Trent Boult	away	64	383	52	11.96	0	155	30.41	25	0
Trent Boult	neutral	29	50	19	6.25	0	58	25.03	10	0
Trent Boult	matches batting first	104	501	52	15.65	0	257	24.27	38	0
Trent Boult	matches fielding first	106	375	38	11.02	0	266	27.99	51	0
Trent Boult	won match	110	334	38	27.83	0	331	20.67	59	0
Trent Boult	lost match	81	394	26	8.75	0	138	35.81	23	0
Trent Boult	World Cup	19	10	4	10	0	39	21.79	8	0
Trent Boult	Chappell-Hadlee	9	28	16	14	0	23	19.08	3	0
Trent Boult	ICC Champions Trophy	3	0	0	0	0	3	44	2	0
Trent Boult	ICC World Test Champ	10	112	38	22.4	0	39	27.74	3	0
Trent Boult	Men's T20 World Cup	9	3	3	3	0	17	12.82	2	0
Trent Boult	Trans-Tasman Trophy	7	124	24	17.71	0	23	41.69	3	0
Virat Kohli	overall	447	23232	254	54.92	70	8	118.37	272	0
Virat Kohli	Test matches	98	7836	254	50.55	27	0	0	98	0
Virat Kohli	One-Day Internationals	254	12169	183	59.07	43	4	166.25	132	0
Virat Kohli	Twenty20 Internationals	95	3227	94	52.04	0	4	49.5	42	0
Virat Kohli	in Africa	38	1916	160	63.86	6	1	115	22	0
Virat Kohli	in Americas	34	1463	200	44.33	5	0	0	30	0
Virat Kohli	in Asia	248	13263	254	60.28	43	4	117	143	0
Virat Kohli	in Europe	53	2507	149	42.49	3	2	71	32	0
Virat Kohli	in Oceania	74	4083	169	50.4	13	1	160	45	0
Virat Kohli	home	179	10111	254	60.9	32	3	118.66	106	0
Virat Kohli	away	196	10263	200	49.82	34	4	108.25	128	0
Virat Kohli	neutral	72	2858	183	56.03	4	1	158	38	0
Virat Kohli	matches batting first	216	10710	254	44.81	28	4	102.25	133	0
Virat Kohli	matches fielding first	230	12522	235	68.05	42	4	134.5	139	0
Virat Kohli	won match	262	15021	254	67.96	48	2	174	184	0
Virat Kohli	lost match	147	6204	153	36.49	14	6	88.5	70	0
Virat Kohli	World Cup	26	1030	107	46.81	2	0	0	14	0
Virat Kohli	Asia Cup	16	766	183	63.83	3	0	0	9	0
Virat Kohli	Border-Gavaskar	20	1682	169	48.05	7	0	0	20	0
Virat Kohli	ICC Champions Trophy	13	529	96	88.16	0	0	0	4	0
Virat Kohli	ICC World Test Champ	21	1223	254	38.21	2	0	0	26	0
Virat Kohli	Men's T20 World Cup	21	845	89	76.81	0	2	23	9	0
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (player_id, name, team, age, role, batting_hand, bowling_hand, bowling_type, career_span, img) FROM stdin;
1	Babar Azam	Pakistan	27	Batter	Right	Right	Offbreak	2015 - present	babar.png
2	Imran Khan	Pakistan	69	Allrounder	Right	Right	Fast	1971 - 1992	imrankhan.png
3	Shaheen Shah Afridi	Pakistan	21	Bowler	Left	Left	Fast	2018 - present	shaheenafridi.png
4	Virat Kohli	India	33	Batter	Right	Right	Medium	2008 - present	kohli.png
5	Marcus Stoinis	Australia	32	Allrounder	Right	Right	Medium	2015 - present	marcus.png
6	Mitchell Starc	Australia	31	Bowler	Left	Left	Fast	2010 - present	starc.png
8	Ben Stokes	England	30	Allrounder	Left	Right	Fast medium	2011 - present	stokes.png
9	James Anderson	England	39	Bowler	Left	Right	Fast medium	2002 - present	anderson.png
10	Kane Williamson	New Zealand	31	Batter	Right	Right	Offbreak	2010 - present	kane.png
11	James Neesham	New Zealand	31	Allrounder	Left	Right	Fast medium	2012 - present	james.png
12	Trent Boult	New Zealand	32	Bowler	Right	Left	Fast medium	2011 - present	trent.png
7	Alastair Cook	England	37	Batter	Left	Right	Slow	2006 - 2018	cook.png
\.


--
-- Data for Name: team_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_stats (team, "grouping", mat, won, lost, tied, draw, nr, wlratio) FROM stdin;
Afghanistan	overall	224	125	94	2	0	3	1.329
Afghanistan	Test matches	6	3	3	0	0	0	1
Afghanistan	One-Day Internationals	129	62	63	1	0	3	0.984
Afghanistan	Twenty20 Internationals	89	60	28	1	0	0	2.142
Afghanistan	v Australia	3	0	3	0	0	0	0
Afghanistan	v Bangladesh	15	8	7	0	0	0	1.142
Afghanistan	v England	4	0	4	0	0	0	0
Afghanistan	v India	7	0	6	1	0	0	0
Afghanistan	v New Zealand	3	0	3	0	0	0	0
Afghanistan	v Pakistan	6	0	6	0	0	0	0
Afghanistan	v South Africa	3	0	3	0	0	0	0
Afghanistan	v Sri Lanka	5	1	4	0	0	0	0.25
Afghanistan	v West Indies	17	6	10	0	0	1	0.6
Afghanistan	in Africa	27	16	11	0	0	0	1.454
Afghanistan	in Americas	10	3	6	0	0	1	0.5
Afghanistan	in Asia	141	85	53	2	0	1	1.603
Afghanistan	in Europe	40	20	19	0	0	1	1.052
Afghanistan	in Oceania	6	1	5	0	0	0	0.2
Afghanistan	away	70	37	31	0	0	2	1.193
Afghanistan	neutral	154	88	63	2	0	1	1.396
Afghanistan	2000s	3	2	1	0	0	0	2
Afghanistan	2010s	205	112	89	1	0	3	1.258
Afghanistan	2020s	16	11	4	1	0	0	2.75
Afghanistan	matches batting first	124	69	52	1	0	2	1.326
Afghanistan	matches fielding first	99	56	42	1	0	0	1.333
Afghanistan	won match	125	125	0	0	0	0	0
Afghanistan	lost match	94	0	94	0	0	0	0
Afghanistan	tied match	2	0	0	2	0	0	0
Afghanistan	no result	3	0	0	0	0	3	0
Afghanistan	won batting first	69	69	0	0	0	0	0
Afghanistan	won fielding first	56	56	0	0	0	0	0
Afghanistan	lost batting first	52	0	52	0	0	0	0
Afghanistan	lost fielding first	42	0	42	0	0	0	0
Afghanistan	tied batting first	1	0	0	1	0	0	0
Afghanistan	tied fielding first	1	0	0	1	0	0	0
Afghanistan	World Cup	15	1	14	0	0	0	0.071
Afghanistan	Asia Cup	12	5	6	1	0	0	0.833
Afghanistan	Men's T20 World Cup	19	7	12	0	0	0	0.583
Afghanistan	WCL Championship	9	7	2	0	0	0	3.5
Afghanistan	World Cup Qualifier	8	5	3	0	0	0	1.666
Australia	overall	1947	1056	629	13	212	37	1.678
Australia	Test matches	836	396	226	2	212	0	1.752
Australia	One-Day Internationals	958	581	334	9	0	34	1.739
Australia	Twenty20 Internationals	153	79	69	2	0	3	1.144
Australia	v Afghanistan	3	3	0	0	0	0	0
Australia	v Bangladesh	37	30	6	0	0	1	5
Australia	v England	525	242	182	2	95	4	1.329
Australia	v India	268	132	96	1	28	11	1.375
Australia	v New Zealand	213	136	51	1	18	7	2.666
Australia	v Pakistan	194	111	59	2	18	4	1.881
Australia	v South Africa	223	114	85	3	20	1	1.341
Australia	v Sri Lanka	145	89	44	0	8	4	2.022
Australia	v West Indies	276	141	103	4	25	3	1.368
Australia	in Africa	159	91	56	1	9	2	1.625
Australia	in Americas	126	67	41	2	15	1	1.634
Australia	in Asia	337	165	128	2	32	10	1.289
Australia	in Europe	312	119	114	3	68	8	1.043
Australia	in Oceania	1013	614	290	5	88	16	2.117
Australia	home	921	560	261	4	81	15	2.145
Australia	away	799	349	300	7	129	14	1.163
Australia	neutral	227	147	68	2	2	8	2.161
Australia	1870s	3	2	1	0	0	0	2
Australia	1880s	27	8	15	0	4	0	0.533
Australia	1890s	26	10	10	0	6	0	1
Australia	1900s	33	16	9	0	8	0	1.777
Australia	1910s	16	7	6	0	3	0	1.166
Australia	1920s	28	14	6	0	8	0	2.333
Australia	1930s	39	22	10	0	7	0	2.2
Australia	1940s	18	14	0	0	4	0	0
Australia	1950s	57	29	12	0	16	0	2.416
Australia	1960s	67	23	14	1	29	0	1.642
Australia	1970s	114	45	44	0	24	1	1.022
Australia	1980s	284	118	116	3	38	9	1.017
Australia	1990s	333	194	106	3	29	1	1.83
Australia	2000s	422	292	96	3	18	13	3.041
Australia	2010s	426	236	157	3	17	13	1.503
Australia	2020s	54	26	27	0	1	0	0.962
Australia	matches batting first	1040	580	324	5	112	19	1.79
Australia	matches fielding first	907	476	305	8	100	18	1.56
Australia	won match	1056	1056	0	0	0	0	0
Australia	lost match	629	0	629	0	0	0	0
Australia	tied match	13	0	0	13	0	0	0
Australia	drawn match	212	0	0	0	212	0	0
Australia	no result	37	0	0	0	0	37	0
Australia	won batting first	580	580	0	0	0	0	0
Australia	won fielding first	476	476	0	0	0	0	0
Australia	lost batting first	324	0	324	0	0	0	0
Australia	lost fielding first	305	0	305	0	0	0	0
Australia	tied batting first	5	0	0	5	0	0	0
Australia	tied fielding first	8	0	0	8	0	0	0
Australia	drawn batting first	112	0	0	0	112	0	0
Australia	drawn fielding first	100	0	0	0	100	0	0
Australia	World Cup	94	69	23	1	0	1	3
Australia	Border-Gavaskar	52	19	22	0	11	0	0.863
Australia	Chappell-Hadlee	32	16	14	0	0	2	1.142
Australia	Frank Worrell Trophy	101	47	30	1	23	0	1.566
Australia	ICC Champions Trophy	24	12	8	0	0	4	1.5
Australia	ICC World Test Champ	16	10	4	0	2	0	2.5
Australia	Men's T20 World Cup	36	22	14	0	0	0	1.571
Australia	The Ashes	337	138	108	0	91	0	1.277
Australia	Trans-Tasman Trophy	45	26	6	0	13	0	4.333
Bangladesh	overall	637	194	417	0	17	9	0.465
Bangladesh	Test matches	126	15	94	0	17	0	0.159
Bangladesh	One-Day Internationals	388	136	245	0	0	7	0.555
Bangladesh	Twenty20 Internationals	123	43	78	0	0	2	0.551
Bangladesh	v Afghanistan	15	7	8	0	0	0	0.875
Bangladesh	v Australia	37	6	30	0	0	1	0.2
Bangladesh	v England	32	5	27	0	0	0	0.185
Bangladesh	v India	58	6	49	0	2	1	0.122
Bangladesh	v New Zealand	68	13	52	0	3	0	0.25
Bangladesh	v Pakistan	65	7	57	0	1	0	0.122
Bangladesh	v South Africa	40	4	34	0	2	0	0.117
Bangladesh	v Sri Lanka	85	14	65	0	4	2	0.215
Bangladesh	v West Indies	72	27	40	0	2	3	0.675
Bangladesh	in Africa	82	26	54	0	1	1	0.481
Bangladesh	in Americas	38	14	22	0	1	1	0.636
Bangladesh	in Asia	421	132	269	0	15	5	0.49
Bangladesh	in Europe	51	19	30	0	0	2	0.633
Bangladesh	in Oceania	45	3	42	0	0	0	0.071
Bangladesh	home	297	114	168	0	13	2	0.678
Bangladesh	away	227	49	170	0	4	4	0.288
Bangladesh	neutral	113	31	79	0	0	3	0.392
Bangladesh	1980s	5	0	5	0	0	0	0
Bangladesh	1990s	32	3	29	0	0	0	0.103
Bangladesh	2000s	248	58	182	0	6	2	0.318
Bangladesh	2010s	297	107	173	0	10	7	0.618
Bangladesh	2020s	55	26	28	0	1	0	0.928
Bangladesh	matches batting first	327	97	217	0	9	4	0.447
Bangladesh	matches fielding first	310	97	200	0	8	5	0.485
Bangladesh	won match	194	194	0	0	0	0	0
Bangladesh	lost match	417	0	417	0	0	0	0
Bangladesh	drawn match	17	0	0	0	17	0	0
Bangladesh	no result	9	0	0	0	0	9	0
Bangladesh	won batting first	97	97	0	0	0	0	0
Bangladesh	won fielding first	97	97	0	0	0	0	0
Bangladesh	lost batting first	217	0	217	0	0	0	0
Bangladesh	lost fielding first	200	0	200	0	0	0	0
Bangladesh	drawn batting first	9	0	0	0	9	0	0
Bangladesh	drawn fielding first	8	0	0	0	8	0	0
Bangladesh	World Cup	40	14	25	0	0	1	0.56
Bangladesh	Asia Cup	48	10	38	0	0	0	0.263
Bangladesh	ICC Champions Trophy	12	2	9	0	0	1	0.222
Bangladesh	ICC World Test Champ	9	0	8	0	1	0	0
Bangladesh	Men's T20 World Cup	33	7	25	0	0	1	0.28
England	overall	1946	837	713	11	351	34	1.173
England	Test matches	1042	378	313	0	351	0	1.207
England	One-Day Internationals	761	384	339	9	0	29	1.132
England	Twenty20 Internationals	143	75	61	2	0	5	1.229
England	v Afghanistan	4	4	0	0	0	0	0
England	v Australia	525	182	242	2	95	4	0.752
England	v Bangladesh	32	27	5	0	0	0	5.4
England	v India	252	101	96	2	50	3	1.052
England	v New Zealand	220	101	63	4	47	5	1.603
England	v Pakistan	198	95	59	1	39	4	1.61
England	v South Africa	238	103	74	1	55	5	1.391
England	v Sri Lanka	127	64	48	1	11	3	1.333
England	v West Indies	281	111	113	0	51	6	0.982
England	in Africa	159	68	55	1	33	2	1.236
England	in Americas	137	45	58	0	29	5	0.775
England	in Asia	310	123	133	2	51	1	0.924
England	in Europe	921	446	265	5	183	22	1.683
England	in Oceania	419	155	202	3	55	4	0.767
England	home	911	439	264	5	183	20	1.662
England	away	874	309	381	5	167	12	0.811
England	neutral	161	89	68	1	1	2	1.308
England	1870s	3	1	2	0	0	0	0.5
England	1880s	29	17	8	0	4	0	2.125
England	1890s	32	16	10	0	6	0	1.6
England	1900s	38	11	18	0	9	0	0.611
England	1910s	21	14	4	0	3	0	3.5
England	1920s	48	18	16	0	14	0	1.125
England	1930s	72	23	14	0	35	0	1.642
England	1940s	32	6	9	0	17	0	0.666
England	1950s	83	39	22	0	22	0	1.772
England	1960s	100	32	15	0	53	0	2.133
England	1970s	141	60	36	0	41	4	1.666
England	1980s	224	84	94	1	45	0	0.893
England	1990s	242	86	113	1	38	4	0.761
England	2000s	376	164	161	3	37	11	1.018
England	2010s	435	227	167	6	23	12	1.359
England	2020s	70	39	24	0	4	3	1.625
England	matches batting first	964	403	353	4	190	14	1.141
England	matches fielding first	981	434	360	7	161	19	1.205
England	won match	837	837	0	0	0	0	0
England	lost match	713	0	713	0	0	0	0
England	tied match	11	0	0	11	0	0	0
England	drawn match	351	0	0	0	351	0	0
England	no result	34	0	0	0	0	34	0
England	won batting first	403	403	0	0	0	0	0
England	won fielding first	434	434	0	0	0	0	0
England	lost batting first	353	0	353	0	0	0	0
England	lost fielding first	360	0	360	0	0	0	0
England	tied batting first	4	0	0	4	0	0	0
England	tied fielding first	7	0	0	7	0	0	0
England	drawn batting first	190	0	0	0	190	0	0
England	drawn fielding first	161	0	0	0	161	0	0
England	World Cup	83	48	32	2	0	1	1.5
England	Basil D'Oliveira	28	12	9	0	7	0	1.333
England	ICC Champions Trophy	25	14	11	0	0	0	1.272
England	ICC World Test Champ	27	12	11	0	4	0	1.09
England	Men's T20 World Cup	38	19	18	0	0	1	1.055
England	The Ashes	337	108	138	0	91	0	0.782
England	The Wisden Trophy	120	36	48	0	36	0	0.75
India	overall	1706	778	650	13	220	45	1.196
India	Test matches	557	165	171	1	220	0	0.964
India	One-Day Internationals	996	518	428	9	0	41	1.21
India	Twenty20 Internationals	153	95	51	3	0	4	1.862
India	v Afghanistan	7	6	0	1	0	0	0
India	v Australia	268	96	132	1	28	11	0.727
India	v Bangladesh	58	49	6	0	2	1	8.166
India	v England	252	96	101	2	50	3	0.95
India	v New Zealand	192	86	71	3	27	5	1.211
India	v Pakistan	200	70	87	1	38	4	0.804
India	v South Africa	138	58	67	0	10	3	0.865
India	v Sri Lanka	228	127	71	1	17	12	1.788
India	v West Indies	248	96	99	2	46	5	0.969
India	in Africa	138	70	54	2	8	4	1.296
India	in Americas	127	43	53	0	26	5	0.811
India	in Asia	1024	520	333	5	141	25	1.561
India	in Europe	169	62	80	1	22	4	0.775
India	in Oceania	248	83	130	5	23	7	0.638
India	home	678	346	204	4	114	10	1.696
India	away	689	242	315	4	106	22	0.768
India	neutral	339	190	131	5	0	13	1.45
India	1930s	7	0	5	0	2	0	0
India	1940s	13	0	6	0	7	0	0
India	1950s	44	6	17	0	21	0	0.352
India	1960s	52	9	21	0	22	0	0.428
India	1970s	77	19	30	0	28	0	0.633
India	1980s	236	80	101	1	48	6	0.792
India	1990s	326	140	140	3	31	12	1
India	2000s	430	211	165	1	36	17	1.278
India	2010s	462	281	144	6	22	9	1.951
India	2020s	59	32	21	2	3	1	1.523
India	matches batting first	822	360	329	8	103	22	1.094
India	matches fielding first	883	418	321	5	117	22	1.302
India	won match	778	778	0	0	0	0	0
India	lost match	650	0	650	0	0	0	0
India	tied match	13	0	0	13	0	0	0
India	drawn match	220	0	0	0	220	0	0
India	no result	45	0	0	0	0	45	0
India	won batting first	360	360	0	0	0	0	0
India	won fielding first	418	418	0	0	0	0	0
India	lost batting first	329	0	329	0	0	0	0
India	lost fielding first	321	0	321	0	0	0	0
India	tied batting first	8	0	0	8	0	0	0
India	tied fielding first	5	0	0	5	0	0	0
India	drawn batting first	103	0	0	0	103	0	0
India	drawn fielding first	117	0	0	0	117	0	0
India	World Cup	84	53	29	1	0	1	1.827
India	Asia Cup	54	36	16	1	0	1	2.25
India	Border-Gavaskar	52	22	19	0	11	0	1.157
India	ICC Champions Trophy	29	18	8	0	0	3	2.25
India	ICC World Test Champ	24	15	6	0	3	0	2.5
India	Men's T20 World Cup	38	23	13	1	0	1	1.769
New Zealand	overall	1386	539	620	15	168	44	0.869
New Zealand	Test matches	451	107	176	0	168	0	0.607
New Zealand	One-Day Internationals	775	354	374	7	0	40	0.946
New Zealand	Twenty20 Internationals	160	78	70	8	0	4	1.114
New Zealand	v Afghanistan	3	3	0	0	0	0	0
New Zealand	v Australia	213	51	136	1	18	7	0.375
New Zealand	v Bangladesh	68	52	13	0	3	0	4
New Zealand	v England	220	63	101	4	47	5	0.623
New Zealand	v India	192	71	86	3	27	5	0.825
New Zealand	v Pakistan	192	72	95	1	21	3	0.757
New Zealand	v South Africa	131	33	77	0	16	5	0.428
New Zealand	v Sri Lanka	154	75	57	2	11	9	1.315
New Zealand	v West Indies	130	53	46	3	19	9	1.152
New Zealand	in Africa	113	47	54	1	8	3	0.87
New Zealand	in Americas	59	19	30	0	9	1	0.633
New Zealand	in Asia	314	93	176	3	32	10	0.528
New Zealand	in Europe	141	47	65	1	20	8	0.723
New Zealand	in Oceania	759	333	295	10	99	22	1.128
New Zealand	home	613	292	206	10	88	17	1.417
New Zealand	away	523	129	296	3	79	16	0.435
New Zealand	neutral	250	118	118	2	1	11	1
New Zealand	1930s	14	0	5	0	9	0	0
New Zealand	1940s	6	0	1	0	5	0	0
New Zealand	1950s	32	1	21	0	10	0	0.047
New Zealand	1960s	43	6	18	0	19	0	0.333
New Zealand	1970s	61	11	28	0	19	3	0.392
New Zealand	1980s	185	73	81	0	27	4	0.901
New Zealand	1990s	272	90	137	4	32	9	0.656
New Zealand	2000s	349	148	159	3	25	14	0.93
New Zealand	2010s	371	179	153	6	20	13	1.169
New Zealand	2020s	53	31	17	2	2	1	1.823
New Zealand	matches batting first	694	271	322	8	77	16	0.841
New Zealand	matches fielding first	692	268	298	7	91	28	0.899
New Zealand	won match	539	539	0	0	0	0	0
New Zealand	lost match	620	0	620	0	0	0	0
New Zealand	tied match	15	0	0	15	0	0	0
New Zealand	drawn match	168	0	0	0	168	0	0
New Zealand	no result	44	0	0	0	0	44	0
New Zealand	won batting first	271	271	0	0	0	0	0
New Zealand	won fielding first	268	268	0	0	0	0	0
New Zealand	lost batting first	322	0	322	0	0	0	0
New Zealand	lost fielding first	298	0	298	0	0	0	0
New Zealand	tied batting first	8	0	0	8	0	0	0
New Zealand	tied fielding first	7	0	0	7	0	0	0
New Zealand	drawn batting first	77	0	0	0	77	0	0
New Zealand	drawn fielding first	91	0	0	0	91	0	0
New Zealand	World Cup	89	54	33	1	0	1	1.636
New Zealand	Chappell-Hadlee	32	14	16	0	0	2	0.875
New Zealand	ICC Champions Trophy	24	12	10	0	0	2	1.2
New Zealand	ICC World Test Champ	14	8	5	0	1	0	1.6
New Zealand	Men's T20 World Cup	37	20	15	2	0	0	1.333
New Zealand	Trans-Tasman Trophy	45	6	26	0	13	0	0.23
Pakistan	overall	1566	752	615	12	162	25	1.222
Pakistan	Test matches	441	145	134	0	162	0	1.082
Pakistan	One-Day Internationals	936	490	417	9	0	20	1.175
Pakistan	Twenty20 Internationals	189	117	64	3	0	5	1.828
Pakistan	v Afghanistan	6	6	0	0	0	0	0
Pakistan	v Australia	194	59	111	2	18	4	0.531
Pakistan	v Bangladesh	65	57	7	0	1	0	8.142
Pakistan	v England	198	59	95	1	39	4	0.621
Pakistan	v India	200	87	70	1	38	4	1.242
Pakistan	v New Zealand	192	95	72	1	21	3	1.319
Pakistan	v South Africa	131	47	76	0	7	1	0.618
Pakistan	v Sri Lanka	231	125	82	1	19	4	1.524
Pakistan	v West Indies	209	96	92	3	15	3	1.043
Pakistan	in Africa	159	87	65	2	2	3	1.338
Pakistan	in Americas	105	48	44	2	7	4	1.09
Pakistan	in Asia	873	469	277	5	112	10	1.693
Pakistan	in Europe	183	72	87	1	20	3	0.827
Pakistan	in Oceania	246	76	142	2	21	5	0.535
Pakistan	home	364	193	91	2	74	4	2.12
Pakistan	away	678	270	307	6	80	15	0.879
Pakistan	neutral	524	289	217	4	8	6	1.331
Pakistan	1950s	29	8	9	0	12	0	0.888
Pakistan	1960s	30	2	8	0	20	0	0.25
Pakistan	1970s	66	17	23	0	26	0	0.739
Pakistan	1980s	242	100	92	0	44	6	1.086
Pakistan	1990s	337	178	126	6	23	4	1.412
Pakistan	2000s	377	202	147	1	22	5	1.374
Pakistan	2010s	422	206	193	4	13	6	1.067
Pakistan	2020s	63	39	17	1	2	4	2.294
Pakistan	matches batting first	804	387	309	6	83	19	1.252
Pakistan	matches fielding first	762	365	306	6	79	6	1.192
Pakistan	won match	752	752	0	0	0	0	0
Pakistan	lost match	615	0	615	0	0	0	0
Pakistan	tied match	12	0	0	12	0	0	0
Pakistan	drawn match	162	0	0	0	162	0	0
Pakistan	no result	25	0	0	0	0	25	0
Pakistan	won batting first	387	387	0	0	0	0	0
Pakistan	won fielding first	365	365	0	0	0	0	0
Pakistan	lost batting first	309	0	309	0	0	0	0
Pakistan	lost fielding first	306	0	306	0	0	0	0
Pakistan	tied batting first	6	0	0	6	0	0	0
Pakistan	tied fielding first	6	0	0	6	0	0	0
Pakistan	drawn batting first	83	0	0	0	83	0	0
Pakistan	drawn fielding first	79	0	0	0	79	0	0
Pakistan	World Cup	79	45	32	0	0	2	1.406
Pakistan	Asia Cup	49	28	20	0	0	1	1.4
Pakistan	ICC Champions Trophy	23	11	12	0	0	0	0.916
Pakistan	ICC World Test Champ	16	7	6	0	3	0	1.166
Pakistan	Men's T20 World Cup	40	24	15	1	0	0	1.6
South Africa	overall	1227	642	433	7	124	21	1.482
South Africa	Test matches	445	169	152	0	124	0	1.111
South Africa	One-Day Internationals	635	388	221	6	0	20	1.755
South Africa	Twenty20 Internationals	147	85	60	1	0	1	1.416
South Africa	v Afghanistan	3	3	0	0	0	0	0
South Africa	v Australia	223	85	114	3	20	1	0.745
South Africa	v Bangladesh	40	34	4	0	2	0	8.5
South Africa	v England	238	74	103	1	55	5	0.718
South Africa	v India	138	67	58	0	10	3	1.155
South Africa	v New Zealand	131	77	33	0	16	5	2.333
South Africa	v Pakistan	131	76	47	0	7	1	1.617
South Africa	v Sri Lanka	128	72	47	2	6	1	1.531
South Africa	v West Indies	108	74	24	1	7	2	3.083
South Africa	in Africa	615	360	185	4	57	9	1.945
South Africa	in Americas	63	38	19	0	5	1	2
South Africa	in Asia	230	119	92	0	16	3	1.293
South Africa	in Europe	148	50	66	2	25	5	0.757
South Africa	in Oceania	171	75	71	1	21	3	1.056
South Africa	home	579	332	178	4	56	9	1.865
South Africa	away	457	196	187	1	65	8	1.048
South Africa	neutral	191	114	68	2	3	4	1.676
South Africa	1880s	2	0	2	0	0	0	0
South Africa	1890s	6	0	6	0	0	0	0
South Africa	1900s	11	4	4	0	3	0	1
South Africa	1910s	21	4	15	0	2	0	0.266
South Africa	1920s	23	3	10	0	10	0	0.3
South Africa	1930s	27	4	10	0	13	0	0.4
South Africa	1940s	12	0	7	0	5	0	0
South Africa	1950s	35	12	15	0	8	0	0.8
South Africa	1960s	31	7	8	0	16	0	0.875
South Africa	1970s	4	4	0	0	0	0	0
South Africa	1990s	243	139	74	1	24	5	1.878
South Africa	2000s	388	227	127	4	23	7	1.787
South Africa	2010s	367	210	129	2	20	6	1.627
South Africa	2020s	57	28	26	0	0	3	1.076
South Africa	matches batting first	618	332	204	3	66	13	1.627
South Africa	matches fielding first	609	310	229	4	58	8	1.353
South Africa	won match	642	642	0	0	0	0	0
South Africa	lost match	433	0	433	0	0	0	0
South Africa	tied match	7	0	0	7	0	0	0
South Africa	drawn match	124	0	0	0	124	0	0
South Africa	no result	21	0	0	0	0	21	0
South Africa	won batting first	332	332	0	0	0	0	0
South Africa	won fielding first	310	310	0	0	0	0	0
South Africa	lost batting first	204	0	204	0	0	0	0
South Africa	lost fielding first	229	0	229	0	0	0	0
South Africa	tied batting first	3	0	0	3	0	0	0
South Africa	tied fielding first	4	0	0	4	0	0	0
South Africa	drawn batting first	66	0	0	0	66	0	0
South Africa	drawn fielding first	58	0	0	0	58	0	0
South Africa	World Cup	64	38	23	2	0	1	1.652
South Africa	Basil D'Oliveira	28	9	12	0	7	0	0.75
South Africa	ICC Champions Trophy	24	12	11	1	0	0	1.09
South Africa	ICC World Test Champ	13	5	8	0	0	0	0.625
South Africa	Men's T20 World Cup	35	22	13	0	0	0	1.692
Sri Lanka	overall	1314	555	621	7	91	40	0.893
Sri Lanka	Test matches	299	95	113	0	91	0	0.84
Sri Lanka	One-Day Internationals	867	393	431	5	0	38	0.911
Sri Lanka	Twenty20 Internationals	148	67	77	2	0	2	0.87
Sri Lanka	v Afghanistan	5	4	1	0	0	0	4
Sri Lanka	v Australia	145	44	89	0	8	4	0.494
Sri Lanka	v Bangladesh	85	65	14	0	4	2	4.642
Sri Lanka	v England	127	48	64	1	11	3	0.75
Sri Lanka	v India	228	71	127	1	17	12	0.559
Sri Lanka	v New Zealand	154	57	75	2	11	9	0.76
Sri Lanka	v Pakistan	231	82	125	1	19	4	0.656
Sri Lanka	v South Africa	128	47	72	2	6	1	0.652
Sri Lanka	v West Indies	102	48	42	0	9	3	1.142
Sri Lanka	in Africa	129	56	61	2	7	3	0.918
Sri Lanka	in Americas	53	23	24	0	5	1	0.958
Sri Lanka	in Asia	830	380	355	3	64	28	1.07
Sri Lanka	in Europe	104	43	51	1	7	2	0.843
Sri Lanka	in Oceania	198	53	130	1	8	6	0.407
Sri Lanka	home	467	239	162	1	42	23	1.475
Sri Lanka	away	510	170	278	3	46	13	0.611
Sri Lanka	neutral	337	146	181	3	3	4	0.806
Sri Lanka	1970s	5	1	4	0	0	0	0.25
Sri Lanka	1980s	124	21	88	0	11	4	0.238
Sri Lanka	1990s	284	112	129	2	31	10	0.868
Sri Lanka	2000s	397	214	152	1	21	9	1.407
Sri Lanka	2010s	449	188	218	4	24	15	0.862
Sri Lanka	2020s	55	19	30	0	4	2	0.633
Sri Lanka	matches batting first	672	290	314	4	46	18	0.923
Sri Lanka	matches fielding first	641	265	307	3	45	21	0.863
Sri Lanka	won match	555	555	0	0	0	0	0
Sri Lanka	lost match	621	0	621	0	0	0	0
Sri Lanka	tied match	7	0	0	7	0	0	0
Sri Lanka	drawn match	91	0	0	0	91	0	0
Sri Lanka	no result	40	0	0	0	0	40	0
Sri Lanka	won batting first	290	290	0	0	0	0	0
Sri Lanka	won fielding first	265	265	0	0	0	0	0
Sri Lanka	lost batting first	314	0	314	0	0	0	0
Sri Lanka	lost fielding first	307	0	307	0	0	0	0
Sri Lanka	tied batting first	4	0	0	4	0	0	0
Sri Lanka	tied fielding first	3	0	0	3	0	0	0
Sri Lanka	drawn batting first	46	0	0	0	46	0	0
Sri Lanka	drawn fielding first	45	0	0	0	45	0	0
Sri Lanka	World Cup	80	38	39	1	0	2	0.974
Sri Lanka	Asia Cup	54	35	19	0	0	0	1.842
Sri Lanka	ICC Champions Trophy	27	14	11	0	0	2	1.272
Sri Lanka	ICC World Test Champ	14	4	6	0	4	0	0.666
Sri Lanka	Men's T20 World Cup	43	27	15	1	0	0	1.8
West Indies	overall	1543	646	667	14	177	39	0.968
West Indies	Test matches	560	178	204	1	177	0	0.872
West Indies	One-Day Internationals	831	405	386	10	0	30	1.049
West Indies	Twenty20 Internationals	152	63	77	3	0	9	0.818
West Indies	v Afghanistan	17	10	6	0	0	1	1.666
West Indies	v Australia	276	103	141	4	25	3	0.73
West Indies	v Bangladesh	72	40	27	0	2	3	1.481
West Indies	v England	281	113	111	0	51	6	1.018
West Indies	v India	248	99	96	2	46	5	1.031
West Indies	v New Zealand	130	46	53	3	19	9	0.867
West Indies	v Pakistan	209	92	96	3	15	3	0.958
West Indies	v South Africa	108	24	74	1	7	2	0.324
West Indies	v Sri Lanka	102	42	48	0	9	3	0.875
West Indies	in Africa	95	36	51	1	5	2	0.705
West Indies	in Americas	596	266	212	4	97	17	1.254
West Indies	in Asia	367	150	175	3	33	6	0.857
West Indies	in Europe	192	80	83	1	22	6	0.963
West Indies	in Oceania	293	114	146	5	20	8	0.78
West Indies	home	579	259	203	4	97	16	1.275
West Indies	away	670	239	330	7	80	14	0.724
West Indies	neutral	294	148	134	3	0	9	1.104
West Indies	1920s	3	0	3	0	0	0	0
West Indies	1930s	19	4	9	0	6	0	0.444
West Indies	1940s	9	3	0	0	6	0	0
West Indies	1950s	48	18	17	0	13	0	1.058
West Indies	1960s	49	18	13	1	17	0	1.384
West Indies	1970s	86	35	21	0	30	0	1.666
West Indies	1980s	252	165	54	1	31	1	3.055
West Indies	1990s	276	126	117	4	23	6	1.076
West Indies	2000s	358	120	190	2	31	15	0.631
West Indies	2010s	380	134	210	6	18	12	0.638
West Indies	2020s	63	23	33	0	2	5	0.696
West Indies	matches batting first	694	288	306	6	73	21	0.941
West Indies	matches fielding first	847	358	361	8	104	16	0.991
West Indies	won match	646	646	0	0	0	0	0
West Indies	lost match	667	0	667	0	0	0	0
West Indies	tied match	14	0	0	14	0	0	0
West Indies	drawn match	177	0	0	0	177	0	0
West Indies	no result	39	0	0	0	0	39	0
West Indies	won batting first	288	288	0	0	0	0	0
West Indies	won fielding first	358	358	0	0	0	0	0
West Indies	lost batting first	306	0	306	0	0	0	0
West Indies	lost fielding first	361	0	361	0	0	0	0
West Indies	tied batting first	6	0	0	6	0	0	0
West Indies	tied fielding first	8	0	0	8	0	0	0
West Indies	drawn batting first	73	0	0	0	73	0	0
West Indies	drawn fielding first	104	0	0	0	104	0	0
West Indies	World Cup	80	43	35	0	0	2	1.228
West Indies	Frank Worrell Trophy	101	30	47	1	23	0	0.638
West Indies	ICC Champions Trophy	24	13	10	1	0	0	1.3
West Indies	ICC World Test Champ	17	4	11	0	2	0	0.363
West Indies	Men's T20 World Cup	36	18	16	1	0	1	1.125
West Indies	The Wisden Trophy	120	48	36	0	36	0	1.333
West Indies	World Cup Qualifier	7	5	2	0	0	0	2.5
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (team_id, name, img) FROM stdin;
1	Pakistan	pakistan.jpg
2	India	india.jpg
3	Australia	australia.jpg
4	England	england.png
5	New Zealand 	newzealand.png
6	South Africa	southafrica.jpg
7	West Indies	westindies.png
8	Bangladesh	bangladesh.png
9	Sri Lanka	srilanka.png
10	Afghanistan 	afghanistan.png
\.


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_player_id_seq', 12, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 10, true);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- PostgreSQL database dump complete
--

