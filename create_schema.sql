--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8
-- Dumped by pg_dump version 10.8

-- Started on 2019-10-25 11:02:54

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
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 26463)
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
-- TOC entry 197 (class 1259 OID 26469)
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
-- TOC entry 198 (class 1259 OID 26471)
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
-- TOC entry 199 (class 1259 OID 26477)
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
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 199
-- Name: exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.exam_id_seq OWNED BY public.exam.id;


--
-- TOC entry 200 (class 1259 OID 26479)
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
-- TOC entry 210 (class 1259 OID 26552)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO admin_user;

--
-- TOC entry 201 (class 1259 OID 26482)
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
-- TOC entry 202 (class 1259 OID 26488)
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
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 202
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 203 (class 1259 OID 26490)
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
-- TOC entry 204 (class 1259 OID 26493)
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
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 204
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- TOC entry 205 (class 1259 OID 26495)
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
-- TOC entry 206 (class 1259 OID 26499)
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
-- TOC entry 207 (class 1259 OID 26501)
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
-- TOC entry 208 (class 1259 OID 26507)
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
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 208
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 209 (class 1259 OID 26509)
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
-- TOC entry 2714 (class 2604 OID 26512)
-- Name: exam id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.exam ALTER COLUMN id SET DEFAULT nextval('public.exam_id_seq'::regclass);


--
-- TOC entry 2715 (class 2604 OID 26513)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 2716 (class 2604 OID 26514)
-- Name: student id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- TOC entry 2718 (class 2604 OID 26515)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);

--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 197
-- Name: answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public.answer_id_seq', 1, false);


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 199
-- Name: exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public.exam_id_seq', 1, false);


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 210
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public.hibernate_sequence', 2, true);


--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 202
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 204
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public.student_id_seq', 1, false);


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 206
-- Name: subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public.subject_id_seq', 1, false);


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 208
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 2720 (class 2606 OID 26517)
-- Name: answer answer_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 26519)
-- Name: exam exam_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 26521)
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (student_id, subject_id);


--
-- TOC entry 2726 (class 2606 OID 26523)
-- Name: grade grade_student_id_subject_id_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_student_id_subject_id_uniq UNIQUE (student_id, subject_id);


--
-- TOC entry 2728 (class 2606 OID 26525)
-- Name: role role_name_key; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- TOC entry 2730 (class 2606 OID 26527)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 26529)
-- Name: student student_code_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_code_uniq UNIQUE (code);


--
-- TOC entry 2734 (class 2606 OID 26531)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 26533)
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 26551)
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 2740 (class 2606 OID 26535)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 26537)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2742 (class 2606 OID 26549)
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- TOC entry 2746 (class 2606 OID 26543)
-- Name: user_role user_role_role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_role_id_fk FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- TOC entry 2745 (class 2606 OID 26538)
-- Name: user_role user_role_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_user_id_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);


-- Completed on 2019-10-25 11:02:55

--
-- PostgreSQL database dump complete
--

