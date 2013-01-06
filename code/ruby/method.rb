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

