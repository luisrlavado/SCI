--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: auditusuario(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION auditusuario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

    BEGIN

        INSERT INTO auditoria_usuario VALUES (old.usuario, old.pass, old.nivel, old.status);

        RETURN NULL;

    END;

$$;


ALTER FUNCTION public.auditusuario() OWNER TO postgres;

--
-- Name: aignación_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "aignación_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "aignación_id_seq" OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aignación; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "aignación" (
    id integer DEFAULT nextval('"aignación_id_seq"'::regclass) NOT NULL,
    fecha_asignacion timestamp without time zone,
    "tipo_asignación" smallint,
    id_personal integer
);


ALTER TABLE "aignación" OWNER TO postgres;

--
-- Name: TABLE "aignación"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "aignación" IS 'Detalles de asignaciones';


--
-- Name: auditoria_equipos_id_equipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auditoria_equipos_id_equipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auditoria_equipos_id_equipo_seq OWNER TO postgres;

--
-- Name: auditoria_personal_id_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auditoria_personal_id_personal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auditoria_personal_id_personal_seq OWNER TO postgres;

--
-- Name: auditoria_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auditoria_usuario (
    usuario character varying(20) NOT NULL,
    pass character varying(500) NOT NULL,
    nivel integer NOT NULL,
    status integer NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now()
);


ALTER TABLE auditoria_usuario OWNER TO postgres;

--
-- Name: TABLE auditoria_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE auditoria_usuario IS 'Cambios o eliminaciones realizados en la tabla usuario';


--
-- Name: COLUMN auditoria_usuario.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN auditoria_usuario.status IS '0=cerrada;1=abierta';


--
-- Name: auditoria_usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auditoria_usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auditoria_usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: bienesgeneral_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bienesgeneral_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bienesgeneral_id_seq OWNER TO postgres;

--
-- Name: bienesgeneral; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bienesgeneral (
    id integer DEFAULT nextval('bienesgeneral_id_seq'::regclass) NOT NULL,
    item integer,
    cod_general character varying(10),
    cod_subcat character varying(10),
    cod_catespf character varying(10),
    descripcion character varying(150),
    estatus_uso_bien integer,
    marca character varying(50),
    modelo character varying(50),
    serial character varying(50),
    tipo_comp character varying(30),
    colores integer,
    num_bien integer,
    estado_bien integer,
    status integer NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    cat_unid_admin character varying(10),
    fecha_elab date,
    per_ini date,
    per_culm date,
    uni_trabajo character varying(30)
);


ALTER TABLE bienesgeneral OWNER TO postgres;

--
-- Name: TABLE bienesgeneral; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE bienesgeneral IS 'Datos almacenados de los bienes';


--
-- Name: COLUMN bienesgeneral.item; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.item IS 'Nro. Inventario';


--
-- Name: COLUMN bienesgeneral.cod_general; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.cod_general IS 'Codigo categoria general';


--
-- Name: COLUMN bienesgeneral.cod_subcat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.cod_subcat IS 'Codigo sub-categoria';


--
-- Name: COLUMN bienesgeneral.cod_catespf; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.cod_catespf IS 'Codigo categoria especifica';


--
-- Name: COLUMN bienesgeneral.estatus_uso_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.estatus_uso_bien IS 'Estatus del uso del bien';


--
-- Name: COLUMN bienesgeneral.tipo_comp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.tipo_comp IS 'Tipo componente';


--
-- Name: COLUMN bienesgeneral.num_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.num_bien IS 'numero de bien';


--
-- Name: COLUMN bienesgeneral.estado_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.estado_bien IS 'Estado del bien';


--
-- Name: COLUMN bienesgeneral.cat_unid_admin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.cat_unid_admin IS 'Categoría de unidad administrativa';


--
-- Name: COLUMN bienesgeneral.per_ini; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.per_ini IS 'Periodo de inicio';


--
-- Name: COLUMN bienesgeneral.per_culm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.per_culm IS 'Periodo de culminación';


