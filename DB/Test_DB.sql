PGDMP     "                
    x            Test_DB    9.4.0    12.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    57544    Test_DB    DATABASE     �   CREATE DATABASE "Test_DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';
    DROP DATABASE "Test_DB";
                postgres    false            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    7            �            1259    58329    Coupon    TABLE     �   CREATE TABLE public."Coupon" (
    "couponId" character varying(50) NOT NULL,
    "custId_id" character varying(20) NOT NULL,
    "menuId_id" character varying(50) NOT NULL
);
    DROP TABLE public."Coupon";
       public            postgres    false            �            1259    58399    FeedBack    TABLE     �   CREATE TABLE public."FeedBack" (
    "feedbackId" character varying(50) NOT NULL,
    "feedbackType" character varying(50) NOT NULL,
    feedback character varying(500) NOT NULL,
    "restId_id" character varying(50) NOT NULL
);
    DROP TABLE public."FeedBack";
       public            postgres    false            �            1259    57730    Menu    TABLE     �   CREATE TABLE public."Menu" (
    "menuId" character varying(50) NOT NULL,
    "menuName" character varying(100) NOT NULL,
    "menuType" character varying(100) NOT NULL,
    "menuPrice" integer NOT NULL,
    "restId_id" character varying(50) NOT NULL
);
    DROP TABLE public."Menu";
       public            postgres    false            �            1259    58349    Orders    TABLE       CREATE TABLE public."Orders" (
    "orderId" character varying(50) NOT NULL,
    "bookingDtTime" timestamp with time zone,
    "tableNo" integer NOT NULL,
    "restId_id" character varying(50),
    "custId_id" character varying(20) NOT NULL,
    status boolean
);
    DROP TABLE public."Orders";
       public            postgres    false            �            1259    57722 
   Restaurant    TABLE     �  CREATE TABLE public."Restaurant" (
    "restId" character varying(50) NOT NULL,
    "restName" character varying(100) NOT NULL,
    "restType" character varying(10) NOT NULL,
    "restOwnerName" character varying(100) NOT NULL,
    "restEmail" character varying(100) NOT NULL,
    "restMobileNo1" bigint NOT NULL,
    "restLandLineNo" bigint NOT NULL,
    "restAddress" text NOT NULL,
    "restImg" character varying(100)
);
     DROP TABLE public."Restaurant";
       public            postgres    false            �            1259    58354    Transaction    TABLE     +  CREATE TABLE public."Transaction" (
    "trnId" character varying(50) NOT NULL,
    "trnDtTime" timestamp with time zone NOT NULL,
    total bigint NOT NULL,
    gst integer NOT NULL,
    discount integer NOT NULL,
    "netTotal" integer NOT NULL,
    "orderId_id" character varying(50) NOT NULL
);
 !   DROP TABLE public."Transaction";
       public            postgres    false            �            1259    57576 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public            postgres    false            �            1259    57574    auth_group_id_seq    SEQUENCE     z   CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    180            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    179            �            1259    57586    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public            postgres    false            �            1259    57584    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    182            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    181            �            1259    57568    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public            postgres    false            �            1259    57566    auth_permission_id_seq    SEQUENCE        CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    178            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    177            �            1259    57594 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
    DROP TABLE public.auth_user;
       public            postgres    false            �            1259    57604    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public            postgres    false            �            1259    57602    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    186            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    185            �            1259    57592    auth_user_id_seq    SEQUENCE     y   CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    184            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    183            �            1259    57612    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public            postgres    false            �            1259    57610 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    188            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    187            �            1259    57714    customer    TABLE     \  CREATE TABLE public.customer (
    "custId" character varying(20) NOT NULL,
    "custFirstName" character varying(100) NOT NULL,
    "custLastName" character varying(100) NOT NULL,
    "custEmail" character varying(50) NOT NULL,
    "custMobileNo" bigint NOT NULL,
    "custCity" text NOT NULL,
    "custPassword" character varying(50) NOT NULL
);
    DROP TABLE public.customer;
       public            postgres    false            �            1259    57672    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public            postgres    false            �            1259    57670    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    190            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    189            �            1259    57558    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public            postgres    false            �            1259    57556    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    176            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    175            �            1259    57547    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public            postgres    false            �            1259    57545    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    174            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    173            �            1259    57703    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public            postgres    false            �            1259    58438 	   ordermenu    TABLE     �   CREATE TABLE public.ordermenu (
    id integer NOT NULL,
    quantity integer NOT NULL,
    "custId_id" character varying(20) NOT NULL,
    "menuId_id" character varying(50) NOT NULL,
    "orderId_id" character varying(50) NOT NULL
);
    DROP TABLE public.ordermenu;
       public            postgres    false            �            1259    58436    ordermenu_id_seq    SEQUENCE     y   CREATE SEQUENCE public.ordermenu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.ordermenu_id_seq;
       public          postgres    false    200            �           0    0    ordermenu_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.ordermenu_id_seq OWNED BY public.ordermenu.id;
          public          postgres    false    199            �           2604    65536    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    179    180    180            �           2604    65537    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    182    181    182            �           2604    65538    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    177    178    178            �           2604    65539    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    184    183    184            �           2604    65540    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    185    186    186            �           2604    65541    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    188    187    188            �           2604    65542    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    189    190    190            �           2604    65543    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    176    175    176            �           2604    65544    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    173    174    174            �           2604    58441    ordermenu id    DEFAULT     l   ALTER TABLE ONLY public.ordermenu ALTER COLUMN id SET DEFAULT nextval('public.ordermenu_id_seq'::regclass);
 ;   ALTER TABLE public.ordermenu ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    199    200    200            �          0    58329    Coupon 
   TABLE DATA           H   COPY public."Coupon" ("couponId", "custId_id", "menuId_id") FROM stdin;
    public          postgres    false    195   �       �          0    58399    FeedBack 
   TABLE DATA           Y   COPY public."FeedBack" ("feedbackId", "feedbackType", feedback, "restId_id") FROM stdin;
    public          postgres    false    198   7�       �          0    57730    Menu 
   TABLE DATA           \   COPY public."Menu" ("menuId", "menuName", "menuType", "menuPrice", "restId_id") FROM stdin;
    public          postgres    false    194   {�       �          0    58349    Orders 
   TABLE DATA           k   COPY public."Orders" ("orderId", "bookingDtTime", "tableNo", "restId_id", "custId_id", status) FROM stdin;
    public          postgres    false    196   ��       �          0    57722 
   Restaurant 
   TABLE DATA           �   COPY public."Restaurant" ("restId", "restName", "restType", "restOwnerName", "restEmail", "restMobileNo1", "restLandLineNo", "restAddress", "restImg") FROM stdin;
    public          postgres    false    193   F�       �          0    58354    Transaction 
   TABLE DATA           m   COPY public."Transaction" ("trnId", "trnDtTime", total, gst, discount, "netTotal", "orderId_id") FROM stdin;
    public          postgres    false    197   ��       �          0    57576 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    180   9�       �          0    57586    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    182   V�       �          0    57568    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    178   s�       �          0    57594 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    184   ��       �          0    57604    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    186   Y�       �          0    57612    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    188   v�       �          0    57714    customer 
   TABLE DATA           �   COPY public.customer ("custId", "custFirstName", "custLastName", "custEmail", "custMobileNo", "custCity", "custPassword") FROM stdin;
    public          postgres    false    192   ��       �          0    57672    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    190   �       �          0    57558    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    176   �       �          0    57547    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    174   ,�       �          0    57703    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    191   �       �          0    58438 	   ordermenu 
   TABLE DATA           Y   COPY public.ordermenu (id, quantity, "custId_id", "menuId_id", "orderId_id") FROM stdin;
    public          postgres    false    200   ��       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    179            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    181            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);
          public          postgres    false    177            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    185            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);
          public          postgres    false    183            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    187            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 327, true);
          public          postgres    false    189            �           0    0    django_content_type_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);
          public          postgres    false    175            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);
          public          postgres    false    173            �           0    0    ordermenu_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.ordermenu_id_seq', 289, true);
          public          postgres    false    199                       2606    58333    Coupon Coupon_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Coupon"
    ADD CONSTRAINT "Coupon_pkey" PRIMARY KEY ("couponId");
 @   ALTER TABLE ONLY public."Coupon" DROP CONSTRAINT "Coupon_pkey";
       public            postgres    false    195                       2606    58406    FeedBack FeedBack_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."FeedBack"
    ADD CONSTRAINT "FeedBack_pkey" PRIMARY KEY ("feedbackId");
 D   ALTER TABLE ONLY public."FeedBack" DROP CONSTRAINT "FeedBack_pkey";
       public            postgres    false    198            �           2606    57734    Menu Menu_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Menu"
    ADD CONSTRAINT "Menu_pkey" PRIMARY KEY ("menuId");
 <   ALTER TABLE ONLY public."Menu" DROP CONSTRAINT "Menu_pkey";
       public            postgres    false    194                       2606    58353    Orders Orders_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY ("orderId");
 @   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_pkey";
       public            postgres    false    196            �           2606    57729    Restaurant Restaurant_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Restaurant"
    ADD CONSTRAINT "Restaurant_pkey" PRIMARY KEY ("restId");
 H   ALTER TABLE ONLY public."Restaurant" DROP CONSTRAINT "Restaurant_pkey";
       public            postgres    false    193                       2606    58358    Transaction Transaction_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_pkey" PRIMARY KEY ("trnId");
 J   ALTER TABLE ONLY public."Transaction" DROP CONSTRAINT "Transaction_pkey";
       public            postgres    false    197            �           2606    57701    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    180            �           2606    57628 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    182    182            �           2606    57591 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    182            �           2606    57581    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    180            �           2606    57619 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    178    178            �           2606    57573 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    178            �           2606    57609 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    186            �           2606    57643 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    186    186            �           2606    57599    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    184            �           2606    57617 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    188            �           2606    57657 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    188    188            �           2606    57695     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    184            �           2606    57721    customer customer_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY ("custId");
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    192            �           2606    57681 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    190            �           2606    57565 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    176    176            �           2606    57563 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    176            �           2606    57555 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    174            �           2606    57710 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    191                       2606    58443    ordermenu ordermenu_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ordermenu
    ADD CONSTRAINT ordermenu_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ordermenu DROP CONSTRAINT ordermenu_pkey;
       public            postgres    false    200            �           1259    58344    Coupon_couponId_b4607bb6_like    INDEX     n   CREATE INDEX "Coupon_couponId_b4607bb6_like" ON public."Coupon" USING btree ("couponId" varchar_pattern_ops);
 3   DROP INDEX public."Coupon_couponId_b4607bb6_like";
       public            postgres    false    195            �           1259    58345    Coupon_custId_id_4a46de2f    INDEX     W   CREATE INDEX "Coupon_custId_id_4a46de2f" ON public."Coupon" USING btree ("custId_id");
 /   DROP INDEX public."Coupon_custId_id_4a46de2f";
       public            postgres    false    195            �           1259    58346    Coupon_custId_id_4a46de2f_like    INDEX     p   CREATE INDEX "Coupon_custId_id_4a46de2f_like" ON public."Coupon" USING btree ("custId_id" varchar_pattern_ops);
 4   DROP INDEX public."Coupon_custId_id_4a46de2f_like";
       public            postgres    false    195            �           1259    58347    Coupon_menuId_id_926d3272    INDEX     W   CREATE INDEX "Coupon_menuId_id_926d3272" ON public."Coupon" USING btree ("menuId_id");
 /   DROP INDEX public."Coupon_menuId_id_926d3272";
       public            postgres    false    195            �           1259    58348    Coupon_menuId_id_926d3272_like    INDEX     p   CREATE INDEX "Coupon_menuId_id_926d3272_like" ON public."Coupon" USING btree ("menuId_id" varchar_pattern_ops);
 4   DROP INDEX public."Coupon_menuId_id_926d3272_like";
       public            postgres    false    195                       1259    58412 !   FeedBack_feedbackId_94f41fc6_like    INDEX     v   CREATE INDEX "FeedBack_feedbackId_94f41fc6_like" ON public."FeedBack" USING btree ("feedbackId" varchar_pattern_ops);
 7   DROP INDEX public."FeedBack_feedbackId_94f41fc6_like";
       public            postgres    false    198                       1259    58413    FeedBack_restId_id_66ca77ce    INDEX     [   CREATE INDEX "FeedBack_restId_id_66ca77ce" ON public."FeedBack" USING btree ("restId_id");
 1   DROP INDEX public."FeedBack_restId_id_66ca77ce";
       public            postgres    false    198                       1259    58414     FeedBack_restId_id_66ca77ce_like    INDEX     t   CREATE INDEX "FeedBack_restId_id_66ca77ce_like" ON public."FeedBack" USING btree ("restId_id" varchar_pattern_ops);
 6   DROP INDEX public."FeedBack_restId_id_66ca77ce_like";
       public            postgres    false    198            �           1259    57742    Menu_menuId_13824f78_like    INDEX     f   CREATE INDEX "Menu_menuId_13824f78_like" ON public."Menu" USING btree ("menuId" varchar_pattern_ops);
 /   DROP INDEX public."Menu_menuId_13824f78_like";
       public            postgres    false    194            �           1259    57743    Menu_restId_id_8b4f5ca7    INDEX     S   CREATE INDEX "Menu_restId_id_8b4f5ca7" ON public."Menu" USING btree ("restId_id");
 -   DROP INDEX public."Menu_restId_id_8b4f5ca7";
       public            postgres    false    194            �           1259    57744    Menu_restId_id_8b4f5ca7_like    INDEX     l   CREATE INDEX "Menu_restId_id_8b4f5ca7_like" ON public."Menu" USING btree ("restId_id" varchar_pattern_ops);
 2   DROP INDEX public."Menu_restId_id_8b4f5ca7_like";
       public            postgres    false    194                       1259    58444    Orders_custId_id_db7db7db    INDEX     W   CREATE INDEX "Orders_custId_id_db7db7db" ON public."Orders" USING btree ("custId_id");
 /   DROP INDEX public."Orders_custId_id_db7db7db";
       public            postgres    false    196                       1259    58445    Orders_custId_id_db7db7db_like    INDEX     p   CREATE INDEX "Orders_custId_id_db7db7db_like" ON public."Orders" USING btree ("custId_id" varchar_pattern_ops);
 4   DROP INDEX public."Orders_custId_id_db7db7db_like";
       public            postgres    false    196                       1259    58369    Orders_orderId_f2985e1d_like    INDEX     l   CREATE INDEX "Orders_orderId_f2985e1d_like" ON public."Orders" USING btree ("orderId" varchar_pattern_ops);
 2   DROP INDEX public."Orders_orderId_f2985e1d_like";
       public            postgres    false    196                       1259    58372    Orders_restId_id_67a9690d    INDEX     W   CREATE INDEX "Orders_restId_id_67a9690d" ON public."Orders" USING btree ("restId_id");
 /   DROP INDEX public."Orders_restId_id_67a9690d";
       public            postgres    false    196                       1259    58373    Orders_restId_id_67a9690d_like    INDEX     p   CREATE INDEX "Orders_restId_id_67a9690d_like" ON public."Orders" USING btree ("restId_id" varchar_pattern_ops);
 4   DROP INDEX public."Orders_restId_id_67a9690d_like";
       public            postgres    false    196            �           1259    57736    Restaurant_restId_0f9d3ca9_like    INDEX     r   CREATE INDEX "Restaurant_restId_0f9d3ca9_like" ON public."Restaurant" USING btree ("restId" varchar_pattern_ops);
 5   DROP INDEX public."Restaurant_restId_0f9d3ca9_like";
       public            postgres    false    193            	           1259    58380    Transaction_orderId_id_57df88b9    INDEX     c   CREATE INDEX "Transaction_orderId_id_57df88b9" ON public."Transaction" USING btree ("orderId_id");
 5   DROP INDEX public."Transaction_orderId_id_57df88b9";
       public            postgres    false    197            
           1259    58381 $   Transaction_orderId_id_57df88b9_like    INDEX     |   CREATE INDEX "Transaction_orderId_id_57df88b9_like" ON public."Transaction" USING btree ("orderId_id" varchar_pattern_ops);
 :   DROP INDEX public."Transaction_orderId_id_57df88b9_like";
       public            postgres    false    197                       1259    58379    Transaction_trnId_26f3da13_like    INDEX     r   CREATE INDEX "Transaction_trnId_26f3da13_like" ON public."Transaction" USING btree ("trnId" varchar_pattern_ops);
 5   DROP INDEX public."Transaction_trnId_26f3da13_like";
       public            postgres    false    197            �           1259    57702    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    180            �           1259    57639 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    182            �           1259    57640 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    182            �           1259    57625 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    178            �           1259    57655 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    186            �           1259    57654 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    186            �           1259    57669 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    188            �           1259    57668 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    188            �           1259    57696     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    184            �           1259    57735    customer_custId_ab3fdea7_like    INDEX     l   CREATE INDEX "customer_custId_ab3fdea7_like" ON public.customer USING btree ("custId" varchar_pattern_ops);
 3   DROP INDEX public."customer_custId_ab3fdea7_like";
       public            postgres    false    192            �           1259    57692 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    190            �           1259    57693 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    190            �           1259    57712 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    191            �           1259    57711 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    191                       1259    58461    ordermenu_custId_id_2bbe7bf9    INDEX     [   CREATE INDEX "ordermenu_custId_id_2bbe7bf9" ON public.ordermenu USING btree ("custId_id");
 2   DROP INDEX public."ordermenu_custId_id_2bbe7bf9";
       public            postgres    false    200                       1259    58462 !   ordermenu_custId_id_2bbe7bf9_like    INDEX     t   CREATE INDEX "ordermenu_custId_id_2bbe7bf9_like" ON public.ordermenu USING btree ("custId_id" varchar_pattern_ops);
 7   DROP INDEX public."ordermenu_custId_id_2bbe7bf9_like";
       public            postgres    false    200                       1259    58463    ordermenu_menuId_id_17c7bb16    INDEX     [   CREATE INDEX "ordermenu_menuId_id_17c7bb16" ON public.ordermenu USING btree ("menuId_id");
 2   DROP INDEX public."ordermenu_menuId_id_17c7bb16";
       public            postgres    false    200                       1259    58464 !   ordermenu_menuId_id_17c7bb16_like    INDEX     t   CREATE INDEX "ordermenu_menuId_id_17c7bb16_like" ON public.ordermenu USING btree ("menuId_id" varchar_pattern_ops);
 7   DROP INDEX public."ordermenu_menuId_id_17c7bb16_like";
       public            postgres    false    200                       1259    58465    ordermenu_orderId_id_b77f3d4b    INDEX     ]   CREATE INDEX "ordermenu_orderId_id_b77f3d4b" ON public.ordermenu USING btree ("orderId_id");
 3   DROP INDEX public."ordermenu_orderId_id_b77f3d4b";
       public            postgres    false    200                       1259    58466 "   ordermenu_orderId_id_b77f3d4b_like    INDEX     v   CREATE INDEX "ordermenu_orderId_id_b77f3d4b_like" ON public.ordermenu USING btree ("orderId_id" varchar_pattern_ops);
 8   DROP INDEX public."ordermenu_orderId_id_b77f3d4b_like";
       public            postgres    false    200            %           2606    58334 3   Coupon Coupon_custId_id_4a46de2f_fk_customer_custId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Coupon"
    ADD CONSTRAINT "Coupon_custId_id_4a46de2f_fk_customer_custId" FOREIGN KEY ("custId_id") REFERENCES public.customer("custId") DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public."Coupon" DROP CONSTRAINT "Coupon_custId_id_4a46de2f_fk_customer_custId";
       public          postgres    false    195    192    2034            &           2606    58339 /   Coupon Coupon_menuId_id_926d3272_fk_Menu_menuId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Coupon"
    ADD CONSTRAINT "Coupon_menuId_id_926d3272_fk_Menu_menuId" FOREIGN KEY ("menuId_id") REFERENCES public."Menu"("menuId") DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public."Coupon" DROP CONSTRAINT "Coupon_menuId_id_926d3272_fk_Menu_menuId";
       public          postgres    false    195    194    2040            *           2606    58407 9   FeedBack FeedBack_restId_id_66ca77ce_fk_Restaurant_restId    FK CONSTRAINT     �   ALTER TABLE ONLY public."FeedBack"
    ADD CONSTRAINT "FeedBack_restId_id_66ca77ce_fk_Restaurant_restId" FOREIGN KEY ("restId_id") REFERENCES public."Restaurant"("restId") DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public."FeedBack" DROP CONSTRAINT "FeedBack_restId_id_66ca77ce_fk_Restaurant_restId";
       public          postgres    false    193    2036    198            $           2606    57737 1   Menu Menu_restId_id_8b4f5ca7_fk_Restaurant_restId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Menu"
    ADD CONSTRAINT "Menu_restId_id_8b4f5ca7_fk_Restaurant_restId" FOREIGN KEY ("restId_id") REFERENCES public."Restaurant"("restId") DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public."Menu" DROP CONSTRAINT "Menu_restId_id_8b4f5ca7_fk_Restaurant_restId";
       public          postgres    false    193    194    2036            (           2606    58416 3   Orders Orders_custId_id_db7db7db_fk_customer_custId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_custId_id_db7db7db_fk_customer_custId" FOREIGN KEY ("custId_id") REFERENCES public.customer("custId") DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_custId_id_db7db7db_fk_customer_custId";
       public          postgres    false    2034    196    192            '           2606    58364 5   Orders Orders_restId_id_67a9690d_fk_Restaurant_restId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_restId_id_67a9690d_fk_Restaurant_restId" FOREIGN KEY ("restId_id") REFERENCES public."Restaurant"("restId") DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_restId_id_67a9690d_fk_Restaurant_restId";
       public          postgres    false    2036    196    193            )           2606    58374 =   Transaction Transaction_orderId_id_57df88b9_fk_Orders_orderId    FK CONSTRAINT     �   ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_orderId_id_57df88b9_fk_Orders_orderId" FOREIGN KEY ("orderId_id") REFERENCES public."Orders"("orderId") DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public."Transaction" DROP CONSTRAINT "Transaction_orderId_id_57df88b9_fk_Orders_orderId";
       public          postgres    false    196    197    2054                       2606    57634 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    178    1995    182                       2606    57629 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    2000    182    180                       2606    57620 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    1990    176    178                       2606    57649 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    180    186    2000                       2606    57644 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    186    2008    184            !           2606    57663 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    178    1995    188                        2606    57658 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    188    184    2008            "           2606    57682 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    190    176    1990            #           2606    57687 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    190    2008    184            +           2606    58446 9   ordermenu ordermenu_custId_id_2bbe7bf9_fk_customer_custId    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordermenu
    ADD CONSTRAINT "ordermenu_custId_id_2bbe7bf9_fk_customer_custId" FOREIGN KEY ("custId_id") REFERENCES public.customer("custId") DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.ordermenu DROP CONSTRAINT "ordermenu_custId_id_2bbe7bf9_fk_customer_custId";
       public          postgres    false    2034    200    192            ,           2606    58451 5   ordermenu ordermenu_menuId_id_17c7bb16_fk_Menu_menuId    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordermenu
    ADD CONSTRAINT "ordermenu_menuId_id_17c7bb16_fk_Menu_menuId" FOREIGN KEY ("menuId_id") REFERENCES public."Menu"("menuId") DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.ordermenu DROP CONSTRAINT "ordermenu_menuId_id_17c7bb16_fk_Menu_menuId";
       public          postgres    false    194    2040    200            -           2606    58456 9   ordermenu ordermenu_orderId_id_b77f3d4b_fk_Orders_orderId    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordermenu
    ADD CONSTRAINT "ordermenu_orderId_id_b77f3d4b_fk_Orders_orderId" FOREIGN KEY ("orderId_id") REFERENCES public."Orders"("orderId") DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.ordermenu DROP CONSTRAINT "ordermenu_orderId_id_b77f3d4b_fk_Orders_orderId";
       public          postgres    false    2054    196    200            �      x������ � �      �   4   x�s342������KU�,.I���H,KU(�W��-(�/K�440����� 8B�      �   9  x���Ms�8��ʯഷ�B�qL���H9�g��(�	��2�~[j��s�V������<����*�)*�����a�F�.x�^_yMѶ�(���n�{ш��'D���lJ ��8�����`��I�#�ɽx�������#�,��-���}��l�!�d+���8z��;�LF~ʗ�A���4�-�k���>DS���vu�o�.|������B����Z��-�#r3�=d�{�WD����5�8Am��c�P5R����
t�߷�#Dv�M#�:XuS�7:6�4Ѷ�h���A�����S��8�:�'�qAn��$;X	�f�Z�mP���o��9�%��*��(ٵC_c�f��R!mj	'	�Qq�Ӥ�#J�u��q�)("�(������hJ�V�����Q����N�&؁������l�(��[��d�o�N�Cs)����Nʃ�`cؼ��4���]T�����f���>����+�1�Xa��-Oq�,"�ۧjR.�T0���߮��i
�\,1��K��j�:&�_���}�5Tb1�3����N
9E,5;l�Ra�I����+��}�&��|��3�UfH筨��WO�cJ>C�H�my*�5e0���lڮ��v�CG���|�	�?���./�?�>z)��r@�'��5��Ĝ^*q� �3+{�qW��!�"�܊J�L�'n`� �Z�Gͯ'Q��ѱ���a�<�a���&�m�Zc�[��Tz���dݚ�5��.��P_�F��}�|��H�bψR�`n����n�+T�Z�[~'�3��CKB�:�ޜ�LR�KB�+�C� .A��Ģ(�14��-��~�b��)�])�j6O����t��q�lERt�{E�:H�}�u۩	Z�yc9�i4j[SxN�}	z�kq�h ���/�{]��r�"��L�5������z-^=e~hx��O8s�%3�	½�Nf�ϨW���t�7��ݻ�}��ӏ��f�-�G���V^x�)2	2�<+�ē�L�DX[�U����	L�saU ���J;��Q����(@�~��9�0d�K�%�R�ܱG�9������$j � ڶP�,E�d�3mDn��´��h��P<�m[��F��h=���D+uh�!���
3�h&���A]e9������AW��"��H�$�ԫG ;�'F����X�ix^�+��Z|�����?//���p{t��s�Ĭ=<��^\����Qe�硦��1Fs�=B��Z$�9U�i�<ç[�N��5}D�D�� �OC���U*��yY.�'�����3�^��d���e��Z�\�n'�����d|����n�VfO���������{z/eg�k3�C"�����358k�yN���{�q�΋��\�'̢��e�~�x�,�t ��C+%��A����׃K��&��y�QNcW&�C��%3534s�u_���z��T�vM�T˙I��gh�&S��k<r�Q���Դ�x��Q�]���:BW�&�[Y>Wnf`�l�%��.�������.1�/����"D�B�V^h�Cr[/	�����?���B:�*�������&�6      �   r   x�m�1�0��~���E[h�5��/���*b1��xh�&�(�MT��Y�j����s����s ��#x�y����3����,�%��9������q����5���>.�      �   C  x���ێ�0�����V�86�k�M��R�]U�&��`"�ҧ�m#�V���83���@i@�D�1���֩Oi�ez,B���2��N�B
�ɉj�H^@�n�}���ܟ���R��Pԉ �\�7�"�օh�2W�!\��*�Oή�2Q'b���y$u�5��u��>qy��ʰŘ`㒨,�.�9,��mK��k��k.,7P\g�$�s���݊�{�;��F��n�u~��;$���X,*W�y�).'����n[,���6r�%$j�K��N�< �Tv��*n�j�VD�A̞��2�
5�0u��Լa�
��PR�gx$�a�<�g?1`�f�X�ye���b��۞ڋ���)�MeQ_�NN>څ5��І�h��" �ƝMY�
�����Q����Obq}�>�� kI߿}������vpy ev9,�K�`�lYj>����L�'l����[v<�q}��S�/{�dZ�tzH^��_6cG�D7�t��ts����*��#A?���e|!��l`lG��巌�[J�F�UFI�{z�7~B�<����K�^4��t2���      �   �   x�]ͻ1�ڞ"}p��5K��#RpE��d�� h0�}P$k�^pq�',C�a:jTZ� ����$[�a��Ӑ��V��M	I��Lqn���>�l�������L<n�6�����V��8e/�޷"t� �6_k����2�      �      x������ � �      �      x������ � �      �      x�e��n�0F����	�B���&YWm�
¦�����6�k�#��|_�y�ƪ��{�Ta���8��߶3mH�ٍ��(1� 8��5�#=�?��4`�-f�0߮�r�FS��A�)��{�~�%A��XQ��(�s����z7�o랥\�'/B�t��R�J����b�.a6�O�|�n�yZ�:�8~���i�<���i��W���L4J�NRd�����kǓ���g��Ѡ�XW���_� �t���;3�Y0�v�H�`"��UA8��������;���U���W@�q�P\`��q�oa\�	��Oۨl�-� ��M Y  rM��:^r���n��1�3��ۨ�+�\$�Ү`�H�B�Q�܂�����o�O�bdՂL��W-��d,y/Z��AZ�Ntw�'�Qm���Z76#��H5���*E��vf���7`��0/��=��W�g�l2����dJ�����#��z��/���=�ٶ*��#+FUJj��N(�k���>��ʠC������!���]f���=�6�I^"p�O��?�҈      �   �   x�=�A�0�������ons�ZAA����J)���>!�=�� ꊶz��Pk¸/yY��v�t�T�w��?�B]�M�qT`�a�)�d?]
�&��mv�L��'�!��,
8e��f2��"]���E�}ݼ��c�o��T.>�
!��?���q�$S/1      �      x������ � �      �      x������ � �      �   {   x�]˽� ���a��s7M����rcд����6.6�̧��%7g��8p��xrH���a�����	ޑn=y�8�4@*-��V8>�`_����!�Ղ��]���\V�5k���k#�� ��0      �   Q  x���Oo����|jQd��K�~��Eoi���)��S����+{�w9������p�yf��.<`���?|^�V���󟒬� ��ߞ?y����������×�?���� �����������_��{�w���p�"���n�Q(� ��5
��-�{(�
M�`1UؠN����//�����m���{`�y�{ �$���4 @���+�	J�< y,{ �)/j���d�Ɍg#�a�j�Ԁ: u��'�-u@s��)�<%(k���h#��X�D���%Q��6mJ�=Q=y���HL�!M��Zt]4�)pL��Z�������j��Z`�K�ɘг�m#r��\`Ћ�)-�d��8��z�A0V%TTZ�à�*��a/c��d���T2���Y��]��A20��%ð�.���#���dp/�5ْ��v�3H����d�j;HJ
mq�N%���G�g.+ۂ���-Rj��������T&=��P�2���"��J�j��2��j1�oP���w��eQ ���yE�fV�?���F~�������������7����?l��+x_��Z�RF<�
.F�1��B�f[1tɅ�&���>ZY�M�ܢq�/G�1�b	�n�����h��fU#d�x��\?�<F����� Į�������+s)��EKq�t9���Ȑ�)�b��h�vѼ�Ar���i%�V.G�ג��Y�U�G˗��k�G�Z�`{��r�˕����
��גt��ྖx4W�T��v2Vw��n���&��<�Y�b�}-A��V�5���t�L⾔�lK쓔��vMȋѺRR���pe4#*Q����f޷��s���m�$���q(�&��-°��`��V�����s0�h�h�rrϡ	G4m5�5�h��	��f��#=Gb�;ȴ�9�p��	'�f���B��s2X����=g�ΙR&)�g��� �}����m�#�z�_�}DY܃��f�W�U[7�C2�A<U�К7�>�%��c�Kw�`�3W.u>��(P.`x�x�&i0�c���Ͳ�˃Z�7]I�(���1����#=&O0E��+u1�cJ�aVh��;�C=�&���C[�K�1��-� ����&Q��&��cp�)� Z�X�7�c(�(���q�9bJ��	���C�1�?�FI���ӊ.�$e+�4*�~o�Y=;P+�Q�Oݺr����M�Q9o�ވ2Ѯ*`WI��^�2Ѯofh7�ڕ�v���n5�vS�]�h7S���z>bz��D��`���Q'�-�i�V�t�m�Յ�W;�Ê1���a�	�`��wX9�p��cwX&%�[�;ۊyA�����jr�)d�VSvO�bW����@�=�vџM[�u�EeI�k�2��sܷ�K/�����|�c|^(� ㄒ�_�6L���XX%-�T0h��7��1�m�u�;h��7�,L6l9A���Yf�1���4�%��2�	F,��:�|��N�:�ud��M0l�s<�|%M0�;{d�
�I݁Y�������IK�ހY�2�bM=���I+^�|e��*�]�>�|e��Z��7?e����|k.�,�/��|k�Ig�ފ�b�d�w1���&Y\��\h�d�xOŚ9����[��äܕ����?p����ʭlap���Y\1�3�����݁Y|�p?Fap�xw�A�0E�{�������,��[Mp��8��,v%k��rX/��:��c���/��¿aB�����a0�\�|�S��r7.X?qP�B�]�O�1&WzZ��$��Z伏u����*��xfх��1F�K�3Uv��7����.�,ư�[����%���9Z@�q?����J�;�O����B��>��b�3Ås��ƴb�o�=���z�$�����>�@CLv����>� O0R2��	��x����9�/�G�lr��w2��������K�ě�ȕ��ק��O����eC�:U��6����d^֠M����o,سx�$U�>����;4C�S���c=<���=F�O�G�}���/�Gr�� w��?�A��ㆡ���]�����=�{���L�^�nX������|D��i�cy���� �P#�      �   �   x�U���0E���8��op馔���e�t��[`���=�{��}�!v�'��&}�H�{�>ܭ��F�א���b�\�i$�x ��-��p��l3�$}�
��Kd��mP4�B5�Ng�1_]�k&U!�[bA�+�A�6ֽ���[���ߒ�V�      �   C  x����R�0��ާ��¥���-y�S��bq៍���#��5�\t��s��%��C?�~�^Na�c�����VȐ��e��%��j�IJ��	Kl��?O�E�Z*\DT�C���URHN��_D����C7<�L�����`�CL�:����w��?�����S�8)�^h�Sv�--������0ͅ ��T	�o��)Į��׌p�vm�i�&M
!`��B��v�:ߴWAF	��7�נyy55����i��Ё�XcZ?N� �t�s�݃�Ff7 �#S��M,a�N���mcRsIdΥ�j������!���1�ua�q�P3TR�2 ������(�yz��|��;4 �JOAd��v����=�B���w>���;���eU���0���Q���W^�����DW�~��wm�R�-RM̈�t�Z�oOƬ�9a�d>2�%QsfL����Z3@��8� ��
U�A���{�4��/:d7 �@�dM�=��#���!u��ߞ�M� 2���5���w~��Q�,a� �!�zS�,#�P+A����f��!r�f Zn,�:]�|�Ի���h��      �   g  x���͎�@����7C����J�0с@\��6ً��|)����L�}���>TRU���+y�2DmϺ[>t��d �U�p�}�"�[���t��)�&k���*�F��-�N��o� *��攆�w�ӎn�`�&��2[d��d}�Cb[&��/�����?[^8�)�Z�U�}T~W��ֹ�݆�g�_]t�~��2|w��KV��c�&_u�nn;�2���ӽ���u��ʻ�;(�7�n�Z��G(Ɣ�k���U	t��^I�H~� A�
��)0�1�h�����L�v�0A(*Y�2Q5d4nNj���1z	l��l1|J����~������u�֕~^���+���b�D~�;n�b��/˂� ���X�E"�r�Y�:�x~W$��mp)Ŀ2������)R��I@A�-�*�4WKl�[�tqo�=�U=�|`%y��S����\�:C|���0�����i�2l"��K�t8=�|h�/�0u�:|��M�s#M1��LJ֌iS#Ҙ��}�=���`
�D�dT H�Ƿ���78�ݹP!���׸W�K�iO��f2br����W�5=ˡW�&X��p�Ǿ��Xj�O���n2�䚢r ���Q&��_g��      �   �   x�]��!г)&��i#]$�?f�G�ܬ�/o�BB���#w��,E]�������5�/���HO��n���w��=�1?����'z����t����,�������w��^sk��������z�R~�1Z�     