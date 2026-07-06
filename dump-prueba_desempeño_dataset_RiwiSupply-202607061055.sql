--
-- PostgreSQL database dump
--

\restrict ZWdTf4JWkSZ3mCarhKKYjpMmoD6NIQAPCSVnhMgC0Nf6pvOfDUYPtdvJiksPhZ4

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 17.10 (Ubuntu 17.10-1.pgdg24.04+1)

-- Started on 2026-07-06 10:55:57 -05

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
-- TOC entry 215 (class 1259 OID 49154)
-- Name: dataset_riwisupply; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset_riwisupply (
    "MovementDate" character varying(50),
    "SupplierName" character varying(50),
    "SupplierCity" character varying(50),
    "Warehouse" character varying(50),
    "WarehouseCity" character varying(50),
    "ProductName" character varying(50),
    "Category" character varying(50),
    "Quantity" integer,
    "UnitPrice" integer,
    "MovementType" character varying(50),
    "PurchaseOrder" character varying(50)
);


--
-- TOC entry 226 (class 1259 OID 49206)
-- Name: movement_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movement_type (
    id integer NOT NULL,
    movementtype character varying(50) NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 49205)
-- Name: movement_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movement_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 225
-- Name: movement_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movement_type_id_seq OWNED BY public.movement_type.id;


--
-- TOC entry 217 (class 1259 OID 49158)
-- Name: product_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_category (
    id integer NOT NULL,
    categoryname character varying(50) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 49157)
-- Name: product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 216
-- Name: product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_category_id_seq OWNED BY public.product_category.id;


--
-- TOC entry 229 (class 1259 OID 49237)
-- Name: product_purshase; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_purshase (
    id_purchase integer NOT NULL,
    id_product integer NOT NULL,
    quantity integer NOT NULL,
    unitprice integer NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 49165)
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    productname character varying(50) NOT NULL,
    id_category integer
);


--
-- TOC entry 218 (class 1259 OID 49164)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 218
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 228 (class 1259 OID 49213)
-- Name: purchase; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase (
    id integer NOT NULL,
    movementdate date NOT NULL,
    id_movement integer,
    id_supplier integer,
    id_warehouse integer
);


--
-- TOC entry 227 (class 1259 OID 49212)
-- Name: purchase_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 227
-- Name: purchase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_id_seq OWNED BY public.purchase.id;


--
-- TOC entry 221 (class 1259 OID 49177)
-- Name: supplier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.supplier (
    id integer NOT NULL,
    suppliername character varying(50) NOT NULL,
    suppliercity character varying(50) NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 49176)
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 220
-- Name: supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.supplier_id_seq OWNED BY public.supplier.id;


--
-- TOC entry 224 (class 1259 OID 49190)
-- Name: supplier_warehouse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.supplier_warehouse (
    id_supplier integer NOT NULL,
    id_warehouse integer NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 49184)
-- Name: warehouse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.warehouse (
    id integer NOT NULL,
    warehousename character varying(50) NOT NULL,
    warehousecity character varying(50) NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 49183)
-- Name: warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 222
-- Name: warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.warehouse_id_seq OWNED BY public.warehouse.id;


--
-- TOC entry 3308 (class 2604 OID 49209)
-- Name: movement_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movement_type ALTER COLUMN id SET DEFAULT nextval('public.movement_type_id_seq'::regclass);


--
-- TOC entry 3304 (class 2604 OID 49161)
-- Name: product_category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_category ALTER COLUMN id SET DEFAULT nextval('public.product_category_id_seq'::regclass);


--
-- TOC entry 3305 (class 2604 OID 49168)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3309 (class 2604 OID 49216)
-- Name: purchase id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase ALTER COLUMN id SET DEFAULT nextval('public.purchase_id_seq'::regclass);


--
-- TOC entry 3306 (class 2604 OID 49180)
-- Name: supplier id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supplier ALTER COLUMN id SET DEFAULT nextval('public.supplier_id_seq'::regclass);


--
-- TOC entry 3307 (class 2604 OID 49187)
-- Name: warehouse id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse ALTER COLUMN id SET DEFAULT nextval('public.warehouse_id_seq'::regclass);


