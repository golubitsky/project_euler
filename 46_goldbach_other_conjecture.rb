# https://projecteuler.net/problem=46

def is_prime?(n)
    return false if n==0 || n==1
    return true if n==2
    i=2
    while i < Math.sqrt(n)
        return false if n % i == 0
        i +=1
    end
    true
end

def check_composite(num, primes)
    primes.each do |prime|
        result = 0
        i = 1
        until result > num
            result = prime + 2 * (i**2)
            return true if result == num
            i += 1
        end
    end
    false
end

def find_false_goldbach
    primes=[2]
    num=3
    loop do
        if num%2 == 0
        elsif is_prime?(num)
            primes << num
        else
            return num if check_composite(num, primes)==false
        end
        num += 1
    end
end

p find_false_goldbach