--
-- Name: COLUMN bienesgeneral.uni_trabajo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bienesgeneral.uni_trabajo IS 'Unidad de Trabajo';


--
-- Name: categoria_general_bienes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_general_bienes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categoria_general_bienes_id_seq OWNER TO postgres;

--
-- Name: categoria_general_bienes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria_general_bienes (
    id integer DEFAULT nextval('categoria_general_bienes_id_seq'::regclass) NOT NULL,
    codigo character varying(12) NOT NULL,
    descripcion character varying(100) NOT NULL,
    tipo integer NOT NULL
);


ALTER TABLE categoria_general_bienes OWNER TO postgres;

--
-- Name: TABLE categoria_general_bienes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE categoria_general_bienes IS 'Codigo general de los bienes';


--
-- Name: sub_categorias_bienes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sub_categorias_bienes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sub_categorias_bienes_id_seq OWNER TO postgres;

--
-- Name: cod_categoria_específica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "cod_categoria_específica" (
    id integer DEFAULT nextval('sub_categorias_bienes_id_seq'::regclass) NOT NULL,
    codigo character varying(12) NOT NULL,
    descripcion character varying(100) NOT NULL,
    tipo integer NOT NULL,
    id_sub_categorias_bienes integer
);


ALTER TABLE "cod_categoria_específica" OWNER TO postgres;

--
-- Name: TABLE "cod_categoria_específica"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "cod_categoria_específica" IS 'Codigos de categoria especifica';


--
-- Name: configuracion_bien_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE configuracion_bien_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuracion_bien_id_seq OWNER TO postgres;

--
-- Name: configuracion_bien; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE configuracion_bien (
    id integer DEFAULT nextval('configuracion_bien_id_seq'::regclass) NOT NULL,
    codigo integer NOT NULL,
    descripcion character varying(100),
    tipo character varying(50)
);


ALTER TABLE configuracion_bien OWNER TO postgres;

--
-- Name: TABLE configuracion_bien; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE configuracion_bien IS 'forma adquision, colores, estatus de uso de bien, condiciones fisicas, categoria de unidades administrativas';


--
-- Name: COLUMN configuracion_bien.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN configuracion_bien.tipo IS 'forma adquision, colores, estatus de uso de bien, condiciones fisicas, marca';


--
-- Name: detalle_entrada_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_entrada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalle_entrada_id_seq OWNER TO postgres;

--
-- Name: detalle_entrada; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detalle_entrada (
    id integer DEFAULT nextval('detalle_entrada_id_seq'::regclass) NOT NULL,
    id_equipos integer NOT NULL,
    cantidad integer NOT NULL,
    fecha_entrada timestamp without time zone NOT NULL,
    tipo_entrada character varying(40),
    id_entrada integer
);


ALTER TABLE detalle_entrada OWNER TO postgres;

--
-- Name: detalle_entrada_id_detalle_entrada_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_entrada_id_detalle_entrada_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalle_entrada_id_detalle_entrada_seq OWNER TO postgres;

--
-- Name: detalle_salida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_salida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalle_salida_id_seq OWNER TO postgres;

--
-- Name: detalle_salida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detalle_salida (
    id integer DEFAULT nextval('detalle_salida_id_seq'::regclass) NOT NULL,
    id_salida_salida integer NOT NULL,
    id_equipos integer NOT NULL,
    cantidad integer NOT NULL,
    fecha_salida timestamp without time zone NOT NULL,
    tipo_salida character varying(40)
);


ALTER TABLE detalle_salida OWNER TO postgres;

--
-- Name: detalle_salida_id_detallle_salida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_salida_id_detallle_salida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalle_salida_id_detallle_salida_seq OWNER TO postgres;

--
-- Name: entrada_id_entrada_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entrada_id_entrada_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entrada_id_entrada_seq OWNER TO postgres;

