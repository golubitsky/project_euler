#https://projecteuler.net/problem=40

str = ''
i = 1
while str.length <=1_000_000
    str << i.to_s
    i += 1
end

result = 1
requests=[1,10,100,1_000,10_000,100_000,1_000_000]
requests.each do |n|
    result *= str[n-1].to_i
end

p result
