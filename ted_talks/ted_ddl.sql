-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.3
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
CREATE DATABASE new_database;
-- ddl-end --


-- object: public.charla | type: TABLE --
-- DROP TABLE IF EXISTS public.charla CASCADE;
CREATE TABLE public.charla (
	identificador integer NOT NULL,
	titulo varchar(128) NOT NULL,
	descripcion varchar(1024),
	identificador_idioma integer,
	identificador_patrocinador integer,
	CONSTRAINT identificador_pk PRIMARY KEY (identificador)

);
-- ddl-end --
ALTER TABLE public.charla OWNER TO postgres;
-- ddl-end --

-- object: public.idioma | type: TABLE --
-- DROP TABLE IF EXISTS public.idioma CASCADE;
CREATE TABLE public.idioma (
	identificador serial NOT NULL,
	nombre varchar(8) NOT NULL,
	CONSTRAINT identificador_pk PRIMARY KEY (identificador)

);
-- ddl-end --
ALTER TABLE public.idioma OWNER TO postgres;
-- ddl-end --

-- object: public.video | type: TABLE --
-- DROP TABLE IF EXISTS public.video CASCADE;
CREATE TABLE public.video (
	identificador serial NOT NULL,
	visitas integer,
	traducido bool,
	destacado bool,
	duracion integer,
	contexto varchar(32),
	identificador_charla integer,
	hora time,
	dia integer,
	mes integer,
	anio integer,
	CONSTRAINT identificador_pk PRIMARY KEY (identificador)

);
-- ddl-end --
ALTER TABLE public.video OWNER TO postgres;
-- ddl-end --

-- object: public.tema | type: TABLE --
-- DROP TABLE IF EXISTS public.tema CASCADE;
CREATE TABLE public.tema (
	identificador integer NOT NULL,
	nombre varchar(32),
	CONSTRAINT identificador_pk PRIMARY KEY (identificador)

);
-- ddl-end --
ALTER TABLE public.tema OWNER TO postgres;
-- ddl-end --

-- object: public.ponente | type: TABLE --
-- DROP TABLE IF EXISTS public.ponente CASCADE;
CREATE TABLE public.ponente (
	identificador serial NOT NULL,
	nombre varchar(32) NOT NULL,
	apellido varchar(32) NOT NULL,
	ha_publicado bool,
	CONSTRAINT identificador_pk PRIMARY KEY (identificador)

);
-- ddl-end --
ALTER TABLE public.ponente OWNER TO postgres;
-- ddl-end --

-- object: public.patrocinador | type: TABLE --
-- DROP TABLE IF EXISTS public.patrocinador CASCADE;
CREATE TABLE public.patrocinador (
	identificador serial NOT NULL,
	nombre varchar(128) NOT NULL,
	CONSTRAINT identificador_pk PRIMARY KEY (identificador)

);
-- ddl-end --
ALTER TABLE public.patrocinador OWNER TO postgres;
-- ddl-end --

-- object: public.charla_ponente | type: TABLE --
-- DROP TABLE IF EXISTS public.charla_ponente CASCADE;
CREATE TABLE public.charla_ponente (
	identificador_ponente integer NOT NULL,
	identificador_charla integer NOT NULL,
	CONSTRAINT charla_ponente_pk PRIMARY KEY (identificador_ponente,identificador_charla)

);
-- ddl-end --
ALTER TABLE public.charla_ponente OWNER TO postgres;
-- ddl-end --

-- object: public.charla_tema | type: TABLE --
-- DROP TABLE IF EXISTS public.charla_tema CASCADE;
CREATE TABLE public.charla_tema (
	identificador_charla integer NOT NULL,
	identificador_tema integer NOT NULL,
	CONSTRAINT charla_tema_pk PRIMARY KEY (identificador_charla,identificador_tema)

);
-- ddl-end --
ALTER TABLE public.charla_tema OWNER TO postgres;
-- ddl-end --

-- object: idioma_fk | type: CONSTRAINT --
-- ALTER TABLE public.charla DROP CONSTRAINT IF EXISTS idioma_fk CASCADE;
ALTER TABLE public.charla ADD CONSTRAINT idioma_fk FOREIGN KEY (identificador_idioma)
REFERENCES public.idioma (identificador) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: patrocinador_fk | type: CONSTRAINT --
-- ALTER TABLE public.charla DROP CONSTRAINT IF EXISTS patrocinador_fk CASCADE;
ALTER TABLE public.charla ADD CONSTRAINT patrocinador_fk FOREIGN KEY (identificador_patrocinador)
REFERENCES public.patrocinador (identificador) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: ponente_fk | type: CONSTRAINT --
-- ALTER TABLE public.charla_ponente DROP CONSTRAINT IF EXISTS ponente_fk CASCADE;
ALTER TABLE public.charla_ponente ADD CONSTRAINT ponente_fk FOREIGN KEY (identificador_ponente)
REFERENCES public.ponente (identificador) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: charla_fk | type: CONSTRAINT --
-- ALTER TABLE public.video DROP CONSTRAINT IF EXISTS charla_fk CASCADE;
ALTER TABLE public.video ADD CONSTRAINT charla_fk FOREIGN KEY (identificador_charla)
REFERENCES public.charla (identificador) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: charla_fk | type: CONSTRAINT --
-- ALTER TABLE public.charla_tema DROP CONSTRAINT IF EXISTS charla_fk CASCADE;
ALTER TABLE public.charla_tema ADD CONSTRAINT charla_fk FOREIGN KEY (identificador_charla)
REFERENCES public.charla (identificador) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: tema_fk | type: CONSTRAINT --
-- ALTER TABLE public.charla_tema DROP CONSTRAINT IF EXISTS tema_fk CASCADE;
ALTER TABLE public.charla_tema ADD CONSTRAINT tema_fk FOREIGN KEY (identificador_tema)
REFERENCES public.tema (identificador) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: charla_fk | type: CONSTRAINT --
-- ALTER TABLE public.charla_ponente DROP CONSTRAINT IF EXISTS charla_fk CASCADE;
ALTER TABLE public.charla_ponente ADD CONSTRAINT charla_fk FOREIGN KEY (identificador_charla)
REFERENCES public.charla (identificador) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


