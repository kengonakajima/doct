VERSION=$(shell ruby -e 'print RUBY_VERSION' )
OSNAME=$(shell uname )

test: ver test_$(VERSION) test_common bench_common bench_$(OSNAME)

ver:
	echo Ruby version is $(VERSION).

test_common:
	ruby method.rb
	ruby control.rb
	ruby pp.rb
	ruby io.rb
	ruby tempfile.rb
	ruby dir.rb
	ruby file.rb
	ruby enumerable.rb
	ruby operators.rb
	ruby range.rb
	ruby regex.rb
	ruby literal.rb
	ruby constants.rb
	ruby variables.rb
	ruby lex.rb
	ruby scope.rb
	ruby array.rb 
	ruby hash.rb 
	ruby string.rb

bench_common:
	ruby framework.rb benchmark bench-simple-loop.rb

bench_Darwin:
	ruby framework.rb execresult get-cpuname-osx.rb
	ruby framework.rb execresult get-os-version-number-osx.rb

bench_Linux:

test_1.8.7:
	ruby only187.rb

test_1.9.3:
	ruby only193.rb


