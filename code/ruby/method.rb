# encoding: utf-8
require "../../utils/doctutil.rb"


#= method-parenthesis
#== ja: メソッド呼び出しの括弧は省略できる
def mul(x)
  x*2
end
y = mul(2)
z = mul 2
assert( y == z )

#= method-super
#== ja: オーバーライドしているメソッドを呼び出す

class X
  def f()
    2
  end
end

class Y < X
  def f()
    super()
  end
  
end
  
y = Y.new
assert( y.f() == 2 )

#= method-block-argument
doct_output_start "method-block-argument"
def f( &b )
  [1,2,3].each do |x|
    b.call(x)
  end
end

f do |a|
  puts a
end 

f { |a|
  puts a
}

doct_output_end

#= method-variable-arguments
#== ja: メソッドの可変長引数は配列として渡される
def f( *args )
  assert( args.class == Array )
  args.join(".")       
end

assert( f( 1,2,3 ) == "1.2.3" )


#= method-call-given-block-with-yield
#== ja: yield

def f()
  yield 10,20
  yield 20
  yield 30,40
end

ary = []
f { |a,b| 
  ary.push( [a,b] )
}

assert( ary == [ [10,20], [20,nil], [30,40] ] )





