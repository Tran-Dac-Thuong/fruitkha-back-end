--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-12-22 23:39:32

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
-- TOC entry 217 (class 1259 OID 24802)
-- Name: Carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Carts" (
    id integer NOT NULL,
    user_id integer,
    product_id integer,
    quantity integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Carts" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24801)
-- Name: Carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Carts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Carts_id_seq" OWNER TO postgres;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 216
-- Name: Carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Carts_id_seq" OWNED BY public."Carts".id;


--
-- TOC entry 219 (class 1259 OID 24846)
-- Name: Comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Comments" (
    id integer NOT NULL,
    user_id integer,
    news_id integer,
    content text,
    created_at text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Comments" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24845)
-- Name: Comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Comments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Comments_id_seq" OWNER TO postgres;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 218
-- Name: Comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Comments_id_seq" OWNED BY public."Comments".id;


--
-- TOC entry 211 (class 1259 OID 24749)
-- Name: Contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Contacts" (
    id integer NOT NULL,
    customer_email text,
    customer_name text,
    subject text,
    message text,
    phone text,
    created_at text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Contacts" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24748)
-- Name: Contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Contacts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Contacts_id_seq" OWNER TO postgres;

--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 210
-- Name: Contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Contacts_id_seq" OWNED BY public."Contacts".id;


--
-- TOC entry 221 (class 1259 OID 24855)
-- Name: News; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."News" (
    id integer NOT NULL,
    title text,
    content text,
    image text,
    author text,
    created_at text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."News" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24854)
-- Name: News_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."News_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."News_id_seq" OWNER TO postgres;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 220
-- Name: News_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."News_id_seq" OWNED BY public."News".id;


--
-- TOC entry 213 (class 1259 OID 24767)
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    id integer NOT NULL,
    user_id integer,
    product_id integer,
    quantity integer,
    payment_method text,
    status text,
    total_cost double precision,
    date text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24766)
-- Name: Orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Orders_id_seq" OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 212
-- Name: Orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_id_seq" OWNED BY public."Orders".id;


--
-- TOC entry 215 (class 1259 OID 24776)
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Products" (
    id integer NOT NULL,
    product_name text,
    price double precision,
    quantity integer,
    image text,
    description text,
    status text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Products" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24775)
-- Name: Products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Products_id_seq" OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 214
-- Name: Products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Products_id_seq" OWNED BY public."Products".id;


--
-- TOC entry 209 (class 1259 OID 24736)
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24864)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    first_name text,
    last_name text,
    email text,
    password text,
    role text,
    auth_provider text,
    avatar text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24863)
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 222
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- TOC entry 3201 (class 2604 OID 24805)
-- Name: Carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carts" ALTER COLUMN id SET DEFAULT nextval('public."Carts_id_seq"'::regclass);


--
-- TOC entry 3202 (class 2604 OID 24849)
-- Name: Comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comments" ALTER COLUMN id SET DEFAULT nextval('public."Comments_id_seq"'::regclass);


--
-- TOC entry 3198 (class 2604 OID 24752)
-- Name: Contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contacts" ALTER COLUMN id SET DEFAULT nextval('public."Contacts_id_seq"'::regclass);


--
-- TOC entry 3203 (class 2604 OID 24858)
-- Name: News id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."News" ALTER COLUMN id SET DEFAULT nextval('public."News_id_seq"'::regclass);


--
-- TOC entry 3199 (class 2604 OID 24770)
-- Name: Orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN id SET DEFAULT nextval('public."Orders_id_seq"'::regclass);


--
-- TOC entry 3200 (class 2604 OID 24779)
-- Name: Products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products" ALTER COLUMN id SET DEFAULT nextval('public."Products_id_seq"'::regclass);


--
-- TOC entry 3204 (class 2604 OID 24867)
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- TOC entry 3368 (class 0 OID 24802)
-- Dependencies: 217
-- Data for Name: Carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Carts" (id, user_id, product_id, quantity, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3370 (class 0 OID 24846)
-- Dependencies: 219
-- Data for Name: Comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Comments" (id, user_id, news_id, content, created_at, "createdAt", "updatedAt") FROM stdin;
19	1	2	I like this news	22-12-2023 22:49:54	2023-12-22 22:49:54.573+07	2023-12-22 22:49:54.573+07
21	2	1	This news very useful :D	22-12-2023 22:52:13	2023-12-22 22:52:13.995+07	2023-12-22 22:52:13.995+07
\.


