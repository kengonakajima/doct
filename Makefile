RUBYSRCS=code/ruby/*.rb

build: test
	ruby --version
	node --version
	lua -v
	ruby gen.rb db.json

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

