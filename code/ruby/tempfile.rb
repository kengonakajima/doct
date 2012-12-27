# encoding: utf-8
require "../../utils/doctutil.rb"

#= tempfile
doct_output_start "tempfile"
require "tempfile"
tf = Tempfile.new( "basename" )
path = tf.path
println "temp file path: ", path
tf.print("hello")
tf.seek(0)
data = tf.read()
assert( data == "hello" )
tf.close(true)   # ja: trueで即削除,falseでGCが削除 en: delete the file immediately when true, otherwise when GC
assert( File.exist?(path)  == false )
ENV.keys.grep( /TE?MP/ ).each do |k|
  println "ENV['#{k}'] => #{ENV[k]}"
end
doct_output_end




