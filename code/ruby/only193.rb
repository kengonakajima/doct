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


#= array-convert-to-string-193
#== version: 1.9.3
a = [3,5,1]
assert( a.to_s == "[3, 5, 1]" )


#= array-keep-conditional
#== version: 1.9.3
a = [3,2,5,4]
assert( a.keep_if do |x| (x%2) == 0 end == [2,4] )

#= array-repeated-combination
#== version: 1.9.3
a = [1, 2, 3]
assert( a.repeated_combination(1).to_a  == [[1], [2], [3]] )
assert( a.repeated_combination(2).to_a  == [[1,1],[1,2],[1,3],[2,2],[2,3],[3,3]] )
assert( a.repeated_combination(3).to_a  == [[1,1,1],[1,1,2],[1,1,3],[1,2,2],[1,2,3],[1,3,3],[2,2,2],[2,2,3],[2,3,3],[3,3,3]] )
assert( a.repeated_combination(0).to_a  == [[]] ) # one combination of length 0

#= array-repeated-permutation
#== version: 1.9.3
a = [1, 2]
assert( a.repeated_permutation(1).to_a  == [[1], [2]] )
assert( a.repeated_permutation(2).to_a  == [[1,1],[1,2],[2,1],[2,2]] )
assert( a.repeated_permutation(3).to_a  == [[1,1,1],[1,1,2],[1,2,1],[1,2,2],[2,1,1],[2,1,2],[2,2,1],[2,2,2]] )
assert( a.repeated_permutation(0).to_a  == [[]] ) # one permutation of length 0

#= array-rotate
#== version: 1.9.3
#== ja: 配列を左向きに回転させる
a = [5,1,2]
assert( a.rotate == [1,2,5] )
assert( a == [5,1,2] )
assert( a.rotate! == [1,2,5] )
assert( a == [1,2,5] )

#= array-sample-randomly
#== version: 1.9.3
a = [3,1,4]
n = a.sample
assert( n == 3 || n == 1 || n == 4 )
ary = a.sample(2)
matched = false
a.repeated_permutation(2).each do |pattern|
  matched |= (pattern == ary)
end
assert(matched)


#= array-select-destructive-193
#== version: 1.9.3
a = %w{ a b c d e f }
assert( a.select {|v| v =~ /[aeiou]/}   == ["a", "e"] )
assert( a == %w{ a b c d e f } )
assert( a.select! {|v| v =~ /[aeiou]/}   == ["a", "e"] )
assert( a == ["a","e"] )

