PGDMP                          |         
   web_app_db    14.3    14.3 8    1
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4
           1262    16394 
   web_app_db    DATABASE     n   CREATE DATABASE web_app_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE web_app_db;
                postgres    false            Ù            1259    24802    Carts    TABLE     â   CREATE TABLE public."Carts" (
    id integer NOT NULL,
    user_id integer,
    product_id integer,
    quantity integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Carts";
       public         heap    postgres    false            Ø            1259    24801    Carts_id_seq    SEQUENCE     †   CREATE SEQUENCE public."Carts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Carts_id_seq";
       public          postgres    false    217            5
           0    0    Carts_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Carts_id_seq" OWNED BY public."Carts".id;
          public          postgres    false    216            Û            1259    24846    Comments    TABLE     ó   CREATE TABLE public."Comments" (
    id integer NOT NULL,
    user_id integer,
    news_id integer,
    content text,
    created_at text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Comments";
       public         heap    postgres    false            Ú            1259    24845    Comments_id_seq    SEQUENCE     ‰   CREATE SEQUENCE public."Comments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Comments_id_seq";
       public          postgres    false    219            6
           0    0    Comments_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Comments_id_seq" OWNED BY public."Comments".id;
          public          postgres    false    218            Ó            1259    24749    Contacts    TABLE       CREATE TABLE public."Contacts" (
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
    DROP TABLE public."Contacts";
       public         heap    postgres    false            Ò            1259    24748    Contacts_id_seq    SEQUENCE     ‰   CREATE SEQUENCE public."Contacts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Contacts_id_seq";
       public          postgres    false    211            7
           0    0    Contacts_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Contacts_id_seq" OWNED BY public."Contacts".id;
          public          postgres    false    210            Ý            1259    24855    News    TABLE     ö   CREATE TABLE public."News" (
    id integer NOT NULL,
    title text,
    content text,
    image text,
    author text,
    created_at text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."News";
       public         heap    postgres    false            Ü            1259    24854    News_id_seq    SEQUENCE     …   CREATE SEQUENCE public."News_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."News_id_seq";
       public          postgres    false    221            8
           0    0    News_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."News_id_seq" OWNED BY public."News".id;
          public          postgres    false    220            Õ            1259    24767    Orders    TABLE     =  CREATE TABLE public."Orders" (
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
    DROP TABLE public."Orders";
       public         heap    postgres    false            Ô            1259    24766 
   Orders_id_seq    SEQUENCE     ‡   CREATE SEQUENCE public."Orders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Orders_id_seq";
       public          postgres    false    213            9
           0    0 
   Orders_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Orders_id_seq" OWNED BY public."Orders".id;
          public          postgres    false    212            ×            1259    24776    Products    TABLE     "  CREATE TABLE public."Products" (
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
    DROP TABLE public."Products";
       public         heap    postgres    false            Ö            1259    24775    Products_id_seq    SEQUENCE     ‰   CREATE SEQUENCE public."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Products_id_seq";
       public          postgres    false    215            :
           0    0    Products_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Products_id_seq" OWNED BY public."Products".id;
          public          postgres    false    214            Ñ            1259    24736 
   SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         heap    postgres    false            ß            1259    24864    Users    TABLE     #  CREATE TABLE public."Users" (
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
    DROP TABLE public."Users";
       public         heap    postgres    false            Þ            1259    24863    Users_id_seq    SEQUENCE     †   CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public          postgres    false    223            ;
           0    0    Users_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;
          public          postgres    false    222                       2604    24805    Carts id    DEFAULT     h   ALTER TABLE ONLY public."Carts" ALTER COLUMN id SET DEFAULT nextval('public."Carts_id_seq"'::regclass);
 9   ALTER TABLE public."Carts" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            ‚           2604    24849    Comments id    DEFAULT     n   ALTER TABLE ONLY public."Comments" ALTER COLUMN id SET DEFAULT nextval('public."Comments_id_seq"'::regclass);
 <   ALTER TABLE public."Comments" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            ~           2604    24752    Contacts id    DEFAULT     n   ALTER TABLE ONLY public."Contacts" ALTER COLUMN id SET DEFAULT nextval('public."Contacts_id_seq"'::regclass);
 <   ALTER TABLE public."Contacts" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            ƒ           2604    24858    News id    DEFAULT     f   ALTER TABLE ONLY public."News" ALTER COLUMN id SET DEFAULT nextval('public."News_id_seq"'::regclass);
 8   ALTER TABLE public."News" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221                       2604    24770 	   Orders id    DEFAULT     j   ALTER TABLE ONLY public."Orders" ALTER COLUMN id SET DEFAULT nextval('public."Orders_id_seq"'::regclass);
 :   ALTER TABLE public."Orders" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            €           2604    24779    Products id    DEFAULT     n   ALTER TABLE ONLY public."Products" ALTER COLUMN id SET DEFAULT nextval('public."Products_id_seq"'::regclass);
 <   ALTER TABLE public."Products" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            „           2604    24867    Users id    DEFAULT     h   ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            (
          0    24802    Carts 
   TABLE DATA           ^   COPY public."Carts" (id, user_id, product_id, quantity, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    217   >       *
          0    24846    Comments 
   TABLE DATA           i   COPY public."Comments" (id, user_id, news_id, content, created_at, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    219   œ>       "
          0    24749    Contacts 
   TABLE DATA           †   COPY public."Contacts" (id, customer_email, customer_name, subject, message, phone, created_at, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    211   !?       ,
          0    24855    News 
   TABLE DATA           i   COPY public."News" (id, title, content, image, author, created_at, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    221   >?       $
          0    24767    Orders 
   TABLE DATA           ‰   COPY public."Orders" (id, user_id, product_id, quantity, payment_method, status, total_cost, date, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    213   C       &
          0    24776    Products 
   TABLE DATA           }   COPY public."Products" (id, product_name, price, quantity, image, description, status, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    215   7C        
          0    24736 
   SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          postgres    false    209   ÖF       .
          0    24864    Users 
   TABLE DATA           „   COPY public."Users" (id, first_name, last_name, email, password, role, auth_provider, avatar, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    223   /G       <
           0    0    Carts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Carts_id_seq"', 83, true);
          public          postgres    false    216            =
           0    0    Comments_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Comments_id_seq"', 21, true);
          public          postgres    false    218            >
           0    0    Contacts_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Contacts_id_seq"', 20, true);
          public          postgres    false    210            ?
           0    0    News_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."News_id_seq"', 7, true);
          public          postgres    false    220            @
           0    0 
   Orders_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Orders_id_seq"', 30, true);
          public          postgres    false    212            A
           0    0    Products_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Products_id_seq"', 10, true);
          public          postgres    false    214            B
           0    0    Users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Users_id_seq"', 8, true);
          public          postgres    false    222            Ž           2606    24807    Carts Carts_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Carts"
    ADD CONSTRAINT "Carts_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Carts" DROP CONSTRAINT "Carts_pkey";
       public            postgres    false    217                       2606    24853    Comments Comments_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_pkey";
       public            postgres    false    219            ˆ           2606    24756    Contacts Contacts_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Contacts"
    ADD CONSTRAINT "Contacts_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Contacts" DROP CONSTRAINT "Contacts_pkey";
       public            postgres    false    211            ’           2606    24862    News News_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."News"
    ADD CONSTRAINT "News_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."News" DROP CONSTRAINT "News_pkey";
       public            postgres    false    221            Š           2606    24774    Orders Orders_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_pkey";
       public            postgres    false    213            Œ           2606    24783    Products Products_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_pkey";
       public            postgres    false    215            †           2606    24740     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            postgres    false    209            ”           2606    24871    Users Users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public            postgres    false    223            (
   
   xœ‹Ñãââ Å ©      *
   u   xœ3´ä4ä4âôTÈÉÌNU(ÉÈ,VÈK-/æ42Ò54Ò5202V02²2±´25áñÀ¢Fp1=Sscms<R\F ó
9C`F+”¥U*”§¦•æ(X¹ ÙdjdehŒfXLÏÒÒÓ&d)®=... Ü,Û      "
   
   xœ‹Ñãââ Å ©      ,
   Ì  xœ}UÁŽã6=;_Á{³†íÄ'·]l[l±‡-P,P m:ÖŒ,¹’œÔýú’’'“É&½1IQäã{Tž|3œ¥RpR«”1/Ð¤£~¥1ùiÐiòEƒï:¡Ôf:<ˆ:D(t
ÛôRß'âsÞ":¨±“£¯y”
ešC>´ñ!n´r ø1Ð{Bç)º>&Lá÷%y˜Î£×cKõ:P(è Ðí¡ØP‡ÕHQK6
7áIš‰ªž†-ŸábÒDâˆåOYQížŠ²(ó2}ÉÇv:É«yñ¡ÈŠ
ìÛìP	°1¯ [liYT?dOÿãZÉGÂPsógc}êäEgô”|aáMšü(šœ§Êx(Jvµ%¤åð“•~¡[hÌ0*ôÒè¾¾G·†Ê8êßšéØC+»-jSSTgÍÀÓxŠÓàP1¢4ž	æ“P“¨†-Švn.‡šG©™ì¬QcÇ=‘ß™F¢ŸSøÍÈ¦ÛèiC>äÒ1òÀ0C!ÑO)‰XB7Ôóäc¯nø{JzIG{Ù¶ÔcÄÀv9úügD+‘òÜy³Ûì³ìá‹Ãvs;I¶¥ûlwgÈW®Õ&ùÙ.†áöÌCai dŠ”~žd3/ÄN~5Ž:9á[8WýBÝ@ƒZÂÛcLÁ^Æ{¦!¸IyTFµ9Aú9“@}/õ¬Áý¢	"]ÌÔF$C>‡ØÆ;—º‰.ö®mžWÕc¸6‡M~‹	ÛÒª*ïÀuåZm“ŸÂ> †Âá,IQÈ–!1ùÊ.b¸˜€”svXC;k1È&’/„¤ðÅ¿JE„…Å45<›y
Dý~rR¸aaH#=’Rü"?Ïtñß‹ðnÑØeÅSõí¡Èn[f[ZTû;h\¹VeòG?‡þk´–).
ÕÅ]Ý¢Â†Xòé¾WïeçRËQn0†p½R·~’5}øð_xoE¨Øe¬‹K×MM3)ÖÏBžDÃ”.ÚD‘r%Na+ãÎÄKx–Úß®dÆJK[ß…ù½G»Ì7ûÍþ!Úå!ÿNªlK÷Ûí´¯\«]$Öåå¢š,	
õDûŒÛûÅô>LˆPüøIZµ‹Â^]a‡*œ0²HtD#•/iJVŸ™ïGŠ…s’¾€ÞÔ5±’bñÄëš^íñh…¢(ËÈn…äû{.–U¶«Š‡èìîp‘méî®2¯\«?ÓÕjõê²›_      $
   
   xœ‹Ñãââ Å ©      &
     xœ}•MoÛ8†Ïò¯˜û*‚¨ÛòÍí=l¶	œb‹
E[l$R ){µ¿¾CÒqä$JCÎpžyg”EOßÖËïŸVëõ¿Ñ¼ŒHšF¢£[þ“ÌRR’ªši^%¿úmôd5Ý?s­7@5£66306´\âòY‹mcAó6zÖÄ0˜¶íZ
²ÆÍR¶‰ÊºCšÁôÊš¾5|Ÿ)°†jÊ,×ÂXÁ0žê¨?föœ[°ÔXûkìEÍ1Â`0¬Àa„ä~¯3Û†CGÑ äo&ð¦n[Gå57†kÉ)ö‚;¢,Íò;’Ý¥j‘Mi‘¤eùG:ûÀ4É£[³”Ù´ á§Sz.ó~
‚¸ÞH~H%°ðTÔ P™÷ªZªß²¦qÁÑ\k!_<sF‘¨Ã$4‚3A[Ø´t§ôm,óE>K¦Åô
–Ó¤Œ–ÿ<|^þù—`HU</<˜åN1Z+òÄ:q	JC?è¾ETx…PëW>AzGQÀ<·¸‘{
T„ç­ÇüYLsÚ0ò¶U{L’› Ð‚5Ÿ÷*2±xèUU' c¬–êÀÐ–ÖÆyíÔ€2ÂëØ£g÷|æí–ô(È¡ÃFrØ±pL ›Cˆ›àËj‘’$Ï«Kð§¦É4ú²^­¾Âòññ~u~•“2õð¿x<´GÔï
°{a›WnX˜ÀµGô.tœÚ~Gðd20l?
æxŸ)÷ 7ø~ÖËJ9."ºÆkÔBsfÛ1ö¥´Î†µã•ô/NÛG˜ŽK¹ýˆf™'¤,®Ò<š&³h½|z<txzÁ2Kgó9É<Ë55ýéŒ¤`ÇÞ7˜û:‚ÄK#`TÍjÐªj[A8?ŠŠAú;ìF$aÚóø0.Ý»øŸ¿k€k£àÒ'
“&ÈÝÈÁj'Kµ¬jq',íÐø9>.ÿBÑ'Y?[¤ê?QãÓ\†z	åòu‰±œ $&æ¿pMäÁÒúj£±æLi<Œ¾Üê,E•/È<™“óásfšÑýêï‡¯Q~Eý³*ŸAý÷¼SÒÉK…ºsª—ý›ÚC;r¾®ÿžB„©rÒXŽøtš¸‰	Bë#¬*§FÉƒÐ±=>üeqä¤ÚÔ`Ï%<]äy2/É;N¤é‚E–&ÓÜ«ûG2™L~ÞMŽ„       
   I   xœËÍL/J,ÉÌÏ+ÖMÎÏ+IL.ÑË*æÊEˆæ¥¤¡‰å§”b¨LN,ÂÊÏÍMÍCÍK-G)-†Ø£ÇÅÅ [6Ñ      .
   Ó  xœ­”Ën›@†×ø)¼ˆ²©<ž3€%Ô°»Äø‚[§ª„Æ€ÛÄ@ç)ú
]uÙ®³®ò}“âTMÚ&ªºèh4‹ùg4ÿùÎ™ƒ¥A“§Ò¼wXªë«(åÉøY*a~„à‘|–^íÝI5¶³‰…ì²ßƒ§“°_¥³Ù6»á¦O£·£ˆˆ(š£K¾¸¦*“ÌùÌuÎºSÉvLÃ–Þ$1i!ÜBjj¢v 
Ò^@å/Rƒüphi"$~Xÿ—CÃ:Œþbh@ÁôY{RC–ÜM‹û’W™ˆ¤8ã"
Â¼Üñd™YrQq™`ôÔvïbÂ‹tá¾Ù»õÉP×>HæÙÉù´ŒRµ¶Ï7«õ2ÙžæÎyÛwœ¾Ý•â²Ì‹N»½	ˆ²,Ú†‡<ú™(CQžkó¶aFjæÛûñfÅh·îfpuÓò—ÝÍ€Û[yoLøÖD©¦žEôBc-ÿ!n›ˆtêÐ©
(Ä¿"y*5hMâîËÝÇš…»ûvûI4¿~øvûÙ—j""à~yÏ	“Bã:$ŸÒˆ
ºb2¿èYö¤2kk¸ŸàG =Ãìž8Îë$ÅO
«"´…ÁJp°Zú ",Û—íeMi¡¶*3¬b…xHaˆj*XQTÊ<MÁL#„
×4‚°'À:^e®ûˆX^Oîù9ô‚¢lÕ¢—SxMá±'|Ïç¥ŽŽ}©£–r¿S$®"¸~Èb_çãáùÆŠÑvšíÒ‚Ýø^‹Ký¹(ŽÃ Õ±ÛdÐ5êqœÅ:„ž±:9u†êz‘–êélÆØ»Ù|S-,;µÄ©£Év‘ºçI5ì¯™U_
uF
RKû#£Hë`¨Ìž&ûW©ºo ÏÔùi IÊ£°N$˜2¦ Z\^—ØSé
ò{â&FŠ;YU¶ßƒF£ñ6£oÁ     