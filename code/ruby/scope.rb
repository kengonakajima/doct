require "./util.rb"

#= scope-of-local-variables
#== ja: ローカル変数は定義した位置より後ろでのみdefined

2.times {
  assert( defined?(v) == nil )
  v=1
  assert( defined?(v) == "local-variable(in-block)" )
}

#= scope-of-local-variables-even-if-not-executed
#== ja: ローカル変数は定義している部分が実行されなくてもdefined
2.times {
  assert( defined?(v) == nil )
  v=1 if false
  assert( defined?(v) == "local-variable(in-block)" )
}

#= scope-of-instance-variables
#== ja: インスタンス変数は他のインスタンスからは見えない
#== en: instance variable can't be seen from other instances
class X
  def a()    @v = 1  end
  def b()    @v = 2  end
  def get()  @v end
end
xa = X.new
xb = X.new
xa.a()
xb.b()
assert( xa.get() == 1 )
assert( xb.get() == 2 )


#= scope-of-class-variables
#== ja: クラス変数はクラスのすべてのインスタンスから見える
#== en: class variable can be seen from all instances of the class
class X
  @@v = 1
  def a() @@v = 2 end
  def b() @@v = 3 end
  def get() @@v end
end
xa = X.new
xb = X.new
assert( xa.get() == 1 )
assert( xb.get() == 1 )
xa.a()
xb.b()
assert( xa.get() == 3 )
assert( xb.get() == 3 )

#= scope-of-class-variables-in-subclasses
#== ja: クラス変数はサブクラスからも見える
#== en: class variables can be seen from subclasses
class X
  @@v = 1
end
class Y < X
  def get() @@v end
end
y = Y.new
assert( y.get() == 1 )

#= scope-of-global-variables
#== ja: グローバル変数はどこからでも見える
#== en: global variables could be seen from anywhere
class X
  def a()
    $v = 123
  end
end
class Y
  def b()
    $v = 456
  end
end
def c()
  $v
end

x = X.new
y = Y.new
x.a()
assert( $v == 123 )
y.b()
assert( $v == 456 )
assert( c() == 456 )


