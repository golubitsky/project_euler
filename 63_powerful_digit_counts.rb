#https://projecteuler.net/problem=63

def find(exp)
    result = 0
    i = 1
    until i**exp >= 10**exp
        result +=1 if i**exp >= 10**(exp-1)
        i+=1
    end
    result
end

def find_all
    result = 0
    i = 1
    while true
        result += find(i)
        return result if find(i) == 0
        i+=1
    end
    result
end

p find_all
