# Resumen de Actividad: #19
El primer codigo esta pensado para enlistar los archivos del sistema para despues permitir al segundo codigo buscar algun elemento especifico con un caracter o frase.

Es importante resaltar que este codigo se debe ejecuar con permisos de super usuario o root

## Cambios Requeridos en el Codigo:
N/A

Este es el primer codigo que verifica los permisos de ejecucion y crea un archivo para su posterior uso
>```shell
>#!/bin/bash
># mklocatedb--Builds the locate database using find. User must be root
># to run this script.
>locatedb="/var/locate.db"
>if [ "$(whoami)" != "root" ] ; then
>    echo "Must be root to run this command." >&2
>    exit 1
>fi
>find / -print > $locatedb
>exit 0
>
>```

Este es el segundo codigo encargado de buscar un elemento en el registro anteriormente creado
>```shell
>#!/bin/sh
># locate--Searches the locate database for the specified pattern
>locatedb="/var/locate.db"
>exec grep -i "$@" $locatedb
>```