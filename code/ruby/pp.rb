# encoding: utf-8
require "../../utils/doctutil.rb"

#= pretty-print
#== ja: 構造をもつオブジェクトを見やすく表示する
doct_output_start "pretty-print"
require "pp"
a = [ 
  1,2,3, "xxxxxxxxx","yyyyyyy",  "zzzzzzz",
  { "a" => 8,    "b" => [11,12,13] ,    "c" => 14,   },
  15,16
]

p a
pp a
doct_output_end
