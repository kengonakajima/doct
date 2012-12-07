# encoding: utf-8
require "./util.rb"

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
assert( a.join(",") == "1,2" )


#= array-equal
#== ja: 配列同士を比較する
assert( [1,2,3] == [1,2,3] )
assert( [1,2,3] != [1,2,3,4] )
assert( [1,2,3] != [1,2,4] )

#= array-mul
assert( [1,2,1,2] == [1,2] * 2 )

#= array-range
#== en: get subarray with a range
x = [0, 1, 2, 3, 4, 5]
assert(2 == x[2])
assert([1, 2, 3] == x[1..3])
assert([1, 2, 3] == x[1,3])

