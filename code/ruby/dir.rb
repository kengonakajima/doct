# encoding: utf-8
require "../../utils/doctutil.rb"

#= dir-glob-files-with-wildcard
#== ja: ワイルドカードを使ってファイル名の配列を得る
doct_output_start "dir-glob-files-with-wildcard"
a = Dir["/etc/*"]
p a.sort[0..3]
b = Dir.glob("/etc/*")
assert( a.sort == b.sort )
doct_output_end

#= dir-chdir
#== ja: 現在のスクリプトを実行中のプロセスのカレントディレクトリを変更する


doct_output_start "dir-chdir"

orig_current = Dir.pwd()
println "current: ", orig_current
Dir.chdir( "/tmp" )
println "current: ", Dir.pwd()
begin
  Dir.chdir( "/tmp__notfound" )
rescue
  assert( $!.class == Errno::ENOENT  )
end
assert( Dir.chdir(orig_current) == 0 )

doct_output_end


#= dir-mkdir
begin
  Dir.rmdir( "/tmp/hoge_dir" )
rescue
end
Dir.mkdir( "/tmp/hoge_dir" )
begin
  Dir.mkdir( "/tmp/hoge_dir" )
rescue
  assert( $!.class == Errno::EEXIST )
end
begin
  Dir.mkdir( "/tmp/hoge_dir/a/b/c/d/e/f/g" )
rescue
  assert( $!.class == Errno::ENOENT )  # ja: 親ディレクトリが無い場合はエラー(自動的には作られない)
end


#= dir-get-current-working-directory
#== ja: 現在のワーキングディレクトリを得る
doct_output_start "dir-get-current-working-directory"
assert( Dir.pwd() == Dir.getwd() )
p Dir.pwd()
doct_output_end


#= dir-delete
#== ja: ディレクトリを削除する

path = "/tmp/#{Time.now.to_i}_#{Process.pid}.tmp"
assert( Dir.mkdir(path) == 0 )
assert( Dir.unlink(path) == 0 )  # unlink

assert( Dir.mkdir(path) == 0 )
assert( Dir.delete(path) == 0 )  # delete

assert( Dir.mkdir(path) == 0 )
assert( Dir.rmdir(path) == 0 )   # rmdir

path2 = "#{path}/hoge.txt"
assert( Dir.mkdir(path) == 0 )
File.open( path2,"w") do |f| f.print( "hello" ) end 
begin
  Dir.rmdir(path2) 
rescue
  assert( $!.class == Errno::ENOTDIR )  # ja: ディレクトリではないものを削除しようとした
end
begin
  Dir.rmdir(path)
rescue
  assert( $!.class == Errno::ENOTEMPTY )  # ja: 空でないディレクトリを削除しようとした
end

#= dir-scan-with-each
#== ja: ディレクトリのファイルをスキャンする
doct_output_start "dir-scan-with-each"
Dir.open( "/usr/bin" ).each do |path|
  p path if path =~ /^l/
end
doct_output_end

#= dir-get-path
doct_output_start "dir-get-path"
p Dir.open( "/etc" ).path
doct_output_end

#= dir-read-incremental
doct_output_start "dir-read-incremental"
Dir.open(  "/usr/bin" ) do |d|
  assert( d.tell == 0 )
  assert( d.pos == d.tell )  # pos() is synonym for tell()
  assert( d.read == "." )
  assert( d.tell == 1 )
  assert( d.read == ".." )
  assert( d.seek(0) )        # ja: 次に読む位置をセット
  assert( d.read == "." ) 
  assert( d.rewind() )       # ja: seek(0)と同じ
  assert( d.read == "." ) 
  while x = d.read
    p x if x =~ /^l/
  end
end
doct_output_end


# __STOP_DOCT_PARSE__

# TODO: chroot
