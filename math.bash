#!/bin/bash

# File: math.bash
# Author: Alejandro Alvarado
# Brief: Calculator Script

# Details:
# Pass in two values on the command line and 
# perform the specified operation: add, subtract,
# multiply, or divide.

OPTIONS="asmd"
DIVIDE_ERROR="DivideByZeroError"
COMMAND=''  # which math operation are we performing
FIRST=0
SECOND=0
RESULT=0

function show_help()
{
    printf "\tUsage $0 -[%s] val1 val2\n" $OPTIONS
}

function add()
{
    echo $(($1 + $2))
}

function subtract()
{
    echo $(($1 - $2))
}

function multiply()
{
    echo $(($1 * $2))
}

function divide()
{
    if ((0 == $2)); then
        echo "$DIVIDE_ERROR"
        exit 1  # tell the caller an error occurred
    fi
    
    echo "scale=2; $1 / $2" | bc  # similar to returning the result
}

while getopts $OPTIONS OPT 
do
    case ${OPT} in
        a|s|m|d)
            COMMAND=$OPT
            ;;
        *)
            echo "Invalid option"
            show_help
            exit 1
            ;;
    esac
done
shift $((OPTIND - 1))
FIRST=$1
SECOND=$2

case $COMMAND in 
    a)
        RESULT=$(add FIRST SECOND)
        ;;
    s)
        RESULT=$(subtract FIRST SECOND)
        ;;
    m)
        RESULT=$(multiply FIRST SECOND)
        ;;
    d)
        RESULT=$(divide $FIRST $SECOND)  # without $, the result will be incorrect
        if [ "$RESULT" == "$DIVIDE_ERROR" ]; then
            exit 1
        fi
        ;;
esac

echo $RESULT

