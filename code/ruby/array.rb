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


#= array-equal
#== ja: 配列同士を比較する
assert( [1,2,3] == [1,2,3] )
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

#= array-range
#== en: get subarray with a range
x = [0, 1, 2, 3, 4, 5]
assert(2 == x[2])
assert([1, 2, 3] == x[1..3])
assert([1, 2, 3] == x[1,3])

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
