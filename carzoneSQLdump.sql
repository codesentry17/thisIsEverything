--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auctions_auccontacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auctions_auccontacts (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    car_id integer NOT NULL,
    car_title character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    bid character varying(100) NOT NULL,
    message text NOT NULL,
    user_id integer NOT NULL,
    create_date timestamp with time zone NOT NULL
);


ALTER TABLE public.auctions_auccontacts OWNER TO postgres;

--
-- Name: auctions_auccontacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auctions_auccontacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_auccontacts_id_seq OWNER TO postgres;

--
-- Name: auctions_auccontacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auctions_auccontacts_id_seq OWNED BY public.auctions_auccontacts.id;


--
-- Name: auctions_auction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auctions_auction (
    id integer NOT NULL,
    car_title character varying(255) NOT NULL,
    city character varying(100) NOT NULL,
    color character varying(100) NOT NULL,
    brand character varying(100) NOT NULL,
    year integer NOT NULL,
    condition character varying(100) NOT NULL,
    price integer NOT NULL,
    description text NOT NULL,
    car_photo character varying(100) NOT NULL,
    car_photo_1 character varying(100) NOT NULL,
    car_photo_2 character varying(100) NOT NULL,
    car_photo_3 character varying(100) NOT NULL,
    features character varying(195) NOT NULL,
    body_style character varying(100) NOT NULL,
    engine character varying(100) NOT NULL,
    transmission character varying(100) NOT NULL,
    interior character varying(100) NOT NULL,
    miles integer NOT NULL,
    doors character varying(10) NOT NULL,
    passengers integer NOT NULL,
    vin_no character varying(100) NOT NULL,
    milage integer NOT NULL,
    fuel_type character varying(50) NOT NULL,
    no_of_owners character varying(100) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    sell_date date NOT NULL
);


ALTER TABLE public.auctions_auction OWNER TO postgres;

--
-- Name: auctions_auction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auctions_auction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_auction_id_seq OWNER TO postgres;

--
-- Name: auctions_auction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auctions_auction_id_seq OWNED BY public.auctions_auction.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: cars_car; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars_car (
    id integer NOT NULL,
    car_title character varying(255) NOT NULL,
    city character varying(100) NOT NULL,
    color character varying(100) NOT NULL,
    brand character varying(100) NOT NULL,
    year integer NOT NULL,
    condition character varying(100) NOT NULL,
    price integer NOT NULL,
    description text NOT NULL,
    car_photo character varying(100) NOT NULL,
    car_photo_1 character varying(100) NOT NULL,
    car_photo_2 character varying(100) NOT NULL,
    car_photo_3 character varying(100) NOT NULL,
    car_photo_4 character varying(100) NOT NULL,
    features character varying(195) NOT NULL,
    body_style character varying(100) NOT NULL,
    engine character varying(100) NOT NULL,
    transmission character varying(100) NOT NULL,
    interior character varying(100) NOT NULL,
    miles integer NOT NULL,
    doors character varying(10) NOT NULL,
    passengers integer NOT NULL,
    vin_no character varying(100) NOT NULL,
    milage integer NOT NULL,
    fuel_type character varying(50) NOT NULL,
    no_of_owners character varying(100) NOT NULL,
    is_featured boolean NOT NULL,
    created_date timestamp with time zone NOT NULL,
    sold boolean NOT NULL
);


ALTER TABLE public.cars_car OWNER TO postgres;

--
-- Name: cars_car_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_car_id_seq OWNER TO postgres;

--
-- Name: cars_car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_car_id_seq OWNED BY public.cars_car.id;


--
-- Name: contacts_contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_contact (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    car_id integer NOT NULL,
    customer_need character varying(100) NOT NULL,
    car_title character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    message text NOT NULL,
    user_id integer NOT NULL,
    create_date timestamp with time zone NOT NULL
);


ALTER TABLE public.contacts_contact OWNER TO postgres;

--
-- Name: contacts_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_contact_id_seq OWNER TO postgres;

--
-- Name: contacts_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_contact_id_seq OWNED BY public.contacts_contact.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: notify_specification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notify_specification (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    brand character varying(100) NOT NULL,
    model character varying(100) NOT NULL,
    fuel character varying(100) NOT NULL,
    transmission character varying(100) NOT NULL,
    color character varying(100) NOT NULL,
    year integer NOT NULL,
    milage integer NOT NULL,
    min_price integer NOT NULL,
    max_price integer NOT NULL,
    body_style character varying(100) NOT NULL,
    created_date date NOT NULL
);


ALTER TABLE public.notify_specification OWNER TO postgres;

--
-- Name: notify_specification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notify_specification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notify_specification_id_seq OWNER TO postgres;

--
-- Name: notify_specification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notify_specification_id_seq OWNED BY public.notify_specification.id;


--
-- Name: pages_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages_team (
    id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    designation character varying(255) NOT NULL,
    photo character varying(100) NOT NULL,
    facebook_link character varying(100) NOT NULL,
    twitter_link character varying(100) NOT NULL,
    google_plus_link character varying(100) NOT NULL,
    created_date timestamp with time zone NOT NULL
);


ALTER TABLE public.pages_team OWNER TO postgres;

--
-- Name: pages_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_teams_id_seq OWNER TO postgres;

--
-- Name: pages_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_teams_id_seq OWNED BY public.pages_team.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auctions_auccontacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auctions_auccontacts ALTER COLUMN id SET DEFAULT nextval('public.auctions_auccontacts_id_seq'::regclass);


