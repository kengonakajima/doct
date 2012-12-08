# encoding: utf-8
require("./util.rb")

#= string-utf8-split-multibyte-with-encoding
#== version: 1.9.3
#== ja: ソース冒頭にencodingを指定してマルチバイト文字を文字単位に分割する

# encoding: utf-8
s = "よい天気"
ary = s.split("")
assert( ary[0] == "よ" )
assert( ary[1] == "い" )
assert( ary[2] == "天" )
assert( ary[3] == "気" )

#= hash-literal-init-with-colon
#== version: 1.9.3
#== ja: ハッシュをコロン記号を使って初期化する
h = { a:1, b:2, c:"hi" }
assert( h[:a] == 1 )
assert( h[:b] == 2 )
assert( h[:c] == "hi" )
assert( h["a"] == nil )


#= array-convert-to-string-1.9.3
a = [3,5,1]
p a.to_s
assert( a.to_s == "[3, 5, 1]" )


#= array-keep-conditional
a = [3,2,5,4]
p a.keep_if do |x| (x%2) == 0 end 
assert( a.keep_if do |x| (x%2) == 0 end == [2,4] )
