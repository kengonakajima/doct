# encoding: utf-8
require("./util.rb")

#= string-equal
assert( "abcd" == "abcd" )
assert( "abcd" === "abcd" )

#= string-literal-compare-single-and-double-quotes
#== ja: シングルクォート内部ではエスケープシーケンスがほぼ無効になる
assert( "a\\na" == 'a\na' )

#= string-compare-percent-q-strings
#== ja: %q文字列内部ではエスケープシーケンスがほぼ無効になる
assert( %Q(st\\nring) == %q(st\nring) )


#= string-here-document-various
#== ja: ヒアドキュメントいろいろ
a = <<End
hello
End
assert( a == "hello\n" )
b = <<End
#{a} world
End
assert( b == "hello\n world\n")
c = <<"End" 
str\ning
End
assert( c == "str\ning\n" )
d = <<'End'
str\ning
End
assert( d == "str\\ning\n" )
e = <<EEEEEEEEND
any word
EEEEEEEEND
assert( e == "any word\n" )
f = <<-EOS
indented
 EOS
assert( f == "indented\n")


#= string-upcase
a = "hello"
b = a.upcase
assert( b == "HELLO" )
assert( a == "hello" )
a.upcase!
assert( a == "HELLO" )

#= string-downcase
a = "Hello"
b = a.downcase
assert( b == "hello" )
assert( a == "Hello" )
a.downcase!
assert( a == "hello" )


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

#= string-literal-template
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

#= string-split-with-limit
#== ja: splitの第二引数で最大分割数を指定可能
ary = "ab,cde,fg".split(",",2)
assert(ary.size==2)
assert(ary[0]=="ab")
assert(ary[1]=="cde,fg")

#= string-cannot-append-fixnum
#== ja: 整数を文字列にそのまま連結することはできない
#== en: Fixnum can't be appended after a string
begin
  "abc" + 2
rescue
  assert( $!.class == TypeError )
end

# __STOP_DOCT_PARSE__
# memo:
# 参考: http://ref.xaio.jp/ruby/classes/string/split
# ruby-langのはまだ.
