#!/usr/bin/env python3
# coding: utf-8

#
# Secretaría de Salud - Consultar Camas de Hospital por Municipio
#

# Liberías
import psycopg2               # Adaptador para la BD PostgreSQL https://pypi.python.org/pypi/psycopg2
import sys                    # Interactuar con otros programas usando estándar de término en sys.exit(1) https://docs.python.org/3.4/library/sys.html
from tabulate import tabulate # Bellas tablas https://pypi.python.org/pypi/tabulate

# Constantes
entidad = '05' # Clave INEGI de la entidad, donde 05 = Coahuila de Zaragoza

try:
    # Puntero a la BD
    con = psycopg2.connect("host=127.0.0.1 dbname='secretaria_de_salud' user='salud' password='cualquiera'")
    cur = con.cursor()
    # Definir títulos de las columnas para la tabla a mostrar
    resultados = [['Clave', 'Municipio', 'THosp', 'TNoHosp', 'Urgencias', 'CirAmb', 'TrabParto', 'PostParto', 'TerInten', 'TerInter', 'Otras']]
    # Consultar
    cur.execute("""
        SELECT
            municipio,
            municipio_nombre,
            SUM(camas_hospitalizacion_total),
            SUM(camas_no_hospitalizacion_total),
            SUM(camas_urgencias),
            SUM(camas_cirugia_ambulatoria),
            SUM(camas_trabajo_parto),
            SUM(camas_recuperacion_postparto),
            SUM(camas_terapia_intensiva),
            SUM(camas_terapia_intermedia),
            SUM(camas_otras_areas)
        FROM
            recursos_salud_2014
        WHERE
            entidad = %s
        GROUP BY
            municipio, municipio_nombre
        ORDER BY
            municipio ASC""", (entidad,))
    renglones = cur.fetchall()
    # Bucle por los registros
    for renglon in renglones:
        resultados.append(renglon)
    # Mostrar los resultados en una tabla en pantalla, la primera fila tiene encabezados
    print("Camas de Hospital según Recursos Salud 2014")
    print()
    print(tabulate(resultados, headers="firstrow"))

except Exception as e:
    print("Error %s" % e)
    sys.exit(1)

finally:
    if con:
        con.close()
