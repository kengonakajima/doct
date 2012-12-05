var assert = require("assert").ok;

//= array-init-lit
//== ja: 引数を要素として持つ配列を生成する
//== en: create an array with specified arguments
a = new Array(1,2,"a","b");
assert( a.length == 4 );
assert( a[0] == 1 );
assert( a[3] == "b" );

//= array-neg-ind
//== ja: 負のインデクスを指定して配列の要素にアクセスするとundefined
a = new Array(1,2,"a",'b');
assert( a[-1] == undefined );

//= array-splice
//== ja: 範囲を指定して配列の部分を取り出す
a = new Array(1,2,"a",'b');
b = a.splice(1,2);
assert( b[0] == 2 );
assert( b[1] == "a" );