--
-- Name: entrada; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entrada (
    id integer DEFAULT nextval('entrada_id_entrada_seq'::regclass) NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    cantidad integer NOT NULL,
    fecha_entrada timestamp without time zone NOT NULL,
    tipo_entrada character varying(40),
    usuario_entrada character varying(40),
    observacion character varying(200),
    id_usuario integer
);


ALTER TABLE entrada OWNER TO postgres;

--
-- Name: TABLE entrada; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE entrada IS 'Equipos que ingresan';


--
-- Name: equipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE equipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE equipo_id_seq OWNER TO postgres;

--
-- Name: equipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE equipo (
    id integer DEFAULT nextval('equipo_id_seq'::regclass) NOT NULL,
    descripcion character varying(100),
    marca character varying(30),
    modelo character varying(30),
    serial character varying(30),
    color character varying(10),
    estado character varying(100) NOT NULL,
    unidad_admin character varying(50),
    status integer DEFAULT 1 NOT NULL,
    responsable character varying(50),
    caracteristicas character varying(150),
    fecha_modif timestamp without time zone,
    unidad_trabajo character varying(50)
);


ALTER TABLE equipo OWNER TO postgres;

--
-- Name: TABLE equipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE equipo IS 'Tabla de los equipos';


--
-- Name: COLUMN equipo.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN equipo.status IS '0=cerrada;1=abierta';


--
-- Name: personal_id_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personal_id_personal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personal_id_personal_seq OWNER TO postgres;

--
-- Name: personal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personal (
    id integer DEFAULT nextval('personal_id_personal_seq'::regclass) NOT NULL,
    ci_per character varying(12) NOT NULL,
    nombres character varying(40),
    apellidos character varying(40),
    cargo character varying(30) NOT NULL,
    telf_pers numeric(12,0) NOT NULL,
    telf_casa numeric(12,0),
    correo character varying(50) NOT NULL,
    f_nac date,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    usuario_creacion character varying(20) NOT NULL,
    usuario_modif character varying(20),
    status integer,
    unidad_trabajo character varying(50),
    id_usuario integer
);


ALTER TABLE personal OWNER TO postgres;

--
-- Name: TABLE personal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE personal IS 'Tabla del personal';


--
-- Name: COLUMN personal.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN personal.status IS '0=cerrada;1=abierta';


--
-- Name: COLUMN personal.unidad_trabajo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN personal.unidad_trabajo IS 'Unidad de Trabajo';


--
-- Name: responsables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE responsables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE responsables_id_seq OWNER TO postgres;

--
-- Name: responsables; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE responsables (
    id integer DEFAULT nextval('responsables_id_seq'::regclass) NOT NULL,
    nombres character varying(40),
    apellidos character varying(40),
    uni_admin character varying(30),
    fecha_creacion timestamp without time zone,
    fecha_modif timestamp without time zone DEFAULT now(),
    status integer
);


ALTER TABLE responsables OWNER TO postgres;

--
-- Name: TABLE responsables; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE responsables IS 'Responsables de inventarios';


--
-- Name: COLUMN responsables.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN responsables.status IS ' 0=cerrada;1=abierta';


--
-- Name: salida_id_salida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE salida_id_salida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salida_id_salida_seq OWNER TO postgres;

--
-- Name: salida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE salida (
    id integer DEFAULT nextval('salida_id_salida_seq'::regclass) NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now() NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    cantidad integer NOT NULL,
    fecha_salida timestamp without time zone NOT NULL,
    tipo_salida character varying(40),
    usuario_salida character varying(40),
    observacion character varying(200),
    id_usuario integer
);


ALTER TABLE salida OWNER TO postgres;

--
-- Name: TABLE salida; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE salida IS 'equipos de salen';


--
-- Name: solvencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE solvencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE solvencia_id_seq OWNER TO postgres;

--
-- Name: solvencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE solvencia (
    id integer DEFAULT nextval('solvencia_id_seq'::regclass) NOT NULL,
    fecha_solvencia smallint,
    id_personal integer
);


ALTER TABLE solvencia OWNER TO postgres;

