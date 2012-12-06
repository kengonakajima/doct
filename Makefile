RUBYSRCS=code/ruby/*.rb

build: version test
	ruby gen.rb db.json

version:
	ruby --version
	node --version
	lua -v

test: rubytest jstest luatest

rubytest:
	make -C code/ruby

jstest:
	make -C code/js

luatest:
	make -C code/lua


