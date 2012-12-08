# encoding: utf-8
require "./util.rb"

#= array-create-with-new
#== ja: 長さや内容を指定して配列を初期化する
#== en: create an array with length and content
a = Array.new()
assert( a.size == 0 )
assert( a[0] == nil )

a = Array.new(2)
assert( a == [ nil, nil ] )

a = Array.new(3,"x")
assert( a == [ "x", "x", "x" ] )


#= array-get-value-with-index
a=[1,2,3]
assert( a.at(1) == 2 )
assert( a[1] == 2 )
assert( a.fetch(1) == 2 )
assert( a.fetch(9,"X") == "X" ) # fetch returns default value

#= array-create-copy
#== ja: 配列を複製する
#== en: creaet a duplicated array of existing array
a = [1,2,3]
b = Array.new(a)
assert( b == [1,2,3] )
c = Array(a)
assert( c == [1,2,3] )

#= array-create-with-block
a = Array.new(3) do |i| i*2 end
assert( a == [ 0,2,4 ] )



#= array-literal
#== ja: 引数を要素として持つ配列を生成する
#== en: create an array with specified arguments
a = Array[1,2,"a",'b'] 
assert( a.size == 4 )
a = Array[1,2,"a",'b'] 
b = [1,2,"a",'b'] 
assert( a == b )

#= array-index-out-of-range
#== ja: 大きすぎるインデクスを指定して配列の要素を得る
a = [1,2,"a",'b'] 
assert( a[4] == nil )  
assert( a[8] == nil )  

#= array-index-negative
#== ja: 負のインデクスを指定して配列の要素を得る
#== en: get a value from an array at negative index
a = [1,2,"a",'b'] 
assert( a[-1] == "b" )  
assert( a.at(-1) == "b" )
assert( a.fetch(-1) == "b" )


#= array-splice
#== ja: 範囲を指定して配列の部分を取り出す
a = [1,2,"a",'b'] 
b = a[1..2]
assert( b[0] == 2 )
assert( b[1] == "a" )

#= array-splice-out-of-range
#== ja: 大きすぎる範囲を指定して配列の部分を取り出す
a = [1,2,"a",'b'] 
c = a[2..10]
assert( c.size == 2 ) 

#= array-append-array
#== ja: 配列を配列に連結する
assert( [1,2,3,4] == [1,2] + [3,4] )
a = [1,2]
b = [3,4]
c = a + b
assert( a == [1,2] )
assert( c == [1,2,3,4] )
d = a.concat(b)
assert( d == [1,2,3,4] )


#= array-compare-equal
#== ja: 配列同士を比較する
assert( [1,2,3] == [1,2,3] )
assert( [1,2,3].eql?( [1,2,3] ) )
assert( [1,2,3] != [1,3,2] )
assert( [1,2,3] != [1,2,3,4] )
assert( [1,2,3] != [1,2,4] )

#= array-repeat-with-multiply
#== ja: 配列を繰り返す
#== en: repeat an array
assert( [1,2,1,2] == [1,2] * 2 )

#= array-logical-and
#== ja: 配列の論理積
a = [1,2,3]
b = [2,3,4]
c = a & b
assert( c == [2,3] )

#= array-range-set
#== en: get subarray with a range
x = [0,1,2,3]
x[1,2] = [5,6]
assert( x == [0,5,6,3] )
x[1..2] = ["a","b"]
assert( x == [0,"a","b",3] )
x[1..2] = "A"  # 2 elements to 1
assert( x == [0,"A",3] )
x[1..2] = []   # 2 elements to 0
assert( x == [0] )


#= array-convert-to-string
#== ja: 指定した文字列で配列をつなげて文字列に変換する
x = [1,2,3]
assert( (x * "A") == x.join("A") )

#= array-subtract
assert( [ 1,1,2,2,3,3,4,5 ] - [ 1,2,4] == [3,3,5] )

#= array-push
a = [1,2]
a << 3 << 4
assert( a == [ 1,2,3,4] )
a.push(5).push(6)
assert( a == [ 1,2,3,4,5,6] )

#= array-compare-dictionary-wise
assert( ( [ "a", "a", "c" ]    <=> [ "a", "b", "c" ] ) == -1 )
assert( ( [ 1, 2, 3, 4, 5, 6 ] <=> [ 1, 2 ] ) == 1 )            

#= array-slice
a = [ "a", "b", "c", "d", "e" ]
assert( a[1, 2] == a.slice(1,2) )
assert( a[1, 2] == [ "b", "c" ] )
assert( a[1..3] == a.slice(1..3) )    
assert( a[1..3] == [ "b", "c", "d" ] )
assert( a[4..7] == a.slice(4..7) )
assert( a[4..7] == [ "e" ] )
assert( a[6..10] == nil )
assert( a.slice(6..10) == nil )
assert( a[-3, 3] == a.slice( -3, 3 ) )
assert( a[-3, 3] == [ "c", "d", "e" ] )
# special cases
assert( a[5, 1] == [] )
assert( a[5..10] == [] )

#= array-clear
#== ja: clearは破壊的だが!は不要
a=[1,2,3]
begin
  a.clear!
rescue
  assert($!.class == NoMethodError )
end
a.clear
assert( a == [] )

#= array-assoc
#== ja: 配列の配列を先頭の要素に==して1つだけ検索
a = [
  [ "jack", "male", 4 ],
  [ "george", "male", 5 ],
  [ "risa", "female", 8 ],
  "mike",
  ["thomas"],
  [ ["foo","bar"], "male", 11 ]
]
assert( a.assoc("george") == ["george","male",5] )
assert( a.assoc("mike") == nil )
assert( a.assoc("thomas") == ["thomas"] )
assert( a.assoc(["foo","bar"] ) == [ ["foo","bar"], "male", 11 ] )

