# Resumen de Actividad: #22
Este codigo permite al usuario la creacion y el establecimiento de notas como "recordatorios" para facilitar tareas y registros.


## Cambios Requeridos en el Codigo:
N/A

En el primer codigo se crea un archivo donde se registraran las notas, o en dado caso de que este ya exista, escribe sobre este
>```shell
>#!/bin/bash
># remember--An easy command line-based reminder pad
>rememberfile="$HOME/.remember"
>if [ $# -eq 0 ] ; then
># Prompt the user for input and append whatever they write to
># the rememberfile.
>    echo "Enter note, end with ^D: "
>    cat - >> $rememberfile
>else
># Append any arguments passed to the script on to the .remember file.
>    echo "$@" >> $rememberfile
>fi
>exit 0
>```

Con el segundo codigo se nos permite el ver las notas anteriormente escritas. Pudiendo tambien el buscar notas por elementos especificos.
>```shell
>#!/bin/bash
># remindme--Searches a data file for matching lines or, if no
># argument is specified, shows the entire contents of the data file
>rememberfile="$HOME/.remember"
>if [ ! -f $rememberfile ] ; then
>    echo "$0: You don't seem to have a .remember file. " >&2
>    echo "To remedy this, please use 'remember' to add reminders" >&2
>    exit 1
>fi
>if [ $# -eq 0 ] ; then
># Display the whole rememberfile when not given any search criteria.
>    more $rememberfile
>else
># Otherwise, search through the file for the given terms, and display
># the results neatly.
>    grep -i -- "$@" $rememberfile | ${PAGER:-more}
>fi
>exit 0
>```