#!/bin/bash
echon()
{
    echo "$*" | tr -d '%'
}

echon $*
