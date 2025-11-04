--
-- PostgreSQL database dump
--

-- Dumped from database version 17.6 (Debian 17.6-2.pgdg13+1)
-- Dumped by pg_dump version 17.5

-- Started on 2025-11-04 17:04:59 UTC

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
-- TOC entry 220 (class 1259 OID 16401)
-- Name: Province; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Province" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Province" OWNER TO admin;

--
-- TOC entry 219 (class 1259 OID 16400)
-- Name: Province_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Province_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Province_id_seq" OWNER TO admin;

--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 219
-- Name: Province_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Province_id_seq" OWNED BY public."Province".id;


--
-- TOC entry 224 (class 1259 OID 16419)
-- Name: cart; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.cart OWNER TO admin;

--
-- TOC entry 223 (class 1259 OID 16418)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_id_seq OWNER TO admin;

--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 223
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- TOC entry 226 (class 1259 OID 16426)
-- Name: order; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    total_price integer NOT NULL,
    product_count integer NOT NULL,
    address text DEFAULT ''::text NOT NULL,
    province_id integer NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."order" OWNER TO admin;

--
-- TOC entry 228 (class 1259 OID 16437)
-- Name: order_detail; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.order_detail (
    id integer NOT NULL,
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    product_price integer NOT NULL,
    product_discount integer NOT NULL,
    count integer NOT NULL
);


ALTER TABLE public.order_detail OWNER TO admin;

--
-- TOC entry 227 (class 1259 OID 16436)
-- Name: order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_detail_id_seq OWNER TO admin;

--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.order_detail_id_seq OWNED BY public.order_detail.id;


--
-- TOC entry 225 (class 1259 OID 16425)
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_id_seq OWNER TO admin;

--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 225
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- TOC entry 222 (class 1259 OID 16410)
-- Name: product; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name text NOT NULL,
    detail text NOT NULL,
    price integer NOT NULL,
    watch_count integer DEFAULT 0 NOT NULL,
    image text NOT NULL,
    stock integer NOT NULL,
    place_of_sele_id integer NOT NULL
);


ALTER TABLE public.product OWNER TO admin;

--
-- TOC entry 221 (class 1259 OID 16409)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO admin;

--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 218 (class 1259 OID 16391)
-- Name: user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    phone text NOT NULL,
    address text DEFAULT ''::text NOT NULL,
    province_id integer NOT NULL,
    password text NOT NULL,
    rank boolean NOT NULL
);


ALTER TABLE public."user" OWNER TO admin;

--
-- TOC entry 217 (class 1259 OID 16390)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO admin;

--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 3301 (class 2604 OID 16404)
-- Name: Province id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Province" ALTER COLUMN id SET DEFAULT nextval('public."Province_id_seq"'::regclass);


--
-- TOC entry 3304 (class 2604 OID 16422)
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- TOC entry 3305 (class 2604 OID 16429)
-- Name: order id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- TOC entry 3308 (class 2604 OID 16440)
-- Name: order_detail id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_detail ALTER COLUMN id SET DEFAULT nextval('public.order_detail_id_seq'::regclass);


--
-- TOC entry 3302 (class 2604 OID 16413)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3299 (class 2604 OID 16394)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3479 (class 0 OID 16401)
-- Dependencies: 220
-- Data for Name: Province; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."Province" (id, name) VALUES (1, 'Bangkok');
INSERT INTO public."Province" (id, name) VALUES (2, 'Sisaket');
INSERT INTO public."Province" (id, name) VALUES (3, 'Kanchanaburi');
INSERT INTO public."Province" (id, name) VALUES (4, 'Phitsanulok');


