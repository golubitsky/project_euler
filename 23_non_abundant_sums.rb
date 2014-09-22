#https://projecteuler.net/problem=23

def sum_factors(n)
    i = 1
    sum = 0
    while i <= Math.sqrt(n)
        if n%i == 0
            sum += i
            sum += n/i unless i == 1 || i==Math.sqrt(n)
        end
        i += 1
    end
    sum
end

def generate_sums(n)
    abundant_numbers=[]
    sums=[]
    i=1
    while i <= n
        if sum_factors(i) > i
            abundant_numbers << i
            abundant_numbers.each do |number|
                sums << number + i
            end
        end
        i += 1
    end
    sums
end

n = 28123
arr = [*1..n] - generate_sums(n)
p arr.inject(:+)