--
-- TOC entry 3479 (class 0 OID 49154)
-- Dependencies: 215
-- Data for Name: dataset_riwisupply; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.dataset_riwisupply VALUES ('2026-04-01', 'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Costa', 'Santa Marta', 'Disco de Corte 4.5', 'Herramienta', 148, 115388, 'OUT', 'PO-1049');
INSERT INTO public.dataset_riwisupply VALUES ('2026-02-14', 'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Costa', 'Santa Marta', 'Electrodo E6013', 'Consumible', 27, 35506, 'IN', 'PO-1041');
INSERT INTO public.dataset_riwisupply VALUES ('2026-01-01', 'Industriales SAS', 'Barranquilla', 'Bodega Costa', 'Santa Marta', 'Guante Nitrilo', 'EPP', 70, 14290, 'IN', 'PO-1022');
INSERT INTO public.dataset_riwisupply VALUES ('2026-02-16', 'Aceros del Norte S.A.S', 'Cartagena', 'Centro Logistico Norte', 'Cartagena', 'Guantes de Nitrilo', 'Elementos Protección', 160, 117524, 'IN', 'PO-1075');
INSERT INTO public.dataset_riwisupply VALUES ('2026-02-28', 'Industriales S.A.S', 'Barranquila', 'Bodega Central', 'Barranquilla', 'Electrodo E6013', 'Consumible', 40, 139836, 'OUT', 'PO-1091');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-06', 'Aceros del Norte S.A.S', 'Cartagena', 'Bod. Central', 'Barranquila', 'Disco de Corte 4.5', 'Herramienta', 130, 88512, 'OUT', 'PO-1041');
INSERT INTO public.dataset_riwisupply VALUES ('2026-01-20', 'Aceros del Norte', 'Cartagena', 'Bodega Central', 'Barranquilla', 'Soldadura E6013', 'Consumibles', 33, 43746, 'OUT', 'PO-1059');
INSERT INTO public.dataset_riwisupply VALUES ('2026-04-13', 'INDUSTRIALES SAS', 'B/quilla', 'Bodega Costa', 'Santa Marta', 'Guante Nitrilo', 'EPP', 119, 23022, 'OUT', 'PO-1035');
INSERT INTO public.dataset_riwisupply VALUES ('2026-04-17', 'Suministros Global SAS', 'Sta Marta', 'Bod. Central', 'Barranquila', 'Guantes de Nitrilo', 'Elementos Protección', 185, 123653, 'IN', 'PO-1032');
INSERT INTO public.dataset_riwisupply VALUES ('2026-02-02', 'Suministros Global SAS', 'Sta Marta', 'Bod. Central', 'Barranquila', 'Electrodo E6013', 'Consumible', 87, 123108, 'OUT', 'PO-1009');
INSERT INTO public.dataset_riwisupply VALUES ('2026-05-23', 'ACEROS NORTE', 'Ctg', 'Bodega Costa', 'Santa Marta', 'Guantes de Nitrilo', 'Elementos Protección', 175, 39944, 'IN', 'PO-1040');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-19', 'Aceros del Norte S.A.S', 'Cartagena', 'Bod. Central', 'Barranquila', 'Disco Corte 4.5', 'Herramientas', 199, 118291, 'OUT', 'PO-1023');
INSERT INTO public.dataset_riwisupply VALUES ('2026-01-25', 'INDUSTRIALES SAS', 'B/quilla', 'Centro Logistico Norte', 'Cartagena', 'Guante Nitrilo', 'EPP', 131, 71980, 'OUT', 'PO-1029');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-15', 'ACEROS NORTE', 'Ctg', 'Bodega Costa', 'Santa Marta', 'Disco de Corte 4.5', 'Herramienta', 134, 89964, 'OUT', 'PO-1035');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-12', 'Industriales SAS', 'Barranquilla', 'Bodega Central', 'Barranquilla', 'Disco Corte 4.5', 'Herramientas', 124, 52910, 'IN', 'PO-1094');
INSERT INTO public.dataset_riwisupply VALUES ('2026-04-26', 'INDUSTRIALES SAS', 'B/quilla', 'Bodega Central', 'Barranquilla', 'Disco Corte 4.5', 'Herramientas', 61, 136736, 'IN', 'PO-1034');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-03', 'INDUSTRIALES SAS', 'B/quilla', 'Centro Logistico Norte', 'Cartagena', 'Disco de Corte 4.5', 'Herramienta', 169, 18022, 'OUT', 'PO-1043');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-21', 'Aceros del Norte', 'Cartagena', 'Bodega Costa', 'Santa Marta', 'Casco Industrial', 'EPP', 192, 108802, 'OUT', 'PO-1083');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-11', 'Aceros del Norte', 'Cartagena', 'Centro Logistico Norte', 'Cartagena', 'Electrodo E6013', 'Consumible', 78, 37943, 'OUT', 'PO-1036');


--
-- TOC entry 3490 (class 0 OID 49206)
-- Dependencies: 226
-- Data for Name: movement_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.movement_type VALUES (20, 'IN');
INSERT INTO public.movement_type VALUES (21, 'OUT');


