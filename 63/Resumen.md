# Resumen de Actividad: #63
Que hace este codigo? No tengo la mas minima idea.

Mentira, este codigo muestra el entorno de desarrollo en formato HTML que puede parecer informacion sin sentido, pero es informacion muy detallada de tu entorno

## Cambios Requeridos en el Codigo:
N/A

>```shell
>#!/bin/bash
># showCGIenv--Displays the CGI runtime environment, as given to any
># CGI script on this system
>echo "Content-type: text/html"
>echo ""
># Now the real information...
>echo "<html><body bgcolor=\"white\"><h2>CGI Runtime Environment</h2>"
>echo "<pre>"
>env || printenv
>echo "</pre>"
>echo "<h3>Input stream is:</h3>"
>echo "<pre>"
>cat -
>echo "(end of input stream)</pre></body></html>"
>exit 0
>```