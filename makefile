all: main libs

main:
	gcc -rdynamic -ldl -o main main.c

libs: goodlib badlib

goodlib:
	gcc -Wall -fPIC -c printer.c
	gcc -shared -Wl,-soname,libprtr.so.1 -o libprtr.so.1.0 printer.o

badlib:
	gcc -Wall -fPIC -c bad_printer.c
	gcc -shared -Wl,-soname,libbadprtr.so.1 -o libbadprtr.so.1.0 bad_printer.o

clean:
	rm *.o
	rm lib*
