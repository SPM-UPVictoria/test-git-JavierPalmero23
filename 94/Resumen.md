# Resumen de Actividad: #94
ESte codigo permite ver informacion y caracteristicas de cualquier imagen almacenada

## Cambios Requeridos en el Codigo:
N/A

ES necesario especificar la ruta de la imagen
>```shell
>#!/bin/bash
># imagesize--Displays image file information and dimensions using the
># identify utility from ImageMagick
>for name
>do
>    identify -format "%f: %G with %k colors.\n" "$name"
>done
>exit 0
>```