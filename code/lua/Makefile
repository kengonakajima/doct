VERSION=$(shell lua -e 'print(_VERSION)')
VERSIONFILE=./VERSION

all: ver test

ver:
	echo Lua version is $(VERSION).
	echo $(VERSION) > $(VERSIONFILE)

test:
	lua array.lua
