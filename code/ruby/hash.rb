# encoding: utf-8
require "./util.rb"

#= hash-literal-init
x = { 1=>2, 2=>4, 3=>6 }
assert( x[1] == 2 ) 
assert( x[2] == 4 )

#= hash-convert-to-json
require "rubygems"
require "json"
x = { 1=>2, "hello"=>"world" }
json = x.to_json()
assert( (json == "{\"hello\":\"world\",\"1\":2}") | (json == "{\"1\":2,\"hello\":\"world\"}" ) )
y = { "a" => { "b" => { "c" => 1 }}}
assert( y.to_json() == "{\"a\":{\"b\":{\"c\":1}}}" )


#= hash-keys
e = { 1=>2, 2=>4, 3=>6 }
assert( e.keys.join(":") == "1:2:3" )

#= hash-values
e = { 1=>2, 2=>4, 3=>6 }
assert( e.values.join(":") == "2:4:6" )


#= hash-length
e = { 1=>2, 2=>4, 3=>6 }
assert( e.length == 3 )

#= hash-has_key
e = { 1=>2, 2=>4, 3=>6 }
assert( e.has_key?(1) )

#= hash-has_value
e = { 1=>2, 2=>4, 3=>6 }
assert( e.has_value?(4) )

#= hash-values_at
e = { 1=>2, 2=>4, 3=>6 }
assert( e.values_at(2,3)  == [4,6] )

