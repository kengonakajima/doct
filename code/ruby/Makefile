RUBY=ruby
VERSION=$(shell ruby -e 'print RUBY_VERSION' )
VERSIONFILE=./VERSION


test: ver test_$(VERSION) test_common

ver:
	echo Ruby version is $(VERSION).
	echo $(VERSION) >> $(VERSIONFILE)

test_common:
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


test_1.8.7:
	ruby hash187.rb
	ruby multibyte187.rb

test_1.9.3:
	ruby hash193.rb
	ruby multibyte193.rb

