PGDMP     !    1            	    w            doantotnghiep    10.8    10.8 	               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �            1259    26482    role    TABLE     +  CREATE TABLE public.role (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(500),
    created_at timestamp without time zone,
    modified_at timestamp without time zone,
    added_by character varying(50),
    modified_by character varying(50)
);
    DROP TABLE public.role;
       public      
   admin_user    false            �            1259    26488    role_id_seq    SEQUENCE     t   CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public    
   admin_user    false    201                       0    0    role_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;
            public    
   admin_user    false    202            �
           2604    26513    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public    
   admin_user    false    202    201            �
           2606    26525    role role_name_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.role DROP CONSTRAINT role_name_key;
       public      
   admin_user    false    201            �
           2606    26527    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public      
   admin_user    false    201           