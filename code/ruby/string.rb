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

#= string-split-with-string
ary = "ab cd ef".split(" ")
assert( ary[0] == "ab" )
assert( ary[1] == "cd" )
assert( ary[2] == "ef" )

#= string-split-with-regex
ary = "ab cd.ef:gh".split(/[ .:]/)
assert( ary[0] == "ab" );
assert( ary[1] == "cd" );
assert( ary[2] == "ef" );

#= string-cannot-append-fixnum
#== ja: 整数を文字列にそのまま連結することはできない
#== en: Fixnum can't be appended after a string
begin
  "abc" + 2
rescue
  assert( $!.class == TypeError )
end
