require "./util.rb"

#= embedded-document
#== ja: 埋め込みドキュメント
=begin
the everything between a line beginning with '=begin' and
that with '=end' will be skipped by the interpreter.
=end





#= end-of-script
#== ja: 
# Make sure put this doct at the end of this file!
assert("ok")
# __END__
assert("ok")
__END__
assert(false)



# __STOP_DOCT_PARSE__
