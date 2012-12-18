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
File.open( "/tmp/test_file_1", "w" ) do |f| end
File.open( "/tmp/test_file_2", "w" ) do |f| end
n = File.chown( owner, group, "/tmp/test_file_1", "/tmp/test_file_2" )
assert( n == 2 )

#= file-change-time
doct_output_start "file-change-time"
p File.ctime( "/etc" )
doct_output_end

#= file-delete
#== ja: ファイルを削除し、削除した数を返す
doct_output_start "file-delete"
File.open( "/tmp/test_file_1", "w" ) do |f| end
File.open( "/tmp/test_file_2", "w" ) do |f| end
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

doct_output_end


#= file-extention-name
#== ja: 拡張子を得る
assert( File.extname("foo/foo.txt") == ".txt" )
assert( File.extname("foo/foo.tar.gz") == ".gz" )
assert( File.extname("foo/bar") == "" )
assert( File.extname("foo/.bar") == "" )
assert( File.extname("foo.txt/bar") == "" )
assert( File.extname(".foo") == "" )



#= file-detect-type
#== ja: ファイルの種別を文字列で得る
assert( File.ftype( "./file.rb" ) == "file" )
assert( File.ftype( "./file.rb" ) != "socket" )
assert( File.ftype( "./file.rb" ) != "fifo" )
assert( File.ftype( "/bin" ) == "directory" )

File.delete_force( "/tmp/etc_link_" ) # __SKIP_DOCT_PARSE__

File.symlink( "/bin", "/tmp/etc_link_" )
assert( File.ftype( "/tmp/etc_link_" ) == "link" )



#= file-test-normal-file
#== ja: ファイルがディレクトリなどではなく通常のファイルであるならtrue

assert( File.file?( __FILE__ ) == true )
assert( File.file?( "/etc" ) == false )


#= file-test-identical
#== ja: 2つのファイルパスが同一のものを指しているかリンクをたどって調べる
File.delete_force "/tmp/etc_link_" # __SKIP_DOCT_PARSE__
File.symlink( "/etc", "/tmp/etc_link_" )
assert( File.identical?( "/etc", "/tmp/etc_link_" ) == true )

#= file-get-last-modified-time
#== ja: ファイルの最終変更時刻を得る
doct_output_start "file-get-last-modified-time"
p File.mtime( "./file.rb" )
doct_output_end

#= file-open-read-close
#== ja: ファイルを開いて読んで閉じる
f = File.open( "./file.rb" )
sz = f.read.size
assert( sz > 1000 )
f.close()

File.open( "./file.rb", "r" ) do |f|  # ja: ブロックの実行が終わると自動的に閉じる | en: f will be closed when given block is finished
  assert( f.read.size == sz )
end

begin
  File.open( "/file/does/not/exist" )  # ja: ファイルが無いときは例外 
rescue
  assert( $!.class == Errno::ENOENT )
end

#= file-open-for-write
#== ja: ファイルを書き込みのために開く


f = File.open( "/tmp/output.txt", "w" )  # ja: 上書きで開く。 同名の既存ファイルは削除される
f.print( "hello" )
f.close()

File.open( "/tmp/output.txt", "a+" ) do |f|  # ja: 追記で開く
  f.print( "world" )
end # ja: ブロックの実行が終わったら閉じられる

File.open( "/tmp/output.txt", "r" ) do |f|
  assert( f.read == "helloworld" )     # ja: 追記されている
end

#= file-test-ownership
#== ja: プログラムを実行しているユーザが指定したファイルのownerであるか調べる
assert( File.owned?( __FILE__ ) )
assert( File.owned?( "/etc" )  == false )

#= file-test-readable
assert( File.readable?( __FILE__ ) )

#= file-test-readable-with-current-user-and-group
assert( File.readable_real?( __FILE__ ) )

File.delete_force "/tmp/etc_link_" # __SKIP_DOCT_PARSE__
File.symlink( "/etc", "/tmp/etc_link_" ) 
assert( File.readlink( "/tmp/etc_link_" ) == "/etc" )


#= file-rename
File.delete_force "/tmp/readme.txt" # __SKIP_DOCT_PARSE__
File.open( "/tmp/readme.txt", "w") do |f| end
assert( File.rename( "/tmp/readme.txt", "/tmp/renamed.txt" ) == 0 )  # ja: 成功したら0
assert( File.exists?( "/tmp/renamed.txt" ) )
begin
  File.rename( "/tmp/readme.txt", "/tmp/renamed2.txt" )  # ja: ファイルが無いときは例外
rescue
  assert( $!.class == Errno::ENOENT )
end



#= file-get-size
#== ja: ファイルサイズを取得する
sz = File.size( "./file.rb" )
File.open("./file.rb","rb") do |f| 
  assert( f.read.size == sz )
