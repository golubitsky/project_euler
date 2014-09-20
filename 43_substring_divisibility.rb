#https://projecteuler.net/problem=43

def digit_test_234(n)
    n.to_s[1,3].to_i % 2 == 0
end
def digit_test_345(n)
    n.to_s[2,3].to_i % 3 == 0
end
def digit_test_456(n)
    n.to_s[3,3].to_i % 5 == 0
end
def digit_test_567(n)
    n.to_s[4,3].to_i % 7 == 0
end
def digit_test_678(n)
    n.to_s[5,3].to_i % 11 == 0
end
def digit_test_789(n)
    n.to_s[6,3].to_i % 13 == 0
end
def digit_test_8910(n)
    n.to_s[7,3].to_i % 17 == 0
end

result=[]
numbers = [0,1,2,3,4,5,6,7,8,9].permutation(10).to_a.map{|digits| digits.join('').to_i}
numbers = numbers.reject{|n| n < 1_000_000_000}
numbers.each do |n|
    next unless digit_test_234(n)
    next unless digit_test_345(n)
    next unless digit_test_456(n)
    next unless digit_test_567(n)
    next unless digit_test_678(n)
    next unless digit_test_789(n)
    next unless digit_test_8910(n)
    result << n
end
p result.inject(:+)
