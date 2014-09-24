#https://projecteuler.net/problem=30
result = []
i = 2
while i < 9**5 * 6
    arr = i.to_s.split('').map(&:to_i)
    result << i if arr.map{|digit| digit ** 5}.inject(:+) == i
    i += 1
end
p result.inject(:+)
