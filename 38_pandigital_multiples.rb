#https://projecteuler.net/problem=38

def find_pandigital
    max = 0
    n = 2
    while n < 10000
        str=''
        str << n.to_s
        str << (2 * n).to_s unless str.length >= 9
        str << (3 * n).to_s unless str.length >= 9
        str << (4 * n).to_s unless str.length >= 9
        str << (5 * n).to_s unless str.length >= 9
        max = str.to_i if str.length == 9 && str.split('').sort.join=="123456789" && str.to_i > max
        n+=1
    end
    max
end

p find_pandigital