#= array-rassoc
#== ja: 配列の配列を先頭から2番目の要素に==して1つだけ検索
#== en: search an array of arrays 
a = [
  [ "jack", "male", 4 ],
  [ "george", "male", 5 ],
  [ "risa", "female", 8 ]
]
assert( a.rassoc("male") == [ "jack", "male", 4 ] )
assert( a.rassoc("both") == nil )

#= array-scan-with-collect-or-map
#== ja: 配列の各要素に対してブロックを呼び出し、その値で内容を置き換える
a=[1,2,3]
a.collect! do |x| x*2 end
assert( a == [2,4,6] )
a.map! do |x| x/2 end
assert( a == [1,2,3] )

#= array-combination
a = [1, 2, 3, 4]
assert( a.combination(1).class.to_s.include?("Enumerator") )
assert( a.combination(1).to_a == [[1],[2],[3],[4]] )
assert( a.combination(2).to_a == [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]] )
assert( a.combination(3).to_a == [[1,2,3],[1,2,4],[1,3,4],[2,3,4]] )
assert( a.combination(4).to_a == [[1,2,3,4]] )
assert( a.combination(0).to_a == [[]] ) # one combination of length 0
assert( a.combination(5).to_a == [] )  # no combinations of length 5

#= array-compact
assert( [ 1, nil, 2, nil, 3 ].compact! == [1,2,3] )
assert( [ 1,2,3 ].compact! == nil ) # tricky
assert( [ 1,2,3 ].compact == [1,2,3] )

#= array-count
a=[1,2,2,3,4]
assert( a.count() == 5 )
assert( a.count(2) == 2 ) # with value
assert( a.count { |x| (x%2) == 0 }   == 3 ) # with block

#= array-cycle
a = [1,2,3]
e = a.cycle(2)
assert( e.class.to_s.include?( "Enumerator" ) )
assert( a.cycle(2).to_a == [1,2,3,1,2,3] )
e = ["a","b"].cycle 
s = ""
e.each do |x| # infinite loop
  s += x
  break if s.size == 10 
end
assert( s == "ababababab" )

#= array-delete
#== ja: 配列の要素を破壊的に削除するが、!は不要
a = [ 1,2,2,3,3 ]
assert( a.delete(2) == 2 )
assert( a ==  [1,3,3] )
assert( a.delete(9) == nil )
assert( a.delete(9) { "not found" }   == "not found" )

#= array-delete-at-index
#== ja: 位置を指定して配列の要素を削除
a = [3,5,6,1]
assert( a.delete_at(2)  == 6 )
assert( a == [3,5,1] )
assert( a.delete_at(99) == nil )

#= array-delete-if
#== ja: 配列から、ブロックで判定した要素を削除
a = [3,5,6,1]
a.delete_if do |x| (x%2) == 0 end
assert( a == [ 3,5,1] )

#= array-remove-head
#== ja: 配列の要素を先頭から数を指定して削除し、残りまたは削除した部分を返す
a = [1,2,3,4]
assert( a.drop(2) == [3,4] )
assert( a == [1,2,3,4] )
assert( a.shift(2) == [1,2] ) # shift is destructive
assert( a == [3,4] ) 

#= array-remove-head-conditional
a = [2,3,5,6,3]
b = a.drop_while do |x| (x < 4) end
assert( b == [5,6,3] )
assert( a == [2,3,5,6,3] )

#= array-scan
#== ja: 配列の要素を走査する

a = [3,3,5,5]
total = 0
b = a.each do |x| total += x end  # returns orig array
assert( total == 3+3+5+5 )
assert( b == [3,3,5,5] )

total = 0
a.each_index do |i| total += a[i] end
assert( total == 3+3+5+5 )
assert( b == [3,3,5,5] )


#= array-check-empty
a = [1,2,3]
assert( a.empty? == false )
a.clear
assert( a.empty? )

#= array-fill
a = [1,2,3,4]
assert( a.fill(9) == [9,9,9,9] ) # destructive
assert( a == [9,9,9,9] )

a = [1,2,3,4]
assert( a.fill(9,2,2) == [1,2,9,9] ) # destructive

a = [1,2,3,4]
assert( a.fill(9,0..1) == [9,9,3,4] ) # destructive

#= array-search-element
#== ja: 配列の要素を検索して最初にみつかったインデクスを返す
a = [ "a", "b", "c" ]
assert( a.index("b") == 1 )
assert( a.index("z") == nil )
assert( a.index{|x|x=="b"} == 1 ) 

#= array-get-first-elements
a = [3,5,1,4]
assert( a.first == 3 )
assert( a.first(2) == [3,5] )

#= array-flatten
a = [3,5,[1,4]]
assert( a.flatten == [3,5,1,4] )
assert( a == [3,5,[1,4]] ) # non-destructive
assert( a.flatten! == [3,5,1,4] )
assert( a == [3,5,1,4] ) # destructive
a = [3,5,[1,[4,8]]]
assert( a.flatten(1) == [3,5,1,[4,8]] )

#= array-include
a = [3,5,1,4]
assert( a.include?(1) )
assert( a.include?(7) == false )

#= array-replace
#== ja: 配列の内容全体を置きかえる
a = [3,5,1,4]
b = [9,8,7,6]
assert( a.replace(b) == [9,8,7,6] )

#= array-insert 
#== ja: 位置を指定して配列の要素を挿入する
a = [3,5,1]
a.insert(2,99) # destructive
assert( a == [3,5,99,1] )



# __STOP_DOCT_PARSE__
# most idea is originally from: http://www.ruby-doc.org/core-1.9.3/Array.html
# 
