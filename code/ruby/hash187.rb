require "./util.rb"

#= hash-literal-init-with-even-sized-array
#== version: 1.8.7
#== ja: ハッシュを偶数要素の配列を使って初期化する(奇数だとコンパイルエラー)
h = { "a",1, "b",2, "c","hi" }
assert( h["a"] == 1 )
assert( h["b"] == 2 )
assert( h["c"] == "hi" )

assert( `ruby -e 'h={1,2,3}' 2>&1` == "-e:1: odd number list for Hash\n" )




