VERSION=$(shell lua -e "s=_VERSION;t=s:gsub('Lua ','');print(t)" )

all: ver test

ver:
	echo Lua version is $(VERSION).

test:
	lua array.lua
