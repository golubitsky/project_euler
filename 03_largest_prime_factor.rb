#https://projecteuler.net/problem=3

require './46_goldbach_other_conjecture.rb'

def find_highest_prime_factor(n)
    i=1
    while i <= n/2
        if n%i==0
            return n/i if is_prime?(n/i)
        end
        i+=1
    end
end


if $PROGRAM_NAME == __FILE__
p find_highest_prime_factor(600851475143)
end
