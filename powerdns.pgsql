--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cryptokeys; Type: TABLE; Schema: public; Owner: pdns; Tablespace: 
--

CREATE TABLE cryptokeys (
    id integer NOT NULL,
    domain_id integer,
    flags integer NOT NULL,
    active boolean,
    content text
);


/* ALTER TABLE public.cryptokeys OWNER TO pdns; */

--
-- Name: cryptokeys_id_seq; Type: SEQUENCE; Schema: public; Owner: pdns
--

CREATE SEQUENCE cryptokeys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


/* ALTER TABLE public.cryptokeys_id_seq OWNER TO pdns; */

--
-- Name: cryptokeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pdns
--

ALTER SEQUENCE cryptokeys_id_seq OWNED BY cryptokeys.id;


--
-- Name: domainmetadata; Type: TABLE; Schema: public; Owner: pdns; Tablespace: 
--

CREATE TABLE domainmetadata (
    id integer NOT NULL,
    domain_id integer,
    kind character varying(16),
    content text
);


/* ALTER TABLE public.domainmetadata OWNER TO pdns; */

--
-- Name: domainmetadata_id_seq; Type: SEQUENCE; Schema: public; Owner: pdns
--

CREATE SEQUENCE domainmetadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


/* ALTER TABLE public.domainmetadata_id_seq OWNER TO pdns; */

--
-- Name: domainmetadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pdns
--

ALTER SEQUENCE domainmetadata_id_seq OWNED BY domainmetadata.id;


--
-- Name: domains; Type: TABLE; Schema: public; Owner: pdns; Tablespace: 
--

CREATE TABLE domains (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    master character varying(20) DEFAULT NULL::character varying,
    last_check integer,
    type character varying(6) NOT NULL,
    notified_serial integer,
    account character varying(40) DEFAULT NULL::character varying
);


/* ALTER TABLE public.domains OWNER TO pdns; */

--
-- Name: domains_id_seq; Type: SEQUENCE; Schema: public; Owner: pdns
--

CREATE SEQUENCE domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


/* ALTER TABLE public.domains_id_seq OWNER TO pdns; */

--
-- Name: domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pdns
--

ALTER SEQUENCE domains_id_seq OWNED BY domains.id;


--
-- Name: records; Type: TABLE; Schema: public; Owner: pdns; Tablespace: 
--

CREATE TABLE records (
    id integer NOT NULL,
    domain_id integer,
    name character varying(255) DEFAULT NULL::character varying,
    type character varying(10) DEFAULT NULL::character varying,
    content character varying(65535) DEFAULT NULL::character varying,
    ttl integer,
    prio integer,
    change_date integer,
    ordername character varying(255),
    auth boolean
);


/* ALTER TABLE public.records OWNER TO pdns; */

--
-- Name: records_id_seq; Type: SEQUENCE; Schema: public; Owner: pdns
--

CREATE SEQUENCE records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


/* ALTER TABLE public.records_id_seq OWNER TO pdns; */

--
-- Name: records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pdns
--

ALTER SEQUENCE records_id_seq OWNED BY records.id;


--
-- Name: supermasters; Type: TABLE; Schema: public; Owner: pdns; Tablespace: 
--

CREATE TABLE supermasters (
    ip character varying(64) NOT NULL,
    nameserver character varying(255) NOT NULL,
    account character varying(40) DEFAULT NULL::character varying
);


/* ALTER TABLE public.supermasters OWNER TO pdns; */

--
-- Name: tsigkeys; Type: TABLE; Schema: public; Owner: pdns; Tablespace: 
--

CREATE TABLE tsigkeys (
    id integer NOT NULL,
    name character varying(255),
    algorithm character varying(255),
    secret character varying(255)
);


/* ALTER TABLE public.tsigkeys OWNER TO pdns; */

--
-- Name: tsigkeys_id_seq; Type: SEQUENCE; Schema: public; Owner: pdns
--

CREATE SEQUENCE tsigkeys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


/* ALTER TABLE public.tsigkeys_id_seq OWNER TO pdns; */

--
-- Name: tsigkeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pdns
--

ALTER SEQUENCE tsigkeys_id_seq OWNED BY tsigkeys.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pdns
--

