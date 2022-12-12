# Resumen de Actividad: #6
En este codigo se valida que la entrada de datos sea un numero punto flotante o decimal mediante el uso de comparadores logico-aritmeticos

## Cambios Requeridos en el Codigo:

Es necesario el uso del codigo #5 que nos indica si el valor es un numero entero
>```shell
>#!/bin/bash
># validint--Validates integer input, allowing negative integers too
>validint()
>{
>    # Validate first field and test that value against min value $2 and/or
>    # max value $3 if they are supplied. If the value isn't within range
>    # or it's not composed of just digits, fail.
>  number="$1";      min="$2";      max="$3"
>  if [ -z $number ] ; then
>    echo "You didn't enter anything. Please enter a number." >&2 ; return 1
>  fi
>  # Is the first character a '-' sign?
>  if [ "${number%${number#?}}" = "-" ] ; then
>    testvalue="${number#?}"
>  else
>    testvalue="$number"
>  fi
>  # Create a version of the number that has no digits for testing.
>  nodigits="$(echo $testvalue | sed 's/[[:digit:]]//g')"
>  # Check for nondigit characters.
>  if [ ! -z $nodigits ] ; then
>    echo "Invalid number format! Only digits, no commas, spaces, etc" >&2
>    return 1
>  fi
>  
>  if [ ! -z $min ] ; then
>  # Is the input less than the minimum value?
>    if [ "$number" -lt "$min" ] ; then
>     #echo "$number is too small: smallest acceptable value is $min" >&2
>      return 1
>    fi
>  fi
>  if [ ! -z $max ] ; then
>  # Is the input greater than the maximum value?
>    if [ "$number" -gt "$max" ] ; then
>      #echo "Your value is too big: largest acceptable value is $max" >&2
>      return 1
>    fi
>  fi
>  return 0
>}
>```

El unico cambio necesario en el codigo #6 es el agregar una condicion para indicar si el valor ingresado es aceptado

>```shell
>#!/bin/bash
>
># validfloat--Tests whether a number is a valid floating-point value.
># Note that this script cannot accept scientific (1.304e5) notation.
># To test whether an entered value is a valid floating-point number,
># we need to split the value into two parts: the integer portion
># and the fractional portion. We test the first part to see whether
># it's a valid integer, and then we test whether the second part is a
># valid >=0 integer. So -30.5 evaluates as valid, but -30.-8 doesn't.
># To include another shell script as part of this one, use the "." source
># notation. Easy enough.
>#aqui se llama al codigo 5
>. receta5.sh
>validfloat(){
>    fvalue="$1"
># Check whether the input number has a decimal point.
>    if [ ! -z $(echo $fvalue | sed 's/[^.]//g') ] ; then
># Extract the part before the decimal point.
>        decimalPart="$(echo $fvalue | cut -d. -f1)"
># Extract the digits after the decimal point.
>        fractionalPart="${fvalue#*\.}"
># Start by testing the decimal part, which is everything
># to the left of the decimal point
>        if [ ! -z $decimalPart ] ; then
> # "!" reverses test logic, so the following is
> # "if NOT a valid integer"
>            if ! validint "$decimalPart" "" "" ; then
>                return 1
>            fi
>        fi
>
># Now let's test the fractional value.
># To start, you can't have a negative sign after the decimal point
># like 33.-11, so let's test for the '-' sign in the decimal.
>        if [ "${fractionalPart%${fractionalPart#?}}" = "-" ] ; then
>            echo "Invalid floating-point number: '-' not allowed \
>            after decimal point." >&2
>        return 1
>        fi
>        if [ "$fractionalPart" != "" ] ; then
> # If the fractional part is NOT a valid integer...
>            if ! validint "$fractionalPart" "0" "" ; then
>                return 1
>            fi
>        fi
>    else
> # If the entire value is just "-", that's not good either.
>        if [ "$fvalue" = "-" ] ; then
>            echo "Invalid floating-point format." >&2
>            return 1
>        fi
># Finally, check that the remaining digits are actually
># valid as integers.
>        if ! validint "$fvalue" "" "" ; then
>            return 1
>        fi
>    fi
>
>    return 0
>}
>#aqui agregamos la condicion para decirle al usuario si el numero es valido
>if validfloat $1 ; then
>  echo "$1 is a valid floating-point value"
>fi
>exit 0
>```