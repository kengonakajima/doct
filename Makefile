RUBYSRCS=code/ruby/*.rb

build: version test
	ruby gen.rb db.json

version:
	ruby --version
	node --version
	lua -v

test:
# ruby test
	ruby code/ruby/array.rb 
	ruby code/ruby/hash.rb 
	ruby code/ruby/string.rb
# js test
	node code/js/array.js
	node code/js/string.js
# lua test
	lua code/lua/array.lua