--
-- TOC entry 3483 (class 0 OID 16419)
-- Dependencies: 224
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3485 (class 0 OID 16426)
-- Dependencies: 226
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3487 (class 0 OID 16437)
-- Dependencies: 228
-- Data for Name: order_detail; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3481 (class 0 OID 16410)
-- Dependencies: 222
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.product (id, name, detail, price, watch_count, image, stock, place_of_sele_id) VALUES (1, 'Raspberry Pi 5', 'built using the RP1 I/O controller, a package containing silicon designed in-house at Raspberry Pi.  USB 3 has more total bandwidth, for much faster transfer speeds.  Camera and DSI display connectors are interchangeable, so you can have one of each, or two the same.', 5000, 0, 'https://assets.raspberrypi.com/static/98b2722d2fdbf42f2789601e1032bb0a/f2559/6aebb638-e088-4b28-bbfd-67eae784ca3b_PI_5_FEATURE.webp', 3, 1);
INSERT INTO public.product (id, name, detail, price, watch_count, image, stock, place_of_sele_id) VALUES (2, 'Raspberry Pi 5', 'built using the RP1 I/O controller, a package containing silicon designed in-house at Raspberry Pi.  USB 3 has more total bandwidth, for much faster transfer speeds.  Camera and DSI display connectors are interchangeable, so you can have one of each, or two the same.', 5000, 0, 'https://assets.raspberrypi.com/static/98b2722d2fdbf42f2789601e1032bb0a/f2559/6aebb638-e088-4b28-bbfd-67eae784ca3b_PI_5_FEATURE.webp', 3, 1);
INSERT INTO public.product (id, name, detail, price, watch_count, image, stock, place_of_sele_id) VALUES (3, 'Raspberry Pi 6', 'Raspberry Pi 5 is built using the RP1 I/O controller, a package containing silicon designed in-house at Raspberry Pi.', 6000, 0, 'https://assets.raspberrypi.com/static/8f6eca535dbb23a21eb41a748050e3a0/33b96/16gb.webp', 2, 1);
INSERT INTO public.product (id, name, detail, price, watch_count, image, stock, place_of_sele_id) VALUES (4, 'Raspberry Pi 7', 'Raspberry Pi 5 is built using the RP1 I/O controller, a package containing silicon designed in-house at Raspberry Pi.', 7000, 0, 'https://assets.raspberrypi.com/static/8f6eca535dbb23a21eb41a748050e3a0/33b96/16gb.webp', 2, 1);


--
-- TOC entry 3477 (class 0 OID 16391)
-- Dependencies: 218
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."user" (id, name, email, phone, address, province_id, password, rank) VALUES (3, 'Hello', 'world', '203920920', '221b', 1, '7e240de74fb1ed08fa08d38063f6a6a91462a815', true);
INSERT INTO public."user" (id, name, email, phone, address, province_id, password, rank) VALUES (4, 'nawasan', 'nawasan@gmail.com', '123094', 'adfafaefahofia', 1, 'd033e22ae348aeb5660fc2140aec35850c4da997', true);
INSERT INTO public."user" (id, name, email, phone, address, province_id, password, rank) VALUES (5, 'admin', 'admin', '111111111', '221b', 2, 'd033e22ae348aeb5660fc2140aec35850c4da997', true);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 219
-- Name: Province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Province_id_seq"', 4, true);


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 223
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.order_detail_id_seq', 1, false);


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 225
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.product_id_seq', 4, true);


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_id_seq', 5, true);


--
-- TOC entry 3313 (class 2606 OID 16408)
-- Name: Province Province_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Province"
    ADD CONSTRAINT "Province_pkey" PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 16424)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3321 (class 2606 OID 16442)
-- Name: order_detail order_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 16435)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- TOC entry 3315 (class 2606 OID 16417)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 16399)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 1259 OID 16489)
-- Name: Province_name_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Province_name_key" ON public."Province" USING btree (name);


--
-- TOC entry 3324 (class 2606 OID 16458)
-- Name: cart cart_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3325 (class 2606 OID 16453)
-- Name: cart cart_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3328 (class 2606 OID 16473)
-- Name: order_detail order_detail_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3329 (class 2606 OID 16483)
-- Name: order_detail order_detail_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3330 (class 2606 OID 16478)
-- Name: order_detail order_detail_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3326 (class 2606 OID 16468)
-- Name: order order_province_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_province_id_fkey FOREIGN KEY (province_id) REFERENCES public."Province"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3327 (class 2606 OID 16463)
-- Name: order order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3323 (class 2606 OID 16448)
-- Name: product product_place_of_sele_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_place_of_sele_id_fkey FOREIGN KEY (place_of_sele_id) REFERENCES public."Province"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3322 (class 2606 OID 16443)
-- Name: user user_province_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_province_id_fkey FOREIGN KEY (province_id) REFERENCES public."Province"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2025-11-04 17:04:59 UTC

--
-- PostgreSQL database dump complete
--

