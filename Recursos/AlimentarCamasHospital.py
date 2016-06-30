#!/usr/bin/env python3
# coding: utf-8

#
# Secretaría de Salud - Alimentar Camas de Hospital por Municipio
#

# Liberías
import psycopg2  # Adaptador para la BD PostgreSQL https://pypi.python.org/pypi/psycopg2
import sys       # Interactuar con otros programas usando estándar de término en sys.exit(1) https://docs.python.org/3.4/library/sys.html

# Constantes
entidad = '05' # Clave INEGI de la entidad, donde 05 = Coahuila de Zaragoza

try:
    print("Alimentar Camas de Hospital por Municipio")
    print()
    # Puntero a la BD
    con = psycopg2.connect("host=127.0.0.1 dbname='secretaria_de_salud' user='salud' password='cualquiera'")
    cur = con.cursor()
    # Consultar
    cur.execute("""
        SELECT
            entidad,
            municipio,
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
            entidad,
            municipio
        ORDER BY
            entidad, municipio ASC""", (entidad,))
    if cur.rowcount == 0:
        raise Exception("La consulta a recursos_salud_2014 con entidad %s no entregó registros." % entidad)
    print("  %s municipios a actualizar..." % cur.rowcount)
    print()
    renglones = cur.fetchall()
    # Bucle por los registros
    for renglon in renglones:
        # Definir variables
        entidad                        = renglon[0]
        municipio                      = renglon[1]
        clave                          = entidad + municipio
        camas_hospitalizacion_total    = renglon[2]
        camas_no_hospitalizacion_total = renglon[3]
        camas_urgencias                = renglon[4]
        camas_cirugia_ambulatoria      = renglon[5]
        camas_trabajo_parto            = renglon[6]
        camas_recuperacion_postparto   = renglon[7]
        camas_terapia_intensiva        = renglon[8]
        camas_terapia_intermedia       = renglon[9]
        camas_otras_areas              = renglon[10]
        # Actualizar la otra tabla
        cur.execute("""
            UPDATE
                recursos_salud_2014_municipios
            SET
                camas_hospitalizacion_total = %s,
                camas_no_hospitalizacion_total = %s,
                camas_urgencias = %s,
                camas_cirugia_ambulatoria = %s,
                camas_trabajo_parto = %s,
                camas_recuperacion_postparto = %s,
                camas_terapia_intensiva = %s,
                camas_terapia_intermedia = %s,
                camas_otras_areas = %s
            WHERE
                clave = %s""",
            (camas_hospitalizacion_total,
            camas_no_hospitalizacion_total,
            camas_urgencias,
            camas_cirugia_ambulatoria,
            camas_trabajo_parto,
            camas_recuperacion_postparto,
            camas_terapia_intensiva,
            camas_terapia_intermedia,
            camas_otras_areas,
            clave,))
        print("  Actualizado el municipio con clave %s" % clave)
    # Ejecutar comandos SQL
    con.commit()
    # Mensaje final
    print("  Terminado con éxito.")
    print()

except Exception as e:
    print("Error %s" % e)
    sys.exit(1)

finally:
    if con:
        con.close()
