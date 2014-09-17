# https://projecteuler.net/problem=36

i = 1
sum = 0
while i <=1_000_000
    decimal = i.to_s
    binary = i.to_s(2)
    sum += i if decimal == decimal.reverse && binary == binary.reverse
    i += 1
end
p sum
