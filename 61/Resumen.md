# Resumen de Actividad: #61
Este codigo permite visualizar detalles de la direccion dwe cartera de bitcoin

## Cambios Requeridos en el Codigo:
N/A

Este codigo se encuentra obsoleto debido a las "optimizaciones" de las paginas web de blockchain al no manejar id's ni direcciones
>```shell
>#!/bin/bash
># getbtcaddr--Given a Bitcoin address, reports useful information
>if [ $# -ne 1 ]; then
>    echo "Usage: $0 <address>"
>    exit 1
>fi
>base_url="https://blockchain.info/q/"
>balance=$(curl -s $base_url"addressbalance/"$1)
>recv=$(curl -s $base_url"getreceivedbyaddress/"$1)
>sent=$(curl -s $base_url"getsentbyaddress/"$1)
>first_made=$(curl -s $base_url"addressfirstseen/"$1)
>echo "Details for address $1"
>echo -e "\tFirst seen: "$(date -d @$first_made)
>echo -e "\tCurrent balance: "$balance
>echo -e "\tSatoshis sent: "$sent
>echo -e "\tSatoshis recv: "$recv
>```