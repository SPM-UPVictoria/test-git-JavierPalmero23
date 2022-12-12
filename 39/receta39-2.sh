#!/bin/bash
# slocate--Tries to search the user's own secure locatedb database for the
# specified pattern. If the pattern doesn't match, it means no database
# exists, so it outputs a warning and creates one. If personal .slocatedb
# is empty, it uses system database instead.
locatedb="/var/locate.db"
slocatedb="$HOME/.slocatedb"
if [ ! -e $slocatedb -o "$1" = "--explain" ] ; then
    cat << "EOF" >&2
Warning: Secure locate keeps a private database for each user, and your
database hasn't yet been created. Until it is (probably late tonight),
I'll just use the public locate database, which will show you all
publicly accessible matches rather than those explicitly available to
account ${USER:-$LOGNAME}.
EOF
    if [ "$1" = "--explain" ] ; then
        exit 0
    fi
# Before we go, create a .slocatedb file so that cron will fill it
# the next time the mkslocatedb script is run.
    touch $slocatedb # mkslocatedb will build it next time through.
    chmod 600 $slocatedb # Start on the right foot with permissions.
elif [ -s $slocatedb ] ; then
    locatedb=$slocatedb
else
    echo "Warning: using public database. Use \"$0 --explain\" for details." >&2
fi
if [ -z "$1" ] ; then
    echo "Usage: $0 pattern" >&2
    exit 1
fi
exec grep -i "$1" $locatedb