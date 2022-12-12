# Resumen de Actividad:
Este codigo permite ver el porcente de espacio en memoria disponible para su uso, todo esto sin informacion "abrumadora" para el usuario

## Cambios Requeridos en el Codigo:
N/A

El codigo modifica la salida de la herramienta `-df`
>```shell
>#!/bin/bash
># diskspace--Summarizes available disk space and presents it in a logical
># and readable fashion
>tempfile="/tmp/available.$$"
>trap "rm -f $tempfile" EXIT
>cat << 'EOF' > $tempfile
>    { sum += $4 }
>END { mb = sum / 1024
>        gb = mb / 1024 
>        printf "%.0f MB (%.2fGB) of available disk space\n", mb, gb
>    }
>EOF
>df -k | awk -f $tempfile
>exit 0
>```