--
-- Name: TABLE solvencia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE solvencia IS 'Detalles de solvencia';


--
-- Name: sub_categorias_bienes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sub_categorias_bienes (
    id integer DEFAULT nextval('sub_categorias_bienes_id_seq'::regclass) NOT NULL,
    codigo character varying(12) NOT NULL,
    descripcion character varying(100) NOT NULL,
    tipo integer NOT NULL,
    id_categoria_general_bienes integer
);


ALTER TABLE sub_categorias_bienes OWNER TO postgres;

--
-- Name: TABLE sub_categorias_bienes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sub_categorias_bienes IS 'Codigos de las subcategoria de bienes';


--
-- Name: ubicacion_id_Ubicacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "ubicacion_id_Ubicacion_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ubicacion_id_Ubicacion_seq" OWNER TO postgres;

--
-- Name: unidad_admin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidad_admin (
    id integer DEFAULT nextval('"ubicacion_id_Ubicacion_seq"'::regclass) NOT NULL,
    nombre character varying(20)
);


ALTER TABLE unidad_admin OWNER TO postgres;

--
-- Name: TABLE unidad_admin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE unidad_admin IS 'Detalles de la Unidad Administrativa donde están ubicados los equipos y el personal';


--
-- Name: unidad_trabajo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidad_trabajo (
    id integer NOT NULL,
    nombre character varying(40) NOT NULL
);


ALTER TABLE unidad_trabajo OWNER TO postgres;

--
-- Name: TABLE unidad_trabajo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE unidad_trabajo IS 'Unidad de Trabajo';


--
-- Name: unidad_trabajo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidad_trabajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unidad_trabajo_id_seq OWNER TO postgres;

--
-- Name: unidad_trabajo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidad_trabajo_id_seq OWNED BY unidad_trabajo.id;


--
-- Name: unidad_trabajo_nombre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidad_trabajo_nombre_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unidad_trabajo_nombre_seq OWNER TO postgres;

--
-- Name: unidad_trabajo_nombre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidad_trabajo_nombre_seq OWNED BY unidad_trabajo.nombre;


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id integer DEFAULT nextval('usuario_id_usuario_seq'::regclass) NOT NULL,
    usuario character varying(20) NOT NULL,
    pass character varying(500) NOT NULL,
    nivel integer NOT NULL,
    fecha_modif timestamp without time zone DEFAULT now(),
    status integer NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- Name: TABLE usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE usuario IS 'Tabla de los usuarios';


--
-- Name: COLUMN usuario.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.status IS '0=cerrada;1=abierta';


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_trabajo ALTER COLUMN id SET DEFAULT nextval('unidad_trabajo_id_seq'::regclass);


--
-- Data for Name: aignación; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "aignación" (id, fecha_asignacion, "tipo_asignación", id_personal) FROM stdin;
\.


--
-- Name: aignación_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"aignación_id_seq"', 1, false);


--
-- Name: auditoria_equipos_id_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_equipos_id_equipo_seq', 1, false);


--
-- Name: auditoria_personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_personal_id_personal_seq', 1, false);


--
-- Data for Name: auditoria_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auditoria_usuario (usuario, pass, nivel, status, fecha_modif) FROM stdin;
admin	admin	1	1	2016-03-14 08:19:07.24595
admin	d033e22ae348aeb5660fc2140aec35850c4da997	1	1	2016-03-14 13:54:46.203441
luis	luis	1	0	2016-03-15 09:26:50.44853
admins	d033e22ae348aeb5660fc2140aec35850c4da997	1	1	2016-03-15 10:54:20.559382
luis	faea5242a00c52da62a0f00df168c199b7ab748d	1	0	2016-03-21 08:45:45.105402
luisrlavado	faea5242a00c52da62a0f00df168c199b7ab748d	1	0	2016-03-21 08:48:25.949754
luisrlavado	fa2512662d5d5bee92595333ee31080a82ad7ef7	1	0	2016-03-21 08:48:52.274506
luisrlavado	fa2512662d5d5bee92595333ee31080a82ad7ef7	1	1	2016-03-28 09:07:27.298972
\.


