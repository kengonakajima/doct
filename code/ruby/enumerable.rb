# encoding: utf-8
require "./util.rb"

# todo: each_entry


#= enumerable-list-entries
a = (1..7).entries
assert( a == [1,2,3,4,5,6,7] )
b = (1..7).to_a
assert( a == b )

#= enumerable-grep-with-pattern
out = (1..100).grep(38..44)
assert( out == [38,39,40,41,42,43,44] )

out = (1..100).grep(38..44) do |x| x*2 end
assert( out == [76,78,80,82,84,86,88] )

out = IO.constants.grep( /SEEK/ )
out = out.map do |x| x.to_s end  
assert( out.sort == [ "SEEK_CUR", "SEEK_END", "SEEK_SET" ] )

