#https://projecteuler.net/problem=37

require './46_goldbach_other_conjecture.rb'

def find_truncatable_primes
    result=[]
    non_primes=[1,4,6,8,0]
    i=10
    while true
        if is_prime?(i)
            left = truncate_from_left(i)
            right = truncate_from_right(i)
            if left == false || right == false
                i += 1
                next
            end
            result << i
        end
        return result if result.size==11
        i += 1
    end
end

def truncate_from_left(n)
    n = n.to_s
    return false unless is_prime?(n[0].to_i)
    while n.length > 0
        n[0]=''
        return false unless is_prime?(n.to_i)
        return true if n.length == 1
    end
end

def truncate_from_right(n)
    n = n.to_s
    return false unless is_prime?(n[-1].to_i)
    while n.length > 0
        n[-1]=''
        return false unless is_prime?(n.to_i)
        return true if n.length == 1
    end
end

p find_truncatable_primes.inject(:+)
