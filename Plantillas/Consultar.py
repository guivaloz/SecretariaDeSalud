#!/usr/bin/env python3
# coding: utf-8

#
# Consultar
#

# Liberías
# psycopg2 - Adaptador para la BD PostgreSQL https://pypi.python.org/pypi/psycopg2
# sys      - Interactuar con otros programas usando estándar de término en sys.exit(1) https://docs.python.org/3.4/library/sys.html
# tabulate - Bellas tablas https://pypi.python.org/pypi/tabulate
import psycopg2
import sys
from tabulate import tabulate

# Constante
limit = 40 # Limitar la cantidad de resultados

try:
    # Puntero a la BD
    con = psycopg2.connect("host=127.0.01 dbname='base_de_datos' user='usuario' password='cualquiera'")
    cur = con.cursor()
    # Definir títulos de las columnas para la tabla a mostrar
    resultados = [['', '', '', '', '']]
    # Consultar
    cur.execute("""
        SELECT
            columnas
        FROM
            tablas
        WHERE
            filtros = 'A'
        ORDER BY
            columna ASC
        LIMIT %s""", (limit,))
    renglones = cur.fetchall()
    # Bucle por los renglones
    for renglon in renglones:
        resultados.append(renglon)
    # Mostrar los resultados en una tabla en pantalla, la primera fila tiene encabezados
    print("Los %s resultados" % limit)
    print()
    print(tabulate(resultados, headers="firstrow"))

except Exception as e:
    print("Error %s" % e)
    sys.exit(1)

finally:
    if con:
        con.close()
