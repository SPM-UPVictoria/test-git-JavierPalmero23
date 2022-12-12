# Resumen de Actividad: #89
Este codigo funciona como un atajo para entrar a la pagina de dropbox

## Cambios Requeridos en el Codigo:
N/A

>```shell
>#!/bin/bash
># startdropbox--Makes sure Dropbox is running on OS X
>app="Dropbox.app"
>verbose=1
>running="$(ps aux | grep -i $app | grep -v grep)"
>if [ "$1" = "-s" ] ; then # -s is for silent mode.
>    verbose=0
>fi
>if [ ! -z "$running" ] ; then
>    if [ $verbose -eq 1 ] ; then
>        echo "$app is running with PID $(echo $running | cut -d\ -f2)"
>    fi
>else
>    if [ $verbose -eq 1 ] ; then
>        echo "Launching $app"
>    fi
>    open -a $app
>fi
>exit 0
>```