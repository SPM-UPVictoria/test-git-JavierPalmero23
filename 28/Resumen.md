# Resumen de Actividad: #28
Este codigo permite el convertir lineas individuales de codigo muy largas e incomodas de leer en varias lineas faciles y comodas de leer 

## Cambios Requeridos en el Codigo:
N/A

El codigo parte las lineas de codigo en la cantidad de caracteres establecido por linea, en este caso se trabaja con 72 espacios de caracteres.
>```shell
>#!/bin/bash
># toolong--Feeds the fmt command only those lines in the input stream
># that are longer than the specified length
>width=72
>if [ ! -r "$1" ] ; then
>    echo "Cannot read file $1" >&2
>    echo "Usage: $0 filename" >&2
>    exit 1
>fi
>while read input
>do
>    if [ ${#input} -gt $width ] ; then
>        echo "$input" | fmt
>    else
>        echo "$input"
>    fi
>done < $1
>exit 0
>```