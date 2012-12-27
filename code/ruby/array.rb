# encoding: utf-8
require "../../utils/doctutil.rb"

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

#= array-logical-or
#== ja: 配列の論理和
a = [1,2,3]
b = [2,3,4]
c = a | b
assert( c == [1,2,3,4] )


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
  assert(false)
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
a.collect! do |x| if (x%2)==0 then nil else x end end
assert( a == [1,nil,3] )

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
assert( a.delete(9) { "not found" }   == "not found" ) # ja: 見つからないときの値を指定

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
a = [3,5,6,1]
a.reject! do |x| (x%2) == 0 end
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

#= array-scan-reverse
#== ja: 配列の要素を逆順に走査する
a = ["a","b","c"]
s = ""
a.reverse_each do |x| s += x end
assert( s == "cba")

#= array-search



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
assert( a.first(2) == a.take(2) ) # not destructive
assert( a == [3,5,1,4] )
b = a.take_while do |x| x > 2 end
assert( b == [3,5] )
assert( a == [3,5,1,4] )

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
assert( a.member?(1) )
assert( a.member?(7) == false )

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

#= array-last
a = [ "w", "x", "y", "z" ]
assert( a.last == "z" )
assert( a.last(2)  == ["y", "z"] )

#= array-length-and-size
a = [4,1,5]
assert( a.length == 3 )
assert( a.length == a.size )

#= array-pack-simplest
a = [ "a", "b", "c" ]
n = [ 65, 66, 67 ]
assert( a.pack("A3A3A3") == "a  b  c  " )
assert( a.pack("a3a3a3") == "a\000\000b\000\000c\000\000" )
assert( n.pack("ccc") == "ABC" )

#= array-permutation
a = [1, 2, 3]
e = a.permutation
assert( e.class.to_s.include?("Enumerator") )
assert( e.to_a == [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]] )
assert( a.permutation(1).to_a  == [[1],[2],[3]] )
assert( a.permutation(2).to_a  == [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]] )
assert( a.permutation(3).to_a  == [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]] )
assert( a.permutation(0).to_a  == [[]] ) # one permutation of length 0
assert( a.permutation(4).to_a  == [] )  # no permutations of length 4

#= array-pop

a = [3,6,1,7]
assert( a.pop == 7 ) # destructive
assert( a == [3,6,1] )
assert( a.pop(2) == [6,1] )
assert( a == [3] )


#= array-product
#== ja: 2つの配列の組み合わせをすべて生成する
assert( [1,2,3].product([4,5]) == [[1,4],[1,5],[2,4],[2,5],[3,4],[3,5]] )
assert( [1,2].product([1,2]) == [[1,1],[1,2],[2,1],[2,2]] )
assert( [1,2].product([3,4],[5,6]) == [[1,3,5],[1,3,6],[1,4,5],[1,4,6],[2,3,5],[2,3,6],[2,4,5],[2,4,6]] )
assert( [1,2].product() == [[1],[2]] )
assert( [1,2].product([]) == [] )

#= array-push
a = [3,6,1]
a.push(9) 
assert( a == [3,6,1,9] )



#= array-reverse
a = [6,1,3]
assert( a.reverse == [3,1,6] )
assert( a == [6,1,3] )
a.reverse!
assert( a == [3,1,6] )

#= array-search-reverse
#== ja: 配列の要素を逆順に検索して最初に見つけた要素のインデクスを返す
a = [6,9,8,7,4]
assert( a.rindex(7) == 3 )
assert( a.rindex(11) == nil )
assert( a.rindex do |x| (x%2)==0 end == 4 )

#= array-find-all-elements
a = %w{ a b c d e f }
b = a.select {|v| v =~ /[aeiou]/}   
assert( b == ["a", "e"] )
assert( a == %w{ a b c d e f } ) # not-destructive
c = a.find_all {|v| v =~ /[aeiou]/}   
assert( c == ["a", "e"] )
assert( a == %w{ a b c d e f } ) # not-destructive


#= array-shift
args = [ "-m", "-q", "filename" ]
assert( args.shift == "-m" )           # destructive
assert( args == [ "-q", "filename"] ) 

args = [ "-m", "-q", "filename" ]
assert( args.shift(2)  == ["-m", "-q"] ) # destructive
assert( args == ["filename"] )

a = [1,2,3]
assert( a.shift(4) == [1,2,3] )
assert( a == [] )

a = []
assert( a.shift == nil )
assert( a == [ ] )


#= array-shuffle
a = [1,2,3]
a.shuffle!
v0 = a.shift
v1 = a.shift
v2 = a.shift
v3 = a.shift
assert( v0 == 1 || v0 == 2 || v0 == 3 )
assert( v1 == 1 || v1 == 2 || v1 == 3 )
assert( v2 == 1 || v2 == 2 || v2 == 3 )
assert( v3 == nil )

#= array-sort
#== ja: 配列の要素を辞書順にソートする。真偽を返すブロックも使える。
a = [ "d", "a", "e", "c", "b" ]
assert( a.sort! == ["a", "b", "c", "d", "e"] )  # destructive by !
assert( a.sort! {|x,y| y <=> x }   == ["e", "d", "c", "b", "a"] )

a = [ "a", "b", 3, 2 ]
begin
  a.sort
  assert(false)
rescue
  assert( $!.class == ArgumentError )
end


#= array-sort-by
#== ja: 配列の要素をブロックが返す値を利用してソートする。
animals = ["mouse", "cat", "hippopotamus", "giraffe"]
sorted = animals.sort_by {|anim| anim.size }
assert( sorted == ["cat", "mouse", "giraffe", "hippopotamus"] )