--
-- TOC entry 3481 (class 0 OID 49158)
-- Dependencies: 217
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_category VALUES (1, 'Herramienta');
INSERT INTO public.product_category VALUES (2, 'Consumible');
INSERT INTO public.product_category VALUES (3, 'EPP');
INSERT INTO public.product_category VALUES (4, 'Elementos Protección');
INSERT INTO public.product_category VALUES (5, 'Consumible');
INSERT INTO public.product_category VALUES (6, 'Herramienta');
INSERT INTO public.product_category VALUES (7, 'Consumibles');
INSERT INTO public.product_category VALUES (8, 'EPP');
INSERT INTO public.product_category VALUES (9, 'Elementos Protección');
INSERT INTO public.product_category VALUES (10, 'Consumible');
INSERT INTO public.product_category VALUES (11, 'Elementos Protección');
INSERT INTO public.product_category VALUES (12, 'Herramientas');
INSERT INTO public.product_category VALUES (13, 'EPP');
INSERT INTO public.product_category VALUES (14, 'Herramienta');
INSERT INTO public.product_category VALUES (15, 'Herramientas');
INSERT INTO public.product_category VALUES (16, 'Herramientas');
INSERT INTO public.product_category VALUES (17, 'Herramienta');
INSERT INTO public.product_category VALUES (18, 'EPP');
INSERT INTO public.product_category VALUES (19, 'Consumible');


--
-- TOC entry 3493 (class 0 OID 49237)
-- Dependencies: 229
-- Data for Name: product_purshase; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3483 (class 0 OID 49165)
-- Dependencies: 219
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3492 (class 0 OID 49213)
-- Dependencies: 228
-- Data for Name: purchase; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3485 (class 0 OID 49177)
-- Dependencies: 221
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.supplier VALUES (1, 'Aceros del Norte S.A.S', 'Cartagena');
INSERT INTO public.supplier VALUES (2, 'Aceros del Norte S.A.S', 'Cartagena');
INSERT INTO public.supplier VALUES (4, 'Aceros del Norte S.A.S', 'Cartagena');
INSERT INTO public.supplier VALUES (6, 'Aceros del Norte S.A.S', 'Cartagena');
INSERT INTO public.supplier VALUES (7, 'Aceros del Norte S.A.S', 'Cartagena');
INSERT INTO public.supplier VALUES (11, 'Aceros del Norte S.A.S', 'Ctg');
INSERT INTO public.supplier VALUES (12, 'Aceros del Norte S.A.S', 'Cartagena');
INSERT INTO public.supplier VALUES (14, 'Aceros del Norte S.A.S', 'Ctg');
INSERT INTO public.supplier VALUES (18, 'Aceros del Norte S.A.S', 'Cartagena');
INSERT INTO public.supplier VALUES (19, 'Aceros del Norte S.A.S', 'Cartagena');
INSERT INTO public.supplier VALUES (3, 'Industriales S.A.S', 'Barranquilla');
INSERT INTO public.supplier VALUES (5, 'Industriales S.A.S', 'Barranquila');
INSERT INTO public.supplier VALUES (8, 'Industriales S.A.S', 'B/quilla');
INSERT INTO public.supplier VALUES (13, 'Industriales S.A.S', 'B/quilla');
INSERT INTO public.supplier VALUES (15, 'Industriales S.A.S', 'Barranquilla');
INSERT INTO public.supplier VALUES (16, 'Industriales S.A.S', 'B/quilla');
INSERT INTO public.supplier VALUES (17, 'Industriales S.A.S', 'B/quilla');
INSERT INTO public.supplier VALUES (9, 'Suministros Global S.A.S', 'Sta Marta');
INSERT INTO public.supplier VALUES (10, 'Suministros Global S.A.S', 'Sta Marta');