--
-- Name: auditoria_usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_usuario_id_usuario_seq', 1, false);


--
-- Data for Name: bienesgeneral; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bienesgeneral (id, item, cod_general, cod_subcat, cod_catespf, descripcion, estatus_uso_bien, marca, modelo, serial, tipo_comp, colores, num_bien, estado_bien, status, fecha_modif, cat_unid_admin, fecha_elab, per_ini, per_culm, uni_trabajo) FROM stdin;
\.


--
-- Name: bienesgeneral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bienesgeneral_id_seq', 1, false);


--
-- Data for Name: categoria_general_bienes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categoria_general_bienes (id, codigo, descripcion, tipo) FROM stdin;
\.


--
-- Name: categoria_general_bienes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_general_bienes_id_seq', 1, false);


--
-- Data for Name: cod_categoria_específica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "cod_categoria_específica" (id, codigo, descripcion, tipo, id_sub_categorias_bienes) FROM stdin;
\.


--
-- Data for Name: configuracion_bien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY configuracion_bien (id, codigo, descripcion, tipo) FROM stdin;
1	1	Negro	Color
2	2	Azul	Color
3	3	Palo Rosa	Color
4	4	Naranja	Color
5	5	Verde	Color
6	6	BEIGE	Color
7	7	CROMÁTICO	Color
8	8	VINOTINTO	Color
9	9	GRIS/NEGRO	Color
10	10	PLATEADO	Color
11	11	BEIGE AUSTRALIA	Color
12	12	PLATEADO FERROSO	Color
13	13	PERLA	Color
14	14	BEIGE OLÍMPICO	Color
15	15	ARENA METALIZADO	Color
16	16	PLATA	Color
17	17	ROJO	Color
18	18	AMARILLO	Color
19	19	BEIGE DUNA	Color
21	21	AZUL/BEIGE	Color
22	22	MARRÓN/BEIGE	Color
23	23	VERDE ESMERALDA	Color
24	24	PLATA CLARO	Color
25	25	PLATEADO BRILLANTE	Color
26	26	MARRÓN PARDILLO BICAPA	Color
27	27	GRIS PALMERA	Color
28	28	DORADO	Color
29	29	MADERA NATURAL	Color
30	30	NEGRO/AMARILLO MOSTAZA	Color
31	31	MARRÓN	Color
32	32	BLANCO	Color
33	33	GRIS	Color
34	34	AZUL/GRIS	Color
35	35	AZUL/NEGRO	Color
36	36	ACERO	Color
37	37	OTRO COLOR	Color
20	20	MARRÓN/NEGRO	Color
39	1	Compra Directa (por consulta de Precio)	Forma de Adquisición del Bien
40	2	Permuta	Forma de Adquisición del Bien
41	3	Dación en pago	Forma de Adquisición del Bien
42	4	Donación	Forma de Adquisición del Bien
43	5	Transferencia	Forma de Adquisición del Bien
44	6	Expropiación	Forma de Adquisición del Bien
45	7	Confiscación	Forma de Adquisición del Bien
46	8	Compra por Concurso Abierto	Forma de Adquisición del Bien
47	9	Compra por Concurso Cerrado	Forma de Adquisición del Bien
48	10	Adjudicación	Forma de Adquisición del Bien
49	1	En uso	Estatus de Uso del Bien
50	2	En comodato	Estatus de Uso del Bien
51	3	En arrendamiento	Estatus de Uso del Bien
52	4	En mantenimiento	Estatus de Uso del Bien
53	5	En reparación	Estatus de Uso del Bien
54	6	En proceso de disposición	Estatus de Uso del Bien
55	7	En desuso por obsolescencia	Estatus de Uso del Bien
56	8	En desuso por inservibilidad	Estatus de Uso del Bien
57	9	En desuso por obsolescencia e inservibilidad	Estatus de Uso del Bien
58	10	En Almacén o Depósito para su asignación	Estatus de Uso del Bien
59	11	Otro uso	Estatus de Uso del Bien
60	1	Óptimo	Estado del Bien
61	2	Regular	Estado del Bien
62	3	Deteriorado	Estado del Bien
63	4	Averiado	Estado del Bien
64	5	Chatarra	Estado del Bien
65	6	No operativo	Estado del Bien
66	7	Otra condición física	Estado del Bien
67	1	Despacho del Presidente	Categorías de Unidades Administrativas
68	2	Despacho del Vicepresidente	Categoría de Unidades Administrativas
69	3	Despacho del Ministro	Categoría de Unidades Administrativas
70	4	Despacho Viceministro	Categoría de Unidades Administrativas
71	5	Dirección General	Categoría de Unidades Administrativas
72	6	Dirección de Linea	Categoría de Unidades Administrativas
73	7	Coordinación	Categoría de Unidades Administrativas
74	8	División	Categoría de Unidades Administrativas
75	9	Departamento	Categoría de Unidades Administrativas
76	10	Presidencia	Categoría de Unidades Administrativas
77	11	Gerencia General	Categoría de Unidades Administrativas
78	12	Gerencia	Categoría de Unidades Administrativas
79	13	Sub-Gerencia	Categoría de Unidades Administrativas
80	14	Despacho del Superintendente	Categoría de Unidades Administrativas
81	15	Dirección General Adjunta	Categoría de Unidades Administrativas
82	16	Intendencia	Categoría de Unidades Administrativas
83	17	Unidad Ad-Hoc	Categoría de Unidades Administrativas
84	18	Área Organizacional	Categoría de Unidades Administrativas
85	19	Área de Trabajo	Categoría de Unidades Administrativas
86	20	Otra categoría de Unidad	Categoría de Unidades Administrativas
\.


