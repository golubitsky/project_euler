#https://projecteuler.net/problem=55

def lychrel?(n)
    i=0
    m = n.to_s.reverse.to_i
    while i < 50
        result = n + m
        n = result
        m = n.to_s.reverse.to_i
        return false if m == result
        i+=1
    end
    true
end

def find_lychrel
    i=1
    result = 0
    while i < 10000
        result += 1 if lychrel?(i)
        i += 1
    end
    result
end

p find_lychrel
