# Resumen de Actividad: #58
Este codigo permitever el clima dada una direccionde codigo postal
Sin embargo, tras discutirlo, parece que el API empleado tiene problmemas actualmente

## Cambios Requeridos en el Codigo:
N/A
>```shell
>#!/bin/bash
># weather--Uses the Wunderground API to get the weather for a given ZIP code
>if [ $# -ne 1 ]; then
>    echo "Usage: $0 <zipcode>"
>    exit 1
>fi
>apikey="b03fdsaf3b2e7cd23" # Not a real API key--you need your own.
>weather=`curl -s \
>    "https://api.wunderground.com/api/$apikey/conditions/q/$1.xml"`
>state=`xmllint --xpath \
>    //response/current_observation/display_location/full/text\(\) \
>    <(echo $weather)`
>zip=`xmllint --xpath \
>    //response/current_observation/display_location/zip/text\(\) \
>    <(echo $weather)`
>current=`xmllint --xpath \
>    //response/current_observation/temp_f/text\(\) \
>    <(echo $weather)`
>condition=`xmllint --xpath \
>    //response/current_observation/weather/text\(\) \
>    <(echo $weather)`
>echo $state" ("$zip") : Current temp "$current"F and "$condition" outside."
>exit 0
>```