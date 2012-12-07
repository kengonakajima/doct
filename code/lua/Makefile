VERSION=$(shell lua -e "s=_VERSION;t=s:gsub('Lua ','');print(t)" )
VERSIONFILE=./VERSION



all: ver test

ver:
	echo Lua version is $(VERSION).
	echo $(VERSION) >> $(VERSIONFILE)

test:
	lua array.lua
