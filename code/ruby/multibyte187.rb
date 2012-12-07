require("./util.rb")

#= string-utf8-split-multibyte-with-kcode
#== version: 1.8.7
#== ja: マルチバイト文字を文字単位に分割する
$KCODE='u'
s = "よい天気"
ary = s.split("")
assert( ary[0] == "よ" )
assert( ary[1] == "い" )
assert( ary[2] == "天" )
assert( ary[3] == "気" )
