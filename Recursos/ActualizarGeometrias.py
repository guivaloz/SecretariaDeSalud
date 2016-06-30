#!/usr/bin/env python3
# coding: utf-8

#
# Secretaría de Salud - Actualizar Geometrías
#

# Liberías
import psycopg2  # Adaptador para la BD PostgreSQL https://pypi.python.org/pypi/psycopg2
import sys       # Interactuar con otros programas usando estándar de término en sys.exit(1) https://docs.python.org/3.4/library/sys.html

# Constantes
entidad = '05' # Clave INEGI de la entidad, donde 05 = Coahuila de Zaragoza

try:
    print("Actualizar Geometrías")
    print()
    # Puntero a la BD INEGI
    inegi_con = psycopg2.connect("host=127.0.0.1 dbname='inegi' user='inegi' password='cualquiera'")
    inegi_cur = inegi_con.cursor()
    # Puntero a la BD Secretaría de Salud
    salud_con = psycopg2.connect("host=127.0.0.1 dbname='secretaria_de_salud' user='salud' password='cualquiera'")
    salud_cur = salud_con.cursor()
    # Consultar polígonos de los municipios en INEGI
    inegi_cur.execute("""
        SELECT
            cve_mun,
            geom
        FROM
            mgn_municipios
        WHERE
            cve_ent = %s
        ORDER BY
            cve_mun ASC""", (entidad,))
    renglones = inegi_cur.fetchall()
    # Bucle para actualizar cada municipio en Secretaría de Salud con su polígono
    for renglon in renglones:
        clave = entidad + renglon[0]
        geom  = renglon[1]
        # Consultar la población total y las camas
        salud_cur.execute("""
            SELECT
                poblacion_total,
                camas_hospitalizacion_total
            FROM
                recursos_salud_2014_municipios
            WHERE
                clave = %s""",
        (clave,))
        consulta                    = salud_cur.fetchone()
        poblacion_total             = consulta[0]
        camas_hospitalizacion_total = consulta[1]
        # Calcular la tasa
        if camas_hospitalizacion_total > 0:
            camas_hospitalizacion_tasa = camas_hospitalizacion_total / (poblacion_total / 10000)
        else:
            camas_hospitalizacion_tasa = 0
        # Actualizar con la tasa y la geometria
        salud_cur.execute("""
            UPDATE
                recursos_salud_2014_municipios
            SET
                camas_hospitalizacion_tasa = %s,
                geom = %s
            WHERE
                clave = %s""",
        (camas_hospitalizacion_tasa, geom, clave,))
        print("  Actualizado el municipio con clave %s" % clave)
    # Ejecutar comandos SQL
    salud_con.commit()
    # Mensaje final
    print("  Terminado con éxito.")
    print()

except Exception as e:
    print("Error %s" % e)
    sys.exit(1)

finally:
    if inegi_con:
        inegi_con.close()
    if salud_con:
        salud_con.close()