--
-- TOC entry 3362 (class 0 OID 24749)
-- Dependencies: 211
-- Data for Name: Contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Contacts" (id, customer_email, customer_name, subject, message, phone, created_at, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3372 (class 0 OID 24855)
-- Dependencies: 221
-- Data for Name: News; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."News" (id, title, content, image, author, created_at, "createdAt", "updatedAt") FROM stdin;
1	You will vainly look for fruit on it in autumn.	In the fall, you may feel fruitless searching for fruit on the trees because typically fall is not the prime time to harvest fresh fruit. The tree has often shed its leaves or the fruit has been harvested the previous summer or fall.	image_1702867252515.jpg	Admin	18-12-2023 9:40:52	2023-12-18 09:40:52.528+07	2023-12-18 09:40:52.528+07
2	A man is worth has its season, like tomato.	Each stage in life brings maturity and completion. Like tomatoes, men also go through different stages, from forming themselves to becoming valuable and ready to bring happiness and benefits to society. Sometimes, their value comes not only from their appearance but also from the qualities hidden behind their maturity and experience.	image_1702867363900.jpg	Admin	18-12-2023 9:42:43	2023-12-18 09:42:43.906+07	2023-12-18 09:42:43.906+07
3	Good thoughts bear good fresh juicy fruit.	Positive thoughts and kindness will create good and happy results, in the same way that fresh, sweet fruit is created from good seeds and thoughtful care.	image_1702867411880.jpg	Admin	18-12-2023 9:43:31	2023-12-18 09:43:31.885+07	2023-12-18 09:43:31.885+07
4	Fall in love with the fresh orange	Love bright orange as warm, dynamic and bright. It brings a feeling of joy, enthusiasm and excitement, like a new breeze in life.	image_1702867460278.jpg	Admin	18-12-2023 9:44:20	2023-12-18 09:44:20.289+07	2023-12-18 09:44:20.289+07
5	Why the berries always look delecious	Berries always look delicious because of their smooth appearance and vibrant and attractive colors. The succulence creates a feeling of freshness and a captivating flavor that often makes berries attractive at first sight.	image_1702867513939.jpg	Admin	18-12-2023 9:45:13	2023-12-18 09:45:13.944+07	2023-12-18 09:45:13.944+07
6	Love for fruits are genuine of John Doe	It may imply that John Doe has a sincere, deep love for fruit. This could be a passion, a hobby, or even an integral part of his daily life.	image_1702867580682.jpg	Admin	18-12-2023 9:46:20	2023-12-18 09:46:20.685+07	2023-12-18 09:46:20.685+07
\.


--
-- TOC entry 3364 (class 0 OID 24767)
-- Dependencies: 213
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Orders" (id, user_id, product_id, quantity, payment_method, status, total_cost, date, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3366 (class 0 OID 24776)
-- Dependencies: 215
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Products" (id, product_name, price, quantity, image, description, status, "createdAt", "updatedAt") FROM stdin;
2	STRAWBERRY	85	100	image_1701519964039.jpg	Strawberries are soft, succulent, bright red fruits, usually round, smooth, and have small spots. They have a characteristic aroma and sweet taste, are widely used in cuisine and are the main ingredient in many desserts.	Stocking	2023-12-02 19:26:04.055+07	2023-12-02 19:26:04.055+07
3	BERRY	85	100	image_1701520117641.jpg	Berries are small, juicy fruits, usually bright red. They have a characteristic sweet and sour taste, and are popular in many dishes and drinks because of their special flavor.	Stocking	2023-12-02 19:28:37.646+07	2023-12-02 19:28:37.646+07
5	AVOCADO	45	100	image_1701521941334.jpg	Avocados have green or purple skin, are usually soft, and have a large seed inside. The light green to creamy yellow flesh has a rich taste and is often used in many dishes, from salads to mousse, as well as being the main ingredient in a number of other delicious dishes.	Stocking	2023-12-02 19:59:01.339+07	2023-12-02 19:59:01.339+07
6	GREEN APPLE	45	100	image_1701521993150.jpg	Green apples have green skin, often with yellow or light pink spots. The meat inside is succulent, crispy and has a sweet and sour flavor. Widely used in cooking or eaten directly, creating a refreshing and delicious feeling.	Stocking	2023-12-02 19:59:53.154+07	2023-12-02 19:59:53.154+07
7	RASPBERRY	80	100	image_1701522078812.jpg	Raspberries are a type of berry native to Europe and Asia. Raspberries are red, oval in shape, small in size, and have a sweet and sour taste. Raspberries are a fruit rich in nutrients, including vitamin C, vitamin K, fiber and antioxidants. Raspberries are often eaten fresh, made into smoothies, juices or used to decorate cakes.	Stocking	2023-12-02 20:01:18.816+07	2023-12-02 20:01:18.816+07
4	LEMON	35	100	image_1701521793840.jpg	Lemon is a thin-skinned, yellow or green fruit with a characteristic aroma. The flesh inside is sour, often used to make lemonade, seasoning or as the main ingredient in many dishes and drinks.	Sold out	2023-12-02 19:56:33.851+07	2023-12-09 00:11:20.634+07
\.


