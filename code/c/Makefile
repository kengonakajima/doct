VERSION=$(shell ./verprint)
VERSIONFILE=./VERSION
CC=gcc

all: ver test

verprint: verprint.c
	gcc verprint.c -o verprint

ver: verprint
	./verprint > $(VERSIONFILE)
	echo $(CC) version is `cat $(VERSIONFILE)`.

test:
	$(CC) printf.c -o test_printf
	./test_printf
