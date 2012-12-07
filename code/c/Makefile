VERSION=$(shell ./verprint)
CC=gcc

all: ver test

verprint: verprint.c
	gcc verprint.c -o verprint

ver: verprint
	echo $(CC) version is `./verprint`.
	gcc -v

test:
	$(CC) printf.c -o test_printf
	./test_printf
