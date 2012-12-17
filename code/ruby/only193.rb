# encoding: utf-8
require "../../utils/doctutil.rb"

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

#= enumerable-each_with_object
#== version: 1.9.3
evens = (1..5).each_with_object([]) do |i,a|  a.push(i*2) end
assert( evens == [2,4,6,8,10 ] )

#= array-flat_map
#== version: 1.9.3
a = [[1,2],[3,4]]
b = a.flat_map do |i| i*2 end
c = a.collect_concat do |i| i*2 end
assert( b == [1,2,1,2,3,4,3,4] )
assert( c == [1,2,1,2,3,4,3,4] )

#= array-slice_before
#== version: 1.9.3
#== ja: 配列を、指定した値の要素より前と、その要素を含む後ろに分割する
out = [1,4,7,3,11,9,5].slice_before(3).to_a
assert( out == [ [1,4,7], [3,11,9,5] ] )

enumerator = [1,4,7,3,11,9,5].slice_before do |x| x == 3 end
out = enumerator.to_a 
assert( out == [ [1,4,7], [3,11,9,5] ] )


# __STOP_DOCT_PARSE__

# TODO: File.absolute_path( "./file.rb" )
