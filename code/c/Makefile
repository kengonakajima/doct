VERSION=$(shell ./verprint)
CC=gcc

all: ver test

verprint: verprint.c
	gcc verprint.c -o verprint

ver: verprint
	echo $(CC) version is `./verprint`.
	gcc -v

test:
	$(CC) stdio.c -o test_stdio
	./test_stdio
	$(CC) varg.c -o test_varg
	./test_varg
