require "../../utils/doctutil.rb"

total=0
10000000.times do |i|
  total += i
end
assert( total == 49999995000000 )


