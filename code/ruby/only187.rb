require "../../utils/doctutil.rb"

#= hash-literal-init-with-even-sized-array
#== version: 1.8.7
#== ja: ハッシュを偶数要素の配列を使って初期化する(奇数だとコンパイルエラー)
h = { "a",1, "b",2, "c","hi" }
assert( h["a"] == 1 )
assert( h["b"] == 2 )
assert( h["c"] == "hi" )

assert( `ruby -e 'h={1,2,3}' 2>&1` == "-e:1: odd number list for Hash\n" )




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

#= array-convert-to-string-187
#== version: 1.8.7

a = [3,5,1]
assert( a.to_s == "351" )


#= control-structure-retry
#== version: 1.8.7

b = []
for i in (1..3) do
    b.push(i)
    break if b == [1,2,1,2,1,2,1,2,1,2]
    retry if i == 2  # ja: 永久ループになる en: repeat infinitely
end
