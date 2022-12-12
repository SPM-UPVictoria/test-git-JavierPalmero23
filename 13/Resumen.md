# Resumen de Actividad: #13
Este codigo se puede describir como la estructura del juego de adivina el numero. Donde el numero a adivinar es totalmente aleatorio.

## Cambios Requeridos en el Codigo:
El codigo original cuenta con varios errorres de redaccion como lo es el no cerrar parentesis o el llamar a variables inexistentes

>```shell
>#!/bin/bash
># hilow--A simple number-guessing game
>biggest=100 # Maximum number possible
>guess=0 # Guessed by player
>guesses=0 # Number of guesses made
>number=$(($$%$biggest)) # Random number, between 1 and $biggest
>echo "Guess a number between 1 and $biggest"
>
>while [ "$guess" -ne $number ] ; do
>    /bin/echo -n "Guess? " ; read guess #cambio en 'read answer' por 'read guess' para evitar un bucle while infinito
>    if [ "$guess" -lt $number ] ; then
>        echo "... bigger!"
>    elif [ "$guess" -gt $number ] ; then
>        echo "... smaller!"
>    fi
>    guesses=$(( $guesses + 1 ))
>done
>
>echo "Right!! Guessed $number in $guesses guesses."
>
>exit 0
>```