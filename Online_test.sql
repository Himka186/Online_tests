--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-09 16:27:27

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16528)
-- Name: Option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Option" (
    option_id bigint NOT NULL,
    question_id bigint,
    option_text character varying(255) NOT NULL,
    is_correct boolean DEFAULT false
);


ALTER TABLE public."Option" OWNER TO postgres;

--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE "Option"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Option" IS 'Для хранения информации о вариантах ответов на вопросы';


--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN "Option".option_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Option".option_id IS 'уник. идентификатоор варианта ответа';


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN "Option".question_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Option".question_id IS 'идентификатор связанного вопроса';


--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN "Option".option_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Option".option_text IS 'текст варианта ответа';


--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN "Option".is_correct; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Option".is_correct IS 'флаг, указывающий, является ли этот вариант ответа правильным';


--
-- TOC entry 221 (class 1259 OID 16527)
-- Name: Option_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Option" ALTER COLUMN option_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Option_option_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16517)
-- Name: Questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Questions" (
    question_id bigint NOT NULL,
    test_id bigint,
    question_text character varying(255) NOT NULL
);


ALTER TABLE public."Questions" OWNER TO postgres;

--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE "Questions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Questions" IS 'Хранения информации о вопросах в тестах';


--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "Questions".question_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Questions".question_id IS 'уник. идентификатор вопроса';


--
-- TOC entry 4837 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "Questions".test_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Questions".test_id IS 'идентификатор связанного теста';


--
-- TOC entry 4838 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "Questions".question_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Questions".question_text IS 'Текст вопроса';


--
-- TOC entry 219 (class 1259 OID 16516)
-- Name: Questions_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Questions" ALTER COLUMN question_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Questions_question_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16540)
-- Name: Result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Result" (
    result_id integer NOT NULL,
    user_id bigint,
    test_id bigint,
    score bigint,
    time_finished timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Result" OWNER TO postgres;

--
-- TOC entry 4839 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE "Result"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Result" IS 'Результаты теста';


--
-- TOC entry 218 (class 1259 OID 16510)
-- Name: Tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tests" (
    test_id bigint NOT NULL,
    test_name character varying(50) NOT NULL,
    test_description character varying(255) NOT NULL,
    created_time timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Tests" OWNER TO postgres;

--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE "Tests"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Tests" IS 'Для хранения информации о тестах';


--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "Tests".test_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Tests".test_id IS 'уник. идентификатор теста';


--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "Tests".test_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Tests".test_name IS 'Имя теста';


--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "Tests".test_description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Tests".test_description IS 'Описание теста';


--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN "Tests".created_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Tests".created_time IS 'Дата создания теста';


--
-- TOC entry 217 (class 1259 OID 16509)
-- Name: Tests_test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Tests" ALTER COLUMN test_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Tests_test_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16504)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    user_id bigint NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(50) NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE "Users"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Users" IS 'Для хранения информации о пользователях ';


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN "Users".user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Users".user_id IS 'Уникальный идентификатор пользователя';


--
-- TOC entry 215 (class 1259 OID 16503)
-- Name: Users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Users" ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16539)
-- Name: test_result_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.test_result_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.test_result_result_id_seq OWNER TO postgres;

--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 223
-- Name: test_result_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.test_result_result_id_seq OWNED BY public."Result".result_id;


--
-- TOC entry 4656 (class 2604 OID 16543)
-- Name: Result result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Result" ALTER COLUMN result_id SET DEFAULT nextval('public.test_result_result_id_seq'::regclass);


--
-- TOC entry 4822 (class 0 OID 16528)
-- Dependencies: 222
-- Data for Name: Option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Option" (option_id, question_id, option_text, is_correct) FROM stdin;
2	1	Ответ 3 для вопроса 1	f
3	1	Ответ 2 для вопроса 1	f
4	1	Ответ 1 для вопроса 1	t
\.


--
-- TOC entry 4820 (class 0 OID 16517)
-- Dependencies: 220
-- Data for Name: Questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Questions" (question_id, test_id, question_text) FROM stdin;
1	1	Вопрос 2 для теста 1
2	1	Вопрос 1 для теста 1
\.


--
-- TOC entry 4824 (class 0 OID 16540)
-- Dependencies: 224
-- Data for Name: Result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Result" (result_id, user_id, test_id, score, time_finished) FROM stdin;
\.


--
-- TOC entry 4818 (class 0 OID 16510)
-- Dependencies: 218
-- Data for Name: Tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tests" (test_id, test_name, test_description, created_time) FROM stdin;
1	Тест 1	Описание теста 1	2024-04-07 14:20:01.02806+05
2	Тест 2	Описание теста 2	2024-04-07 14:20:47.642749+05
\.


--
-- TOC entry 4816 (class 0 OID 16504)
-- Dependencies: 216
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (user_id, username, password, email) FROM stdin;
\.


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 221
-- Name: Option_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Option_option_id_seq"', 4, true);


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 219
-- Name: Questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Questions_question_id_seq"', 2, true);


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 217
-- Name: Tests_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tests_test_id_seq"', 2, true);


--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 215
-- Name: Users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_user_id_seq"', 1, false);


--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 223
-- Name: test_result_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_result_result_id_seq', 1, false);


--
-- TOC entry 4665 (class 2606 OID 16533)
-- Name: Option Option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Option"
    ADD CONSTRAINT "Option_pkey" PRIMARY KEY (option_id);


--
-- TOC entry 4663 (class 2606 OID 16521)
-- Name: Questions Questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Questions"
    ADD CONSTRAINT "Questions_pkey" PRIMARY KEY (question_id);


--
-- TOC entry 4661 (class 2606 OID 16515)
-- Name: Tests Tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tests"
    ADD CONSTRAINT "Tests_pkey" PRIMARY KEY (test_id);


--
-- TOC entry 4659 (class 2606 OID 16508)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);


--
-- TOC entry 4667 (class 2606 OID 16546)
-- Name: Result test_result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT test_result_pkey PRIMARY KEY (result_id);


--
-- TOC entry 4669 (class 2606 OID 16534)
-- Name: Option Option_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Option"
    ADD CONSTRAINT "Option_question_id_fkey" FOREIGN KEY (question_id) REFERENCES public."Questions"(question_id);


--
-- TOC entry 4668 (class 2606 OID 16522)
-- Name: Questions Questions_test_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Questions"
    ADD CONSTRAINT "Questions_test_id_fkey" FOREIGN KEY (test_id) REFERENCES public."Tests"(test_id);


--
-- TOC entry 4670 (class 2606 OID 16552)
-- Name: Result Result_test_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_test_id_fkey" FOREIGN KEY (test_id) REFERENCES public."Tests"(test_id) NOT VALID;


--
-- TOC entry 4671 (class 2606 OID 16547)
-- Name: Result test_result_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT test_result_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."Users"(user_id);


-- Completed on 2024-04-09 16:27:28

--
-- PostgreSQL database dump complete
--

