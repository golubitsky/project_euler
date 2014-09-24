# https://projecteuler.net/problem=49
require './46_goldbach_other_conjecture.rb'

def find_permutation(primes)
    primes.each do |prime|
        i = 1
        while i <= 4500
            prime2 = (prime + i)
            if is_prime?(prime2) && prime2 < 10000
                prime3 = (prime2 + i)
                if is_prime?(prime3) && prime3 < 10000
                    a = prime.to_s.split('').sort.join
                    b = prime2.to_s.split('').sort.join
                    c = prime3.to_s.split('').sort.join
                    return  "#{prime}#{prime2}#{prime3}" if (a == b && b == c) && (a != "1478")
                end
            end
            i += 1
        end
    end
end

#find 4-digit primes
primes = []
i = 1000
while i < 10000
    primes << i if is_prime?(i)
    i += 1
end

p find_permutation(primes)
