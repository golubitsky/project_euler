# https://projecteuler.net/problem=48

n=1
sum=0
while n < 1000
    sum += (n ** n)
    n += 1
end
p sum.to_s[-10..-1]