--
-- Name: configuracion_bien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuracion_bien_id_seq', 86, true);


--
-- Data for Name: detalle_entrada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detalle_entrada (id, id_equipos, cantidad, fecha_entrada, tipo_entrada, id_entrada) FROM stdin;
\.


--
-- Name: detalle_entrada_id_detalle_entrada_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_entrada_id_detalle_entrada_seq', 1, false);


--
-- Name: detalle_entrada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_entrada_id_seq', 1, false);


--
-- Data for Name: detalle_salida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detalle_salida (id, id_salida_salida, id_equipos, cantidad, fecha_salida, tipo_salida) FROM stdin;
\.


--
-- Name: detalle_salida_id_detallle_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_salida_id_detallle_salida_seq', 1, false);


--
-- Name: detalle_salida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_salida_id_seq', 1, false);


--
-- Data for Name: entrada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entrada (id, fecha_creacion, fecha_modif, cantidad, fecha_entrada, tipo_entrada, usuario_entrada, observacion, id_usuario) FROM stdin;
\.


--
-- Name: entrada_id_entrada_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entrada_id_entrada_seq', 1, false);


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY equipo (id, descripcion, marca, modelo, serial, color, estado, unidad_admin, status, responsable, caracteristicas, fecha_modif, unidad_trabajo) FROM stdin;
1	wdjiwdjji	dhidid	didhiod	dhihodhiod	rojo	dndwnhiodwin	dwjowdjopdw	1	fwwd	\N	2016-03-27 19:44:27.56858	\N
2	dwdwhi	VIT	dwji	213213	negro	1	\N	1	\N	\N	2016-03-27 19:44:27.56858	\N
3	dhdh	didi	dnid	bdi	negro	2	1	1	1	dnod	2016-03-28 08:16:08	\N
4	dhdh	didi	dnid	43	negro	2	postgres.php	1	1	dnod	2016-03-28 09:39:14	\N
5	dhdh	didi	dnid	432	negro	2	\N	1	1	dnod	2016-03-28 10:00:58	\N
6	csc	hihi	hihi	hihi	2	1	\N	1	1	ggi	2016-03-29 01:58:49	\N
7	csc	hihi	hihi	ws	2	1	\N	1	2	ggi	2016-03-29 01:59:58	\N
8	csc	hihi	hihi	dydy	2	1	\N	1	2	ggi	2016-03-29 02:02:25	\N
9	PC	VIT	Canaima	cns¡js	2	1	\N	1	2	100GB	2016-03-29 04:13:35	\N
10	PC	VIT	Canaima	f4ur4f	2	1	7	1	2	100GB	2016-03-29 04:16:58	1
\.


