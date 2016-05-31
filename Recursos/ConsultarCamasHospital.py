#!/usr/bin/env python3
# coding: utf-8

#
# Consultar Camas de Hospital por Municipio
#

# Liberías
# psycopg2 - Adaptador para la BD PostgreSQL https://pypi.python.org/pypi/psycopg2
# sys      - Interactuar con otros programas usando estándar de término en sys.exit(1) https://docs.python.org/3.4/library/sys.html
# tabulate - Bellas tablas https://pypi.python.org/pypi/tabulate
import psycopg2
import sys
from tabulate import tabulate

# Constantes
entidad = '05' # Clave INEGI de la entidad Coahuila = 05

try:
    # Puntero a la BD
    con = psycopg2.connect("host=127.0.0.1 dbname='secretaria_de_salud' user='salud' password='cualquiera'")
    cur = con.cursor()
    # Definir títulos de las columnas para la tabla a mostrar
    resultados = [['Entidad', 'Municipio', 'THosp', 'TNoHosp', 'Urgencias', 'CirAmb', 'TrabParto', 'PostParto', 'TerInten', 'TerInter', 'Otras']]
    # Consultar
    cur.execute("""
        SELECT
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
            municipio_nombre
        ORDER BY
            municipio_nombre ASC""", (entidad,))
    renglones = cur.fetchall()
    # Bucle por los renglones
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
