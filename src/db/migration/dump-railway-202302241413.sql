PGDMP                         {            railway    14.1    14.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    49432    railway    DATABASE     k   CREATE DATABASE railway WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE railway;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    49433    user    TABLE     o  CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    telephone character varying(11),
    created_at date DEFAULT now(),
    modified_at date DEFAULT now()
);
    DROP TABLE public."user";
       public         heap    postgres    false    3            �            1259    49440    user_address    TABLE     '  CREATE TABLE public.user_address (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address text NOT NULL,
    city character varying(255) NOT NULL,
    district character varying(255) NOT NULL,
    ward character varying(255) NOT NULL,
    telephone character varying(11) NOT NULL
);
     DROP TABLE public.user_address;
       public         heap    postgres    false    3            �            1259    49445    user_address_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.user_address_id_seq;
       public          postgres    false    3    210            �           0    0    user_address_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.user_address_id_seq OWNED BY public.user_address.id;
          public          postgres    false    211            �            1259    49446    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    209    3            �           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    212            c           2604    49447    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    209            d           2604    49448    user_address id    DEFAULT     r   ALTER TABLE ONLY public.user_address ALTER COLUMN id SET DEFAULT nextval('public.user_address_id_seq'::regclass);
 >   ALTER TABLE public.user_address ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210            �          0    49433    user 
   TABLE DATA           z   COPY public."user" (id, username, password, first_name, last_name, email, telephone, created_at, modified_at) FROM stdin;
    public          postgres    false    209            �          0    49440    user_address 
   TABLE DATA           ]   COPY public.user_address (id, user_id, address, city, district, ward, telephone) FROM stdin;
    public          postgres    false    210            �           0    0    user_address_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.user_address_id_seq', 1, false);
          public          postgres    false    211            �           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 1, true);
          public          postgres    false    212            �   b   x�3�,NI+N�T1JT1�P���/�0��ͪ(�
L770.ɮL-*M�*/M)q2tI̪*r�JpLL���K1q,I��C ##c]#]#$&W� 4~s      �      x������ � �          �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    49432    railway    DATABASE     k   CREATE DATABASE railway WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE railway;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    49433    user    TABLE     o  CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    telephone character varying(11),
    created_at date DEFAULT now(),
    modified_at date DEFAULT now()
);
    DROP TABLE public."user";
       public         heap    postgres    false    3            �            1259    49440    user_address    TABLE     '  CREATE TABLE public.user_address (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address text NOT NULL,
    city character varying(255) NOT NULL,
    district character varying(255) NOT NULL,
    ward character varying(255) NOT NULL,
    telephone character varying(11) NOT NULL
);
     DROP TABLE public.user_address;
       public         heap    postgres    false    3            �            1259    49445    user_address_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.user_address_id_seq;
       public          postgres    false    3    210            �           0    0    user_address_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.user_address_id_seq OWNED BY public.user_address.id;
          public          postgres    false    211            �            1259    49446    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    209    3            �           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    212            c           2604    49447    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    209            d           2604    49448    user_address id    DEFAULT     r   ALTER TABLE ONLY public.user_address ALTER COLUMN id SET DEFAULT nextval('public.user_address_id_seq'::regclass);
 >   ALTER TABLE public.user_address ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210            �          0    49433    user 
   TABLE DATA           z   COPY public."user" (id, username, password, first_name, last_name, email, telephone, created_at, modified_at) FROM stdin;
    public          postgres    false    209   �       �          0    49440    user_address 
   TABLE DATA           ]   COPY public.user_address (id, user_id, address, city, district, ward, telephone) FROM stdin;
    public          postgres    false    210   l        �           0    0    user_address_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.user_address_id_seq', 1, false);
          public          postgres    false    211            �           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 1, true);
          public          postgres    false    212           