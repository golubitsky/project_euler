#https://projecteuler.net/problem=12

def find_factors(n)
    i=1
    factors = 0
    while i <= Math.sqrt(n)
        if n%i==0
            factors += 2
        end
        i+=1
    end
    factors
end

def find_triangle_with_more_than_n_factors(n)
    i=1
    sum = 0
    while true
        sum += i
        i += 1
        return sum if find_factors(sum) > n
    end
end

p find_triangle_with_more_than_n_factors(500)

