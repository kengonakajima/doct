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

//= string-replace-with-string
s = "Hello Hell";
t = s.replace("H","x");
assert( s == "Hello Hell" );
assert( t == "xello Hell" );

//= string-replace-with-regex
s = "Hello Hell";
t = s.replace(/Hell/,"x");
assert( s == "Hello Hell" );
assert( t == "xo Hell" );
t = s.replace(/Hell/g,"x");
assert( s == "Hello Hell" );
assert( t == "xo x" );

//= string-replace-with-function
s = "hello world";
u = s.replace(/o/g, function(str) {
    return "Y";
});
console.log(u);
assert( u == "hellY wYrld" );
              
