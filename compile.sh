#!/bin/bash

file_name=$1

mkdir -p exe

rm -rf ./vcd/$1.vcd 
rm -rf ./exe/$1

if [ -n "$1" ]
then
    echo "Compile $1 ... "
else
    echo "No input verilog file"
fi

result=`iverilog $1.v $1_tb.v -o ./exe/$1 2>&1`

if [ -n "$result" ]
then
    echo "$result"
    echo "Retry!"
else
    echo "Compile success!"
fi

./exe/$1

gtkwave ./vcd/$1.vcd

