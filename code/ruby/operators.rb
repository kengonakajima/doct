require "../../utils/doctutil.rb"

#= operator-and
assert( 1==1 && 2==2 )
assert( ( (1==1) and (2==2) ) ) # must put ( and ) 
assert(
  if 1==1 and 2==2 then
    true
  end
)
assert(
  if 1==1 && 2==2 then
    true
  end
)


#= operator-or
assert( 1==2 || 2==2 )
assert( ( (1==2) or (2==2) ) ) # must put ( and ) 
assert(
  if 1==2 or 2==2 then
    true
  end
)
assert(
  if 1==2 || 2==2 then
    true
  end
)


#= operator-not
assert( ! false )
assert( ( not false ) )

#= operator-ternary
x = 1 != 1 ? 2 : 3
assert( x == 3 )
x = if 1 != 1 then 2 else 3 end
assert( x == 3 )
