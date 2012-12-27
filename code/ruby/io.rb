# encoding: utf-8
require "../../utils/doctutil.rb"

#= io-replace-and-restore-stdout-with-file
#== ja: 標準出力を一時的にファイルに置き換えて、また戻す
doct_output_start "io-replace-and-restore-stdout-with-file"
open("/tmp/output.txt", "w") do |f|
  $stdout = f
  print "Hello 1 , should be saved in file\n"
  $stdout = STDOUT
  print "Hello 2 , should be printed in stdio\n"
end
File.open("/tmp/output.txt","r") do |f|
  assert( f.read == "Hello 1 , should be saved in file\n" )
end
doct_output_end
