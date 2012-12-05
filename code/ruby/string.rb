# encoding: utf-8
require("./util.rb")

#= string-equal
assert( "abcd" == "abcd" )
assert( "abcd" === "abcd" )

#= string-not-equal
assert( "abcd" != "abce" )

#= string-match
assert( ( "abcdef" =~ /de/ ) == 3 )
assert( "abcd" !~ /xy/ )

#= string-match-multiline
assert( "\n" =~ /^$/ )
assert( "" =~ /^$/ )
assert( "a\n" !~ /^$/ )
assert( "a\n\n" =~ /^$/ )


#= string-compare
assert( ( "aaa" <=> "aaa" ) == 0 )
assert( ( "aaa" <=> "bbb" ) == -1 )
assert( ( "aaa" <=> "abc" ) == -1 )
assert( ( "bbb" <=> "aaa" ) == 1 )
assert( ( "AAA" <=> "aaa" ) == -1 )
assert( ( "aaa" <=> "aaaa" ) == -1 )
assert( ( "あ" <=> "い" ) == -1 )

#= string-append-lit
assert( ( "ab" "cd" ) == "abcd" )

#= string-template
x = 123
assert( "hello#{x}" == "hello123" )





