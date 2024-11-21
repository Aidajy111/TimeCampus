--
-- PostgreSQL database cluster dump
--

-- Started on 2024-11-21 13:44:46

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:UJETIpwzHvFmckHelfHvwg==$BDyv2i9Z9IJyyJ2xCRduBN0SFVSatfjRCMfc8erU8yE=:ikL7+T5sNx4VrDh1ka4ZhJ3IQmYNciLdqfdOQ6FVaq4=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1
-- Dumped by pg_dump version 17.1

-- Started on 2024-11-21 13:44:47

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

-- Completed on 2024-11-21 13:44:47

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1
-- Dumped by pg_dump version 17.1

-- Started on 2024-11-21 13:44:47

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 16472)
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    professor character varying(100),
    schedule text,
    student_id integer
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16471)
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_id_seq OWNER TO postgres;

--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 225
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- TOC entry 218 (class 1259 OID 16388)
-- Name: coyrses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coyrses (
    course_id integer NOT NULL,
    course_name character varying(100) NOT NULL,
    hours integer,
    price double precision,
    is_open boolean DEFAULT true
);


ALTER TABLE public.coyrses OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16387)
-- Name: coyrses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.coyrses ALTER COLUMN course_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.coyrses_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16456)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    event_type character varying(50) NOT NULL,
    event_date timestamp without time zone NOT NULL,
    location character varying(200),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    student_id integer,
    CONSTRAINT events_event_type_check CHECK (((event_type)::text = ANY ((ARRAY['academic'::character varying, 'extracurricular'::character varying, 'city'::character varying])::text[])))
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16455)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_id_seq OWNER TO postgres;

--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 223
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 228 (class 1259 OID 16486)
-- Name: exams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exams (
    id integer NOT NULL,
    course_id integer,
    exam_date timestamp without time zone NOT NULL,
    location character varying(200),
    notes text
);


ALTER TABLE public.exams OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16485)
-- Name: exams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exams_id_seq OWNER TO postgres;

--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 227
-- Name: exams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exams_id_seq OWNED BY public.exams.id;


--
-- TOC entry 222 (class 1259 OID 16446)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16445)
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_id_seq OWNER TO postgres;

--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 221
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- TOC entry 220 (class 1259 OID 16411)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    name character varying(30) NOT NULL,
    middlename character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    contacts character varying[],
    coyrse integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16410)
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.students ALTER COLUMN student_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16500)
-- Name: volunteering; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteering (
    id integer NOT NULL,
    event_id integer,
    organization character varying(100),
    role character varying(100)
);


ALTER TABLE public.volunteering OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16499)
-- Name: volunteering_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.volunteering_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.volunteering_id_seq OWNER TO postgres;

--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 229
-- Name: volunteering_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.volunteering_id_seq OWNED BY public.volunteering.id;


--
-- TOC entry 4676 (class 2604 OID 16475)
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- TOC entry 4674 (class 2604 OID 16459)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 4677 (class 2604 OID 16489)
-- Name: exams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams ALTER COLUMN id SET DEFAULT nextval('public.exams_id_seq'::regclass);


--
-- TOC entry 4672 (class 2604 OID 16449)
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- TOC entry 4678 (class 2604 OID 16503)
-- Name: volunteering id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteering ALTER COLUMN id SET DEFAULT nextval('public.volunteering_id_seq'::regclass);


--
-- TOC entry 4855 (class 0 OID 16472)
-- Dependencies: 226
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, name, professor, schedule, student_id) FROM stdin;
1	Математика	Проф. Сидоров	Пн, Ср, Пт 9:00-11:00	1
2	Физика	Проф. Петров	Вт, Чт 11:00-13:00	2
3	Программирование	Проф. Иванова	Пн, Чт 14:00-16:00	3
\.


--
-- TOC entry 4847 (class 0 OID 16388)
-- Dependencies: 218
-- Data for Name: coyrses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coyrses (course_id, course_name, hours, price, is_open) FROM stdin;
\.