ALTER TABLE ONLY cryptokeys ALTER COLUMN id SET DEFAULT nextval('cryptokeys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pdns
--

ALTER TABLE ONLY domainmetadata ALTER COLUMN id SET DEFAULT nextval('domainmetadata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pdns
--

ALTER TABLE ONLY domains ALTER COLUMN id SET DEFAULT nextval('domains_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pdns
--

ALTER TABLE ONLY records ALTER COLUMN id SET DEFAULT nextval('records_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pdns
--

ALTER TABLE ONLY tsigkeys ALTER COLUMN id SET DEFAULT nextval('tsigkeys_id_seq'::regclass);


--
-- Data for Name: cryptokeys; Type: TABLE DATA; Schema: public; Owner: pdns
--

COPY cryptokeys (id, domain_id, flags, active, content) FROM stdin;
\.


--
-- Name: cryptokeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdns
--

SELECT pg_catalog.setval('cryptokeys_id_seq', 1, false);


--
-- Data for Name: domainmetadata; Type: TABLE DATA; Schema: public; Owner: pdns
--

COPY domainmetadata (id, domain_id, kind, content) FROM stdin;
\.


--
-- Name: domainmetadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdns
--

SELECT pg_catalog.setval('domainmetadata_id_seq', 1, false);


--
-- Data for Name: domains; Type: TABLE DATA; Schema: public; Owner: pdns
--

COPY domains (id, name, master, last_check, type, notified_serial, account) FROM stdin;
\.


--
-- Name: domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdns
--

SELECT pg_catalog.setval('domains_id_seq', 1, false);


--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: pdns
--

COPY records (id, domain_id, name, type, content, ttl, prio, change_date, ordername, auth) FROM stdin;
\.


--
-- Name: records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdns
--

SELECT pg_catalog.setval('records_id_seq', 1, false);


--
-- Data for Name: supermasters; Type: TABLE DATA; Schema: public; Owner: pdns
--

COPY supermasters (ip, nameserver, account) FROM stdin;
\.


--
-- Data for Name: tsigkeys; Type: TABLE DATA; Schema: public; Owner: pdns
--

COPY tsigkeys (id, name, algorithm, secret) FROM stdin;
\.


--
-- Name: tsigkeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdns
--

SELECT pg_catalog.setval('tsigkeys_id_seq', 1, false);


--
-- Name: cryptokeys_pkey; Type: CONSTRAINT; Schema: public; Owner: pdns; Tablespace: 
--

ALTER TABLE ONLY cryptokeys
    ADD CONSTRAINT cryptokeys_pkey PRIMARY KEY (id);


--
-- Name: domainmetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: pdns; Tablespace: 
--

ALTER TABLE ONLY domainmetadata
    ADD CONSTRAINT domainmetadata_pkey PRIMARY KEY (id);


--
-- Name: domains_pkey; Type: CONSTRAINT; Schema: public; Owner: pdns; Tablespace: 
--

ALTER TABLE ONLY domains
    ADD CONSTRAINT domains_pkey PRIMARY KEY (id);


--
-- Name: records_pkey; Type: CONSTRAINT; Schema: public; Owner: pdns; Tablespace: 
--

ALTER TABLE ONLY records
    ADD CONSTRAINT records_pkey PRIMARY KEY (id);


--
-- Name: tsigkeys_pkey; Type: CONSTRAINT; Schema: public; Owner: pdns; Tablespace: 
--

ALTER TABLE ONLY tsigkeys
    ADD CONSTRAINT tsigkeys_pkey PRIMARY KEY (id);


--
-- Name: domain_id; Type: INDEX; Schema: public; Owner: pdns; Tablespace: 
--

CREATE INDEX domain_id ON records USING btree (domain_id);


--
-- Name: name_index; Type: INDEX; Schema: public; Owner: pdns; Tablespace: 
--

CREATE UNIQUE INDEX name_index ON domains USING btree (name);


--
-- Name: namealgoindex; Type: INDEX; Schema: public; Owner: pdns; Tablespace: 
--

CREATE UNIQUE INDEX namealgoindex ON tsigkeys USING btree (name, algorithm);


--
-- Name: nametype_index; Type: INDEX; Schema: public; Owner: pdns; Tablespace: 
--

CREATE INDEX nametype_index ON records USING btree (name, type);


--
-- Name: orderindex; Type: INDEX; Schema: public; Owner: pdns; Tablespace: 
--

CREATE INDEX orderindex ON records USING btree (ordername);


--
-- Name: rec_name_index; Type: INDEX; Schema: public; Owner: pdns; Tablespace: 
--

CREATE INDEX rec_name_index ON records USING btree (name);


--
-- Name: cryptokeys_domain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pdns
--

ALTER TABLE ONLY cryptokeys
    ADD CONSTRAINT cryptokeys_domain_id_fkey FOREIGN KEY (domain_id) REFERENCES domains(id) ON DELETE CASCADE;


--
-- Name: domain_exists; Type: FK CONSTRAINT; Schema: public; Owner: pdns
--

ALTER TABLE ONLY records
    ADD CONSTRAINT domain_exists FOREIGN KEY (domain_id) REFERENCES domains(id) ON DELETE CASCADE;


--
-- Name: domainmetadata_domain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pdns
--

ALTER TABLE ONLY domainmetadata
    ADD CONSTRAINT domainmetadata_domain_id_fkey FOREIGN KEY (domain_id) REFERENCES domains(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

/* REVOKE ALL ON SCHEMA public FROM PUBLIC; */
/* REVOKE ALL ON SCHEMA public FROM postgres; */
/* GRANT ALL ON SCHEMA public TO postgres; */
/* GRANT ALL ON SCHEMA public TO PUBLIC; */


--
-- Name: cryptokeys; Type: ACL; Schema: public; Owner: pdns
--

/* REVOKE ALL ON TABLE cryptokeys FROM PUBLIC; */
/* REVOKE ALL ON TABLE cryptokeys FROM pdns; */
/* GRANT ALL ON TABLE cryptokeys TO pdns; */


--
-- Name: cryptokeys_id_seq; Type: ACL; Schema: public; Owner: pdns
--

/* REVOKE ALL ON SEQUENCE cryptokeys_id_seq FROM PUBLIC; */
/* REVOKE ALL ON SEQUENCE cryptokeys_id_seq FROM pdns; */
/* GRANT ALL ON SEQUENCE cryptokeys_id_seq TO pdns; */


--
-- Name: domainmetadata; Type: ACL; Schema: public; Owner: pdns
--

/* REVOKE ALL ON TABLE domainmetadata FROM PUBLIC; */
/* REVOKE ALL ON TABLE domainmetadata FROM pdns; */
/* GRANT ALL ON TABLE domainmetadata TO pdns; */


--
-- Name: domainmetadata_id_seq; Type: ACL; Schema: public; Owner: pdns
--

/* REVOKE ALL ON SEQUENCE domainmetadata_id_seq FROM PUBLIC; */
/* REVOKE ALL ON SEQUENCE domainmetadata_id_seq FROM pdns; */
/* GRANT ALL ON SEQUENCE domainmetadata_id_seq TO pdns; */


--
-- Name: domains; Type: ACL; Schema: public; Owner: pdns
--

/* REVOKE ALL ON TABLE domains FROM PUBLIC; */
/* REVOKE ALL ON TABLE domains FROM pdns; */
/* GRANT ALL ON TABLE domains TO pdns; */


--
-- Name: domains_id_seq; Type: ACL; Schema: public; Owner: pdns
--

/* REVOKE ALL ON SEQUENCE domains_id_seq FROM PUBLIC; */
/* REVOKE ALL ON SEQUENCE domains_id_seq FROM pdns; */
/* GRANT ALL ON SEQUENCE domains_id_seq TO pdns; */


--
-- Name: records; Type: ACL; Schema: public; Owner: pdns
--

/* REVOKE ALL ON TABLE records FROM PUBLIC; */
/* REVOKE ALL ON TABLE records FROM pdns; */
/* GRANT ALL ON TABLE records TO pdns; */


--
-- Name: records_id_seq; Type: ACL; Schema: public; Owner: pdns
--

/* REVOKE ALL ON SEQUENCE records_id_seq FROM PUBLIC; */
/* REVOKE ALL ON SEQUENCE records_id_seq FROM pdns; */
/* GRANT ALL ON SEQUENCE records_id_seq TO pdns; */


--
-- Name: supermasters; Type: ACL; Schema: public; Owner: pdns
--

/* REVOKE ALL ON TABLE supermasters FROM PUBLIC; */
/* REVOKE ALL ON TABLE supermasters FROM pdns; */
/* GRANT ALL ON TABLE supermasters TO pdns; */


--
-- Name: tsigkeys; Type: ACL; Schema: public; Owner: pdns
--

/* REVOKE ALL ON TABLE tsigkeys FROM PUBLIC; */
/* REVOKE ALL ON TABLE tsigkeys FROM pdns; */
/* GRANT ALL ON TABLE tsigkeys TO pdns; */


--
-- Name: tsigkeys_id_seq; Type: ACL; Schema: public; Owner: pdns
--

/* REVOKE ALL ON SEQUENCE tsigkeys_id_seq FROM PUBLIC; */
/* REVOKE ALL ON SEQUENCE tsigkeys_id_seq FROM pdns; */
/* GRANT ALL ON SEQUENCE tsigkeys_id_seq TO pdns; */


--
-- PostgreSQL database dump complete
--

