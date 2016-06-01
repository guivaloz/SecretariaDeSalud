
# Recursos Salud

### Obtener los archivos con datos abiertos.

Descargar en:

    http://www.dgis.salud.gob.mx/contenidos/basesdedatos/da_recursos.html

Comando wget para descargar los dos archivos ZIP:

    $ wget -cv -i urls-para-wget.txt

O uno por uno:

    $ wget http://www.dgis.salud.gob.mx/descargas/datosabiertos/recursos_salud_2013.zip
    $ wget http://www.dgis.salud.gob.mx/descargas/datosabiertos/recursos_salud_2014.zip

Desempacar.

    $ unzip recursos_salud_2013.zip
    $ unzip recursos_salud_2014.zip

Recuerde la ruta absoluta donde están los archivos CSV; es necesario para el comando COPY. Por ejemplo:

    $ ls /mnt/cascarrabias/DB/SecretariaDeSalud/Recursos/recursos_salud_2014.csv

### Crear tabla en la base de datos

En el archivo recursos-salud-2014.sql está el comando CREATE para crear la tabla:

    $ psql -U salud -f recursos-salud-2014.sql secretaria_de_salud

### Preparar contenido del CSV

Marcó error al importar porque hay latitudes y longitudes como "NULL,NULL".

Con sed cambie los NULL por nada (un dato vacío en un archivo CSV es importado como NULL).

    $ sed -i 's/NULL//g' recursos_salud_2014.csv

### Importar el CSV a PostgreSQL

Ingrese a la base de datos.

    $ psql secretaria_de_salud

Dentro de psql cambie la codificación de los caracteres, ya que el CSV no está en UTF-8

    \encoding LATIN1

Ejecute el siguiente comando COPY para importar el CVS a la tabla.

    COPY recursos_salud_2014 FROM '/mnt/cascarrabias/DB/SecretariaDeSalud/Recursos/recursos_salud_2014.csv' DELIMITER ',' CSV HEADER;

Salga de psql

    \q
