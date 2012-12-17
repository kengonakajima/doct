require "../../utils/doctutil.rb"

#= variable-file-and-line
#== ja: ファイル名と行番号を得る擬似変数
assert( __FILE__ == "variables.rb" )
l1 = __LINE__
l2 = __LINE__
assert( l2 == ( l1 + 1 ) )


#= variable-version-string
#= ja: スクリプトを実行中のRuby処理系のバージョン番号を定義済み変数から得て出力する
doct_output_start "variable-version-string"

p RUBY_VERSION

doct_output_end
