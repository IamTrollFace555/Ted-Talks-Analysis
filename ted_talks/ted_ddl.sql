CREATE TABLE charla (
	identificador integer NOT NULL,
	titulo varchar(128) NOT NULL,
	descripcion varchar(2048),
	identificador_idioma integer,
	identificador_patrocinador integer,
	CONSTRAINT id_charla_pk PRIMARY KEY (identificador)
);

CREATE TABLE idioma (
	identificador serial NOT NULL,
	nombre varchar(8) NOT NULL,
	CONSTRAINT id_idioma_pk PRIMARY KEY (identificador)
);

CREATE TABLE video (
	identificador serial NOT NULL,
	visitas integer,
	traducido bool,
	destacado bool,
	duracion integer,
	contexto varchar(64),
	hora time,
	dia integer,
	mes integer,
	anio integer,
	identificador_charla integer,
	CONSTRAINT id_video_pk PRIMARY KEY (identificador)
);

CREATE TABLE tema (
	identificador integer NOT NULL,
	nombre varchar(32),
	CONSTRAINT id_tema_pk PRIMARY KEY (identificador)
);

CREATE TABLE ponente (
	identificador int NOT NULL,
	nombre varchar(32),
	apellido varchar(64),
	ha_publicado bool,
	CONSTRAINT id_ponente_pk PRIMARY KEY (identificador)
);

CREATE TABLE patrocinador (
	identificador serial NOT NULL,
	nombre varchar(128) NOT NULL,
	CONSTRAINT id_patrocinador_pk PRIMARY KEY (identificador)
);

CREATE TABLE charla_ponente (
	identificador_ponente serial NOT NULL,
	identificador_charla integer NOT NULL,
	CONSTRAINT charla_ponente_pk PRIMARY KEY (identificador_ponente,identificador_charla)
);

CREATE TABLE charla_tema (
	identificador_charla integer NOT NULL,
	identificador_tema integer NOT NULL,
	CONSTRAINT charla_tema_pk PRIMARY KEY (identificador_charla,identificador_tema)
);

-- FOREIGN KEYS
ALTER TABLE charla ADD CONSTRAINT idioma_fk FOREIGN KEY (identificador_idioma)
	REFERENCES idioma (identificador) MATCH FULL
	ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE charla ADD CONSTRAINT patrocinador_fk FOREIGN KEY (identificador_patrocinador)
	REFERENCES patrocinador (identificador) MATCH FULL
	ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE charla_ponente ADD CONSTRAINT ponente_fk FOREIGN KEY (identificador_ponente)
	REFERENCES ponente (identificador) MATCH FULL
	ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE video ADD CONSTRAINT video_charla_fk FOREIGN KEY (identificador_charla)
	REFERENCES charla (identificador) MATCH FULL
	ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE charla_tema ADD CONSTRAINT tema_charla_fk FOREIGN KEY (identificador_charla)
	REFERENCES charla (identificador) MATCH FULL
	ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE charla_tema ADD CONSTRAINT tema_fk FOREIGN KEY (identificador_tema)
	REFERENCES tema (identificador) MATCH FULL
	ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE charla_ponente ADD CONSTRAINT ponente_charla_fk FOREIGN KEY (identificador_charla)
	REFERENCES charla (identificador) MATCH FULL
	ON DELETE SET NULL ON UPDATE CASCADE;
