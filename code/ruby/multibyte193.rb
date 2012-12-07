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

