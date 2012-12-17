require "../../utils/doctutil.rb"

#= bench-simple-loop
#== ja: 100万回の単純なループにかかる時間を計測する
total=0
1000000.times do |i|
  total += i
end
p total


