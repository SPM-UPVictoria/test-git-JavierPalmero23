# Resumen de Actividad: #31
Este codigo facilita el acceso del protocolo SFTP como si fuera el protocolo FTP (no sabria describir ninguno de los dos, pero ftp se ve mas user-friendly)

## Cambios Requeridos en el Codigo:
N/A

Solo sera necesario introducir la cuenta y la direccion de acceso
>```shell
>#!/bin/bash
># mysftp--Makes sftp start up more like ftp
>/bin/echo -n "User account: "
>read account
>if [ -z $account ] ; then
>    exit 0; # Changed their mind, presumably
>fi
>if [ -z "$1" ] ; then
>    /bin/echo -n "Remote host: "
>    read host
>    if [ -z $host ] ; then
>        exit 0
>    fi
>else
>    host=$1
>fi
># End by switching to sftp. The -C flag enables compression here.
>exec sftp -C $account@$host
>```