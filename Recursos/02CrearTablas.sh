#!/bin/bash

#
# Secretaría de Salud - Recursos Crear Tablas
#

# Yo soy
SOY="[Recursos Crear Tablas]"

# Definir constantes que definen los tipos de errores
EXITO=0
E_NOARGS=65
E_FATAL=99

# Definir constantes
BD="secretaria_de_salud"
BD_USUARIO="salud"

# Cambiar al directorio donde se encuentra este bash script
cd "$(dirname "$0")"

# Crear tablas
echo "$SOY Creando las tablas..."
psql -U $BD_USUARIO -f recursos-salud-2014.sql $BD
if [ "$?" -ne $EXITO ]; then
    exit $E_FATAL
fi
psql -U $BD_USUARIO -f recursos-salud-2014-municipios.sql $BD
if [ "$?" -ne $EXITO ]; then
    exit $E_FATAL
fi

echo "$SOY Script terminado."
exit $EXITO
