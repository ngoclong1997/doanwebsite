--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 9.6.15

-- Started on 2019-10-09 00:28:37 +07

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
-- TOC entry 1 (class 3079 OID 12655)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 24595)
-- Name: answer; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.answer (
    id bigint NOT NULL,
    subject_id bigint NOT NULL,
    test_code character varying(10) NOT NULL,
    answers character varying(255) NOT NULL,
	exam_code character varying(255),
	exam_id bigint NOT NULL,
    added_by character varying(50),
    modified_by character varying(50),
    created_at timestamp without time zone,
    modified_at timestamp without time zone
);


ALTER TABLE public.answer OWNER TO admin_user;

--
-- TOC entry 189 (class 1259 OID 24608)
-- Name: answer_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public.answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answer_id_seq OWNER TO admin_user;

--
-- TOC entry 199 (class 1259 OID 24661)
-- Name: exam; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.exam (
    id bigint NOT NULL,
    name character varying(512) NOT NULL,
    start_date timestamp without time zone NOT NULL,
    description character varying(1024),
    added_by character varying(50),
    modified_by character varying(50),
    created_at timestamp without time zone,
    modified_at timestamp without time zone
);


ALTER TABLE public.exam OWNER TO admin_user;

--
-- TOC entry 198 (class 1259 OID 24659)
-- Name: exam_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public.exam_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exam_id_seq OWNER TO admin_user;

--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 198
-- Name: exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.exam_id_seq OWNED BY public.exam.id;


--
-- TOC entry 191 (class 1259 OID 24612)
-- Name: grade; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.grade (
    student_id bigint NOT NULL,
    subject_id bigint NOT NULL,
    point numeric(2,2) NOT NULL,
    exam_id bigint NOT NULL,
	created_at timestamp without time zone,
    modified_at timestamp without time zone,
    added_by character varying(50),
    modified_by character varying(50)
);


ALTER TABLE public.grade OWNER TO admin_user;

--
-- TOC entry 195 (class 1259 OID 24627)
-- Name: role; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.role (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(500),
    created_at timestamp without time zone,
    modified_at timestamp without time zone,
    added_by character varying(50),
    modified_by character varying(50)
);


ALTER TABLE public.role OWNER TO admin_user;

--
-- TOC entry 194 (class 1259 OID 24625)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO admin_user;

--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 194
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 188 (class 1259 OID 24602)
-- Name: student; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.student (
    id bigint NOT NULL,
    code character varying(10) NOT NULL,
	lastname character varying(50) NOT NULL,
    firstname character varying(30) NOT NULL,
	dob timestamp without time zone NOT NULL,
    gender character varying(5) NOT NULL,
    exam_id bigint NOT NULL,
	added_by character varying(50),
    modified_by character varying(50),
    created_at timestamp without time zone,
    modified_at timestamp without time zone
    
);


ALTER TABLE public.student OWNER TO admin_user;

--
-- TOC entry 187 (class 1259 OID 24600)
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public.student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_seq OWNER TO admin_user;

--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 187
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- TOC entry 185 (class 1259 OID 24590)
-- Name: subject; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.subject (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    exam_id bigint DEFAULT 0 NOT NULL,
	created_at timestamp without time zone,
    modified_at timestamp without time zone,
    added_by character varying(50),
    modified_by character varying(50)
);


ALTER TABLE public.subject OWNER TO admin_user;

--
-- TOC entry 190 (class 1259 OID 24610)
-- Name: subject_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public.subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_id_seq OWNER TO admin_user;

--
-- TOC entry 193 (class 1259 OID 24619)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
	firstname character varying(50) NOT NULL,
	lastname character varying(100) NOT NULL,
	email character varying(255) NOT NULL,
	enabled boolean NOT NULL,
    added_by character varying(50),
    modified_by character varying(50),
    created_at timestamp without time zone,
    modified_at timestamp without time zone
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 24617)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 192
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 197 (class 1259 OID 24638)
-- Name: user_role; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.user_role (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    created_at timestamp without time zone,
    modified_at timestamp without time zone,
    added_by character varying(50),
    modified_by character varying(50)
);


ALTER TABLE public.user_role OWNER TO admin_user;

--
-- TOC entry 2316 (class 2604 OID 24664)
-- Name: exam id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.exam ALTER COLUMN id SET DEFAULT nextval('public.exam_id_seq'::regclass);


--
-- TOC entry 2314 (class 2604 OID 24630)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 2312 (class 2604 OID 24605)
-- Name: student id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- TOC entry 2313 (class 2604 OID 24622)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);

--
-- TOC entry 2320 (class 2606 OID 24599)
-- Name: answer answer_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 24669)
-- Name: exam exam_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 24616)
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (student_id, subject_id);


--
-- TOC entry 2328 (class 2606 OID 24654)
-- Name: grade grade_student_id_subject_id_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_student_id_subject_id_uniq UNIQUE (student_id, subject_id);


--
-- TOC entry 2334 (class 2606 OID 24656)
-- Name: role role_name_key; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- TOC entry 2336 (class 2606 OID 24635)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 24658)
-- Name: student student_code_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_code_uniq UNIQUE (code);


--
-- TOC entry 2324 (class 2606 OID 24607)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 24594)
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 24624)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 24643)
-- Name: user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);
	
ALTER TABLE public.user_role ADD CONSTRAINT user_role_user_id_fk FOREIGN KEY (user_id) REFERENCES public.user(id);
ALTER TABLE public.user_role ADD CONSTRAINT user_role_role_id_fk FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- TOC entry 2332 (class 2606 OID 24645)
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);
	
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


-- Completed on 2019-10-09 00:28:38 +07

--
-- PostgreSQL database dump complete
--

