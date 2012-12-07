require "./util.rb"

#= constant-search-order
#== ja: 定数の探索順

class Foo
  C = "Foo"
end

C = "Object"

class Bar < Foo
  def get() 
    return C 
  end
end

b = Bar.new
assert( b.get() == "Foo" )

class Baz < Foo
  C = "Baz"
  def get()
    return C
  end
end
z = Baz.new
assert( z.get() == "Baz" )
assert( Foo::C == "Foo" )
      

