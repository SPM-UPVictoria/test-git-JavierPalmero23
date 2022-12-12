# Resumen de Actividad: #56
Este codigo permite el conocer una ubicacion en base a su codigo postal, unicamente funciona para direcciones en Estados Unidos
## Cambios Requeridos en el Codigo:
N/A

La pagina de direcciones sigue en linea
>```shell
>#!/bin/bash
># zipcode--Given a ZIP code, identifies the city and state. Use >city-data.com,
># which has every ZIP code configured as its own web page.
>baseURL="http://www.city-data.com/zips"
>/bin/echo -n "ZIP code $1 is in "
>curl -s -dump "$baseURL/$1.html" | \
>    grep -i '<title>' | \
>    cut -d\( -f2 | cut -d\) -f1
>exit 0
>```