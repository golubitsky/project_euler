#https://projecteuler.net/problem=35
require './46_goldbach_other_conjecture.rb'

def find_primes(num)
    primes=[]
    i = 1
    while i <= num
        primes << i if is_prime?(i)
        i += 1
    end
    primes
end

def circular?(prime,primes)
    str=prime.to_s
    (str.length - 1).times do
        str = str[1..-1] << str[0]
        return false unless is_prime?(str.to_i)
    end
    true
end

def find_circular_primes(primes)
    result=[]
    primes.each do |prime|
        result << prime if circular?(prime, primes)
    end
    result
end

if $PROGRAM_NAME == __FILE__
primes=find_primes(1000000)
p find_circular_primes(primes).length
end
