
# Nacimientos

### Obtener los archivos con datos abiertos.

Descargar en:

    http://www.dgis.salud.gob.mx/contenidos/basesdedatos/da_nacimientos.html

Comandos wget:

Desempacar:

    $ unzip sinac_2014.zip

### Crear tabla en la base de datos

En el archivo sinac-2014.sql está el comando CREATE para crear la tabla:

    $ psql -U salud -f sinac-2014.sql secretaria_de_salud

### Preparar contenido del CSV

Antes de importar, hay errores en las fechas que debe reparar con el comando sed:

    ERROR:  el valor de hora/fecha está fuera de rango: «99/99/9999»
    SUGERENCIA:  Quizás necesite una configuración diferente de «datestyle».
    CONTEXTO:  COPY sinac_2014, línea 10980, columna fech_nacm: «99/99/9999»

Con sed cambie los "99/99/9999" por nada (un dato vacío en un archivo CSV es importado como NULL):

    $ sed -i 's/"99\/99\/9999"//g' SINAC_2014.csv

Explicación del comando sed:

    sed -i 's/original/new/g' file.txt
    sed = Stream EDitor
     -i = in-place (i.e. save back to the original file)
    The command string:
        s        = the substitute command
        original = a regular expression describing the word to replace (or just the word itself)
        new      = the text to replace it with
        g        = global (i.e. replace all and not just the first occurrence)
    file.txt = the file name

### Ingrese a la base de datos

    $ psql secretaria_de_salud

### Ejecute los siguientes comandos dentro de psql para importar el CVS a la tabla

    SET DateStyle to 'DMY';
    COPY sinac_2014 FROM '/mnt/cascarrabias/DB/Salud.gob.mx/Nacimientos/SINAC_2014.csv' DELIMITER ',' CSV HEADER;
    \q
