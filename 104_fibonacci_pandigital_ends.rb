#https://projecteuler.net/problem=104

def solve #using while loop
  a, b, i = 1, 1, 3
  loop do
    a, b = b, a + b
    return i if satisfies_conditions?(b.to_s)
    p i if i%10000 == 0
    i += 1
  end
end

def satisfies_conditions?(str)
  return false unless str.length >= 9
  return false unless str[-9..-1].chars.sort.join == "123456789"
  return false unless str[0..8].chars.sort.join == "123456789"
  true
end

p solve
