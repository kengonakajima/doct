require "./util.rb"

#= range-for
a = []
for i in 1..3 do a.push(i) end
assert( a == [1,2,3] )

#= range-member-integer
r = 1..10
assert( r.member?(3) )
assert( ! r.member?(11)  )

#= range-member-string
r = "a" .. "k"
assert( r.member?("c") )
assert( ! r.member?("x") )

#= range-methods
r = 1..10
assert( r.begin == 1 )
assert( r.first == 1 )
assert( r.end == 10 )
assert( r.last == 10 )

#= range-compare
r = 1..10
s = 1..10
t = 2..10
assert( r.eql?(s) )
assert( ! r.eql?(t) )

#= range-loop-iterate
a = []
r = 1..5
r.step do |i| a.push(i) end
assert( a == [1,2,3,4,5] )

a = []
r.step(2) do |i| a.push(i) end
assert( a == [1,3,5] )


#= range-conditional
a = []
5.times do |n|
  if (n==2)..(n==4) then
    a.push(n)
  end
end
assert( a == [2,3,4] )




