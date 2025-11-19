--
-- PostgreSQL database dump
--

\restrict AUiVtJo2cRHItmGUHnB4T73WTFmNMlGfkHtcdEm4wNbRgF1xulPAEcDbZ3Dz7ee

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

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
-- Name: test1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test1 (
    id integer
);


ALTER TABLE public.test1 OWNER TO postgres;

--
-- Data for Name: test1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test1 (id) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict AUiVtJo2cRHItmGUHnB4T73WTFmNMlGfkHtcdEm4wNbRgF1xulPAEcDbZ3Dz7ee