--
-- TOC entry 4853 (class 0 OID 16456)
-- Dependencies: 224
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, title, description, event_type, event_date, location, created_at, student_id) FROM stdin;
1	Научная конференция	Конференция по актуальным научным вопросам.	academic	2024-12-01 10:00:00	Аудитория 101	2024-11-21 12:57:33.166392	1
2	Футбольный матч	Матч между командами университета.	extracurricular	2024-12-05 15:00:00	Стадион	2024-11-21 12:57:33.166392	2
3	Городская ярмарка	Ярмарка местных производителей.	city	2024-12-10 12:00:00	Центральная площадь	2024-11-21 12:57:33.166392	3
\.


--
-- TOC entry 4857 (class 0 OID 16486)
-- Dependencies: 228
-- Data for Name: exams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exams (id, course_id, exam_date, location, notes) FROM stdin;
1	1	2025-01-15 09:00:00	Аудитория 101	Не забудьте взять калькулятор.
2	2	2025-01-20 11:00:00	Аудитория 102	Тема: Оптика.
3	3	2025-01-25 14:00:00	Аудитория 103	Проектная работа.
\.


--
-- TOC entry 4851 (class 0 OID 16446)
-- Dependencies: 222
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, name, email, created_at) FROM stdin;
1	Иван Иванов	ivan.ivanov@example.com	2024-11-21 12:55:52.121187
2	Мария Петрова	maria.petrova@example.com	2024-11-21 12:55:52.121187
3	Алексей Смирнов	alexey.smirnov@example.com	2024-11-21 12:55:52.121187
\.


--
-- TOC entry 4849 (class 0 OID 16411)
-- Dependencies: 220
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, name, middlename, lastname, contacts, coyrse) FROM stdin;
\.


--
-- TOC entry 4859 (class 0 OID 16500)
-- Dependencies: 230
-- Data for Name: volunteering; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteering (id, event_id, organization, role) FROM stdin;
1	1	Научное общество	Участник
2	2	Спортивный клуб	Организатор
3	3	Городская администрация	Волонтер
\.


--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 225
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 3, true);


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 217
-- Name: coyrses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coyrses_course_id_seq', 1, false);


--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 223
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 3, true);


--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 227
-- Name: exams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exams_id_seq', 3, true);


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 221
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_seq', 3, true);


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 219
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_student_id_seq', 1, false);


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 229
-- Name: volunteering_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.volunteering_id_seq', 3, true);


--
-- TOC entry 4691 (class 2606 OID 16479)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 4681 (class 2606 OID 16393)
-- Name: coyrses coyrses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coyrses
    ADD CONSTRAINT coyrses_pkey PRIMARY KEY (course_id);


--
-- TOC entry 4689 (class 2606 OID 16465)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 4693 (class 2606 OID 16493)
-- Name: exams exams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_pkey PRIMARY KEY (id);


--
-- TOC entry 4685 (class 2606 OID 16454)
-- Name: student student_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_email_key UNIQUE (email);


--
-- TOC entry 4687 (class 2606 OID 16452)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- TOC entry 4683 (class 2606 OID 16417)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4695 (class 2606 OID 16505)
-- Name: volunteering volunteering_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteering
    ADD CONSTRAINT volunteering_pkey PRIMARY KEY (id);


--
-- TOC entry 4698 (class 2606 OID 16480)
-- Name: courses courses_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- TOC entry 4697 (class 2606 OID 16466)
-- Name: events events_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- TOC entry 4699 (class 2606 OID 16494)
-- Name: exams exams_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 4696 (class 2606 OID 16418)
-- Name: students students_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_courses FOREIGN KEY (coyrse) REFERENCES public.coyrses(course_id);


--
-- TOC entry 4700 (class 2606 OID 16506)
-- Name: volunteering volunteering_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteering
    ADD CONSTRAINT volunteering_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;


-- Completed on 2024-11-21 13:44:48

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-11-21 13:44:48

--
-- PostgreSQL database cluster dump complete
--