--
-- Name: auctions_auction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auctions_auction ALTER COLUMN id SET DEFAULT nextval('public.auctions_auction_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: cars_car id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars_car ALTER COLUMN id SET DEFAULT nextval('public.cars_car_id_seq'::regclass);


--
-- Name: contacts_contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_contact ALTER COLUMN id SET DEFAULT nextval('public.contacts_contact_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: notify_specification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notify_specification ALTER COLUMN id SET DEFAULT nextval('public.notify_specification_id_seq'::regclass);


--
-- Name: pages_team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_team ALTER COLUMN id SET DEFAULT nextval('public.pages_teams_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auctions_auccontacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auctions_auccontacts (id, first_name, last_name, car_id, car_title, email, phone, bid, message, user_id, create_date) FROM stdin;
28	Max	Smith	6	Jeep Compass	mail@email.com		1500000	im a competitor	11	2023-03-03 15:27:29.717709+05:30
29	john	doe	4	Volkswagen Taigun	scrappyc35@gmail.com	999	2200000	lets see...	5	2023-03-05 18:27:25.431338+05:30
31	max	payne	7	Renault Kwid	nishantdutta17@gmail.com	9996969698	750000	i require this baddy	12	2023-04-05 01:06:48.638298+05:30
\.


--
-- Data for Name: auctions_auction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auctions_auction (id, car_title, city, color, brand, year, condition, price, description, car_photo, car_photo_1, car_photo_2, car_photo_3, features, body_style, engine, transmission, interior, miles, doors, passengers, vin_no, milage, fuel_type, no_of_owners, created_date, sell_date) FROM stdin;
2	MG Hector	Powai	white	MG	2019	Fantastic	1491000	<p>Never before deal !!!</p>	photos/2023/02/12/Screen_Shot_2023-02-12_at_9.02.54_PM.png	photos/2023/02/12/Screen_Shot_2023-02-12_at_9.03.00_PM.png	photos/2023/02/12/Screen_Shot_2023-02-12_at_9.03.10_PM.png		Cruise Control,Audio Interface,Airbags,Air Conditioning,Seat Heating,Alarm System,ParkAssist,Power Steering,Reversing Camera,Direct Fuel Injection,Auto Start/Stop,Wind Deflector,Bluetooth Handset	SUV	1.5L Turbocharged	automatic	nylon	50945	4	5	1320989754	13	diesel	1	2023-02-16 21:03:46+05:30	2023-04-11
1	Kia Seltos	Thane	maroon	Kia	2019	Great	1437000	<p>Up for auction.&nbsp;</p>	photos/2023/02/12/Screen_Shot_2023-02-12_at_7.57.29_PM.png	photos/2023/02/12/Screen_Shot_2023-02-12_at_7.57.35_PM.png	photos/2023/02/12/Screen_Shot_2023-02-12_at_7.57.44_PM.png		Audio Interface,Airbags,Air Conditioning,Seat Heating,Alarm System,ParkAssist,Power Steering,Reversing Camera,Direct Fuel Injection,Auto Start/Stop,Wind Deflector,Bluetooth Handset	SUV	GTX+ 1.4 MT	manual	leather	60000	4	5	534324	10	petrol	2	2023-02-11 20:37:20+05:30	2023-04-20
5	Tata Tiago	Powai	grey	Tata	2018	Superb	552000	<p>Up for auction is a Tata Tiago hatchback that&#39;s perfect for those looking for an economical and practical vehicle. This car has a sleek and modern design with a compact body that makes it easy to navigate through tight spaces and park in small spots. The hatchback body style provides ample storage space for luggage, groceries, or sports equipment.</p>\r\n\r\n<p>Overall, this Tata Tiago&nbsp;hatchback is a great option</p>	photos/2023/03/02/Screen_Shot_2023-03-02_at_5.41.06_PM.png	photos/2023/03/02/Screen_Shot_2023-03-02_at_5.41.31_PM.png	photos/2023/03/02/Screen_Shot_2023-03-02_at_5.41.37_PM.png		Audio Interface,Airbags,Air Conditioning,ParkAssist,Power Steering,Auto Start/Stop,Wind Deflector	hatchback	XZA 1.2 revotron	manual	nylon	26400	4	4	567145234	13	diesel	2	2023-03-02 17:41:43+05:30	2023-04-08
3	Hyundai i20	Vashi	grey	Hyundai	2013	Working	326000	<p>This grey hatchback up for auction is a compact car with a streamlined body design. It features a four-door layout and has a hatchback rear end that provides ample storage space for cargo. The exterior is finished in a sleek shade of grey, with minimal detailing that gives it a modern and stylish look. The car has a reliable engine, and the interior is spacious and comfortable, with room for up to five passengers. Overall, this grey hatchback is a practical and versatile vehicle that would make an excellent choice for daily commutes, errands, or road trips.</p>	photos/2023/02/26/Screen_Shot_2023-02-26_at_6.51.30_PM.png	photos/2023/02/26/Screen_Shot_2023-02-26_at_6.51.38_PM.png	photos/2023/02/26/Screen_Shot_2023-02-26_at_6.51.49_PM.png		Audio Interface,Airbags,Air Conditioning,Direct Fuel Injection,Auto Start/Stop	hatchback	4 cylinder inline petrol engine	manual	polyester	63998	4	4	348907	18	petrol	1	2023-02-27 18:42:44+05:30	2023-04-09
7	Renault Kwid	Thane	black	Jeep	2016	Working	700000	<p>description&nbsp;</p>	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.47.36_PM.png	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.47.42_PM.png	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.47.50_PM.png		Cruise Control,Audio Interface,Airbags,Seat Heating,ParkAssist,Power Steering,Auto Start/Stop,Wind Deflector,Bluetooth Handset	SUV	RXT	manual	leather	28000	4	4	67878300	18	petrol	2	2023-03-03 14:48:03+05:30	2023-04-10
4	Volkswagen Taigun	Thane	black	Volkswagen	2022	Brand New	1700000	<p>Versatile vehicle designed for transporting people and goods. It typically has a four-wheel-drive system, high ground clearance, and a spacious interior with multiple rows of seating. The exterior is characterized by its boxy shape, elevated ride height, and dark color, which gives it a sleek and sophisticated look. Black SUVs are often used for family transportation, off-road adventures, or as luxury vehicles for executives and celebrities.</p>	photos/2023/03/02/Screen_Shot_2023-03-02_at_5.38.12_PM.png	photos/2023/03/02/Screen_Shot_2023-03-02_at_5.38.18_PM.png	photos/2023/03/02/Screen_Shot_2023-03-02_at_5.38.25_PM.png		Cruise Control,Audio Interface,Airbags,Air Conditioning,Seat Heating,Alarm System,ParkAssist,Power Steering,Reversing Camera,Direct Fuel Injection,Auto Start/Stop,Wind Deflector,Bluetooth Handset	SUV	topline 1.0 TSI MT	automatic	Polyester	3680	4	6	235634235	18	petrol	1	2023-03-02 17:33:32+05:30	2023-04-15
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add car	1	add_car
2	Can change car	1	change_car
3	Can delete car	1	delete_car
4	Can view car	1	view_car
5	Can add team	2	add_team
6	Can change team	2	change_team
7	Can delete team	2	delete_team
8	Can view team	2	view_team
9	Can add contact	3	add_contact
10	Can change contact	3	change_contact
11	Can delete contact	3	delete_contact
12	Can view contact	3	view_contact
13	Can add log entry	4	add_logentry
14	Can change log entry	4	change_logentry
15	Can delete log entry	4	delete_logentry
16	Can view log entry	4	view_logentry
17	Can add permission	5	add_permission
18	Can change permission	5	change_permission
19	Can delete permission	5	delete_permission
20	Can view permission	5	view_permission
21	Can add group	6	add_group
22	Can change group	6	change_group
23	Can delete group	6	delete_group
24	Can view group	6	view_group
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add content type	8	add_contenttype
30	Can change content type	8	change_contenttype
31	Can delete content type	8	delete_contenttype
32	Can view content type	8	view_contenttype
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
37	Can add site	10	add_site
38	Can change site	10	change_site
39	Can delete site	10	delete_site
40	Can view site	10	view_site
41	Can add email address	11	add_emailaddress
42	Can change email address	11	change_emailaddress
43	Can delete email address	11	delete_emailaddress
44	Can view email address	11	view_emailaddress
45	Can add email confirmation	12	add_emailconfirmation
46	Can change email confirmation	12	change_emailconfirmation
47	Can delete email confirmation	12	delete_emailconfirmation
48	Can view email confirmation	12	view_emailconfirmation
49	Can add social account	13	add_socialaccount
50	Can change social account	13	change_socialaccount
51	Can delete social account	13	delete_socialaccount
52	Can view social account	13	view_socialaccount
53	Can add social application	14	add_socialapp
54	Can change social application	14	change_socialapp
55	Can delete social application	14	delete_socialapp
56	Can view social application	14	view_socialapp
57	Can add social application token	15	add_socialtoken
58	Can change social application token	15	change_socialtoken
59	Can delete social application token	15	delete_socialtoken
60	Can view social application token	15	view_socialtoken
61	Can add auction	16	add_auction
62	Can change auction	16	change_auction
63	Can delete auction	16	delete_auction
64	Can view auction	16	view_auction
65	Can add auc contacts	17	add_auccontacts
66	Can change auc contacts	17	change_auccontacts
67	Can delete auc contacts	17	delete_auccontacts
68	Can view auc contacts	17	view_auccontacts
69	Can add specification	18	add_specification
70	Can change specification	18	change_specification
71	Can delete specification	18	delete_specification
72	Can view specification	18	view_specification
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$sWutvrkoHXrk$SOVva3OILcyrJnBcbyeFE7emPsc8vR+piUO4aanOt6A=	2023-04-04 14:09:48.338082+05:30	t	djangoadmin			scrappycoco902@gmail.com	t	t	2023-01-28 16:03:29+05:30
2	!z0JZCPPeKFdXEUbauPOXe2O34dC4Vw7ECRKj3lVS	2023-02-03 13:33:15.646891+05:30	f	bot	Bot	Bot		f	t	2023-02-02 21:04:10.558893+05:30
3	!Dy3HeHPpvwuamJMkcKRaNaxmuVnGNAb4ggyYRBhF	2023-02-03 15:11:47.948267+05:30	f	scrappy	Scrappy	Coco		f	t	2023-02-02 21:05:53.756714+05:30
5	pbkdf2_sha256$180000$sExy0F2DfboR$ZXbKF6ICgZhix9oWtCg0pG/gr42Qdfzu47DIVUcTfTo=	2023-04-05 01:08:15.832864+05:30	f	johndoe	john	doe	scrappycoco902@gmail.com	f	t	2023-02-02 21:23:33+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: cars_car; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars_car (id, car_title, city, color, brand, year, condition, price, description, car_photo, car_photo_1, car_photo_2, car_photo_3, car_photo_4, features, body_style, engine, transmission, interior, miles, doors, passengers, vin_no, milage, fuel_type, no_of_owners, is_featured, created_date, sold) FROM stdin;
1	Ford EcoSport	Thane	black	Ford	2016	Fully Working	500000	<h2><strong><cite>We&rsquo;ll bring the car straight to your home or you can experience<br />\r\none of our CarZone&nbsp;Hub.</cite></strong></h2>	photos/2023/01/28/fordEco1.png	photos/2023/01/28/fordEco2.png	photos/2023/01/28/fordEco3.png			Cruise Control,Audio Interface,Airbags,Air Conditioning,Seat Heating,ParkAssist,Bluetooth Handset	SUV	1.5L TiVCT (Petrol)	automatic	cool	46122	4	5	12344321	16	petrol	2	t	2023-01-28 16:26:26+05:30	f
3	Mercedes Benz E Class	Vashi	white	Mercedes	2011	Great	936000	<p>U gotta buy this !!!</p>	photos/2023/02/11/Screen_Shot_2023-02-11_at_2.44.11_PM.png	photos/2023/02/11/Screen_Shot_2023-02-11_at_2.43.59_PM.png	photos/2023/02/11/Screen_Shot_2023-02-11_at_2.44.22_PM.png			Audio Interface,Airbags,Air Conditioning,Alarm System,ParkAssist,Reversing Camera,Direct Fuel Injection,Auto Start/Stop,Wind Deflector,Bluetooth Handset	sedan	V6	automatic	leather	78206	4	5	35654325	20	petrol	2	f	2023-02-11 14:44:40+05:30	f
4	Honda City	Thane	white	Honda	2016	Super	763100	<p>In great condtion and a wise choice</p>	photos/2023/02/11/Screen_Shot_2023-02-11_at_2.59.28_PM.png	photos/2023/02/11/Screen_Shot_2023-02-11_at_2.59.35_PM.png				Audio Interface,Airbags,Air Conditioning,ParkAssist,Direct Fuel Injection,Bluetooth Handset	sedan	1498 cc	automatic	polyester	84204	4	5	876445367	17	petrol	1	t	2023-02-11 14:53:41+05:30	f
7	Volkswagen Polo	Thane	red	Volkswagen	2012	Working Great!!!	325000	<p>Worth another shot!!!</p>	photos/2023/02/11/Screen_Shot_2023-02-12_at_2.40.47_AM.png	photos/2023/02/11/Screen_Shot_2023-02-12_at_2.41.06_AM.png	photos/2023/02/11/Screen_Shot_2023-02-12_at_2.41.17_AM.png			Audio Interface,Airbags,Air Conditioning,Alarm System,ParkAssist,Power Steering,Reversing Camera,Direct Fuel Injection,Auto Start/Stop,Bluetooth Handset	hatchback	3 cylinder inline	manual	leather	61480	4	4	345642331232	13	petrol	2	t	2023-02-12 02:41:27+05:30	f
6	Ford Endeavour	Vashi	white	Ford	2018	Perfect	2854000	<p>Like new. Great car!!</p>	photos/2023/02/11/Screen_Shot_2023-02-11_at_3.18.44_PM.png	photos/2023/02/11/Screen_Shot_2023-02-11_at_3.18.52_PM.png	photos/2023/02/11/Screen_Shot_2023-02-11_at_3.19.04_PM.png			Cruise Control,Audio Interface,Airbags,Air Conditioning,Alarm System,ParkAssist,Direct Fuel Injection,Auto Start/Stop,Wind Deflector,Bluetooth Handset	SUV	2.2l 4X2 AT	manual	nylon	76544	4	5	3453154623555	20	diesel	1	t	2023-02-11 15:14:34+05:30	f
10	Nissan Terrano	Thane	red	Nissan	2015	Great	500000	<p>Very Nice !!!</p>	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.21.32_PM.png	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.21.39_PM.png	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.21.48_PM.png			Audio Interface,Airbags,Air Conditioning,Seat Heating,Reversing Camera,Direct Fuel Injection,Bluetooth Handset	SUV	XL Plus 85	maunal	polyester	86000	4	5	3453452453	17	diesel	2	f	2023-03-03 14:21:12+05:30	f
8	Skoda Superb	Powai	blue	Skoda	2015	Wonderful	585000	<p>Up for Auction. Don&#39;t miss it !!!</p>	photos/2023/02/12/Screen_Shot_2023-02-12_at_7.49.01_PM.png	photos/2023/02/12/Screen_Shot_2023-02-12_at_7.49.16_PM.png	photos/2023/02/12/Screen_Shot_2023-02-12_at_7.49.27_PM.png			Cruise Control,Audio Interface,Airbags,Air Conditioning,Alarm System,ParkAssist,Reversing Camera,Auto Start/Stop,Bluetooth Handset	sedan	1.8 TSI AT	manual	polyester	81945	4	5	43565473452	17	diesel	1	f	2023-02-12 19:46:46+05:30	f
11	Maruti Desire	Powai	red	Maruti	2017	Nice	650000	<p>Very nice car. Worth another chance</p>	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.24.57_PM.png	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.25.02_PM.png	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.25.10_PM.png			Audio Interface,Alarm System,ParkAssist,Direct Fuel Injection,Wind Deflector	sedan	VXI	manual	leather	78096	4	4	34536552	18	petrol	1	t	2023-03-03 14:25:40+05:30	f
12	Maruti Wagon R	Vashi	white	Maruti	2012	Working	286000	<p>Still runs</p>	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.29.34_PM.png	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.29.39_PM.png	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.29.46_PM.png			Audio Interface,Airbags,Seat Heating,Alarm System,Reversing Camera,Direct Fuel Injection,Bluetooth Handset	hatchback	1.0 LXI CNG	manual	leather	88000	4	4	2343521432	12	petrol	2	f	2023-03-03 14:30:08+05:30	f
5	Mahindra Thar LX	Powai	grey	Mahindra	2021	Too Good	1670000	<p>No problem, be it city or off road!!!</p>	photos/2023/02/11/Screen_Shot_2023-02-11_at_3.08.40_PM.png	photos/2023/02/11/Screen_Shot_2023-02-11_at_3.08.52_PM.png	photos/2023/02/11/Screen_Shot_2023-02-11_at_3.08.21_PM.png			Cruise Control,Audio Interface,Airbags,Air Conditioning,ParkAssist,Power Steering,Direct Fuel Injection,Auto Start/Stop,Bluetooth Handset	SUV	2.0L I4 mStallion 150 TGD	automatic	vinyl	4729	2	4	4653425632	23	diesel	1	f	2023-02-11 15:03:23+05:30	f
2	Toyota Corolla Altis	Powai	grey	Toyota	2016	Great	450000	<p>In great shape.</p>	photos/2023/01/31/Screen_Shot_2023-01-31_at_8.38.49_PM.png	photos/2023/01/31/Screen_Shot_2023-01-31_at_8.39.01_PM.png	photos/2023/01/31/Screen_Shot_2023-01-31_at_8.39.12_PM.png			Airbags,Air Conditioning,Alarm System,ParkAssist,Reversing Camera	sedan	2ZRFE, gasoline, 4 cylinder inline	manual	nice	30000	4	5	23453879492	16	petrol	2	f	2023-01-31 20:36:02+05:30	f
13	Tata Hexa Varicor	Thane	white	Tata	2020	Super	2000000	<p>Very good condition (as good as new)</p>	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.34.19_PM.png	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.34.25_PM.png	photos/2023/03/03/Screen_Shot_2023-03-03_at_2.34.32_PM.png			Cruise Control,Audio Interface,Seat Heating,Alarm System,Reversing Camera,Direct Fuel Injection,Wind Deflector,Bluetooth Handset	SUV	400 XMA	automatic	polyester	10000	5	6	8645346574	19	diesel	1	f	2023-03-03 14:35:00+05:30	f
17	Tata Tiago	Vashi	white	Tata	2020	Superb	1900000	<p>For sale: 2nd hand white hatchback in great condition. Excellent option for those seeking a reliable vehicle.</p>	photos/2023/03/19/Screen_Shot_2023-03-19_at_11.45.52_PM.png	photos/2023/03/19/Screen_Shot_2023-03-19_at_11.46.02_PM.png	photos/2023/03/19/Screen_Shot_2023-03-19_at_11.46.11_PM.png			Audio Interface,Airbags,Air Conditioning,Seat Heating,ParkAssist,Direct Fuel Injection,Auto Start/Stop,Bluetooth Handset	SUV	Revotron 1.2 L BS6 engine	manual	nylon	8000	4	4	123	20	petrol	1	t	2023-03-19 21:38:19+05:30	f
9	Tata Harrier	Vashi	white	Tata	2019	Nice	1484000	<p>The Harrier is an elegant white SUV that is now up for sale. With its sleek and stylish design, this vehicle is sure to turn heads on the road. The exterior of the Harrier features a bold and athletic stance, with sculpted lines and a distinct front grille. The white paint job is in excellent condition, shining brightly in the sun and complementing the car&#39;s sophisticated look.</p>\r\n\r\n<p>Inside, the Harrier is spacious and comfortable, with plush seats that can accommodate up to five passengers. The cabin is well-appointed, with premium materials and modern technology features that make driving a pleasure.</p>	photos/2023/03/02/Screen_Shot_2023-03-02_at_5.48.02_PM.png	photos/2023/03/02/Screen_Shot_2023-03-02_at_5.48.09_PM.png	photos/2023/03/02/Screen_Shot_2023-03-02_at_5.48.32_PM.png			Cruise Control,Airbags,Air Conditioning,Alarm System,ParkAssist,Reversing Camera,Auto Start/Stop,Wind Deflector	SUV	XZ 2.0L Kryotec	manual	polyester	56210	4	5	1237452435	17	petrol	1	t	2023-03-02 17:47:50+05:30	f
\.


--
-- Data for Name: contacts_contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_contact (id, first_name, last_name, car_id, customer_need, car_title, city, state, email, phone, message, user_id, create_date) FROM stdin;
9	registeringFirstName	registeringLastName	6	I'm interested in this	Ford Endeavour	xyz	pqr	sample@mmail.com			7	2023-02-12 14:59:23.906126+05:30
10	registeringFirstName	registeringLastName	7	I'm interested in this	Volkswagen Polo	Thane	Maharastra	sample@mmail.com	49999	I want to buy this Polo	7	2023-02-12 18:06:41.605944+05:30
12	check	proj	8	I'm interested in this	Skoda Superb	city!	state1	mail@xx.yy	999	comments	0	2023-02-21 20:48:33.965297+05:30
17	john	doe	12	I'd like to know your best price for this	Maruti Wagon R	cccc	ssss	scrappyc35@gmail.com			5	2023-03-03 21:14:56.494828+05:30
18	john	doe	4		Honda City	CityNow	StateNow	scrappyc35@gmail.com	999	comms	5	2023-03-12 22:54:20.527051+05:30
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-01-28 16:12:41.66415+05:30	1	John	1	[{"added": {}}]	2	1
2	2023-01-28 16:13:59.846797+05:30	2	Max	1	[{"added": {}}]	2	1
3	2023-01-28 16:14:42.756501+05:30	3	maggie	1	[{"added": {}}]	2	1
4	2023-01-28 16:15:25.172871+05:30	4	white	1	[{"added": {}}]	2	1
5	2023-01-28 16:16:08.67923+05:30	5	Nick	1	[{"added": {}}]	2	1
6	2023-01-28 16:34:39.159527+05:30	1	First Car	1	[{"added": {}}]	1	1
7	2023-01-28 16:36:45.078121+05:30	1	First Car	2	[{"changed": {"fields": ["Price"]}}]	1	1
8	2023-01-28 18:52:34.479282+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["Car title", "State", "City", "Color", "Model", "Year", "Condition", "Price", "Description", "Car photo", "Car photo 1", "Car photo 2", "Features", "Engine", "Transmission", "Miles", "Doors", "Passengers", "Milage", "No of owners"]}}]	1	1
9	2023-01-29 00:04:01.053883+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["Is featured"]}}]	1	1
10	2023-01-31 20:01:49.316214+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["Body style"]}}]	1	1
11	2023-01-31 20:40:06.649612+05:30	2	Toyota Corolla Altis	1	[{"added": {}}]	1	1
12	2023-01-31 20:43:26.725906+05:30	2	Toyota Corolla Altis	2	[{"changed": {"fields": ["Miles"]}}]	1	1
13	2023-02-01 01:53:02.134474+05:30	2	Toyota Corolla Altis	2	[{"changed": {"fields": ["Year"]}}]	1	1
14	2023-02-02 11:41:38.612585+05:30	1	facebook Login	1	[{"added": {}}]	14	1
15	2023-02-02 11:42:33.311195+05:30	1	localhost:8000	2	[{"changed": {"fields": ["Domain name", "Display name"]}}]	10	1
16	2023-02-02 21:00:03.433184+05:30	2	Google Login	1	[{"added": {}}]	14	1
17	2023-02-02 21:22:20.875592+05:30	4	johndoe	3		7	1
18	2023-02-02 21:24:48.506206+05:30	4	Ben	2	[{"changed": {"fields": ["First name", "Last name", "Designation"]}}]	2	1
19	2023-02-02 21:25:06.167523+05:30	3	Maggie	2	[{"changed": {"fields": ["First name", "Last name", "Designation"]}}]	2	1
20	2023-02-02 21:25:24.721489+05:30	4	Ben	2	[{"changed": {"fields": ["Designation"]}}]	2	1
21	2023-02-02 21:25:40.172375+05:30	3	Girl	2	[{"changed": {"fields": ["First name", "Designation"]}}]	2	1
22	2023-02-02 21:26:06.929559+05:30	2	boy	2	[{"changed": {"fields": ["First name", "Last name", "Designation"]}}]	2	1
23	2023-02-02 21:26:12.734863+05:30	3	Girl	2	[{"changed": {"fields": ["Last name"]}}]	2	1
24	2023-02-02 21:26:25.646109+05:30	1	boy 2	2	[{"changed": {"fields": ["First name", "Last name", "Designation"]}}]	2	1
25	2023-02-02 21:26:59.159442+05:30	2	boy 1	2	[{"changed": {"fields": ["First name"]}}]	2	1
26	2023-02-02 21:27:33.623441+05:30	2	Toyota Corolla Altis	2	[{"changed": {"fields": ["Body style", "Engine", "Transmission"]}}]	1	1
27	2023-02-02 21:27:50.594378+05:30	1	Ford EcoSport	2	[]	1	1
28	2023-02-02 21:30:32.340815+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["Transmission"]}}]	1	1
29	2023-02-03 13:34:34.518566+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["Body style"]}}]	1	1
30	2023-02-03 13:36:20.139014+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["Price"]}}]	1	1
31	2023-02-03 13:36:39.328487+05:30	2	Toyota Corolla Altis	2	[{"changed": {"fields": ["Price"]}}]	1	1
32	2023-02-03 13:48:25.000459+05:30	5	Nick	2	[{"changed": {"fields": ["Photo"]}}]	2	1
33	2023-02-03 13:49:40.227213+05:30	2	Jijo	2	[{"changed": {"fields": ["First name", "Last name", "Photo"]}}]	2	1
34	2023-02-03 13:50:21.037307+05:30	5	Nick	2	[{"changed": {"fields": ["Photo"]}}]	2	1
35	2023-02-03 13:50:31.592877+05:30	3	Girl	2	[{"changed": {"fields": ["Photo"]}}]	2	1
36	2023-02-03 13:54:40.727915+05:30	1	Nish	2	[{"changed": {"fields": ["First name", "Last name", "Photo"]}}]	2	1
37	2023-02-03 13:54:59.433885+05:30	3	Alden	2	[{"changed": {"fields": ["First name", "Last name", "Designation"]}}]	2	1
38	2023-02-03 13:55:10.712002+05:30	2	Jijo	2	[{"changed": {"fields": ["Last name", "Designation"]}}]	2	1
39	2023-02-03 13:55:18.687508+05:30	1	Nish	2	[{"changed": {"fields": ["Designation"]}}]	2	1
40	2023-02-03 13:55:43.689125+05:30	3	Alden	2	[{"changed": {"fields": ["Photo"]}}]	2	1
41	2023-02-03 13:56:01.794432+05:30	4	Ben	3		2	1
42	2023-02-03 13:57:14.98129+05:30	2	Jijo	2	[{"changed": {"fields": ["Photo"]}}]	2	1
43	2023-02-03 13:57:22.266606+05:30	5	Nick	2	[{"changed": {"fields": ["Photo"]}}]	2	1
44	2023-02-03 13:59:17.639404+05:30	5	Snow	2	[{"changed": {"fields": ["First name", "Last name", "Designation"]}}]	2	1
45	2023-02-03 14:00:46.051763+05:30	5	Snow	2	[{"changed": {"fields": ["Photo"]}}]	2	1
46	2023-02-03 14:02:25.33132+05:30	2	Jijo	2	[{"changed": {"fields": ["Photo"]}}]	2	1
47	2023-02-03 14:02:56.001836+05:30	2	Jijo	2	[{"changed": {"fields": ["Photo"]}}]	2	1
48	2023-02-03 14:03:41.564678+05:30	2	Jijo	2	[{"changed": {"fields": ["Photo"]}}]	2	1
49	2023-02-11 14:52:30.246976+05:30	3	Mercedes Benz E Class	1	[{"added": {}}]	1	1
50	2023-02-11 15:01:01.375245+05:30	4	Honda City	1	[{"added": {}}]	1	1
51	2023-02-11 15:09:23.82374+05:30	5	Mahindra Thar LX	1	[{"added": {}}]	1	1
52	2023-02-11 15:10:06.627928+05:30	5	Mahindra Thar LX	2	[{"changed": {"fields": ["Is featured"]}}]	1	1
53	2023-02-11 15:10:06.635984+05:30	3	Mercedes Benz E Class	2	[{"changed": {"fields": ["Is featured"]}}]	1	1
54	2023-02-11 15:10:06.643517+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["Is featured"]}}]	1	1
55	2023-02-11 15:12:36.938482+05:30	5	Mahindra Thar LX	2	[{"changed": {"fields": ["Is featured"]}}]	1	1
56	2023-02-11 15:12:36.957556+05:30	3	Mercedes Benz E Class	2	[{"changed": {"fields": ["Is featured"]}}]	1	1
57	2023-02-11 15:12:36.964498+05:30	2	Toyota Corolla Altis	2	[{"changed": {"fields": ["Is featured"]}}]	1	1
58	2023-02-11 15:19:26.170407+05:30	6	Ford Endeavour	1	[{"added": {}}]	1	1
59	2023-02-11 15:21:44.988408+05:30	3	Mercedes Benz E Class	2	[{"changed": {"fields": ["Model"]}}]	1	1
60	2023-02-11 15:22:10.726172+05:30	5	Mahindra Thar LX	2	[{"changed": {"fields": ["Model"]}}]	1	1
61	2023-02-11 15:22:33.772365+05:30	4	Honda City	2	[{"changed": {"fields": ["Model"]}}]	1	1
62	2023-02-11 19:52:43.899262+05:30	4	Honda City	2	[{"changed": {"fields": ["Fuel type"]}}]	1	1
63	2023-02-11 19:52:59.792174+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["Body style"]}}]	1	1
64	2023-02-11 20:39:55.871761+05:30	1	firstAuc	1	[{"added": {}}]	16	1
65	2023-02-12 02:45:07.904247+05:30	7	Volkswagen	1	[{"added": {}}]	1	1
66	2023-02-12 02:47:24.232886+05:30	6	Ford	2	[{"changed": {"fields": ["Car title"]}}]	1	1
67	2023-02-12 02:47:51.53765+05:30	7	Volkswagen Polo	2	[{"changed": {"fields": ["Car title"]}}]	1	1
68	2023-02-12 02:47:59.86003+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["Car title"]}}]	1	1
70	2023-02-12 04:14:55.162336+05:30	1	djangoadmin	2	[{"changed": {"fields": ["Email address"]}}]	7	1
71	2023-02-12 04:46:30.478767+05:30	1	scrappyc35@gmail.com	3		3	1
72	2023-02-12 12:49:22.631457+05:30	4	1010throwaway0101@gmail.com	3		3	1
73	2023-02-12 12:49:22.642344+05:30	3	1010throwaway0101@gmail.com	3		3	1
74	2023-02-12 12:49:22.644852+05:30	2	scrappyc35@gmail.com	3		3	1
75	2023-02-12 14:22:10.595155+05:30	7	Volkswagen Polo	2	[{"changed": {"fields": ["City"]}}]	1	1
76	2023-02-12 14:22:23.328445+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["City"]}}]	1	1
77	2023-02-12 14:22:39.086083+05:30	5	Mahindra Thar LX	2	[{"changed": {"fields": ["City"]}}]	1	1
78	2023-02-12 14:22:50.093081+05:30	4	Honda City	2	[{"changed": {"fields": ["City"]}}]	1	1
79	2023-02-12 14:23:00.825406+05:30	3	Mercedes Benz E Class	2	[{"changed": {"fields": ["City"]}}]	1	1
80	2023-02-12 14:23:22.978221+05:30	2	Toyota Corolla Altis	2	[{"changed": {"fields": ["City"]}}]	1	1
81	2023-02-12 14:23:36.622738+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["City"]}}]	1	1
82	2023-02-12 14:25:00.327154+05:30	7	fake@mail.com	3		3	1
83	2023-02-12 14:25:00.330556+05:30	6	xyz@mail.com	3		3	1
84	2023-02-12 14:25:00.332983+05:30	5	sample@email.com	3		3	1
85	2023-02-12 17:19:30.628984+05:30	1	aucContacts object (1)	3		17	1
86	2023-02-12 18:05:31.017953+05:30	2	aucContacts object (2)	3		17	1
87	2023-02-12 19:53:31.267831+05:30	8	Skoda Superb	1	[{"added": {}}]	1	1
88	2023-02-12 19:58:21.772601+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["Car title", "City", "Color", "Model", "Year", "Condition", "Price", "Description", "Car photo", "Car photo 1", "Car photo 2", "Features", "Body style", "Engine", "Interior", "No of owners"]}}]	16	1
89	2023-02-12 19:59:36.019393+05:30	3	aucContacts object (3)	3		17	1
90	2023-02-12 20:54:22.573247+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["Is featured"]}}]	1	1
91	2023-02-12 21:06:39.851756+05:30	2	MG Hector	1	[{"added": {}}]	16	1
92	2023-02-12 22:03:48.856591+05:30	5	aucContacts object (5)	3		17	1
93	2023-02-12 22:07:57.747808+05:30	6	aucContacts object (6)	3		17	1
94	2023-02-12 22:10:37.398945+05:30	7	aucContacts object (7)	3		17	1
95	2023-02-13 20:43:54.242994+05:30	8	aucContacts object (8)	3		17	1
96	2023-02-13 20:45:04.290658+05:30	9	aucContacts object (9)	3		17	1
97	2023-02-14 23:48:25.273867+05:30	7	Username	2	[]	7	1
98	2023-02-14 23:48:45.148592+05:30	7	Username	2	[]	7	1
99	2023-02-14 23:49:07.176399+05:30	7	Username	3		7	1
100	2023-02-16 19:57:43.136391+05:30	10	aucContacts object (10)	3		17	1
101	2023-02-16 19:57:43.145611+05:30	4	aucContacts object (4)	3		17	1
102	2023-02-16 20:01:59.252035+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["Miles"]}}]	16	1
103	2023-02-17 11:25:16.24112+05:30	5	Snow	2	[{"changed": {"fields": ["Photo"]}}]	2	1
104	2023-02-17 11:56:53.93909+05:30	5	Snow	2	[{"changed": {"fields": ["Photo"]}}]	2	1
105	2023-02-21 20:58:33.366916+05:30	1	djangoadmin	2	[{"changed": {"fields": ["Email address"]}}]	7	1
106	2023-02-21 21:11:30.314231+05:30	13	aucContacts object (13)	3		17	1
107	2023-02-22 21:55:02.414673+05:30	8	alden_f	3		7	1
108	2023-02-22 21:55:11.043922+05:30	9	scrappy4	3		7	1
109	2023-02-23 19:01:57.694001+05:30	14	scrappyc35@gmail.com	3		17	1
110	2023-02-23 19:02:47.502871+05:30	12	aldenfarias8@gmail.com	3		17	1
111	2023-02-25 22:31:11.601542+05:30	2	MG Hector	2	[{"changed": {"fields": ["SellDate"]}}]	16	1
112	2023-02-25 22:35:18.020676+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["SellDate"]}}]	16	1
113	2023-02-26 18:52:26.972073+05:30	3	Hyundai i20	1	[{"added": {}}]	16	1
114	2023-02-26 18:53:33.793796+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
115	2023-02-26 19:09:16.230655+05:30	10	scrappy4	3		7	1
116	2023-02-27 19:55:11.596451+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
117	2023-02-27 19:55:18.850613+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
118	2023-02-27 19:55:36.457999+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Created date"]}}]	16	1
119	2023-02-27 19:56:02.05252+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sell date", "Created date"]}}]	16	1
120	2023-02-28 19:35:22.395239+05:30	2	MG Hector	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
121	2023-02-28 20:06:57.872729+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sold"]}}]	16	1
122	2023-02-28 20:26:19.439927+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["Sold"]}}]	1	1
123	2023-02-28 20:26:53.239331+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["Sold"]}}]	1	1
124	2023-02-28 20:29:46.41054+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["Sold"]}}]	1	1
125	2023-02-28 20:30:01.856158+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
126	2023-02-28 20:30:01.863101+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["Sold"]}}]	1	1
127	2023-02-28 20:30:55.419184+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
128	2023-03-01 21:58:14.352843+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sold"]}}]	16	1
129	2023-03-01 21:58:47.956502+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sold"]}}]	16	1
130	2023-03-01 22:02:37.636662+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sold"]}}]	16	1
131	2023-03-01 22:02:45.310787+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
132	2023-03-01 22:07:54.681012+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
133	2023-03-01 22:09:25.955458+05:30	2	MG Hector	2	[{"changed": {"fields": ["Sold"]}}]	16	1
134	2023-03-01 22:09:31.336913+05:30	2	MG Hector	2	[{"changed": {"fields": ["Sold"]}}]	16	1
135	2023-03-01 23:03:02.499223+05:30	7	Volkswagen Polo	2	[{"changed": {"fields": ["Sold"]}}]	1	1
136	2023-03-01 23:03:15.133244+05:30	7	Volkswagen Polo	2	[{"changed": {"fields": ["Sold"]}}]	1	1
137	2023-03-01 23:04:12.405322+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
138	2023-03-01 23:04:34.348877+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
139	2023-03-01 23:04:34.354809+05:30	7	Volkswagen Polo	2	[{"changed": {"fields": ["Sold"]}}]	1	1
140	2023-03-01 23:06:11.773743+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
141	2023-03-01 23:06:11.780975+05:30	7	Volkswagen Polo	2	[{"changed": {"fields": ["Sold"]}}]	1	1
142	2023-03-01 23:52:45.217909+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sold"]}}]	16	1
143	2023-03-01 23:53:05.610074+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sold"]}}]	16	1
144	2023-03-01 23:53:41.045398+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
145	2023-03-01 23:57:27.75628+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sold"]}}]	16	1
146	2023-03-02 00:01:41.0795+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
147	2023-03-02 00:09:53.288704+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
148	2023-03-02 00:09:59.205688+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sold"]}}]	16	1
149	2023-03-02 00:12:59.380282+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["Sold"]}}]	1	1
150	2023-03-02 00:13:11.511848+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["Sold"]}}]	1	1
151	2023-03-02 15:45:18.524758+05:30	2	MG Hector	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
152	2023-03-02 15:45:26.226766+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
153	2023-03-02 17:40:36.03223+05:30	4	Volkswagen Taigun	1	[{"added": {}}]	16	1
154	2023-03-02 17:46:24.088244+05:30	5	Tata Tiago	1	[{"added": {}}]	16	1
155	2023-03-02 17:52:25.060902+05:30	9	Tata Harrier	1	[{"added": {}}]	1	1
156	2023-03-02 22:15:19.246149+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["Sold"]}}]	1	1
157	2023-03-02 22:15:36.14109+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["Sold"]}}]	1	1
158	2023-03-03 00:44:14.022844+05:30	5	Mahindra Thar LX	2	[{"changed": {"fields": ["Color"]}}]	1	1
159	2023-03-03 00:44:32.215169+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Color"]}}]	1	1
160	2023-03-03 00:44:57.35266+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["Color"]}}]	1	1
161	2023-03-03 00:45:09.075226+05:30	3	Mercedes Benz E Class	2	[{"changed": {"fields": ["Color"]}}]	1	1
162	2023-03-03 01:47:31.520703+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
163	2023-03-03 01:48:01.64677+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
164	2023-03-03 02:34:16.803455+05:30	1	djangoadmin	2	[{"changed": {"fields": ["Email address"]}}]	7	1
165	2023-03-03 02:38:34.985845+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Sold"]}}]	16	1
166	2023-03-03 11:15:57.079965+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
167	2023-03-03 11:27:48.003677+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Sold"]}}]	1	1
168	2023-03-03 11:59:16.411283+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Sold"]}}]	16	1
169	2023-03-03 12:30:30.597988+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
170	2023-03-03 12:31:13.890193+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Sold"]}}]	16	1
171	2023-03-03 12:31:37.832225+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Sold"]}}]	16	1
172	2023-03-03 12:33:45.809841+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
173	2023-03-03 13:19:29.465333+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
174	2023-03-03 14:24:23.306017+05:30	10	Nissan Terrano	1	[{"added": {}}]	1	1
175	2023-03-03 14:27:47.666024+05:30	11	Maruti Desire	1	[{"added": {}}]	1	1
176	2023-03-03 14:32:11.919799+05:30	12	Maruti Wagon R	1	[{"added": {}}]	1	1
177	2023-03-03 14:37:33.320083+05:30	13	Tata Hexa	1	[{"added": {}}]	1	1
178	2023-03-03 14:45:34.124628+05:30	6	Jeep Compass	1	[{"added": {}}]	16	1
179	2023-03-03 14:50:13.583627+05:30	7	Renault Kwid	1	[{"added": {}}]	16	1
180	2023-03-03 14:59:09.953706+05:30	13	Tata Hexa	2	[{"changed": {"fields": ["Sold"]}}]	1	1
181	2023-03-03 14:59:53.959989+05:30	13	Tata Hexa	2	[{"changed": {"fields": ["Sold"]}}]	1	1
182	2023-03-03 15:14:57.241228+05:30	7	Renault Kwid	2	[{"changed": {"fields": ["Sold"]}}]	16	1
183	2023-03-03 19:46:26.891943+05:30	13	Tata Hexa Varicor	2	[{"changed": {"fields": ["Car title", "Model"]}}]	1	1
184	2023-03-03 19:46:44.808056+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Model"]}}]	1	1
185	2023-03-03 19:46:58.011518+05:30	11	Maruti Desire	2	[{"changed": {"fields": ["Model"]}}]	1	1
186	2023-03-03 19:47:07.900373+05:30	10	Nissan Terrano	2	[{"changed": {"fields": ["Model"]}}]	1	1
187	2023-03-03 19:47:21.603411+05:30	9	Tata Harrier	2	[{"changed": {"fields": ["Model"]}}]	1	1
188	2023-03-03 19:47:30.15821+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Model"]}}]	1	1
189	2023-03-03 19:47:42.31386+05:30	7	Volkswagen Polo	2	[{"changed": {"fields": ["Model"]}}]	1	1
190	2023-03-03 19:47:52.130693+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["Model"]}}]	1	1
191	2023-03-03 19:48:03.989946+05:30	5	Mahindra Thar LX	2	[{"changed": {"fields": ["Model"]}}]	1	1
192	2023-03-03 19:48:12.004822+05:30	4	Honda City	2	[{"changed": {"fields": ["Model"]}}]	1	1
193	2023-03-03 19:48:24.219882+05:30	3	Mercedes Benz E Class	2	[{"changed": {"fields": ["Model"]}}]	1	1
194	2023-03-03 19:48:40.547073+05:30	2	Toyota Corolla Altis	2	[{"changed": {"fields": ["Model"]}}]	1	1
195	2023-03-03 19:48:55.591083+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["Model"]}}]	1	1
196	2023-03-03 20:32:57.846063+05:30	13	Tata Hexa Varicor	2	[{"changed": {"fields": ["Brand"]}}]	1	1
197	2023-03-03 20:33:03.866029+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Brand"]}}]	1	1
198	2023-03-03 20:33:10.773934+05:30	11	Maruti Desire	2	[{"changed": {"fields": ["Brand"]}}]	1	1
199	2023-03-03 20:33:17.463153+05:30	10	Nissan Terrano	2	[{"changed": {"fields": ["Brand"]}}]	1	1
200	2023-03-03 20:33:25.354034+05:30	9	Tata Harrier	2	[{"changed": {"fields": ["Brand"]}}]	1	1
201	2023-03-03 20:33:32.021192+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["Brand"]}}]	1	1
202	2023-03-03 20:33:39.183289+05:30	7	Volkswagen Polo	2	[{"changed": {"fields": ["Brand"]}}]	1	1
203	2023-03-03 20:33:45.895645+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["Brand"]}}]	1	1
204	2023-03-03 20:33:53.52779+05:30	5	Mahindra Thar LX	2	[{"changed": {"fields": ["Brand"]}}]	1	1
205	2023-03-03 20:33:59.800694+05:30	4	Honda City	2	[{"changed": {"fields": ["Brand"]}}]	1	1
206	2023-03-03 20:34:07.496219+05:30	3	Mercedes Benz E Class	2	[{"changed": {"fields": ["Brand"]}}]	1	1
207	2023-03-03 20:34:14.852923+05:30	2	Toyota Corolla Altis	2	[{"changed": {"fields": ["Brand"]}}]	1	1
208	2023-03-03 20:34:21.863089+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["Brand"]}}]	1	1
209	2023-03-03 21:02:18.963197+05:30	13	Tata Hexa Varicor	2	[{"changed": {"fields": ["Sold"]}}]	1	1
210	2023-03-04 20:44:44.495766+05:30	13	Tata Hexa Varicor	2	[{"changed": {"fields": ["Sold"]}}]	1	1
211	2023-03-04 22:11:15.142365+05:30	7	Renault Kwid	2	[{"changed": {"fields": ["Sold"]}}]	16	1
212	2023-03-04 22:15:18.811291+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Brand"]}}]	16	1
213	2023-03-04 22:15:58.934909+05:30	7	Renault Kwid	2	[{"changed": {"fields": ["Brand"]}}]	16	1
214	2023-03-04 22:16:05.456442+05:30	6	Jeep Compass	2	[{"changed": {"fields": ["Brand"]}}]	16	1
215	2023-03-04 22:16:11.837808+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Brand"]}}]	16	1
216	2023-03-04 22:16:18.0738+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Brand"]}}]	16	1
217	2023-03-04 22:16:30.252305+05:30	2	MG Hector	2	[{"changed": {"fields": ["Brand"]}}]	16	1
218	2023-03-04 22:16:36.215934+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["Brand"]}}]	16	1
219	2023-03-05 17:45:40.658595+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
220	2023-03-05 17:45:50.787448+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
221	2023-03-05 18:02:37.382751+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
222	2023-03-05 18:04:21.999368+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
223	2023-03-05 18:04:28.14701+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
224	2023-03-05 18:06:52.222707+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
225	2023-03-05 18:15:50.776638+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
226	2023-03-05 18:18:32.055239+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
227	2023-03-05 18:18:39.453416+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
228	2023-03-05 18:27:50.499324+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
229	2023-03-05 18:28:12.85044+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
230	2023-03-05 18:28:38.35779+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
231	2023-03-05 18:28:49.673756+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
232	2023-03-05 18:28:54.758386+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
233	2023-03-05 18:57:39.872629+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
234	2023-03-05 19:00:23.753536+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
235	2023-03-05 19:03:49.505081+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
236	2023-03-05 19:10:33.598894+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
237	2023-03-05 19:11:08.391575+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
238	2023-03-05 19:30:58.945029+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
239	2023-03-05 19:31:59.943212+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
240	2023-03-05 19:33:13.965607+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
241	2023-03-05 21:08:19.672726+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
242	2023-03-05 21:08:28.9966+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
243	2023-03-05 21:08:36.429315+05:30	2	MG Hector	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
244	2023-03-05 21:08:44.711932+05:30	6	Jeep Compass	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
245	2023-03-05 21:23:06.667877+05:30	7	Renault Kwid	2	[{"changed": {"fields": ["Brand"]}}]	16	1
246	2023-03-05 22:24:36.445028+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
247	2023-03-05 22:42:38.694175+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date", "Sold"]}}]	16	1
248	2023-03-07 20:46:29.841613+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
249	2023-03-07 20:59:53.075781+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
250	2023-03-07 21:07:54.001103+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
251	2023-03-07 21:08:24.87352+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
252	2023-03-07 21:10:13.377713+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
253	2023-03-07 21:10:26.880996+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
254	2023-03-07 21:11:07.531087+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
255	2023-03-07 21:13:43.895944+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
256	2023-03-07 21:13:55.526505+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
257	2023-03-07 21:14:13.36322+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
258	2023-03-07 21:14:23.286396+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
259	2023-03-07 21:37:47.311199+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
260	2023-03-07 21:38:53.947066+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
261	2023-03-07 21:41:29.039649+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
262	2023-03-07 21:45:10.218037+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
263	2023-03-07 21:45:18.144671+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sold"]}}]	16	1
264	2023-03-07 21:45:44.437875+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
265	2023-03-07 21:47:54.499595+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
266	2023-03-09 19:27:37.957741+05:30	11	Maruti Desire	2	[{"changed": {"fields": ["Color"]}}]	1	1
267	2023-03-09 19:27:47.276388+05:30	10	Nissan Terrano	2	[{"changed": {"fields": ["Color"]}}]	1	1
268	2023-03-09 19:41:01.824078+05:30	7	Renault Kwid	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
269	2023-03-09 19:41:09.001235+05:30	6	Jeep Compass	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
270	2023-03-09 19:41:14.609001+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
271	2023-03-09 19:41:25.109637+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date", "Sold"]}}]	16	1
272	2023-03-09 19:41:31.796813+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
273	2023-03-09 19:41:37.833718+05:30	2	MG Hector	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
274	2023-03-09 19:41:43.399419+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
275	2023-03-11 15:06:30.514032+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
276	2023-03-11 15:13:09.866878+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
277	2023-03-11 15:18:05.211776+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
278	2023-03-11 20:34:31.829693+05:30	7	Renault Kwid	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
279	2023-03-11 20:34:37.859542+05:30	6	Jeep Compass	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
280	2023-03-11 20:34:44.107621+05:30	5	Tata Tiago	2	[]	16	1
281	2023-03-11 20:34:52.647268+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
282	2023-03-11 20:35:00.499292+05:30	2	MG Hector	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
283	2023-03-11 20:35:13.438188+05:30	2	MG Hector	2	[{"changed": {"fields": ["Created date"]}}]	16	1
284	2023-03-11 20:51:12.616993+05:30	13	Tata Hexa Varicor	2	[{"changed": {"fields": ["State"]}}]	1	1
285	2023-03-11 20:52:26.1371+05:30	13	Tata Hexa Varicor	2	[{"changed": {"fields": ["State"]}}]	1	1
286	2023-03-11 20:52:35.813104+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["State"]}}]	1	1
287	2023-03-11 20:52:44.137334+05:30	11	Maruti Desire	2	[{"changed": {"fields": ["State"]}}]	1	1
288	2023-03-11 20:52:52.266629+05:30	10	Nissan Terrano	2	[{"changed": {"fields": ["State"]}}]	1	1
289	2023-03-11 20:52:59.927235+05:30	9	Tata Harrier	2	[{"changed": {"fields": ["State"]}}]	1	1
290	2023-03-11 20:53:07.266577+05:30	8	Skoda Superb	2	[{"changed": {"fields": ["State"]}}]	1	1
291	2023-03-11 20:53:14.787862+05:30	7	Volkswagen Polo	2	[{"changed": {"fields": ["State"]}}]	1	1
292	2023-03-11 20:53:20.907253+05:30	6	Ford Endeavour	2	[{"changed": {"fields": ["State"]}}]	1	1
293	2023-03-11 20:53:27.343227+05:30	5	Mahindra Thar LX	2	[{"changed": {"fields": ["State"]}}]	1	1
294	2023-03-11 20:53:37.996714+05:30	4	Honda City	2	[{"changed": {"fields": ["State"]}}]	1	1
295	2023-03-11 20:53:45.868368+05:30	3	Mercedes Benz E Class	2	[{"changed": {"fields": ["State"]}}]	1	1
296	2023-03-11 20:53:53.164042+05:30	2	Toyota Corolla Altis	2	[{"changed": {"fields": ["State"]}}]	1	1
297	2023-03-11 20:53:59.662838+05:30	1	Ford EcoSport	2	[{"changed": {"fields": ["State"]}}]	1	1
298	2023-03-11 21:16:44.346625+05:30	7	Renault Kwid	2	[{"changed": {"fields": ["State"]}}]	16	1
299	2023-03-11 21:16:51.786337+05:30	6	Jeep Compass	2	[{"changed": {"fields": ["State"]}}]	16	1
300	2023-03-11 21:16:56.25293+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["State"]}}]	16	1
301	2023-03-11 21:17:00.982837+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["State"]}}]	16	1
302	2023-03-11 21:17:06.326261+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["State"]}}]	16	1
303	2023-03-11 21:17:17.406781+05:30	2	MG Hector	2	[{"changed": {"fields": ["State"]}}]	16	1
304	2023-03-11 21:17:22.085084+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["State"]}}]	16	1
305	2023-03-11 21:20:58.560994+05:30	7	Renault Kwid	2	[{"changed": {"fields": ["State"]}}]	16	1
306	2023-03-11 21:21:03.535818+05:30	6	Jeep Compass	2	[{"changed": {"fields": ["State"]}}]	16	1
307	2023-03-11 21:21:07.628969+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["State"]}}]	16	1
308	2023-03-11 21:21:12.076296+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["State"]}}]	16	1
309	2023-03-11 21:21:19.976627+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["State"]}}]	16	1
310	2023-03-11 21:21:27.744025+05:30	2	MG Hector	2	[{"changed": {"fields": ["State"]}}]	16	1
311	2023-03-11 21:21:33.01122+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["State"]}}]	16	1
312	2023-03-11 21:22:47.877064+05:30	7	Renault Kwid	2	[{"changed": {"fields": ["City"]}}]	16	1
313	2023-03-11 21:22:52.732432+05:30	6	Jeep Compass	2	[{"changed": {"fields": ["City"]}}]	16	1
314	2023-03-11 21:22:57.473778+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["City"]}}]	16	1
315	2023-03-11 21:23:03.004839+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["City"]}}]	16	1
316	2023-03-11 21:23:07.98618+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["City"]}}]	16	1
317	2023-03-11 21:23:13.134075+05:30	2	MG Hector	2	[{"changed": {"fields": ["City"]}}]	16	1
318	2023-03-11 21:23:18.538363+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["City"]}}]	16	1
319	2023-03-11 22:14:56.49038+05:30	30	scrappyc35@gmail.com	2	[]	17	1
320	2023-03-12 23:25:13.971055+05:30	1	Specification object (1)	3		18	1
321	2023-03-14 23:46:53.459592+05:30	2	Specification object (2)	2	[{"changed": {"fields": ["Model"]}}]	18	1
322	2023-03-15 00:47:02.439207+05:30	5	johndoe	2	[{"changed": {"fields": ["Email address"]}}]	7	1
323	2023-03-15 03:24:28.954969+05:30	2	Specification object (2)	3		18	1
324	2023-03-15 03:33:11.434928+05:30	4	Specification object (4)	3		18	1
325	2023-03-15 21:17:23.650438+05:30	11	Maruti Desire	2	[{"changed": {"fields": ["Sold"]}}]	1	1
326	2023-03-15 21:17:50.49938+05:30	11	Maruti Desire	2	[{"changed": {"fields": ["Sold"]}}]	1	1
327	2023-03-15 21:18:18.587585+05:30	4	Honda City	2	[{"changed": {"fields": ["Sold"]}}]	1	1
328	2023-03-15 21:18:32.46222+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
329	2023-03-17 19:57:50.135731+05:30	3	Specification object (3)	3		18	1
330	2023-03-17 19:58:56.595664+05:30	5	Specification object (5)	2	[{"changed": {"fields": ["Fuel"]}}]	18	1
331	2023-03-18 22:49:45.609492+05:30	4	Honda City	2	[{"changed": {"fields": ["Sold"]}}]	1	1
332	2023-03-18 22:50:51.743806+05:30	4	Honda City	2	[{"changed": {"fields": ["Sold"]}}]	1	1
333	2023-03-19 01:16:51.239932+05:30	6	Jeep Compass	3		16	1
334	2023-03-19 01:21:28.367949+05:30	7	Renault Kwid	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
335	2023-03-19 01:21:28.373781+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
336	2023-03-19 01:21:28.379504+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
337	2023-03-19 01:21:28.384957+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
338	2023-03-19 01:21:28.39094+05:30	2	MG Hector	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
339	2023-03-19 01:21:28.395862+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
340	2023-03-19 01:27:52.853575+05:30	12	Maruti Wagon R	2	[{"changed": {"fields": ["Sold"]}}]	1	1
341	2023-03-19 21:21:28.513973+05:30	4	Honda City	2	[{"changed": {"fields": ["Sold"]}}]	1	1
342	2023-03-19 21:26:19.849427+05:30	13	Tata Hexa Varicor	2	[]	1	1
343	2023-03-19 21:29:18.619771+05:30	14	Tata Example	1	[{"added": {}}]	1	1
344	2023-03-19 21:29:55.255958+05:30	14	Tata Example	2	[]	1	1
345	2023-03-19 21:30:29.530866+05:30	14	Tata Example	3		1	1
346	2023-03-19 21:32:42.065294+05:30	15	sample	1	[{"added": {}}]	1	1
347	2023-03-19 21:36:21.576772+05:30	15	sample	3		1	1
348	2023-03-19 21:37:40.314151+05:30	16	Example	1	[{"added": {}}]	1	1
349	2023-03-19 21:38:04.572604+05:30	16	Example	3		1	1
350	2023-03-19 21:39:10.452315+05:30	17	Example	1	[{"added": {}}]	1	1
351	2023-03-19 21:40:38.997614+05:30	17	Example	2	[]	1	1
352	2023-03-19 21:44:50.28027+05:30	17	Example	2	[]	1	1
353	2023-03-19 21:45:29.515042+05:30	17	Example	2	[]	1	1
354	2023-03-19 21:51:29.968605+05:30	17	Tata Tiago	2	[{"changed": {"fields": ["Car title"]}}]	1	1
355	2023-03-19 21:51:53.279034+05:30	17	Tata Tiago	2	[]	1	1
356	2023-03-19 21:57:03.691448+05:30	17	Tata Tiago	2	[]	1	1
357	2023-03-19 21:57:48.869378+05:30	17	Tata Tiago	2	[]	1	1
358	2023-03-19 21:58:18.441216+05:30	17	Tata Tiago	2	[]	1	1
359	2023-03-19 21:58:39.185396+05:30	17	Tata Tiago	2	[]	1	1
360	2023-03-19 21:58:59.373033+05:30	17	Tata Tiago	2	[]	1	1
361	2023-03-19 21:59:21.203692+05:30	17	Tata Tiago	2	[]	1	1
362	2023-03-19 21:59:44.624114+05:30	17	Tata Tiago	2	[]	1	1
363	2023-03-19 22:04:15.059389+05:30	17	Tata Tiago	2	[]	1	1
364	2023-03-19 22:05:46.460695+05:30	17	Tata Tiago	2	[]	1	1
365	2023-03-19 22:08:32.626872+05:30	17	Tata Tiago	2	[]	1	1
366	2023-03-19 22:11:19.402694+05:30	17	Tata Tiago	2	[{"changed": {"fields": ["Color"]}}]	1	1
367	2023-03-19 23:13:51.004584+05:30	17	Tata Tiago	2	[]	1	1
368	2023-03-19 23:14:30.24816+05:30	17	Tata Tiago	2	[]	1	1
369	2023-03-19 23:15:21.955436+05:30	17	Tata Tiago	2	[]	1	1
370	2023-03-19 23:18:45.323347+05:30	17	Tata Tiago	2	[]	1	1
371	2023-03-19 23:19:09.987931+05:30	17	Tata Tiago	2	[]	1	1
372	2023-03-19 23:20:26.839356+05:30	17	Tata Tiago	2	[]	1	1
373	2023-03-19 23:23:14.553128+05:30	17	Tata Tiago	2	[]	1	1
374	2023-03-19 23:25:10.972873+05:30	17	Tata Tiago	2	[]	1	1
375	2023-03-19 23:35:56.74785+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
376	2023-03-19 23:36:13.824427+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
377	2023-03-19 23:49:24.091543+05:30	17	Tata Tiago	2	[{"changed": {"fields": ["Condition", "Description", "Car photo", "Car photo 1", "Car photo 2", "Features", "Engine", "Interior", "Is featured"]}}]	1	1
378	2023-03-21 02:01:46.041511+05:30	17	Tata Tiago	2	[]	1	1
379	2023-03-21 02:03:25.890069+05:30	8	Specification object (8)	2	[{"changed": {"fields": ["Email"]}}]	18	1
380	2023-03-21 02:03:53.946296+05:30	17	Tata Tiago	2	[]	1	1
381	2023-03-21 02:03:57.376583+05:30	17	Tata Tiago	2	[]	1	1
382	2023-03-21 02:04:56.332353+05:30	17	Tata Tiago	2	[]	1	1
383	2023-03-21 02:22:47.157024+05:30	17	Tata Tiago	2	[]	1	1
384	2023-03-21 03:29:39.887302+05:30	17	Tata Tiago	2	[]	1	1
385	2023-04-01 22:08:43.041854+05:30	6	Ford Endeavour	2	[]	1	1
386	2023-04-02 14:00:11.250003+05:30	4	Honda City	2	[]	1	1
387	2023-04-02 14:02:36.36939+05:30	4	Honda City	2	[]	1	1
388	2023-04-02 14:02:50.546889+05:30	4	Honda City	2	[]	1	1
389	2023-04-02 14:03:36.344277+05:30	4	Honda City	2	[]	1	1
390	2023-04-02 14:04:40.593232+05:30	4	Honda City	2	[]	1	1
391	2023-04-02 14:05:18.065174+05:30	4	Honda City	2	[]	1	1
392	2023-04-02 14:07:43.446129+05:30	9	Specification object (9)	2	[{"changed": {"fields": ["Email"]}}]	18	1
393	2023-04-02 14:08:21.432831+05:30	4	Honda City	2	[]	1	1
394	2023-04-02 14:15:25.724648+05:30	9	Specification object (9)	2	[{"changed": {"fields": ["Email"]}}]	18	1
395	2023-04-02 14:15:52.623119+05:30	4	Honda City	2	[]	1	1
396	2023-04-02 14:19:51.4974+05:30	4	Honda City	2	[]	1	1
397	2023-04-02 15:31:40.568568+05:30	4	Honda City	2	[]	1	1
398	2023-04-02 15:34:43.975873+05:30	7	Renault Kwid	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
399	2023-04-02 15:34:43.982086+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
400	2023-04-02 15:34:43.987737+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
401	2023-04-02 15:34:43.993656+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
402	2023-04-02 15:34:44.000011+05:30	2	MG Hector	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
403	2023-04-02 15:34:44.005577+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
404	2023-04-02 15:35:32.402765+05:30	5	Tata Tiago	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
405	2023-04-02 15:35:32.408614+05:30	4	Volkswagen Taigun	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
406	2023-04-02 15:35:32.413555+05:30	3	Hyundai i20	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
407	2023-04-02 15:35:32.420815+05:30	2	MG Hector	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
408	2023-04-02 15:35:32.425585+05:30	1	Kia Seltos	2	[{"changed": {"fields": ["Sell date"]}}]	16	1
409	2023-04-02 20:53:59.884104+05:30	4	Honda City	2	[]	1	1
410	2023-04-02 20:56:52.329947+05:30	1	Ford EcoSport	2	[]	1	1
411	2023-04-02 20:58:12.653471+05:30	12	Maruti Wagon R	2	[]	1	1
412	2023-04-02 21:06:15.497632+05:30	4	Honda City	2	[]	1	1
413	2023-04-02 21:17:41.647415+05:30	17	Tata Tiago	2	[]	1	1
414	2023-04-02 21:19:22.940318+05:30	17	Tata Tiago	2	[]	1	1
415	2023-04-02 21:20:09.015277+05:30	9	Tata Harrier	2	[]	1	1
416	2023-04-05 01:03:06.238932+05:30	19	nishantdutta17@gmail.com	3		3	1
417	2023-04-05 01:07:41.826266+05:30	11	max	3		7	1
418	2023-04-05 01:08:07.125883+05:30	12	maxpayne	3		7	1
419	2023-04-05 01:29:20.200293+05:30	18	Mitsubishi Outlander	1	[{"added": {}}]	1	1
420	2023-04-05 01:30:24.29789+05:30	18	Mitsubishi Outlander	2	[]	1	1
421	2023-04-05 01:32:16.473031+05:30	18	Mitsubishi Outlander	2	[{"changed": {"fields": ["Brand"]}}]	1	1
422	2023-04-05 01:34:22.078175+05:30	18	Mitsubishi Outlander	3		1	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	cars	car
2	pages	team
3	contacts	contact
4	admin	logentry
5	auth	permission
6	auth	group
7	auth	user
8	contenttypes	contenttype
9	sessions	session
10	sites	site
11	account	emailaddress
12	account	emailconfirmation
13	socialaccount	socialaccount
14	socialaccount	socialapp
15	socialaccount	socialtoken
16	auctions	auction
17	auctions	auccontacts
18	notify	specification
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-01-28 15:09:44.964911+05:30
2	auth	0001_initial	2023-01-28 15:09:45.017924+05:30
3	account	0001_initial	2023-01-28 15:09:45.092889+05:30
4	account	0002_email_max_length	2023-01-28 15:09:45.121728+05:30
5	admin	0001_initial	2023-01-28 15:09:45.147956+05:30
6	admin	0002_logentry_remove_auto_add	2023-01-28 15:09:45.175104+05:30
7	admin	0003_logentry_add_action_flag_choices	2023-01-28 15:09:45.189562+05:30
8	contenttypes	0002_remove_content_type_name	2023-01-28 15:09:45.220581+05:30
9	auth	0002_alter_permission_name_max_length	2023-01-28 15:09:45.228228+05:30
10	auth	0003_alter_user_email_max_length	2023-01-28 15:09:45.249409+05:30
11	auth	0004_alter_user_username_opts	2023-01-28 15:09:45.27017+05:30
12	auth	0005_alter_user_last_login_null	2023-01-28 15:09:45.291016+05:30
13	auth	0006_require_contenttypes_0002	2023-01-28 15:09:45.295655+05:30
14	auth	0007_alter_validators_add_error_messages	2023-01-28 15:09:45.310306+05:30
15	auth	0008_alter_user_username_max_length	2023-01-28 15:09:45.330926+05:30
16	auth	0009_alter_user_last_name_max_length	2023-01-28 15:09:45.345912+05:30
17	auth	0010_alter_group_name_max_length	2023-01-28 15:09:45.361274+05:30
18	auth	0011_update_proxy_permissions	2023-01-28 15:09:45.378197+05:30
19	cars	0001_initial	2023-01-28 15:09:45.394275+05:30
20	cars	0002_auto_20200706_1659	2023-01-28 15:09:45.437957+05:30
21	cars	0003_auto_20230128_0634	2023-01-28 15:09:45.453082+05:30
22	contacts	0001_initial	2023-01-28 15:09:45.465578+05:30
23	pages	0001_initial	2023-01-28 15:09:45.479089+05:30
24	pages	0002_auto_20200625_1755	2023-01-28 15:09:45.505416+05:30
25	sessions	0001_initial	2023-01-28 15:09:45.516564+05:30
26	sites	0001_initial	2023-01-28 15:09:45.531158+05:30
27	sites	0002_alter_domain_unique	2023-01-28 15:09:45.544836+05:30
28	socialaccount	0001_initial	2023-01-28 15:09:45.623333+05:30
29	socialaccount	0002_token_max_lengths	2023-01-28 15:09:45.674126+05:30
30	socialaccount	0003_extra_data_default_dict	2023-01-28 15:09:45.686269+05:30
31	auctions	0001_initial	2023-02-11 19:57:50.053377+05:30
32	auctions	0002_auccontacts	2023-02-12 17:08:58.270904+05:30
33	auctions	0003_auction_selldate	2023-02-25 22:30:03.612263+05:30
34	auctions	0004_auto_20230225_2230	2023-02-25 22:30:32.055948+05:30
35	auctions	0005_auto_20230225_2302	2023-02-25 23:02:11.733801+05:30
36	cars	0004_car_sold	2023-02-28 19:55:37.702283+05:30
37	auctions	0006_auction_sold	2023-02-28 20:01:27.734516+05:30
38	auctions	0007_auto_20230303_2032	2023-03-03 20:32:24.41273+05:30
39	cars	0005_auto_20230303_2032	2023-03-03 20:32:24.447176+05:30
40	cars	0006_auto_20230303_2034	2023-03-03 20:34:47.051796+05:30
41	cars	0007_remove_car_brand	2023-03-03 20:44:44.185117+05:30
42	auctions	0002_auto_20230304_2111	2023-03-04 21:11:13.034481+05:30
43	cars	0002_car_checking	2023-03-05 21:50:06.974933+05:30
44	cars	0003_remove_car_checking	2023-03-05 21:50:45.63974+05:30
45	cars	0002_auto_20230305_2154	2023-03-05 21:55:07.687981+05:30
46	auctions	0003_remove_auction_sold	2023-03-11 15:08:42.069578+05:30
47	auctions	0004_auto_20230311_2101	2023-03-11 21:01:59.491354+05:30
48	cars	0003_auto_20230311_2101	2023-03-11 21:01:59.5068+05:30
49	cars	0004_auto_20230311_2104	2023-03-11 21:04:27.916196+05:30
50	auctions	0005_auto_20230311_2120	2023-03-11 21:20:29.369529+05:30
51	auctions	0006_auto_20230311_2122	2023-03-11 21:22:28.559959+05:30
52	notify	0001_initial	2023-03-12 23:21:49.800195+05:30
53	notify	0002_specification_body_style	2023-03-15 03:43:43.148906+05:30
54	notify	0003_specification_created_date	2023-03-17 19:42:07.376948+05:30
55	notify	0004_auto_20230318_0222	2023-03-18 02:23:06.925633+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
r1hd6d1nvx0xd0uh0geo5m1y0igbp0zg	MTQxNWNhMjBiMTlkNjVjMWRkZDA4ZTdhZDU1OGIwNGYxNzdlYjJjNjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNjg4NjlmNWFkNmRhZmI3MTY4NmMxNzVlMjA0MWM0MTg2MDQyZTNhIn0=	2023-02-26 00:54:47.060818+05:30
ynyvhpv3vy2n6w3wqpsdgb14kj4awi1d	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-28 23:44:28.392613+05:30
mpl2d55f2d7w045bpguhmhk291g78sz2	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-15 21:57:53.830787+05:30
zw77zi8sj1l1f9jdamtt8b2zd4yxl4y2	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-03 20:07:34.013613+05:30
tca2cwjz2s2xgyn1fa1qmz4uwgj87tu7	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-29 21:12:53.531916+05:30
ksfbti6gvab3rlhtos29mck264qhl3ca	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-16 13:14:55.945897+05:30
r36h15eud1qqpg8j2vel3q9tfesa7lo0	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-16 18:18:01.070386+05:30
m91r0maxzbd6srlbst9f86qa3kfgwumw	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-03 10:58:01.700608+05:30
gj9l8vld2qqath6djf6dblqkej9w9t2u	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-02-17 15:13:46.974766+05:30
e948amh1eaomlphgskmjnlsftsbbs37v	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-16 22:15:11.121908+05:30
aymnkcuy5jd44lhvraks2fbxfctqqb9o	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-17 11:15:49.207032+05:30
cbgyyf22cvd1matcpqmxpjv473eju6mm	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-04-18 14:09:48.3453+05:30
g3hvfv1or93n8k5myfc6mlsb6m7ou2od	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-17 14:21:05.213163+05:30
io5987pia37h6eam9i1213bfombrtzks	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-12 18:30:39.088484+05:30
ulmkwspc766glaa5rs594a8anlmknbbt	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-17 19:45:50.081017+05:30
jdnmo05mwi7d86q7g0exqs9nyiljnngq	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-18 20:42:48.378906+05:30
99w4b0rdpbnyyvs616c775dccvnegmub	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-13 19:12:39.51328+05:30
vd9npnr6312t07pgrybhii6pyaybf8a8	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-19 17:45:31.325071+05:30
sya2em50blmmc3u2baqzpnpjnbfoodlp	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-14 19:35:01.626306+05:30
8nzdrecv8xsdi2s1paqzfqhvg9hf1637	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-21 20:44:52.85277+05:30
t4iu93va3bwabsp95s9hth3381ovtucm	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-23 19:27:17.87659+05:30
jbuqcz47vr873dml9wz9p6odl0px8mdc	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-25 14:54:46.197525+05:30
shykzws56kwbumga17r4ni3o5f4j1zp1	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-26 14:46:04.116498+05:30
33a31jhjjbu5ap9x6ndr7kt71hj02kba	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-29 21:17:16.899101+05:30
e5wggry18epwfh0jybiscz81beqrxwjt	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-29 21:18:10.973296+05:30
sclnnbyqp310lnfxzzfx4ku770yjjml0	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-03-31 19:39:42.82338+05:30
bytg4zke4z5ycwn3d58rinbrdbcxr7f5	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-04-01 02:48:47.090692+05:30
762cu1cp0wgbwcoljbylom1mhhi8zfkm	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-04-01 19:02:29.02324+05:30
b1dwz1peji7yl0cdu363bgkugxcefntl	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-04-02 01:16:41.028962+05:30
5kd35zom8z54dfbhkkun8uy75o82c3v4	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-04-02 21:19:07.612882+05:30
f3mo0c6kqynsnjhp1qd4ie8pr564xzaz	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-04-04 02:01:13.390837+05:30
cio8vqbr6xtkp5qrbeub08pjt9kqyhql	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-04-15 22:06:44.481458+05:30
pnvpja5rgpzl2ntvta6ep326deeuds38	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-04-16 13:49:31.838052+05:30
ip9o01jox77gcozmyf09pk5jjxdqip2e	N2E1ZjA1M2Y2YjZlMjQ1ODU4OTA3NzFjODNkNjlmZDUyMTFjYzZiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGI3YWQ5ZjNiYzM2MzNiYWYxZDg4ZmU2OWU2ZjAzNWE2ZmFmZjQ2In0=	2023-04-16 20:53:44.21838+05:30
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	localhost:8000	localhost:8000
\.


