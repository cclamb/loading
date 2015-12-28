#!/bin/bash

gcc -Wall -fPIC -c bad_printer.c
gcc -Wall -fPIC -c printer.c
gcc -shared -Wl,-soname,libbadprtr.so.1 -o libbadprtr.so.1.0 bad_printer.o
gcc -shared -Wl,-soname,libprtr.so.1 -o libprtr.so.1.0 printer.o
gcc -rdynamic -ldl -o main main.c

