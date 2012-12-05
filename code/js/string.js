var assert = require("assert").ok;

//= string-concat
assert( ("ab" + "cd") == "abcd" );
assert( ("ab" + 1) == "ab1" );

//= string-split-with-string
ary = "ab cd ef".split(" ");
assert( ary[0] == "ab" );
assert( ary[1] == "cd" );
assert( ary[2] == "ef" );

//= string-split-with-regex
ary = "ab cd.ef:gh".split(/[ .:]/);
assert( ary[0] == "ab" );
assert( ary[1] == "cd" );
assert( ary[2] == "ef" );

