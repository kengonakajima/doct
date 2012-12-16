require "../../utils/doctutil.rb"

#= literal-integer-decimal
#== ja: 10進数整数リテラル
assert( 0d123 == 123 )
assert( -0d123 == -123 )
assert( -0d1_000_000 == -1000000 )

#= literal-integer-hexadecimal
assert( 0xff == 255 )
assert( -0xff == -255 )
assert( 0xff_ff == 65535 )

#= literal-integer-binary-digit
assert( 0b111 == 7 )
assert( -0b111 == -7 )
assert( 0b11_01_01 == 53 )

#= literal-integer-octal-digit
assert( 0377 == 255 )
assert( -0377 == -255 )
assert( 03_7_7 == 255 )

# literal-integer-character-code
# fails in 1.9.3, but not documented well yet. Pending.
#assert( ?a == 97 )
#assert( ?\C-a == 1 ) # CTRL-A
#assert( ?\M-a == 225 ) # META-A
#assert( ?\M-\C-a == 129 ) # META-CTRL-A




#= literal-floating-point
#== ja: 浮動少数リテラル

assert( 1.01e3 > 1000 )
assert( 1.2e-3 < 0.0013 && 1.2e-3 > 0.0011 )


