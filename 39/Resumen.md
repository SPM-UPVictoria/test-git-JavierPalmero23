# Resumen de Actividad: #39
Estos dos codigos permiten la creacion de una base de datos con direcciones de documentos para su posterior busqueda

## Cambios Requeridos en el Codigo:
N/A

Este codigo permite la creacion de direcciones de documentos 
>```shell
>#!/bin/bash
># mkslocatedb--Builds the central, public locate database as user nobody
># and simultaneously steps through each user's home directory to find
># those that contain a .slocatedb file. If found, an additional, private
># version of the locate database will be created for that user.
>locatedb="/var/locate.db"
>slocatedb=".slocatedb"
>if [ "$(id -nu)" != "root" ] ; then
>    echo "$0: Error: You must be root to run this command." >&2
>    exit 1
>fi
>if [ "$(grep '^nobody:' /etc/passwd)" = "" ] ; then
>    echo "$0: Error: you must have an account for user 'nobody'" >&2
>    echo "to create the default slocate database." >&2
>    exit 1
>fi
>cd / # Sidestep post-su pwd permission problems.
># First create or update the public database.
>su -fm nobody -c "find / -print" > $locatedb 2>/dev/null
>echo "building default slocate database (user = nobody)"
>echo ... result is $(wc -l < $locatedb) lines long.
># Now step through the user accounts on the system to see who has
># a .slocatedb file in their home directory.
>for account in $(cut -d: -f1 /etc/passwd)
>do
>    homedir="$(grep "^${account}:" /etc/passwd | cut -d: -f6)"
>    if [ "$homedir" = "/" ] ; then
>        continue # Refuse to build one for root dir.
>    elif [ -e $homedir/$slocatedb ] ; then
>        echo "building slocate database for user $account"
>        su -m $account -c "find / -print" > $homedir/$slocatedb \
>        2>/dev/null
>        chmod 600 $homedir/$slocatedb
>        chown $account $homedir/$slocatedb
>        echo ... result is $(wc -l < $homedir/$slocatedb) lines long.
>    fi
>done
>exit 0
>```

Este codigo permite la busqueda de los elementos anteriormente enlistados
>```shell
>#!/bin/bash
># slocate--Tries to search the user's own secure locatedb database for the
># specified pattern. If the pattern doesn't match, it means no database
># exists, so it outputs a warning and creates one. If personal .slocatedb
># is empty, it uses system database instead.
>locatedb="/var/locate.db"
>slocatedb="$HOME/.slocatedb"
>if [ ! -e $slocatedb -o "$1" = "--explain" ] ; then
>    cat << "EOF" >&2
>Warning: Secure locate keeps a private database for each user, and your
>database hasn't yet been created. Until it is (probably late tonight),
>I'll just use the public locate database, which will show you all
>publicly accessible matches rather than those explicitly available to
>account ${USER:-$LOGNAME}.
>EOF
>    if [ "$1" = "--explain" ] ; then
>        exit 0
>    fi
># Before we go, create a .slocatedb file so that cron will fill it
># the next time the mkslocatedb script is run.
>    touch $slocatedb # mkslocatedb will build it next time through.
>    chmod 600 $slocatedb # Start on the right foot with permissions.
>elif [ -s $slocatedb ] ; then
>    locatedb=$slocatedb
>else
>    echo "Warning: using public database. Use \"$0 --explain\" for details." >&2
>fi
>if [ -z "$1" ] ; then
>    echo "Usage: $0 pattern" >&2
>    exit 1
>fi
>exec grep -i "$1" $locatedb
>```