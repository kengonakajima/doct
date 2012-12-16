require "../../utils/doctutil.rb"

#= literal-regex
e = /abc/
assert( "abcabc".sub(e,"ABC" ) == "ABCabc" )
assert( "abcabc".gsub(e,"ABC" ) == "ABCABC" )

#= literal-regex-template
s = "bc"
e = /a#{s}/
assert( "abcabc".gsub(e,"ABC" ) == "ABCABC" )