--
-- Data for Name: notify_specification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notify_specification (id, user_id, name, email, brand, model, fuel, transmission, color, year, milage, min_price, max_price, body_style, created_date) FROM stdin;
\.


--
-- Data for Name: pages_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_team (id, first_name, last_name, designation, photo, facebook_link, twitter_link, google_plus_link, created_date) FROM stdin;
1	Nish	D	Player	photos/2023/02/03/WhatsApp_Image_2023-02-03_at_1.53.20_PM.jpeg	https://facebook.com	https://facebook.com	https://facebook.com	2023-01-28 16:12:41.659942+05:30
3	Alden	F	Player	photos/2023/02/03/WhatsApp_Image_2023-02-03_at_1.54.13_PM.jpeg	https://facebook.com	https://facebook.com	https://facebook.com	2023-01-28 16:14:42.754222+05:30
2	Jijo	E	Player	photos/2023/02/03/WhatsApp_Image_2023-02-03_at_1.46.10_PM_FzquYHl.jpeg	https://facebook.com	https://facebook.com	https://facebook.com	2023-01-28 16:13:59.84532+05:30
5	Snow	J	Player	photos/2023/02/17/WhatsApp_Image_2023-02-03_at_2.00.31_PM.jpeg	https://facebook.com	https://facebook.com	https://facebook.com	2023-01-28 16:16:08.677777+05:30
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
1	facebook	102450496101168	2023-02-03 13:33:15.631455+05:30	2023-02-02 21:04:10.575709+05:30	{"id": "102450496101168", "name": "Bot Bot", "first_name": "Bot", "last_name": "Bot"}	2
2	google	102273588949485903268	2023-02-03 15:11:47.915519+05:30	2023-02-02 21:05:53.775008+05:30	{"id": "102273588949485903268", "name": "Scrappy Coco", "given_name": "Scrappy", "family_name": "Coco", "picture": "https://lh3.googleusercontent.com/a/AEdFTp5FW9DAnO_8KTeA3uIDE2PIGrn2X7M_p2D8Lrje=s96-c", "locale": "en"}	3
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
1	facebook	facebook Login	485932113734009	a978958098d81fd905ca94b7ad64f521	
2	google	Google Login	867545455665-s6q74hrprhiasl3t2h6pop06fc4r4g9c.apps.googleusercontent.com	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	
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
1	1	1
2	2	1
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
1	EAAG58ZBMGKXkBAGOkqnHfskmWZCiJTATlKJZCIXuVDsCQVZCY5fjtfIfGOZBUYeESQAS63s1ZCPtj7JjKonADZAuuYmRnCvP83awsnMg7UFsn06slxE18VssDH2GIeLJt7BZCXaldwyhYeXZAUxGDBGv5uv5ZAiLD6ZBmLOPvC3ltftzzYRBrhM0YSoZA7uAtda4TQXzLilvjHOiGqZBSOw6rgWcK1pHYN7zDZA3gZD		\N	1	1
2	ya29.a0AVvZVsqwiUcLt2zKKC69YalYaTq0dqk0YpnuFFWaEVMmfvPl66uautbRx_hHu9f7-ugZkLRfxI6YSKM1Ab2cxS3nifucG8lEmBNPkDJy3XQIBlonBe8eYN3MbUc5n0AGwx6N6EtMlQTPx3kjiJKZ0FyErxKYUAaCgYKAVQSARMSFQGbdwaIoOgSO9cc_9OEMZNYrJr8Eg0165		2023-02-03 16:11:46.613467+05:30	2	2
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auctions_auccontacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auctions_auccontacts_id_seq', 31, true);


--
-- Name: auctions_auction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auctions_auction_id_seq', 7, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 12, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: cars_car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_car_id_seq', 18, true);


--
-- Name: contacts_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_contact_id_seq', 19, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 422, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 55, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: notify_specification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notify_specification_id_seq', 11, true);


--
-- Name: pages_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_teams_id_seq', 5, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 4, true);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 2, true);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 2, true);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 4, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auctions_auccontacts auctions_auccontacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auctions_auccontacts
    ADD CONSTRAINT auctions_auccontacts_pkey PRIMARY KEY (id);


--
-- Name: auctions_auction auctions_auction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auctions_auction
    ADD CONSTRAINT auctions_auction_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cars_car cars_car_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars_car
    ADD CONSTRAINT cars_car_pkey PRIMARY KEY (id);


--
-- Name: contacts_contact contacts_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_contact
    ADD CONSTRAINT contacts_contact_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: notify_specification notify_specification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notify_specification
    ADD CONSTRAINT notify_specification_pkey PRIMARY KEY (id);


--
-- Name: pages_team pages_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_team
    ADD CONSTRAINT pages_teams_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

