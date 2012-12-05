RUBYSRCS=code/ruby/*.rb

build: version test
	ruby gen.rb db.json

version:
	ruby --version
	node --version
	lua -v

test: rubytest jstest luatest

rubytest:
	ruby code/ruby/array.rb 
	ruby code/ruby/hash.rb 
	ruby code/ruby/string.rb

jstest:
	node code/js/array.js
	node code/js/string.js
luatest:
	lua code/lua/array.lua

