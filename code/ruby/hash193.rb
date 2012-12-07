# encoding: utf-8
require "./util.rb"

#= hash-literal-init-with-colon
#== ja: ハッシュをコロン記号を使って初期化する
h = { a:1, b:2, c:"hi" }
assert( h[:a] == 1 )
assert( h[:b] == 2 )
assert( h[:c] == "hi" )
assert( h["a"] == nil )
