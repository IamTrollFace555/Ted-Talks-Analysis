COPY idioma(identificador, nombre)
	FROM 'C:\segunda_entrega\datasets\idioma.csv'
		WITH DELIMITER ';'
		CSV HEADER;

COPY patrocinador(identificador, nombre)
	FROM 'C:\segunda_entrega\datasets\patrocinador.csv'
		WITH DELIMITER ';'
		CSV HEADER;

COPY charla(identificador, titulo, descripcion, identificador_idioma, identificador_patrocinador)
	FROM 'C:\segunda_entrega\datasets\charla.csv'
		WITH DELIMITER ';'
		CSV HEADER
		ENCODING 'windows-1251';

COPY video(identificador, visitas, traducido, destacado, duracion, contexto, hora, dia, mes, anio, identificador_charla)
	FROM 'C:\segunda_entrega\datasets\video.csv'
		WITH DELIMITER ';'
		CSV HEADER
		ENCODING 'windows-1251';

COPY tema(identificador, nombre)
	FROM 'C:\segunda_entrega\datasets\tema.csv'
		WITH DELIMITER ';'
		CSV HEADER;

COPY ponente(identificador, nombre, apellido, ha_publicado)
	FROM 'C:\segunda_entrega\datasets\ponente.csv'
		WITH DELIMITER ';'
		CSV HEADER;

COPY charla_tema(identificador_charla, identificador_tema)
	FROM 'C:\segunda_entrega\datasets\charla_tema.csv'
		WITH DELIMITER ';'
		CSV HEADER;

COPY charla_ponente(identificador_charla, identificador_ponente)
	FROM 'C:\segunda_entrega\datasets\charla_ponente.csv'
		WITH DELIMITER ';'
		CSV HEADER;