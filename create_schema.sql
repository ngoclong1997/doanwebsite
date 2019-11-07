--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

-- Started on 2019-11-01 17:57:08

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
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 2882
-- Name: DATABASE graduation_thesis; Type: COMMENT; Schema: -; Owner: admin_user
--

COMMENT ON DATABASE graduation_thesis IS 'This is my graduation thesis project';


--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 24597)
-- Name: answer; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.answer (
    id bigint NOT NULL,
    subject_id bigint NOT NULL,
    test_code character varying(10) NOT NULL,
    answers character varying(255) NOT NULL,
    exam_id bigint NOT NULL,
    added_by character varying(50),
    modified_by character varying(50),
    created_at timestamp without time zone,
    modified_at timestamp without time zone
);


ALTER TABLE public.answer OWNER TO admin_user;

--
-- TOC entry 197 (class 1259 OID 24603)
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
-- TOC entry 198 (class 1259 OID 24605)
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
-- TOC entry 199 (class 1259 OID 24611)
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
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 199
-- Name: exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.exam_id_seq OWNED BY public.exam.id;


--
-- TOC entry 211 (class 1259 OID 24688)
-- Name: exam_subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exam_subject (
    exam_id bigint NOT NULL,
    subject_id bigint NOT NULL
);


ALTER TABLE public.exam_subject OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24613)
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
-- TOC entry 201 (class 1259 OID 24616)
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
-- TOC entry 202 (class 1259 OID 24618)
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
-- TOC entry 203 (class 1259 OID 24624)
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
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 203
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 204 (class 1259 OID 24626)
-- Name: student; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.student (
    id bigint NOT NULL,
    code character varying(10) NOT NULL,
    lastname character varying(50) NOT NULL,
    firstname character varying(30) NOT NULL,
    gender character varying(5) NOT NULL,
    exam_id bigint NOT NULL,
    added_by character varying(50),
    modified_by character varying(50),
    created_at timestamp without time zone,
    modified_at timestamp without time zone,
    dob character varying(15)
);


ALTER TABLE public.student OWNER TO admin_user;

--
-- TOC entry 205 (class 1259 OID 24629)
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
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 205
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- TOC entry 206 (class 1259 OID 24631)
-- Name: subject; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public.subject (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp without time zone,
    modified_at timestamp without time zone,
    added_by character varying(50),
    modified_by character varying(50)
);


ALTER TABLE public.subject OWNER TO admin_user;

--
-- TOC entry 207 (class 1259 OID 24635)
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
-- TOC entry 208 (class 1259 OID 24637)
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
-- TOC entry 209 (class 1259 OID 24643)
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
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 210 (class 1259 OID 24645)
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
-- TOC entry 2718 (class 2604 OID 24648)
-- Name: exam id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.exam ALTER COLUMN id SET DEFAULT nextval('public.exam_id_seq'::regclass);


--
-- TOC entry 2719 (class 2604 OID 24649)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 2720 (class 2604 OID 24650)
-- Name: student id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- TOC entry 2721 (class 2604 OID 24651)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 2723 (class 2606 OID 24653)
-- Name: answer answer_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 24714)
-- Name: answer answer_subject_id_exam_id_test_code_key; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_subject_id_exam_id_test_code_key UNIQUE (subject_id, exam_id, test_code);


--
-- TOC entry 2727 (class 2606 OID 24655)
-- Name: exam exam_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 24692)
-- Name: exam_subject exam_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_subject
    ADD CONSTRAINT exam_subject_pkey PRIMARY KEY (subject_id, exam_id);


--
-- TOC entry 2729 (class 2606 OID 24657)
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (student_id, subject_id);


--
-- TOC entry 2731 (class 2606 OID 24659)
-- Name: grade grade_student_id_subject_id_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_student_id_subject_id_uniq UNIQUE (student_id, subject_id);


--
-- TOC entry 2733 (class 2606 OID 24661)
-- Name: role role_name_key; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- TOC entry 2735 (class 2606 OID 24663)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 24712)
-- Name: student student_code_exam_id_key; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_code_exam_id_key UNIQUE (code, exam_id);


--
-- TOC entry 2739 (class 2606 OID 24667)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 24669)
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 24671)
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 2745 (class 2606 OID 24673)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 24675)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2747 (class 2606 OID 24677)
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- TOC entry 2754 (class 2606 OID 24693)
-- Name: exam_subject exam_subject_exam_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_subject
    ADD CONSTRAINT exam_subject_exam_id_fk FOREIGN KEY (exam_id) REFERENCES public.exam(id);


--
-- TOC entry 2755 (class 2606 OID 24698)
-- Name: exam_subject exam_subject_subject_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_subject
    ADD CONSTRAINT exam_subject_subject_id_fk FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- TOC entry 2752 (class 2606 OID 24678)
-- Name: user_role user_role_role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_role_id_fk FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- TOC entry 2753 (class 2606 OID 24683)
-- Name: user_role user_role_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_user_id_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);


-- Completed on 2019-11-01 17:57:09

--
-- PostgreSQL database dump complete
--

