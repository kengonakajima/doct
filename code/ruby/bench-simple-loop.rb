require "../../utils/doctutil.rb"

#= bench-simple-loop
#== ja: 1000万回の単純なループにかかる時間を計測する
total=0
10000000.times do |i|
  total += i
end
assert( total == 49999995000000 )
p "done", total


