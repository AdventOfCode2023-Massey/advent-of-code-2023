#!/bin/sh
# Copyright © 2016 Bart Massey

# Set up a template directory for a new day.

if [ $# -ne 0 ] && [ $# -ne 1 ]
then
    echo "mkday: usage: mkday <day>" >&2
    exit 1
fi

if ! [ -f mkday.sh ]
then
    echo "mkday: not run from base directory" >&2
    exit 1
fi

YEARFILE=".year"
if [ -s $YEARFILE ]
then
    YEAR=`cat $YEARFILE`
else
    YEAR=`date +'%Y'`
    echo $YEAR > $YEARFILE
    echo "mkday: set year to $YEAR" >&2
fi

DAYFILE=".day"
if [ $# -gt 0 ]
then
    DAYSTR="$1"
else
    if [ -s $DAYFILE ]
    then
        DAYSTR=`expr "\`cat $DAYFILE\`" + 1`
    else
        DAYSTR=1
        while true
        do
            if [ $DAYSTR -ge 26 ]
            then
                echo "mkday: no available days" >&2
                exit 1
            fi
            DAYZ=""
            if [ $DAYSTR -lt 10 ]
            then
                DAYZ="0"
            fi
            if [ ! -d "day${DAYZ}${DAYSTR}" ] 
            then
                break
            fi
            DAYSTR=`expr $DAYSTR + 1`
        done
        [ $? -ne 0 ] && exit 1
    fi
fi
echo "$DAYSTR" >$DAYFILE

case "$DAYSTR" in
    [1-9]) DAYZ="0$DAYSTR" ;;
    [1-3][0-9]) DAYZ="$DAYSTR" ;;
    *) echo "mkday: bad day $DAYSTR" >&2; exit 1 ;;
esac
DAY=day$DAYZ

mkdir $DAY
if [ $? -ne 0 ]
then
    echo "mkday: directory cannot be created, giving up" >&2
    exit 1
fi

cd template
for f in *
do
    sed -e "s=<day>=${DAYSTR}=g" -e "s=<year>=${YEAR}=g" -e "s=<0day>=${DAYZ}=" <$f >../$DAY/$f
done

cd ../$DAY
mv gitignore .gitignore
git init
git add *
git add -f .gitignore
git commit -m "advent of code $YEAR day $DAYZ"
echo $DAYSTR >.day
mkgit -X github-AdventOfCode${YEAR}-Massey

cd ..
git submodule add ssh://git@github.com/AdventOfCode${YEAR}-Massey/${DAY}.git
