# encoding: utf-8
require "../../utils/doctutil.rb"

#= control-structure-if-else-elsif
a = 7
if a == 1 then
  assert(false)
elsif a == 3 then
  assert(false)
elsif a == 5 then 
  assert(false)
else 
  assert(true)
end


if a == 3    # ja: then は省略できる　  en: 'then' could be omitted
  assert(false)
else
  assert(true)
end


#= control-structure-if-modifier
#== ja: 行の後ろに置いたif文の条件が成立したときだけ行の前半部分を実行する

a = 7
a = 3 if a == 7
assert( a == 3 )


#= control-structure-unless
#== ja: unless文

a = 7
x = 0
unless (a % 2) == 0 
  x = 1
else
  x = 2
end
p x
assert( x == 1 )




#= control-structure-unless-modifier
#== ja: 行の後ろに置いたunless文の条件が成立したときだけ行の前半部分を実行する

a = 3
assert(false) unless (a%2) == 1

#= control-structure-while
#== ja: while文ではdoを省略できる
a=0
b=[]
while (a+=1) < 5 do
  b.push(a)
end
assert(b == [1,2,3,4] )

a=0
b=[]
while (a+=1) < 5     # ja: doを省略できる
  b.push(a)
end
assert(b == [1,2,3,4] )


#= control-structure-while-modifier
#== ja: 行の後ろに置いたwhile文の条件が成立している間だけ行の前半部分を実行する

a=0
b=[]
b.push(a) while (a += 1) < 5
assert(b == [1,2,3,4] )

#= control-structure-until
#== ja: until文. 条件が満たされるまで実行する。doは省略できる。
a=0
b=[]
until (a+=1) == 5 do
    b.push(a)
end
assert( b == [1,2,3,4] )

a=0
b=[]
until (a+=1) == 5   # ja: doは省略できる
    b.push(a)
end
assert( b == [1,2,3,4] )

#= control-structure-until-modifier
#== ja: 行の後ろに置いたuntil文の条件が成立していない間だけ行の前半部分を実行する
a=0
b=[]
b.push(a) until (a+=1) == 5
assert( b == [1,2,3,4] )


