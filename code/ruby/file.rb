# encoding: utf-8
require "../../utils/doctutil.rb"

#= file-access-time
#== ja: 
doct_output_start "file-access-time"
p File.atime( "/etc" )
doct_output_end

#= file-basename
#== ja: ファイルのパスからディレクトリ名を削除する(最後のスラッシュの後)
assert( File.basename("/etc/apache2/httpd.conf") == "httpd.conf" )
assert( File.basename("/etc/apache2/httpd.conf", ".conf") == "httpd" ) # ja: 拡張子も削除できる 
assert( File.basename("apache2/httpd.conf", ".conf") == "httpd" ) 
assert( File.basename("httpd.conf") == "httpd.conf" )
assert( File.basename("/etc/apache2/") == "apache2" )

#= file-change-owner
#== ja: ファイルの所有者を変更し、変更した数を返す
owner = `id -u`.strip.to_i
group = `id -g`.strip.to_i
system( "touch /tmp/test_file_1" )
system( "touch /tmp/test_file_2" )
n = File.chown( owner, group, "/tmp/test_file_1", "/tmp/test_file_2" )
assert( n == 2 )

#= file-change-time
doct_output_start "file-change-time"
p File.ctime( "/etc" )
doct_output_end

#= file-delete
#== ja: ファイルを削除し、削除した数を返す
doct_output_start "file-delete"
system( "touch /tmp/test_file_1" )
system( "touch /tmp/test_file_2" )
n = File.delete( "/tmp/test_file_1", "/tmp/test_file_2" )
assert( n == 2 )
begin
  File.unlink( "/tmp/test_file_1", "/tmp/test_file_2" ) # ja: 2回目の削除は例外
rescue
  p $!
  assert( $!.class == Errno::ENOENT )
end
doct_output_end

#= file-test-directory
#== ja: 指定したファイルパスがディレクトリとして存在しているか調べる
assert( File.directory?( "/etc" )  )
begin
  File.directory?( "/etc___" ) 
rescue
  assert( $!.class == Errno::ENOENT )  # ja: 存在しない場合は例外
end


#= file-get-directory-name
#== ja: 指定したファイルを含むディレクトリの名前を得る(最後の/の前)
assert( File.dirname("apache2/httpd.conf") == "apache2" )
assert( File.dirname("file.txt") == "." )

assert( File.dirname("etc/apache2/") == "etc" )
assert( File.dirname("etc//apache2") == "etc" )

#= file-test-executable
#== ja: 実行可能ファイルであるか調べる
assert( File.executable?( "/bin/ls" )  )
assert( File.executable?( "./file.rb" ) == false )
begin
  File.executable?( "/bin/command_should_not_exist" )
rescue
  assert( $!.class == Errno::ENOENT )  # ja: 存在しない場合は例外
end

#= file-test-executable-with-user-and-group
#== ja: 現在のユーザとグループで実行可能か調べる
assert( File.executable_real?( "/bin/ls" )  )


#= file-test-exist
#== ja: ファイルが存在するか確認する

assert(  File.exists?( "/etc" ) == true )
assert(  File.exist?( "/etc" ) == true )    # ja: exist? と exists?　の両方が利用可能
assert(  File.exists?( "/etc/hogehogehogehogehoge" ) == false )

#
#= file-expand-path-to-full-path
#== ja: ファイルパスを絶対パスに展開する
doct_output_start("file-expand-path-to-full-path"); tmp = ENV["HOME"]

println "working directory: ", Dir.getwd
println "home: ", ENV["HOME"]
println "relative-to-current: ", File.expand_path( "./file.rb" )  # ja: Dir.getwdを利用して展開する
println "relative-to-user: ", File.expand_path( "~/readme.txt" )  # ja: 環境変数HOMEを利用して展開する
println "relative-to-specific-user: ", File.expand_path( "~root/readme.txt" )  # ja: 環境変数HOMEを利用して展開する
begin
  println File.expand_path( "~user_not_found/readme.txt" )  # ja: 存在しない
rescue
  assert( $!.class == ArgumentError )
end






#= file-test-normal-file
#== ja: ファイルがディレクトリなどではなく通常のファイルであるならtrue

assert( File.file?( "./file.rb" ) == true )
assert( File.file?( "/etc" ) == false )



