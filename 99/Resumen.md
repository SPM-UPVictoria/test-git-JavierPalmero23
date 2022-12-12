# Resumen de Actividad: #99
Este codigo nos permite saber que dia de la semana fue en una fecha dada.

se podria ver como un calendario?

## Cambios Requeridos en el Codigo:
N/A

Requiere paqueteria de ncal

>```shell
>#!/bin/bash
># dayinpast--Given a date, reports what day of the week it was
>if [ $# -ne 3 ] ; then
>    echo "Usage: $(basename $0) mon day year" >&2
>    echo " with just numerical values (ex: 7 7 1776)" >&2
>    exit 1
>fi
>date --version > /dev/null 2>&1 # Discard error, if any.
>baddate="$?" # Just look at return code.
>if [ ! $baddate ] ; then
>    date -d $1/$2/$3 +"That was a %A."
>else
>    if [ $2 -lt 10 ] ; then
>        pattern=" $2[^0-9]"
>    else
>        pattern="$2[^0-9]"
>    fi
>    dayofweek="$(Yncal $1 $3 | grep "$pattern" | cut -c1-2)"
>    case $dayofweek in
>        Su ) echo "That was a Sunday."; ;;
>        Mo ) echo "That was a Monday."; ;;
>        Tu ) echo "That was a Tuesday."; ;;
>        We ) echo "That was a Wednesday."; ;;
>        Th ) echo "That was a Thursday."; ;;
>        Fr ) echo "That was a Friday."; ;;
>        Sa ) echo "That was a Saturday."; ;;
>    esac
>fi
>exit 0
>```