PGDMP     $                    {            railway    14.7    14.7     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16394    railway    DATABASE     h   CREATE DATABASE railway WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Vietnamese_Vietnam.1258';
    DROP DATABASE railway;
                postgres    false            ?            1259    16455    user    TABLE     o  CREATE TABLE public."user" (
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
       public         heap    postgres    false            ?            1259    16466    user_address    TABLE     R  CREATE TABLE public.user_address (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address text NOT NULL,
    city character varying(255) NOT NULL,
    district character varying(255) NOT NULL,
    ward character varying(255) NOT NULL,
    telephone character varying(11) NOT NULL,
    created_at date,
    modified_at date
);
     DROP TABLE public.user_address;
       public         heap    postgres    false            ?            1259    16465    user_address_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.user_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.user_address_id_seq;
       public          postgres    false    212            ?           0    0    user_address_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.user_address_id_seq OWNED BY public.user_address.id;
          public          postgres    false    211            ?            1259    16454    user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    210                        0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    209            a           2604    16458    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            d           2604    16469    user_address id    DEFAULT     r   ALTER TABLE ONLY public.user_address ALTER COLUMN id SET DEFAULT nextval('public.user_address_id_seq'::regclass);
 >   ALTER TABLE public.user_address ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            ?          0    16455    user 
   TABLE DATA           z   COPY public."user" (id, username, password, first_name, last_name, email, telephone, created_at, modified_at) FROM stdin;
    public          postgres    false    210   ?       ?          0    16466    user_address 
   TABLE DATA           v   COPY public.user_address (id, user_id, address, city, district, ward, telephone, created_at, modified_at) FROM stdin;
    public          postgres    false    212   ?                  0    0    user_address_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_address_id_seq', 3, true);
          public          postgres    false    211                       0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 2, true);
          public          postgres    false    209            h           2606    16473    user_address user_address_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.user_address DROP CONSTRAINT user_address_pkey;
       public            postgres    false    212            f           2606    16464    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    210            i           2606    16474 &   user_address user_address_user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.user_address DROP CONSTRAINT user_address_user_id_fkey;
       public          postgres    false    3174    212    210            ?   ?   x?????0  ???B) ?)j@jL\
?%-$??#?8???p???	k: ",*P????%-??????[????? 3?]?1߽???P?2???Ƈ?P??WuU1?P)??
R5}i?@????R?????p?Si)\??+
f??C@?<5ӳ]ļZ?T#??n|=mk?????6.? wK?P?      ?   T   x?3?4?LIMK,?)?,?T??8?0.???ML??-,9?u???e?iDc??\??p?d???k|3?2H7+F??? ??<i     