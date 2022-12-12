# Resumen de Actividad: #8
Este codigo se encarga de eliminar los saltos de linea al momento de imprimir los elementos recibidos. Diciendoce tecnicamente como reemplazo de `echo -n`

## Cambios Requeridos en el Codigo:
No fue necesario ningun cambio, la actividad cuenta con tres versiones funcionales del codigo. En este caso utilizaremos la mas sencilla

>```shell
>echon()
>{
>    echo "$*" | tr -d '%'
>}
>
>echon $*
>```