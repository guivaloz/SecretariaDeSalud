
# Recursos Salud

### Obtener los archivos con datos abiertos.

En esta página de salud.gob.mx se encuentran:

    http://www.dgis.salud.gob.mx/contenidos/basesdedatos/da_recursos.html

Cree dentro de **Recursos** la carpeta **Descargas**

    $ mkdir Desempacados
    $ mkdir Descargas
    $ cd Descargas

Puede descargar con un solo comando wget los dos archivos ZIP:

    $ wget -cv -i urls-para-wget.txt

O bien, uno por uno:

    $ wget http://www.dgis.salud.gob.mx/descargas/datosabiertos/recursos_salud_2013.zip
    $ wget http://www.dgis.salud.gob.mx/descargas/datosabiertos/recursos_salud_2014.zip

Desempacar.

    $ unzip -d ../Desempacados recursos_salud_2013.zip
    $ unzip -d ../Desempacados recursos_salud_2014.zip

Recuerde la ruta absoluta donde están los archivos CSV; es necesario para el comando **COPY.** Por ejemplo, en mi caso:

    $ ls /home/guivaloz/Documentos/GitHub/guivaloz/SecretariaDeSalud/Recursos/Desempacados/recursos_salud_2014.csv

### Crear tabla en la base de datos

En el archivo recursos-salud-2014.sql está el comando CREATE para crear la tabla:

    $ psql -U salud -f recursos-salud-2014.sql secretaria_de_salud

Lea el archivo **recursos-salud-2014.sql**, para que lea las descripciones de cada columna.

### Preparar contenido del CSV

**Marcó error al importar porque hay latitudes y longitudes como "NULL,NULL".**

Con sed cambie los NULL por nada (un dato vacío en un archivo CSV es importado como NULL).

    $ sed -i 's/NULL//g' recursos_salud_2014.csv

### Importar el CSV a PostgreSQL

Ingrese a la base de datos.

    $ psql secretaria_de_salud

Dentro de psql cambie la codificación de los caracteres, ya que el CSV no está en UTF-8

    \encoding LATIN1

Ejecute el siguiente comando COPY para importar el CVS a la tabla.

    COPY recursos_salud_2014 FROM '/home/guivaloz/Documentos/GitHub/guivaloz/SecretariaDeSalud/Recursos/Desempacados/recursos_salud_2014.csv' DELIMITER ',' CSV HEADER;

Salga de psql

    \q

### Consulte las cantidades de camas de hospital por municipio

Estudie y ejecute el programa en python

    $ python3 ConsultarCamasHospital.py

Y cambie la clave de la entidad para elaborar esta consulta en otros estados

### Mapeo por municipios en QGIS

Para mapear en QGIS necesitamos tener una sola tabla con los municipios, los totales de población y los totales del recurso.

El script CrearBaseDatos.sh debió haber creado **recursos_salud_2014_municipios**. Manualmente se hace así:

    $ psql -U salud -f recursos-salud-2014-municipios.sql secretaria_de_salud

Note que tiene una columna para polígonos georreferenciados.

Ingrese a la base de datos.

    $ psql secretaria_de_salud

Luego inserte los municipios y poblaciones de Coahuila de Zaragoza, con:

    \encoding UTF8
    COPY recursos_salud_2014_municipios (entidad, clave, nombre, poblacion_total, poblacion_total_masculina, poblacion_total_femenina) FROM '/home/guivaloz/Documentos/GitHub/guivaloz/SecretariaDeSalud/Recursos/05CoahuilaDeZaragoza.csv' DELIMITER ',' CSV HEADER;

Salga de psql

    \q