--
-- Name: equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipo_id_seq', 10, true);


--
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personal (id, ci_per, nombres, apellidos, cargo, telf_pers, telf_casa, correo, f_nac, fecha_creacion, fecha_modif, usuario_creacion, usuario_modif, status, unidad_trabajo, id_usuario) FROM stdin;
1	2232323	Luis	Lavado	dndnid	221562614	246246246	ffjifjif@fjifjif.com	2016-03-13	2016-03-14 08:18:08.589283	2016-03-14 08:18:08.589283	0	0	1	dfhf	1
2	213213213	Luis	Lavado	gygyug	123123	31232132	wdhdwhwd@fehif.com	2016-03-16	2016-03-17 15:09:23.12021	2016-03-17 15:09:23.12021	0	0	1	CCO	2
\.


--
-- Name: personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personal_id_personal_seq', 2, true);


--
-- Data for Name: responsables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY responsables (id, nombres, apellidos, uni_admin, fecha_creacion, fecha_modif, status) FROM stdin;
1	fdjwdj	bggouudwdw	vhoyuh	2016-03-14 14:03:04.140312	2016-03-14 14:03:04.140312	1
\.


--
-- Name: responsables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('responsables_id_seq', 1, true);


--
-- Data for Name: salida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY salida (id, fecha_creacion, fecha_modif, cantidad, fecha_salida, tipo_salida, usuario_salida, observacion, id_usuario) FROM stdin;
\.


--
-- Name: salida_id_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('salida_id_salida_seq', 1, false);


--
-- Data for Name: solvencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY solvencia (id, fecha_solvencia, id_personal) FROM stdin;
\.


--
-- Name: solvencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solvencia_id_seq', 1, false);


--
-- Data for Name: sub_categorias_bienes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sub_categorias_bienes (id, codigo, descripcion, tipo, id_categoria_general_bienes) FROM stdin;
\.


--
-- Name: sub_categorias_bienes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sub_categorias_bienes_id_seq', 1, false);


--
-- Name: ubicacion_id_Ubicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"ubicacion_id_Ubicacion_seq"', 1, true);


--
-- Data for Name: unidad_admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY unidad_admin (id, nombre) FROM stdin;
1	Coordinación
\.


--
-- Data for Name: unidad_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY unidad_trabajo (id, nombre) FROM stdin;
1	CCO
\.


--
-- Name: unidad_trabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_trabajo_id_seq', 1, true);


--
-- Name: unidad_trabajo_nombre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_trabajo_nombre_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id, usuario, pass, nivel, fecha_modif, status) FROM stdin;
1	admin	d033e22ae348aeb5660fc2140aec35850c4da997	1	2016-03-11 11:46:23.877504	1
2	luisrlavadoo	fa2512662d5d5bee92595333ee31080a82ad7ef7	1	2016-03-11 14:59:49.432414	1
\.


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 2, true);


--
-- Name: PK_personal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT "PK_personal" PRIMARY KEY (id);


--
-- Name: UN_personal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT "UN_personal" UNIQUE (ci_per);


--
-- Name: UN_ubicacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_admin
    ADD CONSTRAINT "UN_ubicacion" UNIQUE (nombre);


--
-- Name: UN_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT "UN_usuario" UNIQUE (usuario);


--
-- Name: personal_uq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT personal_uq UNIQUE (id_usuario);