--
-- TOC entry 3360 (class 0 OID 24736)
-- Dependencies: 209
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
migrations-contact.js
migrations-order.js
migrations-product.js
migrations-cart.js
migrations-comment.js
migrations-new.js
migrations-user.js
\.


--
-- TOC entry 3374 (class 0 OID 24864)
-- Dependencies: 223
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, first_name, last_name, email, password, role, auth_provider, avatar, "createdAt", "updatedAt") FROM stdin;
2	I am	User2	user2@gmail.com	$2a$10$4MmwyTQuPLoQD1LtGF0HQeGumSSloz.ekG5gWNg3nggUsNvaXx586	CUSTOMER	LOCAL	\N	2023-12-18 09:38:03.719+07	2023-12-18 09:38:03.719+07
3	I am	Admin	admin@gmail.com	$2a$10$4MmwyTQuPLoQD1LtGF0HQeGumSSloz.ekG5gWNg3nggUsNvaXx586	ADMIN	LOCAL	\N	2023-12-18 09:38:39.725+07	2023-12-18 09:38:39.725+07
4	Tran Dac	Thuong	hoangdeptraibodoiqua4321@gmail.com	$2a$10$FqQ6IXmXTVkdrjBU.5TLN.aIiUoBYRtgm8GMypkfjbirso2JYACrO	CUSTOMER	GOOGLE	https://lh3.googleusercontent.com/a/ACg8ocLyN3_SsNrjEACdwz-cbqEkIaLl4yCIC0WC1u3uR_D3=s96-c	2023-12-20 13:09:58.502+07	2023-12-20 13:09:58.502+07
5	Thương	Trần Đắc	trandacthuong23@gmail.com	$2a$10$FqQ6IXmXTVkdrjBU.5TLN.31OTO3pR5g6IEnQUqFDLQsn46/92Gi2	CUSTOMER	FACEBOOK	https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.30497-1/84628273_176159830277856_972693363922829312_n.jpg?stp=c15.0.50.50a_cp0_dst-jpg_p50x50&_nc_cat=1&ccb=1-7&_nc_sid=810bd0&_nc_ohc=aPJYkDh1lRoAX9vD0Eh&_nc_ht=scontent.fsgn5-2.fna&edm=AP4hL3IEAAAA&oh=00_AfBHOJ8jXmt8HSS66ZSUkuXDLmDnHO94LsmTYiuJFPx6DA&oe=65AA05D9	2023-12-20 13:19:23.546+07	2023-12-20 13:19:23.546+07
1	I am	User1	user1@gmail.com	$2a$10$4MmwyTQuPLoQD1LtGF0HQeGumSSloz.ekG5gWNg3nggUsNvaXx586	CUSTOMER	LOCAL	image_1703256671558.png	2023-12-18 09:37:35.172+07	2023-12-22 21:52:20.488+07
\.


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 216
-- Name: Carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Carts_id_seq"', 80, true);


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 218
-- Name: Comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Comments_id_seq"', 21, true);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 210
-- Name: Contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Contacts_id_seq"', 16, true);


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 220
-- Name: News_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."News_id_seq"', 7, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 212
-- Name: Orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orders_id_seq"', 29, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 214
-- Name: Products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Products_id_seq"', 10, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 222
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 5, true);


--
-- TOC entry 3214 (class 2606 OID 24807)
-- Name: Carts Carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carts"
    ADD CONSTRAINT "Carts_pkey" PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 24853)
-- Name: Comments Comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_pkey" PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 24756)
-- Name: Contacts Contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contacts"
    ADD CONSTRAINT "Contacts_pkey" PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 24862)
-- Name: News News_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."News"
    ADD CONSTRAINT "News_pkey" PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 24774)
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 24783)
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 24740)
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- TOC entry 3220 (class 2606 OID 24871)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


-- Completed on 2023-12-22 23:39:33

--
-- PostgreSQL database dump complete
--

