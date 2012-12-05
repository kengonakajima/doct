
--= array-init-lit
--== ja: 引数を要素として持つ配列を生成する
--== en: create an array with specified arguments
a = {1,2,"a",'b'}
assert( #a == 4 )
assert( a[0] == nil )
assert( a[1] == 1 )
assert( a[2] == 2 )
assert( a[3] == "a" )
assert( a[4] == "b" )

--= array-out-ind
--== ja: 大きすぎるインデクスを指定して配列の要素を得る
a = {1,2,"a",'b'}
assert( a[5] == nil )
assert( a[8] == nil )

--= array-neg-ind
--== ja: 負のインデクスを指定して配列の要素をget/set
a = {1,2,"a",'b'}
assert( a[-1] == nil )
b = {}
b[-1] = 2
assert( b[-1] == 2 )





