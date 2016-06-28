#!/bin/bash

#
# Secretaría de Salud - Insertar Sistema de Referencia de Coordenadas
#

# Yo soy
SOY="[Alimentar SRC]"

# Definir constantes que definen los tipos de errores
EXITO=0
E_FATAL=99

# Definir constantes
BD="secretaria_de_salud"
BD_USUARIO="salud"

# Cambiar al directorio donde se encuentra este bash script
cd "$(dirname "$0")"

# Insertar
echo "$SOY Insertando SRC..."
psql -f src-itrf92-inegi.sql $BD
if [ "$?" -ne $EXITO ]; then
    exit $E_FATAL
fi

echo "$SOY Script terminado."
exit $EXITO
