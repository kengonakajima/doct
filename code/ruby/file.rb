# encoding: utf-8
require "../../utils/doctutil.rb"


#= file-test-exist
#= ja: ファイルが存在するか確認する

assert(  File.exists?( "/etc" ) == true )
assert(  File.exists?( "/etc/hogehogehogehogehoge" ) == false )