--
-- TOC entry 3488 (class 0 OID 49190)
-- Dependencies: 224
-- Data for Name: supplier_warehouse; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3487 (class 0 OID 49184)
-- Dependencies: 223
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.warehouse VALUES (1, 'Bodega Costa', 'Santa Marta');
INSERT INTO public.warehouse VALUES (2, 'Bodega Costa', 'Santa Marta');
INSERT INTO public.warehouse VALUES (3, 'Bodega Costa', 'Santa Marta');
INSERT INTO public.warehouse VALUES (4, 'Centro Logistico Norte', 'Cartagena');
INSERT INTO public.warehouse VALUES (5, 'Bodega Central', 'Barranquilla');
INSERT INTO public.warehouse VALUES (6, 'Bod. Central', 'Barranquila');
INSERT INTO public.warehouse VALUES (7, 'Bodega Central', 'Barranquilla');
INSERT INTO public.warehouse VALUES (8, 'Bodega Costa', 'Santa Marta');
INSERT INTO public.warehouse VALUES (9, 'Bod. Central', 'Barranquila');
INSERT INTO public.warehouse VALUES (10, 'Bod. Central', 'Barranquila');
INSERT INTO public.warehouse VALUES (11, 'Bodega Costa', 'Santa Marta');
INSERT INTO public.warehouse VALUES (12, 'Bod. Central', 'Barranquila');
INSERT INTO public.warehouse VALUES (13, 'Centro Logistico Norte', 'Cartagena');
INSERT INTO public.warehouse VALUES (14, 'Bodega Costa', 'Santa Marta');
INSERT INTO public.warehouse VALUES (15, 'Bodega Central', 'Barranquilla');
INSERT INTO public.warehouse VALUES (16, 'Bodega Central', 'Barranquilla');
INSERT INTO public.warehouse VALUES (17, 'Centro Logistico Norte', 'Cartagena');
INSERT INTO public.warehouse VALUES (18, 'Bodega Costa', 'Santa Marta');
INSERT INTO public.warehouse VALUES (19, 'Centro Logistico Norte', 'Cartagena');


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 225
-- Name: movement_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movement_type_id_seq', 21, true);


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 216
-- Name: product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_category_id_seq', 19, true);


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 218
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 227
-- Name: purchase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_id_seq', 1, false);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 220
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.supplier_id_seq', 19, true);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 222
-- Name: warehouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.warehouse_id_seq', 19, true);


--
-- TOC entry 3321 (class 2606 OID 49211)
-- Name: movement_type movement_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movement_type
    ADD CONSTRAINT movement_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 49163)
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 49241)
-- Name: product_purshase product_purshase_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_purshase
    ADD CONSTRAINT product_purshase_pkey PRIMARY KEY (id_purchase, id_product);


--
-- TOC entry 3313 (class 2606 OID 49170)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 49218)
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (id);


--
-- TOC entry 3315 (class 2606 OID 49182)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 49243)
-- Name: product_purshase uq_product_purchase; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_purshase
    ADD CONSTRAINT uq_product_purchase UNIQUE (id_product, id_purchase);


--
-- TOC entry 3319 (class 2606 OID 49194)
-- Name: supplier_warehouse uq_supplier_warehouse; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supplier_warehouse
    ADD CONSTRAINT uq_supplier_warehouse PRIMARY KEY (id_supplier, id_warehouse);


--
-- TOC entry 3317 (class 2606 OID 49189)
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 49249)
-- Name: product_purshase fk_id_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_purshase
    ADD CONSTRAINT fk_id_product FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- TOC entry 3335 (class 2606 OID 49244)
-- Name: product_purshase fk_id_purchase; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_purshase
    ADD CONSTRAINT fk_id_purchase FOREIGN KEY (id_purchase) REFERENCES public.purchase(id);


--
-- TOC entry 3328 (class 2606 OID 49171)
-- Name: products fk_products_category; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_category FOREIGN KEY (id_category) REFERENCES public.product_category(id);


--
-- TOC entry 3331 (class 2606 OID 49229)
-- Name: purchase fk_purshase_movement; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT fk_purshase_movement FOREIGN KEY (id_movement) REFERENCES public.movement_type(id);


--
-- TOC entry 3332 (class 2606 OID 49219)
-- Name: purchase fk_purshase_supplier; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT fk_purshase_supplier FOREIGN KEY (id_supplier) REFERENCES public.supplier(id);


--
-- TOC entry 3333 (class 2606 OID 49224)
-- Name: purchase fk_purshase_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT fk_purshase_warehouse FOREIGN KEY (id_warehouse) REFERENCES public.warehouse(id);


--
-- TOC entry 3329 (class 2606 OID 49195)
-- Name: supplier_warehouse fk_supplier; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supplier_warehouse
    ADD CONSTRAINT fk_supplier FOREIGN KEY (id_supplier) REFERENCES public.supplier(id);


--
-- TOC entry 3330 (class 2606 OID 49200)
-- Name: supplier_warehouse fk_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supplier_warehouse
    ADD CONSTRAINT fk_warehouse FOREIGN KEY (id_warehouse) REFERENCES public.warehouse(id);


-- Completed on 2026-07-06 10:55:57 -05

--
-- PostgreSQL database dump complete
--

\unrestrict ZWdTf4JWkSZ3mCarhKKYjpMmoD6NIQAPCSVnhMgC0Nf6pvOfDUYPtdvJiksPhZ4