#= array-transpose
#== ja: 2次元配列を転置する(列と行を入れ替える)
a = [[1,2], [3,4], [5,6]]
assert( a.transpose   == [[1, 3, 5], [2, 4, 6]] )  # not destructive
assert( a == [[1,2], [3,4], [5,6]] )

#= array-unique
a = [3,3,5,8,2,5,3]
b = a.uniq! # destructive
assert( a == [3,5,8,2] )

#= array-unshift
a = [1,2,3]
a.unshift(8)  # destructive
assert( a == [8,1,2,3] )

#= array-select-values-at-indexes
a = ["cat","dog","fox","mole","frog"]
b = a.values_at(1,2,4)
assert( b == ["dog","fox","frog"] )

#= array-zip
a = [1,2,3]
b = ["a","b","c"]
c = [7,8,9]
d = a.zip(b,c)  # not destructive
assert( d == [[1, "a", 7], [2, "b", 8], [3, "c", 9]] )
assert( a == [1,2,3] )

a = [1,2]
b = ["a","b","c","d","e","f","g"]
c = [7,8,9,10,11]
d = a.zip(b,c)  # not destructive
assert( d == [[1, "a", 7], [2, "b", 8]] )


#= array-find
a = [1,4,9,11].find do |x| (x%2)==0 end
assert( a == 4 )
a = [1,4,9,11].detect do |x| (x%2)==0 end
assert( a == 4 )

#= array-each_cons
# see also each_slice
a=[]
[1,4,9,11,13].each_cons(3) do |x| a.push(x) end
assert( a == [ [1,4,9], [4,9,11], [9,11,13] ] )

#= array-each_slice
# see also each_cons
a=[]
[1,4,7,9,10,12,15].each_slice(3) do |x| a.push(x) end
assert( a == [ [1,4,7], [9,10,12], [15] ] )

#= array-each_with_index
# from Enumerable
a=[ "cat", "dog", "wombat" ]
b=[]
a.each_with_index do |item,index| b.push([item,index]) end
assert( b == [ ["cat",0], ["dog",1], ["wombat",2] ] )

#= array-find-index
assert( (1..100).find_index(50) == 49 )

#= array-reduce
# aliased: inject
# from Enumerable
b = []
out = [1,2,3,4,5].reduce do |sum,n| 
  b.push( [sum,n] )
  sum + n 
end
assert( out == 15 )
assert( b == [ [1,2], [3,3], [6,4], [10,5] ] )

out = [1,2,3,4,5].reduce(:+) # reduce(Symbol) 
assert( out == 15 )

b = []
out = [1,2,3,4,5].reduce(100) do |sum,n|   # reduce(Initial_value)
  b.push( [sum,n] )
  sum + n
end
assert( out == 115 )
assert( b == [ [100,1], [101,2], [103,3], [106,4], [110,5] ] )

out = [1,2,3,4,5].reduce(100,:+)
assert( out == 115 )

out = [1,2,3,4,5].inject(100,:+)  # same as reduce()
assert( out == 115 )


#= array-max
# from Enumerable
assert( [1,5,8,3,2].max() == 8 )

a = [ "albatross", "dog", "horse" ]
assert( a.max == "horse" )     # dictionary wise
assert( a.max {|a,b| a.length <=> b.length }  == "albatross" ) # length wise

#= array-max_by
# from Enumerable
a = [ "albatross", "dog", "horse" ]
out = a.max_by do |x| x.length end
assert( out == "albatross" )

#= array-min
# from Enumerable
assert( [1,5,8,3,2].min() == 1 )

a = [ "albatross", "dog", "horse" ]
assert( a.min == "albatross" )     # dictionary wise
assert( a.min {|a,b| a.length <=> b.length }  == "dog" ) # length wise

#= array-min_by
# from Enumerable
a = [ "albatross", "dog", "horse" ]
out = a.min_by do |x| x.length end
assert( out == "dog" )

#= array-minmax
# from Enumerable
a = [ "albatross", "dog", "horse" ]
assert( a.minmax == [ "albatross", "horse" ] ) # dictionary wise
out = a.minmax do |a,b| a.length <=> b.length end
assert( out == [ "dog", "albatross" ] ) # length wise

#= array-minmax_by
# from Enumerable
a = [ "albatross", "dog", "horse" ]
out = a.minmax_by do |x| x.length end
assert( out == [ "dog", "albatross" ] )

#= array-none
#== ja: それぞれの要素を評価して一度でもtrueだったらfalse、すべてfalseだったらtrueを返す
# from Enumerable
out = ["ant", "bear","cat"].none? do |word| word.length == 5 end
assert( out == true )

out = ["ant","bear","cat"].none? do |word| word.length >= 4 end
assert( out == false )

assert( [].none? == true )      # en: empty array gives true because starting state is true | ja: 初期状態がtrueから始まるので、配列に要素がない場合はtrueが返される
assert( [nil].none? == true )   # en: nil is evaluated as false 
assert( [nil,false].none? == true ) 

#= array-one
#== ja: 全要素を評価して一度だけ真だったらtrue, 0回か2回以上だったらfalse
out = ["ant","bear","cat"].one? do |word| word.length == 4 end
assert( out == true )
out = ["ant","bear","cat"].one? do |word| word.length == 3 end
assert( out == false ) 

assert( [nil, true, 99 ].one? == false )
assert( [nil, true, false ].one? == true ) # ja: nilはfalseと評価される | en: nil is evaluated as false

#= array-partition

out = (1..6).partition do |v| v.even? end
assert( out ==  [[2, 4, 6], [1, 3, 5]] )


# __STOP_DOCT_PARSE__
#
# most idea is originally from: http://www.ruby-doc.org/core-1.9.3/Array.html
# 
