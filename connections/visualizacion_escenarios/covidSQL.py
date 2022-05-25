def escenario1():
    return """SELECT nombre as tema_destacado, COUNT(nombre) as frecuencia
    FROM tema t
        INNER JOIN charla_tema ct
            ON t.identificador = ct.identificador_tema
        INNER JOIN charla c
            ON identificador_charla = c.identificador
        INNER JOIN video v
            ON v.identificador_charla = c.identificador
        WHERE destacado = true
        GROUP BY nombre
        HAVING COUNT(nombre) >= 50
        ORDER BY frecuencia DESC;"""


def escenario2():
    return """SELECT anio, SUM(visitas) as visitas_totales, AVG(visitas) as visitas_promedio
        FROM video
    GROUP BY anio
    ORDER BY anio;"""


def escenario3():
    return """SELECT nombre as tema, SUM(visitas) as visitas, AVG(visitas) as visitas_promedio
    FROM tema t
        INNER JOIN charla_tema ct
            ON t.identificador = ct.identificador_tema
        INNER JOIN charla c
            ON identificador_charla = c.identificador
        INNER JOIN video v
            ON v.identificador_charla = c.identificador
        GROUP BY nombre;"""


def escenario4():
    return """select descripcion from charla"""


def escenario5 ():
    return """SELECT anio, nombre as tema, traducido, SUM(visitas) as visitas
    FROM tema t
        INNER JOIN charla_tema ct
            ON t.identificador = ct.identificador_tema
        INNER JOIN charla c
            ON identificador_charla = c.identificador
        INNER JOIN video v
            ON v.identificador_charla = c.identificador
        GROUP BY nombre, anio, traducido"""