--
-- Name: pk  sub_categorias_bienes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sub_categorias_bienes
    ADD CONSTRAINT "pk  sub_categorias_bienes" PRIMARY KEY (id);


--
-- Name: pk categoria_general_bienes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria_general_bienes
    ADD CONSTRAINT "pk categoria_general_bienes" PRIMARY KEY (id);


--
-- Name: pk configuracion_bien; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_bien
    ADD CONSTRAINT "pk configuracion_bien" PRIMARY KEY (id);


--
-- Name: pk_asignacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "aignación"
    ADD CONSTRAINT pk_asignacion PRIMARY KEY (id);


--
-- Name: pk_bienes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bienesgeneral
    ADD CONSTRAINT pk_bienes PRIMARY KEY (id);


--
-- Name: pk_cat_especifica; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "cod_categoria_específica"
    ADD CONSTRAINT pk_cat_especifica PRIMARY KEY (id);


--
-- Name: CONSTRAINT pk_cat_especifica ON "cod_categoria_específica"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_cat_especifica ON "cod_categoria_específica" IS 'Categoria especifica';


--
-- Name: pk_detalle_entrada; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detalle_entrada
    ADD CONSTRAINT pk_detalle_entrada PRIMARY KEY (id);


--
-- Name: pk_detalle_salida; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detalle_salida
    ADD CONSTRAINT pk_detalle_salida PRIMARY KEY (id);


--
-- Name: pk_entrada; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT pk_entrada PRIMARY KEY (id);


--
-- Name: pk_equipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT pk_equipo PRIMARY KEY (id);


--
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- Name: pk_salida; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY salida
    ADD CONSTRAINT pk_salida PRIMARY KEY (id);


--
-- Name: pk_serial; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY responsables
    ADD CONSTRAINT pk_serial PRIMARY KEY (id);


--
-- Name: pk_solvencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY solvencia
    ADD CONSTRAINT pk_solvencia PRIMARY KEY (id);


--
-- Name: pk_ubicacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_admin
    ADD CONSTRAINT pk_ubicacion PRIMARY KEY (id);


--
-- Name: un_bien_serial; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bienesgeneral
    ADD CONSTRAINT un_bien_serial UNIQUE (serial);


--
-- Name: un_equipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT un_equipo UNIQUE (serial);


--
-- Name: unidad_trabajo_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_trabajo
    ADD CONSTRAINT unidad_trabajo_nombre_key UNIQUE (nombre);


--
-- Name: unidad_trabajo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_trabajo
    ADD CONSTRAINT unidad_trabajo_pkey PRIMARY KEY (id);


--
-- Name: actualizarusuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizarusuario AFTER UPDATE ON usuario FOR EACH ROW EXECUTE PROCEDURE auditusuario();


--
-- Name: auditusuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auditusuario AFTER DELETE ON usuario FOR EACH ROW EXECUTE PROCEDURE auditusuario();


--
-- Name: categoria_general_bienes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sub_categorias_bienes
    ADD CONSTRAINT categoria_general_bienes_fk FOREIGN KEY (id_categoria_general_bienes) REFERENCES categoria_general_bienes(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: entrada_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_entrada
    ADD CONSTRAINT entrada_fk FOREIGN KEY (id_entrada) REFERENCES entrada(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fk_especifica_sub; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "cod_categoria_específica"
    ADD CONSTRAINT fk_especifica_sub FOREIGN KEY (id_sub_categorias_bienes) REFERENCES sub_categorias_bienes(id);


--
-- Name: personal_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "aignación"
    ADD CONSTRAINT personal_fk FOREIGN KEY (id_personal) REFERENCES personal(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: personal_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solvencia
    ADD CONSTRAINT personal_fk FOREIGN KEY (id_personal) REFERENCES personal(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_salida
    ADD CONSTRAINT salida_fk FOREIGN KEY (id_salida_salida) REFERENCES salida(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY salida
    ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
