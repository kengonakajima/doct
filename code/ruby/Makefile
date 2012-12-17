VERSION=$(shell ruby -e 'print RUBY_VERSION' )

test: ver test_$(VERSION) test_common bench_common

ver:
	echo Ruby version is $(VERSION).

test_common:
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
	ruby framework.rb bench-simple-loop.rb

test_1.8.7:
	ruby only187.rb

test_1.9.3:
	ruby only193.rb