end

#= file-test-content-size
File.delete_force "/tmp/readme.txt" # __SKIP_DOCT_PARSE__

assert( ! File.size?( "/tmp/readme.txt" ) ) # ja: ファイルが存在しないので false
File.open( "/tmp/readme.txt", "w" ) do |f| end  # ja: 空のファイルを作成
assert( ! File.size?( "/tmp/readme.txt" ) )  # ja: ファイルが空なので false
File.open( "/tmp/readme.txt", "a+" ) do |f| 
  f.print( "hello" )
end  
assert( File.size?( "/tmp/readme.txt" ) )  # ja: ファイルのサイズが(5バイト)あるので true

#= file-test-pipe
assert( File.pipe?( "./file.rb" ) == false )

#= file-test-socket
assert( File.socket?( "./file.rb" ) == false )

#= file-split-directory-name-and-file-basename
#== ja: ファイルパスを、ディレクトリ名とファイルの名称に分ける
assert( File.split("/home/gumby/.profile")  == ["/home/gumby", ".profile" ] )

#= file-get-stat
stat = File.stat( "./file.rb" )
mt = File.mtime( "./file.rb" )
assert( mt == stat.mtime )

#= file-test-sticky
#== ja: stickyビットが設定されているか調べる
assert( File.sticky?( "./file.rb" ) == false )

#= file-create-symbolic-link
#== ja: シンボリックリンクを作成する
File.delete_force "/tmp/link_to_etc" # __SKIP_DOCT_PARSE__

assert( File.symlink( "/etc", "/tmp/link_to_etc" ) == 0 ) 
assert( File.delete( "/tmp/link_to_etc" ) == 1 ) 

assert( File.symlink( "/etc____", "/tmp/link_to_etc" ) == 0 ) # ja: 存在しないファイルへのリンクも作成可能

#= file-test-symbolic-link
#== ja: シンボリックリンクであるか確認する
File.delete_force "/tmp/link_to_etc" # __SKIP_DOCT_PARSE__

assert( File.symlink( "/etc", "/tmp/link_to_etc" ) == 0 ) 
assert( File.symlink?( "/tmp/link_to_etc" )  )
assert( ! File.symlink?( "/bin" )  )


#= file-truncate
#== ja: ファイルの内容を冒頭だけ残してサイズを小さくする

File.open("/tmp/out", "w") do |f|
  assert( f.write("1234567890") == 10 )
end
assert( File.size("/tmp/out") == 10 )
assert( File.truncate("/tmp/out", 5) == 0 )
assert( File.size("/tmp/out") == 5 )

#= file-set-access-and-modification-time
#== ja: ファイルの最終アクセス時刻と修正時刻を変更する
t0 = Time.at(0)
File.open( "/tmp/readme.txt", "w" ) do |f| f.print("hello") end

File.utime( t0, t0, "/tmp/readme.txt" )
assert( File.atime( "/tmp/readme.txt" ) == t0 )
assert( File.mtime( "/tmp/readme.txt" ) == t0 )

#= file-test-writable
File.delete_force "/tmp/readme.txt" # __SKIP_DOCT_PARSE__

File.open("/tmp/readme.txt","w") do |f|
  f.print "hello"
end
assert( File.writable?( "/tmp/readme.txt" ) )
assert( File.writable_real?( "/tmp/readme.txt" ) ) # ja: 現在のユーザとグループで書き込みが可能か？


#= file-test-zero-sized
#== ja: ファイルが存在してサイズがゼロか調べる

File.delete_force "/tmp/readme.txt" # __SKIP_DOCT_PARSE__

assert( ! File.zero?( "/tmp/readme.txt" )  )  # ja: ファイルが存在しないときはfalse
File.open("/tmp/readme.txt", "w" ) do |f| end  # ja: 空のファイルを作成
assert( File.zero?( "/tmp/readme.txt" )  )  
File.open("/tmp/readme.txt", "a+" ) do |f| f.print("hello") end 
assert( ! File.zero?( "/tmp/readme.txt" )  )   # ja: 中身があるのでfalse


# __STOP_DOCT_PARSE__
# TODO: File#fnmatch file-name-match-with-library-function-fnmatch
# TODO: File#grpowned? file-test-group-ownership 
# TODO: File#join
# TODO: File#lchmod
# TODO: File#lchown
# TODO: File#lstat
# TODO: File#path
# TODO: File#realpath
# TODO: File#realdirpath
# TODO: File#setgid
# TODO: File#setuid
# TODO: Stat
# TODO: File#sticky?
# TODO: File#umask
# TODO: File#umask
# TODO: File#world_readable? world_writable?

# TODO: File : instance methods
