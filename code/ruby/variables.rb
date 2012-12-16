require "../../utils/doctutil.rb"

#= file-and-line-variable
#== ja: ファイル名と行番号を得る擬似変数
assert( __FILE__ == "variables.rb" )
l1 = __LINE__
l2 = __LINE__
assert( l2 == ( l1 + 1 ) )

